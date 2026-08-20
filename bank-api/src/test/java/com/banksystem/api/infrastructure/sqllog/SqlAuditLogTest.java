package com.banksystem.api.infrastructure.sqllog;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

/**
 * Drives {@link SqlLoggingDataSource} over a stub JDBC driver — the same call
 * sequence {@code NamedParameterJdbcTemplate} makes (prepare, bind, execute,
 * walk the ResultSet, close) — and checks what lands in the audit file.
 */
class SqlAuditLogTest {

    private static final String SQL = """
            SELECT c.custNo, c.name1
            FROM stcusttab c
            WHERE c.custNo = ? AND c.BankingDate = ?""";

    @TempDir
    Path dir;

    @Test
    void writesRequestHeaderQueryAndFooter() throws Exception {
        Path file = dir.resolve("sql.log");
        SqlLogWriter writer = writer(file);
        DataSource ds = new SqlLoggingDataSource(stubDataSource(2, null), writer, "archival");

        writer.requestStarted("r-1", "GET /api/customers/0123456/profile user=DEVUSER");
        runQuery(ds);
        writer.requestFinished(200);

        String logged = read(file);
        assertTrue(logged.contains("[r-1] >>>> GET /api/customers/0123456/profile user=DEVUSER"), logged);
        assertTrue(logged.contains("[r-1] SQL #1 · archival · 2 rows · "), logged);
        // Values inlined, quoted as strings so the leading zero survives — the
        // line is the query, runnable as printed.
        assertTrue(logged.contains("WHERE c.custNo = '0123456' AND c.BankingDate = '2009-07-11'"), logged);
        assertFalse(logged.contains("ARGS"), "ARGS is redundant once every ? is substituted:\n" + logged);
        assertTrue(logged.contains("[r-1] <<<< 200 · 1 query · "), logged);
        // The header is written once, not per query.
        assertEquals(1, logged.lines().filter(l -> l.contains(">>>>")).count(), logged);
    }

    @Test
    void logsAnApiHitThatRanNoQueries() throws Exception {
        Path file = dir.resolve("sql.log");
        SqlLogWriter writer = writer(file);

        writer.requestStarted("r-2", "GET /api/reference/branches user=DEVUSER");
        writer.requestFinished(304);

        String logged = read(file);
        assertTrue(logged.contains("[r-2] >>>> GET /api/reference/branches"), logged);
        assertTrue(logged.contains("[r-2] <<<< 304 · 0 queries · "), logged);
    }

    @Test
    void recordsAFailedStatementAndRethrows() throws Exception {
        Path file = dir.resolve("sql.log");
        SqlLogWriter writer = writer(file);
        DataSource ds = new SqlLoggingDataSource(
                stubDataSource(0, new SQLException("ORA-00942: table or view does not exist")),
                writer, "statement");

        writer.requestStarted("r-3", "GET /api/statements/hist user=DEVUSER");
        assertThrows(SQLException.class, () -> runQuery(ds));
        writer.requestFinished(500);

        String logged = read(file);
        assertTrue(logged.contains("FAILED: java.sql.SQLException: ORA-00942"), logged);
        assertTrue(logged.contains("WHERE c.custNo = '0123456' AND c.BankingDate = '2009-07-11'"), logged);
        assertTrue(logged.contains("[r-3] <<<< 500 · 1 query · "), logged);
    }

    @Test
    void disabledWritesNothing() throws Exception {
        Path file = dir.resolve("sql.log");
        SqlLogWriter writer = new SqlLogWriter(false, file.toString(), 50, 3);

        assertFalse(writer.isEnabled());
        writer.requestStarted("r-4", "GET /api/x user=DEVUSER");
        writer.requestFinished(200);

        // Disabled the datasource is never wrapped, so only the filter could write —
        // and it short-circuits. Nothing must reach the disk either way.
        assertFalse(Files.exists(file), "no file should be created while disabled");
    }

    @Test
    void quotesByTypeAndEscapesEmbeddedQuotes() {
        assertEquals("'0123456'", SqlLogWriter.literal("0123456"));   // stays a string: the leading zero matters
        assertEquals("42", SqlLogWriter.literal(42));
        assertEquals("1.5", SqlLogWriter.literal(1.5));
        assertEquals("true", SqlLogWriter.literal(true));
        assertEquals("NULL", SqlLogWriter.literal(null));
        assertEquals("'O''BRIEN'", SqlLogWriter.literal("O'BRIEN"));
    }

    @Test
    void substitutesOnlyRealPlaceholders() {
        // A ? inside a literal, an identifier or a comment is not a parameter.
        String sql = """
                SELECT '?' AS q, "odd?col"          -- why? because
                FROM t /* ? */ WHERE a = ? AND b = ?""";
        SqlLogWriter.Inlined out = SqlLogWriter.inline(sql, List.of("'x'", "7"));

        assertEquals(2, out.substituted());
        assertTrue(out.sql().contains("WHERE a = 'x' AND b = 7"), out.sql());
        assertTrue(out.sql().contains("SELECT '?' AS q"), out.sql());
        assertTrue(out.sql().contains("\"odd?col\""), out.sql());
        assertTrue(out.sql().contains("-- why? because"), out.sql());
        assertTrue(out.sql().contains("/* ? */"), out.sql());
    }

    @Test
    void keepsRawBindingsWhenSubstitutionDoesNotLineUp() throws Exception {
        Path file = dir.resolve("sql.log");
        SqlLogWriter writer = writer(file);

        // Three values, two placeholders — the inlined text cannot be trusted, so
        // the bindings are printed as well rather than silently dropped.
        writer.logQuery("archival", "SELECT * FROM t WHERE a = ? AND b = ?",
                List.of("'1'", "'2'", "'3'"), "0 rows", 4);

        String logged = read(file);
        assertTrue(logged.contains("ARGS [1]='1' [2]='2' [3]='3'"), logged);
    }

    private SqlLogWriter writer(Path file) {
        return new SqlLogWriter(true, file.toString(), 50, 3);
    }

    private String read(Path file) throws IOException {
        return Files.readString(file);
    }

    private static void runQuery(DataSource ds) throws SQLException {
        try (Connection c = ds.getConnection();
                PreparedStatement ps = c.prepareStatement(SQL)) {
            ps.setString(1, "0123456");
            ps.setString(2, "2009-07-11");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // consumed like a RowMapper would
                }
            }
        }
    }

    // ---- stub driver -------------------------------------------------------

    /** @param rows how many rows executeQuery yields; @param failure thrown from executeQuery when set */
    private static DataSource stubDataSource(int rows, SQLException failure) {
        Connection connection = proxy(Connection.class, (p, m, a) -> switch (m.getName()) {
            case "prepareStatement", "prepareCall" -> statement(rows, failure);
            default -> defaultValue(m.getReturnType());
        });
        return proxy(DataSource.class, (p, m, a) ->
                "getConnection".equals(m.getName()) ? connection : defaultValue(m.getReturnType()));
    }

    private static PreparedStatement statement(int rows, SQLException failure) {
        return proxy(PreparedStatement.class, (p, m, a) -> {
            if ("executeQuery".equals(m.getName())) {
                if (failure != null) {
                    throw failure;
                }
                return resultSet(rows);
            }
            return defaultValue(m.getReturnType());
        });
    }

    private static ResultSet resultSet(int rows) {
        int[] served = {0};
        return proxy(ResultSet.class, (p, m, a) ->
                "next".equals(m.getName()) ? served[0]++ < rows : defaultValue(m.getReturnType()));
    }

    @SuppressWarnings("unchecked")
    private static <T> T proxy(Class<T> type, InvocationHandler handler) {
        return (T) Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[] {type},
                (p, m, a) -> switch (m.getName()) {
                    case "toString" -> "stub:" + type.getSimpleName();
                    case "hashCode" -> System.identityHashCode(p);
                    case "equals" -> p == (a == null ? null : a[0]);
                    default -> handler.invoke(p, m, a);
                });
    }

    /** Primitive-safe default so the stub never returns null into an unboxing site. */
    private static Object defaultValue(Class<?> type) {
        if (!type.isPrimitive()) {
            return null;
        }
        if (type == boolean.class) {
            return false;
        }
        if (type == long.class) {
            return 0L;
        }
        if (type == void.class) {
            return null;
        }
        return 0;
    }
}
