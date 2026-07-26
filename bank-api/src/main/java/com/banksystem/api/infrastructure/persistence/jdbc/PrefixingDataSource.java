package com.banksystem.api.infrastructure.persistence.jdbc;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.jdbc.datasource.DelegatingDataSource;

/**
 * Wraps a {@link DataSource} so that every SQL string passed to
 * {@code prepareStatement(...)} / {@code prepareCall(...)} is run through a
 * {@link SqlTablePrefixer} first. This is the single, central place where the
 * legacy BM table names are mapped to Denodo's prefixed view names — no
 * repository SQL has to change, and switching environments (staging → prod) is
 * only a change to the {@code table-prefix} property.
 *
 * <p>The connection is proxied dynamically; every method except the
 * SQL-carrying prepare* calls is delegated unchanged. All access to the two
 * archival/online templates goes through {@code NamedParameterJdbcTemplate},
 * which only ever issues {@code PreparedStatement}s, so intercepting prepare*
 * covers all queries.
 */
class PrefixingDataSource extends DelegatingDataSource {

    private final SqlTablePrefixer prefixer;

    PrefixingDataSource(DataSource targetDataSource, SqlTablePrefixer prefixer) {
        super(targetDataSource);
        this.prefixer = prefixer;
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
                PrefixingDataSource.class.getClassLoader(),
                new Class<?>[] {Connection.class},
                (proxy, method, args) -> {
                    String name = method.getName();
                    if (args != null && args.length > 0 && args[0] instanceof String
                            && ("prepareStatement".equals(name) || "prepareCall".equals(name))) {
                        args = args.clone();
                        args[0] = prefixer.rewrite((String) args[0]);
                    }
                    try {
                        return method.invoke(target, args);
                    } catch (InvocationTargetException e) {
                        throw e.getTargetException();
                    }
                });
    }
}
