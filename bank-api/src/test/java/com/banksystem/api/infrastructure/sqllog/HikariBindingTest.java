package com.banksystem.api.infrastructure.sqllog;

import static org.junit.jupiter.api.Assertions.assertTrue;

import com.zaxxer.hikari.HikariDataSource;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import javax.sql.DataSource;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

/**
 * The production chain end to end: Hikari pool -> SqlLoggingDataSource ->
 * PrefixingDataSource -> NamedParameterJdbcTemplate, over a stub driver.
 */
class HikariBindingTest {

    @TempDir
    Path dir;

    @Test
    void bindingsSurviveTheWholeChain() throws Exception {
        Path file = dir.resolve("sql.log");
        SqlLogWriter writer = new SqlLogWriter(true, file.toString(), 50, 3);

        HikariDataSource pool = new HikariDataSource();
        pool.setDataSource(stub());
        pool.setMaximumPoolSize(1);
        pool.setConnectionTestQuery("SELECT 1");

        DataSource logged = new SqlLoggingDataSource(pool, writer, "archival");
        NamedParameterJdbcTemplate jdbc = new NamedParameterJdbcTemplate(logged);

        writer.requestStarted("r-1", "GET /api/customers/0123456 user=DEVUSER");
        jdbc.query("SELECT c.custNo FROM stcusttab c WHERE c.custNo = :custNo AND c.BankingDate = :bd",
                Map.of("custNo", "0123456", "bd", "2009-07-11"), (rs, i) -> "row");
        writer.requestFinished(200);
        pool.close();

        String entry = Files.readString(file);
        assertTrue(entry.contains("WHERE c.custNo = '0123456' AND c.BankingDate = '2009-07-11'"),
                "bindings lost in the chain:\n" + entry);
    }

    private static DataSource stub() {
        ResultSet rs = make(ResultSet.class, new Object() {
            int served;
            Object answer(String m) {
                return "next".equals(m) ? served++ < 2 : null;
            }
        }::answer);
        DatabaseMetaData md = make(DatabaseMetaData.class, m -> switch (m) {
            case "getDatabaseProductName" -> "Stub";
            case "getDatabaseProductVersion", "getDriverName", "getDriverVersion" -> "1.0";
            default -> null;
        });
        PreparedStatement ps = make(PreparedStatement.class, m -> "executeQuery".equals(m) ? rs : null);
        Connection con = make(Connection.class, m -> switch (m) {
            case "prepareStatement", "prepareCall" -> ps;
            case "createStatement" -> ps;
            case "isValid" -> Boolean.TRUE;
            case "getMetaData" -> md;
            case "isClosed" -> Boolean.FALSE;
            default -> null;
        });
        return make(DataSource.class, m -> "getConnection".equals(m) ? con : null);
    }

    private interface Answer { Object get(String method); }

    @SuppressWarnings("unchecked")
    private static <T> T make(Class<T> type, Answer answer) {
        InvocationHandler h = (p, m, a) -> {
            switch (m.getName()) {
                case "toString": return "stub:" + type.getSimpleName();
                case "hashCode": return System.identityHashCode(p);
                case "equals": return p == (a == null ? null : a[0]);
                default: break;
            }
            Object v = answer.get(m.getName());
            if (v != null) {
                return v;
            }
            Class<?> r = m.getReturnType();
            if (!r.isPrimitive()) return null;
            if (r == boolean.class) return false;
            if (r == long.class) return 0L;
            if (r == void.class) return null;
            return 0;
        };
        return (T) Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[] {type}, h);
    }
}
