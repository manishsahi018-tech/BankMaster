package com.banksystem.api.infrastructure.sqllog;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.sql.DataSource;
import org.springframework.jdbc.datasource.DelegatingDataSource;

/**
 * Wraps a {@link DataSource} so that every statement it runs is recorded in the
 * SQL audit log — the SQL text, the bound parameter values, the outcome and the
 * elapsed time. Nothing in the repositories changes; this is the same
 * dynamic-proxy approach {@code PrefixingDataSource} already uses, one layer
 * deeper.
 *
 * <p>ORDER MATTERS: this sits INSIDE the prefixing datasource
 * (prefixing(logging(hikari))), so the prefixer rewrites {@code stcusttab} to
 * {@code bv_impala_stg_bankmaster_stcusttab} BEFORE this sees the SQL. What
 * lands in the log is therefore what the driver was actually given — paste-able
 * into Denodo as-is, which is the whole point of logging it.
 *
 * <p>Three proxies, one per JDBC level:
 * <ul>
 *   <li>Connection — hands out proxied statements,</li>
 *   <li>Statement — captures {@code setX(index, value)} bindings and times the
 *       {@code execute*} call,</li>
 *   <li>ResultSet — counts rows as they are read, and writes the entry when the
 *       set is closed (a row count is not known any earlier).</li>
 * </ul>
 *
 * <p>Only installed when the audit log is enabled, so a normal run carries none
 * of this indirection.
 */
public class SqlLoggingDataSource extends DelegatingDataSource {

    private final SqlLogWriter writer;
    /** Which database ran the query — shown on every logged line. */
    private final String db;

    public SqlLoggingDataSource(DataSource targetDataSource, SqlLogWriter writer, String db) {
        super(targetDataSource);
        this.writer = writer;
        this.db = db;
    }

    @Override
    public Connection getConnection() throws SQLException {
        return wrap(super.getConnection());
    }

    @Override
    public Connection getConnection(String username, String password) throws SQLException {
        return wrap(super.getConnection(username, password));
    }

    private Connection wrap(Connection target) {
        return (Connection) Proxy.newProxyInstance(
                SqlLoggingDataSource.class.getClassLoader(),
                new Class<?>[] {Connection.class},
                (proxy, method, args) -> {
                    Object result = invoke(method, target, args);
                    String name = method.getName();
                    String sql = args != null && args.length > 0 && args[0] instanceof String s ? s : null;
                    if (result instanceof CallableStatement cs && "prepareCall".equals(name)) {
                        return statementProxy(cs, sql, CallableStatement.class);
                    }
                    if (result instanceof PreparedStatement ps && "prepareStatement".equals(name)) {
                        return statementProxy(ps, sql, PreparedStatement.class);
                    }
                    if (result instanceof Statement st && "createStatement".equals(name)) {
                        // SQL arrives later, on execute(sql).
                        return statementProxy(st, null, Statement.class);
                    }
                    return result;
                });
    }

    private Object statementProxy(Statement target, String sql, Class<?> type) {
        return Proxy.newProxyInstance(
                SqlLoggingDataSource.class.getClassLoader(),
                new Class<?>[] {type},
                new StatementRecorder(target, sql));
    }

    /** Captures bindings on one statement and times each execution of it. */
    private final class StatementRecorder implements java.lang.reflect.InvocationHandler {

        private final Statement target;
        private final String preparedSql;
        /** Parameter index -> SQL literal, kept in index order so ? substitution lines up. */
        private final Map<Integer, String> params = new TreeMap<>();

        StatementRecorder(Statement target, String preparedSql) {
            this.target = target;
            this.preparedSql = preparedSql;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            String name = method.getName();

            if (name.startsWith("set") && args != null && args.length >= 2 && args[0] instanceof Integer index) {
                // setString/setInt/setObject/... all share (index, value); setNull's
                // second argument is a type code, not a value.
                params.put(index, "setNull".equals(name) ? "NULL" : SqlLogWriter.literal(args[1]));
                return SqlLoggingDataSource.invoke(method, target, args);
            }
            if ("clearParameters".equals(name)) {
                params.clear();
                return SqlLoggingDataSource.invoke(method, target, args);
            }
            if (!isExecute(name)) {
                return SqlLoggingDataSource.invoke(method, target, args);
            }

            String sql = args != null && args.length > 0 && args[0] instanceof String s ? s : preparedSql;
            List<String> bound = new ArrayList<>(params.values());
            long start = System.nanoTime();
            Object result;
            try {
                result = SqlLoggingDataSource.invoke(method, target, args);
            } catch (Throwable t) {
                writer.logQuery(db, text(sql), bound, "FAILED: " + t, millisSince(start));
                throw t;
            }
            if (result instanceof ResultSet rs) {
                // Rows are not counted yet; the entry is written when the set closes.
                return resultSetProxy(rs, text(sql), bound, start);
            }
            writer.logQuery(db, text(sql), bound, outcome(name, result), millisSince(start));
            return result;
        }

        private String text(String sql) {
            return sql == null ? "(sql not captured)" : sql;
        }
    }

    private Object resultSetProxy(ResultSet target, String sql, List<String> bound, long start) {
        int[] rows = {0};
        boolean[] logged = {false};
        return Proxy.newProxyInstance(
                SqlLoggingDataSource.class.getClassLoader(),
                new Class<?>[] {ResultSet.class},
                (proxy, method, args) -> {
                    String name = method.getName();
                    Object result;
                    try {
                        result = invoke(method, target, args);
                    } catch (Throwable t) {
                        if (!logged[0]) {
                            logged[0] = true;
                            writer.logQuery(db, sql, bound, "FAILED after " + rows[0] + " rows: " + t,
                                    millisSince(start));
                        }
                        throw t;
                    }
                    if ("next".equals(name) && Boolean.TRUE.equals(result)) {
                        rows[0]++;
                    } else if ("close".equals(name) && !logged[0]) {
                        logged[0] = true;
                        writer.logQuery(db, sql, bound, rows[0] + (rows[0] == 1 ? " row" : " rows"),
                                millisSince(start));
                    }
                    return result;
                });
    }

    private static boolean isExecute(String name) {
        return "execute".equals(name)
                || "executeQuery".equals(name)
                || "executeUpdate".equals(name)
                || "executeLargeUpdate".equals(name)
                || "executeBatch".equals(name)
                || "executeLargeBatch".equals(name);
    }

    private static String outcome(String method, Object result) {
        if (method.startsWith("executeUpdate") || method.startsWith("executeLarge")) {
            return "updated " + result;
        }
        if (result instanceof int[] batch) {
            return "batch of " + batch.length;
        }
        if (result instanceof long[] batch) {
            return "batch of " + batch.length;
        }
        return "ok";
    }

    private static long millisSince(long startNanos) {
        return (System.nanoTime() - startNanos) / 1_000_000L;
    }

    /** Delegates a proxied call, unwrapping the reflection wrapper so callers see the real exception. */
    private static Object invoke(Method method, Object target, Object[] args) throws Throwable {
        try {
            return method.invoke(target, args);
        } catch (InvocationTargetException e) {
            throw e.getTargetException();
        }
    }
}
