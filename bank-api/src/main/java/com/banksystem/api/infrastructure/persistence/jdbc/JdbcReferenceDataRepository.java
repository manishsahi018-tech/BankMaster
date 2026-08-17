package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.CodeEntry;
import com.banksystem.api.domain.repository.ReferenceDataRepository;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.annotation.Profile;
import org.springframework.context.event.EventListener;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Reference-data code sets from the Denodo stctltab views. The set NAMES are
 * the contract with bank-ui/src/codes.ts and mirror
 * MockReferenceDataRepository (values may differ where the mock deviates
 * from the legacy domains — e.g. sex/maritalStatus below use the C's
 * 0/1-style codes, and card statuses use the workbook labels).
 *
 * <p>Set → archival source (schema files win over the spec's javadoc):
 * <ul>
 *   <li>{@code idType} — stctltab, RecordType 'ID' (generic ctlCode +
 *       arabic/english name layout).</li>
 *   <li>{@code businessType} — stctltab, RecordType 'BS'.</li>
 *   <li>{@code samaMainCategory} — stctltab, RecordType 'SM' (no dedicated
 *       overlay view exists; SM rows use the generic layout). The legacy
 *       Access combo table samamaincategoryinfo maps here.</li>
 *   <li>{@code samaSubCategory} — stctltabSS overlay view
 *       (samaSubCategoryCode + names). Access samasubcategoryinfo maps here.
 *       (stctltabCC is the main+sub CROSS-classification/config table, not a
 *       simple code list — not used for combos.)</li>
 *   <li>{@code country} — stctltabNA overlay (countryCode + names). NOTE:
 *       per stctltabNA.ts, recType 'NA' is the COUNTRY table in the archival
 *       workbook — not "narratives" as older port notes suggested.</li>
 *   <li>{@code branch} — stctltabBD overlay (branchCode + branch names);
 *       richer than brcode, which only maps short code → branch code.
 *       Access branchinfo maps here.</li>
 *   <li>{@code sex}, {@code maritalStatus}, {@code language} — fixed 1-char
 *       domains with no archival code table (stcusttab.ts documents the
 *       columns but no view enumerates the values) — served as constants.</li>
 *   <li>{@code currency} — stctltabXC overlay (currCode + names). Access
 *       currencyinfo maps here.</li>
 *   <li>{@code ledger} — stctltabMM overlay (ledgerCode + names). The table's
 *       own description calls it "Memo Code", but its columns are the ledger
 *       master; column detail wins. Access bmledgerinfo maps here.</li>
 *   <li>{@code accStatus} — stctltab, RecordType 'AS'.</li>
 *   <li>{@code stmtFreq} — stctltab, RecordType 'SF'.</li>
 *   <li>{@code intApplication} — stctltab, RecordType 'IA' (Interest
 *       Application info).</li>
 *   <li>{@code cardStatus}, {@code cardRequestStatus} — fixed domains from
 *       the stcardtab.ts field descriptions (schema wins over the mock's
 *       abbreviated labels: e.g. requestStatus 1 is 'Approved' and 9 is
 *       'Rejected' per the workbook, not 'Requested'/'Completed').</li>
 * </ul>
 *
 * <p>Any set whose view is missing at runtime is logged and returned as an
 * empty list — codes() never fails as a whole. Loaded lazily once and cached
 * (reference data is static per BankingDate, and BankingDateProvider fixes
 * the date for the process lifetime).
 */
@Repository
@Profile("denodo")
public class JdbcReferenceDataRepository implements ReferenceDataRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcReferenceDataRepository.class);


    /** Generic stctltab layout: ctlCode + names, filtered by RecordType. */
    private static final String CTLTAB_SET = """
            SELECT ctlCode AS code,
                   COALESCE(NULLIF(TRIM(englishName), ''), arabicName) AS description
            FROM   stctltab
            WHERE  RecordType = :recordType
            ORDER  BY ctlCode
            """;

    private final NamedParameterJdbcTemplate jdbc;

    private volatile Map<String, List<CodeEntry>> cached;

    public JdbcReferenceDataRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    /**
     * The sets backed by a Denodo view. If every one of these comes back empty
     * the load did not really succeed (view missing, pool not up yet), so the
     * result is NOT cached — otherwise one bad moment at startup would pin
     * empty combos for the life of the process. The remaining sets are
     * constants and are always populated, so they cannot be used as the signal.
     */
    private static final List<String> DB_BACKED = List.of(
            "idType", "country", "businessType",
            "samaMainCategory", "samaSubCategory", "branch",
            "currency", "ledger", "accStatus", "stmtFreq", "intApplication");

    @Override
    public Map<String, List<CodeEntry>> codes() {
        Map<String, List<CodeEntry>> result = cached;
        if (result == null) {
            synchronized (this) {
                if (cached == null) {
                    Map<String, List<CodeEntry>> loaded = load();
                    if (anyDbSetPopulated(loaded)) {
                        cached = loaded;
                    } else {
                        // Serve what we have; the next call retries the DB.
                        log.warn("Reference data: every archival-backed code set came back "
                                + "empty — serving constants only and NOT caching, so the "
                                + "next call retries.");
                        return loaded;
                    }
                }
                result = cached;
            }
        }
        return result;
    }

    private static boolean anyDbSetPopulated(Map<String, List<CodeEntry>> sets) {
        return DB_BACKED.stream().anyMatch(name -> !sets.getOrDefault(name, List.of()).isEmpty());
    }

    /**
     * Warms the cache just after startup, on a virtual thread so a slow Denodo
     * never delays the server accepting requests. Without this the first
     * operator to log in pays for all six view reads; with it, /api/codes is
     * a memory hit from the first call. Failure is not fatal — codes() simply
     * loads on demand as before.
     */
    @EventListener(ApplicationReadyEvent.class)
    public void preload() {
        Thread.ofVirtual().name("reference-data-preload").start(() -> {
            try {
                int populated = (int) DB_BACKED.stream()
                        .filter(name -> !codes().getOrDefault(name, List.of()).isEmpty())
                        .count();
                log.info("Reference data pre-loaded ({}/{} archival code sets populated).",
                        populated, DB_BACKED.size());
            } catch (RuntimeException e) {
                log.warn("Reference data pre-load failed ({}); /api/codes will load on demand.",
                        e.toString());
            }
        });
    }

    private Map<String, List<CodeEntry>> load() {
        Map<String, List<CodeEntry>> sets = new LinkedHashMap<>();
        sets.put("idType", ctltabSet("idType", "ID"));
        // Legacy stcusttab domains (stlayout.h struct customerInfo):
        // sexCode '0'-Male/'1'-Female (:1435) and marritalStatus
        // '0'-Married/'1'-Single/'2'-Others (:1437). The archival view keeps
        // the raw codes (stcusttab.ts documents no decode), so M/F-style
        // entries would never match a data row.
        sets.put("sex", List.of(
                new CodeEntry("0", "Male"),
                new CodeEntry("1", "Female")));
        sets.put("maritalStatus", List.of(
                new CodeEntry("0", "Married"),
                new CodeEntry("1", "Single"),
                new CodeEntry("2", "Others")));
        sets.put("language", List.of(
                new CodeEntry("0", "Arabic"),
                new CodeEntry("1", "English")));
        sets.put("country", querySet("country", """
                SELECT countryCode AS code,
                       COALESCE(NULLIF(TRIM(englishName), ''), arabicName) AS description
                FROM   stctltabNA
                ORDER  BY countryCode
                """, Map.of()));
        sets.put("businessType", ctltabSet("businessType", "BS"));
        sets.put("samaMainCategory", ctltabSet("samaMainCategory", "SM"));
        sets.put("samaSubCategory", querySet("samaSubCategory", """
                SELECT samaSubCategoryCode AS code,
                       COALESCE(NULLIF(TRIM(englishName), ''), arabicName) AS description
                FROM   stctltabSS
                ORDER  BY samaSubCategoryCode
                """, Map.of()));
        sets.put("branch", querySet("branch", """
                SELECT branchCode AS code,
                       COALESCE(NULLIF(TRIM(englishName), ''), arabicName) AS description
                FROM   stctltabBD
                ORDER  BY branchCode
                """, Map.of()));
        // The four sets the account/statement screens resolve against. All were
        // referenced by the UI long before anything served them, so every
        // lookup fell back to the bare code — "01 / 00 / 108" where the operator
        // expects "Saudi Riyal / Open / Call Deposit".
        sets.put("currency", querySet("currency", """
                SELECT currCode AS code,
                       COALESCE(NULLIF(TRIM(englishName), ''), arabicName) AS description
                FROM   stctltabXC
                ORDER  BY currCode
                """, Map.of()));
        // stctltabMM is the LEDGER master despite its table-level description
        // calling it "Memo Code": its columns are ledgerCode + LEDGER NAME IN
        // ARABIC/ENGLISH plus per-ledger rules (account creation allowed,
        // cheque book allowed, minimum deposit). Column detail wins over the
        // sheet's heading, as it does elsewhere in this workbook. This is the
        // archival counterpart of the legacy client's local Access bmledgerinfo.
        sets.put("ledger", querySet("ledger", """
                SELECT ledgerCode AS code,
                       COALESCE(NULLIF(TRIM(englishName), ''), arabicName) AS description
                FROM   stctltabMM
                ORDER  BY ledgerCode
                """, Map.of()));
        // Generic stctltab record types, both named in stctltab.ts's own
        // RecordType list: 'AS' Account status type info, 'SF' Statement
        // Frequency Code info.
        sets.put("accStatus", ctltabSet("accStatus", "AS"));
        sets.put("stmtFreq", ctltabSet("stmtFreq", "SF"));
        sets.put("intApplication", ctltabSet("intApplication", "IA"));
        // Fixed value domains documented on stcardtab.ts (cardStatus /
        // requestStatus) — no stctltab recType carries them.
        sets.put("cardStatus", List.of(
                new CodeEntry("0", "Requested"),
                new CodeEntry("1", "Open"),
                new CodeEntry("2", "Lost"),
                new CodeEntry("3", "Stolen"),
                new CodeEntry("4", "Restricted"),
                new CodeEntry("9", "Closed/Damaged")));
        sets.put("cardRequestStatus", List.of(
                new CodeEntry("0", "Requested"),
                new CodeEntry("1", "Approved"),
                new CodeEntry("2", "Processed"),
                new CodeEntry("3", "Generated At DC9000"),
                new CodeEntry("4", "Received By Branch"),
                new CodeEntry("5", "Received By Customer"),
                new CodeEntry("8", "Canceled By Branch"),
                new CodeEntry("9", "Rejected")));
        return Collections.unmodifiableMap(sets);
    }

    /** One generic-layout stctltab code list, selected by RecordType. */
    private List<CodeEntry> ctltabSet(String setName, String recordType) {
        return querySet(setName, CTLTAB_SET,
                Map.of("recordType", recordType));
    }

    /**
     * Runs one code-set query; a missing/broken view yields an empty list
     * with a warning so a single absent Denodo view never fails codes().
     */
    private List<CodeEntry> querySet(String setName, String sql, Map<String, ?> params) {
        try {
            return jdbc.query(sql, params, (rs, i) -> new CodeEntry(
                    trimmed(rs.getString("code")),
                    trimmed(rs.getString("description"))));
        } catch (DataAccessException e) {
            log.warn("Reference data set '{}' unavailable from archival DB ({}); returning empty list",
                    setName, e.getMostSpecificCause().getMessage());
            return List.of();
        }
    }

    private static String trimmed(String value) {
        return value == null ? "" : value.trim();
    }
}
