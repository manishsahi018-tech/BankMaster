package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.infrastructure.runtimeconfig.RuntimeSettings;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
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
 * <p>The date comes from {@code banking-date} in the runtime configuration file
 * (see {@link RuntimeSettings}) — a fixed snapshot, set per environment and
 * EDITABLE WHILE THE APPLICATION RUNS. It is read on every call rather than
 * captured, so saving a new date in that file re-points every screen at another
 * restore snapshot within a second; nothing is restarted and no session drops.
 *
 * <p>When the setting is blank the date is resolved once from
 * {@code MAX(BankingDate)} of stcusttab, cached for the process lifetime and
 * logged as a warning: stcusttab's snapshot is not necessarily the right one for
 * the BM views, so the fallback is a dev convenience, not a configuration.
 */
@Component
@Profile("denodo")
public class BankingDateProvider {

    private static final Logger log = LoggerFactory.getLogger(BankingDateProvider.class);

    private final NamedParameterJdbcTemplate archivalJdbc;
    private final RuntimeSettings settings;
    private volatile String resolved;

    public BankingDateProvider(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate archivalJdbc,
            RuntimeSettings settings) {
        this.archivalJdbc = archivalJdbc;
        this.settings = settings;
    }

    /**
     * The BankingDate every archival query filters on, exactly as the views
     * store it — the value is bound as a string and compared with {@code =}.
     */
    public String bankingDate() {
        String configured = settings.bankingDate();
        if (!configured.isEmpty()) {
            return configured;
        }
        String value = resolved;
        if (value == null) {
            value = archivalJdbc.queryForObject(
                    "SELECT MAX(BankingDate) FROM stcusttab", Map.of(), String.class);
            if (value == null || value.isBlank()) {
                throw new IllegalStateException("Could not resolve BankingDate from stcusttab; "
                        + "set banking-date in " + settings.source());
            }
            log.warn("banking-date is blank in {}; every archival query will filter on "
                    + "MAX(BankingDate) FROM stcusttab = {}. Set it explicitly — stcusttab's "
                    + "snapshot is not necessarily the right one for the BM views "
                    + "(gld0data/sod0data/pyd0data/rid0data/thd0data span several restore "
                    + "dates, stcardtab runs past the restore).", settings.source(), value);
            resolved = value;
        }
        return value;
    }
}
