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
 * The banking date archival queries filter on — one for the application, plus
 * an optional separate one for the two card views.
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
 * <p><b>The card views are allowed their own date.</b> {@code stcardtab} was
 * restored past the snapshot the rest of the CSD views sit on (08/12/2012 vs
 * 11/07/2009), so {@code card-banking-date} pins {@code stcardtab} and
 * {@code stcardlog} separately; see {@link #cardBankingDate()}. Left blank —
 * the default — it is exactly {@link #bankingDate()} and nothing changes.
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

    /**
     * The BankingDate the card views ({@code stcardtab}, {@code stcardlog}) are
     * read at: {@code card-banking-date} when it is set, otherwise
     * {@link #bankingDate()}.
     *
     * <p>The fallback is what keeps the setting inert — with a blank value every
     * card query binds the same date it always did, so the split costs nothing
     * until it is configured.
     *
     * <p>Setting it is a trade, not a fix. A date past the CSD restore makes the
     * later {@code stcardtab} rows visible (the card grid, Card Detail, Customer
     * Search by card number) but {@code stcardlog} was measured with only the
     * 11/07/2009 snapshot, so Card Update History and Card Tracking History come
     * back empty at any later date. RuntimeSettings logs a warning naming both
     * values whenever the two dates differ.
     */
    public String cardBankingDate() {
        String configured = settings.cardBankingDate();
        return configured.isEmpty() ? bankingDate() : configured;
    }
}
