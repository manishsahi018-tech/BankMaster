package com.banksystem.api.infrastructure.persistence.jdbc;

import com.zaxxer.hikari.HikariDataSource;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

/**
 * The connections of the revamp:
 *
 *   archival-db  (DB #1) — the BM archival schema (stcusttab, gld0data, …)
 *                          served by Denodo views (Hive-backed) over the
 *                          Denodo JDBC driver; replaces the legacy MS
 *                          Access source. THE connection: every repository
 *                          is wired to {@code archivalJdbc}.
 *   statement-db (DB #3) — the statement archive behind Historical Statement
 *                          only. NOT Denodo: a separate Oracle instance whose
 *                          STMT_HDR/STMT_TXN (and PDP_ prefixed) tables replace
 *                          the legacy's Btrieve statement index plus the
 *                          zipped pre-rendered page files it pointed at
 *                          (frmHistStmt.frm generateReport/processStmt). Off by
 *                          default — see JdbcStatementRepository.
 *
 * <p>There is no DB #2 datasource. The slot existed for the cbcmssrv/Finacle
 * online gateway replacement, but it was only ever a second Hikari pool onto
 * the SAME Denodo server — every property defaulted to its archival
 * counterpart, no repository queried it, and its one consumer was the health
 * endpoint probing the connection it had just probed. Both sources being
 * Denodo, the two are merged into DB #1.
 *
 * <p>This does not retire DB #2 as a CONCEPT: the online gateway's data still
 * does not exist here, which is why {@code UnavailableOnlineEnquiryRepository}
 * answers On-demand Statement and Transaction Inquiry, and why the
 * {@code TODO(DB #2)} markers in JdbcCardRepository still stand. When that
 * source turns up on its own engine, add its datasource + template beans back
 * here and qualify the repositories that need it — the same shape
 * {@code statementDataSource} already has for DB #3.
 *
 * <p>Driver jars (Denodo's is not on Maven Central, and neither is Oracle's) are
 * loaded at runtime from the directory given via -Dloader.path (see README
 * "Deploying against Denodo").
 */
@Configuration
@Profile("denodo")
public class DenodoDataSourceConfig {

    @Bean
    @Primary
    @ConfigurationProperties("bank.archival-db")
    public HikariDataSource archivalDataSource() {
        return new HikariDataSource();
    }

    @Bean
    @Primary
    public NamedParameterJdbcTemplate archivalJdbc(
            @Qualifier("archivalDataSource") DataSource dataSource,
            @Value("${bank.archival-db.table-prefix:}") String tablePrefix) {
        return new NamedParameterJdbcTemplate(prefixed(dataSource, tablePrefix));
    }

    /**
     * DB #3 — the statement archive. Separate from {@code online-db} on purpose:
     * that slot is reserved for the Finacle/cbcmssrv replacement (Transaction
     * Inquiry, On-demand Statement), and this one holds statements only.
     *
     * <p>Created ONLY when {@code bank.statement-db.enabled} is true. It has to
     * be conditional rather than merely unconfigured, because binding this
     * datasource loads its driver class eagerly: an Oracle driver is a new
     * requirement that a site running only DB #1 and DB #2 has no reason to
     * have deployed, and Hikari's ClassNotFoundException on driver-class-name
     * fails the whole context — taking every other screen down over a facility
     * that is switched off. {@code UnavailableStatementRepository} answers in
     * its place when it is off.
     */
    @Bean
    @ConditionalOnProperty(name = "bank.statement-db.enabled", havingValue = "true")
    @ConfigurationProperties("bank.statement-db")
    public HikariDataSource statementDataSource() {
        return new HikariDataSource();
    }

    /**
     * The prefix here is a SCHEMA qualifier, not a view-name prefix: set
     * {@code bank.statement-db.table-prefix=O2MS_UPG1.} and {@code FROM STMT_TXN}
     * is rewritten to {@code FROM O2MS_UPG1.STMT_TXN}. Leave it blank if the
     * connection's own schema already resolves the tables.
     */
    @Bean
    @ConditionalOnProperty(name = "bank.statement-db.enabled", havingValue = "true")
    public NamedParameterJdbcTemplate statementJdbc(
            @Qualifier("statementDataSource") DataSource dataSource,
            @Value("${bank.statement-db.table-prefix:}") String tablePrefix) {
        return new NamedParameterJdbcTemplate(prefixed(dataSource, tablePrefix));
    }

    /**
     * Wraps the datasource so the legacy BM table names in the repositories are
     * rewritten to Denodo's prefixed view names (e.g. stcusttab →
     * bv_impala_stg_bankmaster_stcusttab). A blank prefix is a no-op, so an
     * environment whose views are named exactly like the legacy tables needs no
     * prefix at all.
     */
    private static DataSource prefixed(DataSource dataSource, String tablePrefix) {
        if (tablePrefix == null || tablePrefix.isBlank()) {
            return dataSource;
        }
        return new PrefixingDataSource(dataSource, new SqlTablePrefixer(tablePrefix));
    }
}
