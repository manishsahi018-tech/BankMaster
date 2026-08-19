package com.banksystem.api.infrastructure.persistence.jdbc;

import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

/**
 * The one banking date every archival query filters on.
 *
 * <p>Every archival view prefixes its primary key with BankingDate (the ETL's
 * "Data Restored date" — a column the live ISAM files did not have), so a query
 * that names only the legacy key columns can match rows from several restore
 * snapshots at once. Every repository under the {@code denodo} profile
 * therefore carries {@code AND <alias>.BankingDate = :bankingDate} and binds
 * the value this provider returns.
 *
 * <p>The date comes from {@code bank.archival-db.banking-date} — a fixed
 * snapshot, set per environment. When that property is blank it is resolved
 * once from {@code MAX(BankingDate)} of stcusttab, cached for the process
 * lifetime and logged as a warning: stcusttab's snapshot is not necessarily the
 * right one for the BM views, so the fallback is a dev convenience, not a
 * configuration.
 */
@Component
@Profile("denodo")
public class BankingDateProvider {

    private static final Logger log = LoggerFactory.getLogger(BankingDateProvider.class);

    private final NamedParameterJdbcTemplate archivalJdbc;
    private final String configured;
    private volatile String resolved;

    public BankingDateProvider(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate archivalJdbc,
            @Value("${bank.archival-db.banking-date:}") String configured) {
        this.archivalJdbc = archivalJdbc;
        this.configured = configured == null ? "" : configured.trim();
    }

    /**
     * The BankingDate every archival query filters on, exactly as the views
     * store it — the value is bound as a string and compared with {@code =}.
     */
    public String bankingDate() {
        if (!configured.isEmpty()) {
            return configured;
        }
        String value = resolved;
        if (value == null) {
            value = archivalJdbc.queryForObject(
                    "SELECT MAX(BankingDate) FROM stcusttab", Map.of(), String.class);
            if (value == null || value.isBlank()) {
                throw new IllegalStateException(
                        "Could not resolve BankingDate from stcusttab; set bank.archival-db.banking-date");
            }
            log.warn("bank.archival-db.banking-date is not set; every archival query will "
                    + "filter on MAX(BankingDate) FROM stcusttab = {}. Set the property "
                    + "explicitly — stcusttab's snapshot is not necessarily the right one "
                    + "for the BM views (gld0data/sod0data/pyd0data/rid0data/thd0data span "
                    + "several restore dates, stcardtab runs past the restore).", value);
            resolved = value;
        }
        return value;
    }
}
