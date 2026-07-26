package com.banksystem.api.infrastructure.persistence.jdbc;

import java.util.Map;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

/**
 * Every archival table prefixes its primary key with BankingDate (the
 * restore date — a column the live ISAM files did not have), so every
 * query needs a BankingDate predicate on top of the legacy key columns
 * (QUERY-SPECS.md conventions).
 *
 * The date comes from bank.archival-db.banking-date when configured
 * (fixed snapshot), otherwise it is resolved once from
 * MAX(BankingDate) of stcusttab and cached for the process lifetime.
 */
@Component
@Profile("denodo")
public class BankingDateProvider {

    private final NamedParameterJdbcTemplate archivalJdbc;
    private final String configured;
    private volatile String resolved;

    public BankingDateProvider(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate archivalJdbc,
            @Value("${bank.archival-db.banking-date:}") String configured) {
        this.archivalJdbc = archivalJdbc;
        this.configured = configured == null ? "" : configured.trim();
    }

    /** The BankingDate (YYYYMMDD) all archival queries must filter on. */
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
            resolved = value;
        }
        return value;
    }
}
