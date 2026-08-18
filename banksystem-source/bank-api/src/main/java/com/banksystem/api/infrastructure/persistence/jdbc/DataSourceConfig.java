package com.banksystem.api.infrastructure.persistence.jdbc;

import com.zaxxer.hikari.HikariDataSource;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

/**
 * The two logical databases of the revamp:
 *
 *   archival-db (DB #1) — the BM archival schema (stcusttab, gld0data, …)
 *                         served by Denodo views (Hive-backed) over the
 *                         Denodo JDBC driver; replaces the legacy MS
 *                         Access source.
 *   online-db   (DB #2) — replaces the legacy cbcmssrv TCP/IP / Finacle
 *                         gateway source. Engine still undecided (may not
 *                         be Denodo) — configured purely via properties,
 *                         so switching engines needs only a URL/driver
 *                         change. Defaults to the archival connection.
 *
 * Driver jars (Denodo's is not on Maven Central) are loaded at runtime
 * from the directory given via -Dloader.path (see README "Deploying
 * against Denodo").
 */
@Configuration
@Profile("denodo")
public class DataSourceConfig {

    @Bean
    @Primary
    @ConfigurationProperties("bank.archival-db")
    public HikariDataSource archivalDataSource() {
        return new HikariDataSource();
    }

    @Bean
    @ConfigurationProperties("bank.online-db")
    public HikariDataSource onlineDataSource() {
        return new HikariDataSource();
    }

    @Bean
    @Primary
    public NamedParameterJdbcTemplate archivalJdbc(
            @Qualifier("archivalDataSource") DataSource dataSource) {
        return new NamedParameterJdbcTemplate(dataSource);
    }

    @Bean
    public NamedParameterJdbcTemplate onlineJdbc(
            @Qualifier("onlineDataSource") DataSource dataSource) {
        return new NamedParameterJdbcTemplate(dataSource);
    }
}
