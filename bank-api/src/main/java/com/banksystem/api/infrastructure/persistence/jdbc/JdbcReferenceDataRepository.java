package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.CodeEntry;
import com.banksystem.api.domain.model.UiLanguage;
import com.banksystem.api.domain.repository.ReferenceDataRepository;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
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
 * empty list — codes() never fails as a whole. Loaded lazily once and cached,
 * KEYED ON THE BANKING DATE it was loaded for: reference data is static per
 * BankingDate, but the date itself is editable while the application runs
 * (RuntimeSettings), so a cache pinned for the process lifetime would keep
 * serving the previous snapshot's codes after the date moved.
 */
@Repository
@Profile("denodo")
public class JdbcReferenceDataRepository implements ReferenceDataRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcReferenceDataRepository.class);


    /**
     * Generic stctltab layout: ctlCode + names, filtered by RecordType.
     *
     * <p>{@code {name:}} is resolved by {@link UiLanguage#localise} into the
     * COALESCE that prefers this language's name column — once per language at
     * class-init, so both renderings stay constants.
     */
    private static final Map<UiLanguage, String> CTLTAB_SET = UiLanguage.localise("""
            SELECT ctlCode AS code,
                   {name:} AS description
            FROM   stctltab
            WHERE  BankingDate = :bankingDate
              AND  RecordType = :recordType
            ORDER  BY ctlCode
            """);

    private final NamedParameterJdbcTemplate jdbc;
    private final BankingDateProvider bankingDate;

    /** The loaded sets together with the BankingDate they were read at. */
    private record Cached(String bankingDate, Map<String, List<CodeEntry>> codes) {}

    /**
     * One cache entry PER LANGUAGE. The sets differ by language only in their
     * descriptions, but they differ in every row, so a single slot would be
     * thrashed by two operators reading different languages.
     */
    private final Map<UiLanguage, Cached> cached = new EnumMap<>(UiLanguage.class);

    public JdbcReferenceDataRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc,
            BankingDateProvider bankingDate) {
        this.jdbc = jdbc;
        this.bankingDate = bankingDate;
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
            "currency", "ledger", "accStatus", "stmtFreq", "intApplication",
            // The seven stctltab record types the profile combos resolve
            // against. They belong on this list by its own definition — every
            // one is a view read — and their absence from it hid them from the
            // pre-load report, which is where an operator looks first when a
            // combo shows a bare code.
            "title", "education", "profession", "position",
            "monthlyIncome", "segmentation", "documentType");

    @Override
    public Map<String, List<CodeEntry>> codes(UiLanguage language) {
        String date = bankingDate.bankingDate();
        Cached result = cached.get(language);
        if (result != null && result.bankingDate().equals(date)) {
            return result.codes();
        }
        synchronized (this) {
            result = cached.get(language);
            if (result != null && result.bankingDate().equals(date)) {
                return result.codes();
            }
            Map<String, List<CodeEntry>> loaded = load(language);
            if (!anyDbSetPopulated(loaded)) {
                // Serve what we have; the next call retries the DB.
                log.warn("Reference data: every archival-backed code set came back "
                        + "empty — serving constants only and NOT caching, so the "
                        + "next call retries.");
                return loaded;
            }
            if (result != null) {
                log.info("Reference data ({}) reloaded for banking-date {} (was {}).",
                        language.code(), date, result.bankingDate());
            }
            cached.put(language, new Cached(date, loaded));
            return loaded;
        }
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
            // Both languages: an operator who logs in and immediately switches
            // to Arabic would otherwise pay for a whole second load.
            for (UiLanguage language : UiLanguage.values()) {
                try {
                    Map<String, List<CodeEntry>> sets = codes(language);
                    int populated = (int) DB_BACKED.stream()
                            .filter(name -> !sets.getOrDefault(name, List.of()).isEmpty())
                            .count();
                    log.info("Reference data ({}) pre-loaded ({}/{} archival code sets populated).",
                            language.code(), populated, DB_BACKED.size());
                } catch (RuntimeException e) {
                    log.warn("Reference data ({}) pre-load failed ({}); /api/codes will load on demand.",
                            language.code(), e.toString());
                }
            }
        });
    }

    private Map<String, List<CodeEntry>> load(UiLanguage language) {
        Map<String, List<CodeEntry>> sets = new LinkedHashMap<>();
        sets.put("idType", ctltabSet(language, "idType", "ID"));
        // The combos the legacy filled from titleinfo / educationinfo and
        // friends in the branch PC's LOCAL Access database. stctltab carries
        // them all under its own record types — the workbook documents
        // TT/ED/PR/PO/MI/SG/DT on stctltab.RecordType — so the lists are
        // archival after all and only the lookup was local. Rendered as
        // "<code>-<description>", which is the form the legacy combos show
        // (cmbTitle.AddItem rs("titlecode") & "-" & rs("englishname"),
        // frmIndividualSaudi.frm:6346).
        sets.put("title", ctltabSet(language, "title", "TT"));
        sets.put("education", ctltabSet(language, "education", "ED"));
        sets.put("profession", ctltabSet(language, "profession", "PR"));
        sets.put("position", ctltabSet(language, "position", "PO"));
        sets.put("monthlyIncome", ctltabSet(language, "monthlyIncome", "MI"));
        sets.put("segmentation", ctltabSet(language, "segmentation", "SG"));
        sets.put("documentType", ctltabSet(language, "documentType", "DT"));
        // Legacy stcusttab domains (stlayout.h struct customerInfo):
        // sexCode '0'-Male/'1'-Female (:1435) and marritalStatus
        // '0'-Married/'1'-Single/'2'-Others (:1437). The archival view keeps
        // the raw codes (stcusttab.ts documents no decode), so M/F-style
        // entries would never match a data row.
        sets.put("sex", fixed(language,
                new Fixed("0", "Male", "ذكر"),
                new Fixed("1", "Female", "أنثى")));
        sets.put("maritalStatus", fixed(language,
                new Fixed("0", "Married", "متزوج"),
                // "أعزب", as frmIndividualSaudi's own radio group reads — not
                // the legacy table's "مفرد", which is its single/JOINT account
                // caption and has nothing to do with marital status.
                new Fixed("1", "Single", "أعزب"),
                new Fixed("2", "Others", "أخرى")));
        sets.put("language", fixed(language,
                new Fixed("0", "Arabic", "عربي"),
                new Fixed("1", "English", "انجليزي")));
        // packageaccinfo was a table in the branch PC's LOCAL Access database
        // (frmIndividualOthers2.frm:2688-2699), not an stctltab record type —
        // the workbook's RecordType list has no package entry — so there is no
        // archival view to read it from. The workbook does document the domain
        // on the column itself (stcusttab.packageAcc "Valid Values are: 0-None
        // ... 5-Private Banking"), which is the same authority the sexCode and
        // marritalStatus sets above rest on.
        // 1-5 are ANB product names, so the Arabic is the product's own name
        // rather than a translation of the English transliteration.
        sets.put("packageAcc", fixed(language,
                new Fixed("0", "None", "لا يوجد"),
                new Fixed("1", "Munafa", "منافع"),
                new Fixed("2", "Wahat", "واحات"),
                new Fixed("3", "Al Safwa", "الصفوة"),
                new Fixed("4", "Mubarak", "مبارك"),
                new Fixed("5", "Private Banking", "الخدمات المصرفية الخاصة")));
        sets.put("country", querySet(language, "country", """
                SELECT countryCode AS code,
                       {name:} AS description
                FROM   stctltabNA
                WHERE  BankingDate = :bankingDate
                ORDER  BY countryCode
                """, Map.of()));
        sets.put("businessType", ctltabSet(language, "businessType", "BS"));
        sets.put("samaMainCategory", ctltabSet(language, "samaMainCategory", "SM"));
        sets.put("samaSubCategory", querySet(language, "samaSubCategory", """
                SELECT samaSubCategoryCode AS code,
                       {name:} AS description
                FROM   stctltabSS
                WHERE  BankingDate = :bankingDate
                ORDER  BY samaSubCategoryCode
                """, Map.of()));
        sets.put("branch", querySet(language, "branch", """
                SELECT branchCode AS code,
                       {name:} AS description
                FROM   stctltabBD
                WHERE  BankingDate = :bankingDate
                ORDER  BY branchCode
                """, Map.of()));
        // The four sets the account/statement screens resolve against. All were
        // referenced by the UI long before anything served them, so every
        // lookup fell back to the bare code — "01 / 00 / 108" where the operator
        // expects "Saudi Riyal / Open / Call Deposit".
        sets.put("currency", querySet(language, "currency", """
                SELECT currCode AS code,
                       {name:} AS description
                FROM   stctltabXC
                WHERE  BankingDate = :bankingDate
                ORDER  BY currCode
                """, Map.of()));
        // stctltabMM is the LEDGER master despite its table-level description
        // calling it "Memo Code": its columns are ledgerCode + LEDGER NAME IN
        // ARABIC/ENGLISH plus per-ledger rules (account creation allowed,
        // cheque book allowed, minimum deposit). Column detail wins over the
        // sheet's heading, as it does elsewhere in this workbook. This is the
        // archival counterpart of the legacy client's local Access bmledgerinfo.
        sets.put("ledger", querySet(language, "ledger", """
                SELECT ledgerCode AS code,
                       {name:} AS description
                FROM   stctltabMM
                WHERE  BankingDate = :bankingDate
                ORDER  BY ledgerCode
                """, Map.of()));
        // Generic stctltab record types, both named in stctltab.ts's own
        // RecordType list: 'AS' Account status type info, 'SF' Statement
        // Frequency Code info.
        sets.put("accStatus", ctltabSet(language, "accStatus", "AS"));
        sets.put("stmtFreq", ctltabSet(language, "stmtFreq", "SF"));
        sets.put("intApplication", ctltabSet(language, "intApplication", "IA"));
        // Fixed value domains documented on stcardtab.ts (cardStatus /
        // requestStatus) — no stctltab recType carries them.
        // stchqtab's own column descriptions enumerate both domains — the
        // same source the cardStatus / currency sets were transcribed from,
        // and there is no stctltab record type for either.
        // SAMA account status. No stctltab record type carries it — the
        // RecordType list has 'AS' for the bank's own account status and 'RC'
        // for the change reason, but nothing for SAMA — so like cardStatus and
        // packageAcc the domain comes from the column's own description.
        //
        // The legacy read it from samaacctstatusinfo, a table in the branch
        // PC's LOCAL Access database (frmAccct.frm:2482, and the same table in
        // frmAcctStatusHistory.frm:210), matching on the leading TWO
        // characters. Codes are the 2-char form stacclog documents
        // ("00-Open;01-Inactive;02-Dormant;03-Unclaimed"); gld0data holds the
        // same domain one character wide, which codes.ts tail-matches.
        //
        // "Not defined" is deliberately absent: it is the legacy's fallback for
        // a code missing from the local table (globalFunctions.bas:9042
        // appends tCode & "-Not defined"), not a value the domain carries —
        // which is why the Arabic capture shows "0 -Not define" beside a real
        // "00-Open". codeLabel degrades the same way, to the bare code.
        sets.put("samaStatus", fixed(language,
                new Fixed("00", "Open", "مفتوح"),
                new Fixed("01", "Inactive", "غير نشط"),
                new Fixed("02", "Dormant", "غير متحرك"),
                new Fixed("03", "Unclaimed", "غير مطالب به")));
        sets.put("chequeType", fixed(language,
                new Fixed("1", "Personal", "شخصي"),
                new Fixed("2", "Corporate", "تجاري")));
        sets.put("chequeBookStatus", fixed(language,
                new Fixed("1", "Requested", "مطلوب"),
                new Fixed("2", "Produced", "تم الإصدار"),
                new Fixed("3", "Received by Branch", "مستلمة من الفرع"),
                new Fixed("4", "Issued to customer", "صادرة للعميل"),
                new Fixed("9", "Rejected by branch", "مرفوضة من الفرع")));
        sets.put("cardStatus", fixed(language,
                new Fixed("0", "Requested", "مطلوبة"),
                new Fixed("1", "Open", "مفتوحة"),
                new Fixed("2", "Lost", "مفقودة"),
                new Fixed("3", "Stolen", "مسروقة"),
                new Fixed("4", "Restricted", "مقيدة"),
                new Fixed("9", "Closed/Damaged", "مغلقة/تالفة")));
        sets.put("cardRequestStatus", fixed(language,
                new Fixed("0", "Requested", "مطلوبة"),
                new Fixed("1", "Approved", "موافق عليها"),
                new Fixed("2", "Processed", "تمت المعالجة"),
                new Fixed("3", "Generated At DC9000", "صدرت في DC9000"),
                new Fixed("4", "Received By Branch", "مستلمة من الفرع"),
                new Fixed("5", "Received By Customer", "مستلمة من العميل"),
                new Fixed("8", "Canceled By Branch", "ملغاة من الفرع"),
                new Fixed("9", "Rejected", "مرفوضة")));
        logRowCounts(sets);
        return Collections.unmodifiableMap(sets);
    }

    /**
     * One line per load naming every archival-backed set and the number of rows
     * it returned. A combo that shows a bare code has exactly two causes — the
     * set came back EMPTY, or the code did not match a row in it — and only the
     * log can tell them apart on a bank PC, where the archival tables cannot be
     * queried by hand. querySet already warns when a view is broken; this
     * covers the quieter case of a view that answers with no rows.
     */
    private void logRowCounts(Map<String, List<CodeEntry>> sets) {
        StringBuilder line = new StringBuilder();
        for (String name : DB_BACKED) {
            if (!line.isEmpty()) {
                line.append(", ");
            }
            line.append(name).append('=').append(sets.getOrDefault(name, List.of()).size());
        }
        log.info("Reference data rows at banking-date {}: {}", bankingDate.bankingDate(), line);
    }

    /**
     * One entry of a fixed value domain — a set the archival schema documents
     * on the column itself (stcusttab.sexCode, stcardtab.requestStatus …) but
     * that no stctltab record type enumerates, so there is no bilingual table
     * to read and both names are carried here.
     */
    private record Fixed(String code, String english, String arabic) {}

    private static List<CodeEntry> fixed(UiLanguage language, Fixed... entries) {
        return Arrays.stream(entries)
                .map(e -> new CodeEntry(e.code(),
                        language == UiLanguage.ARABIC ? e.arabic() : e.english()))
                .toList();
    }

    /** One generic-layout stctltab code list, selected by RecordType. */
    private List<CodeEntry> ctltabSet(UiLanguage language, String setName, String recordType) {
        return querySet(language, setName, CTLTAB_SET.get(language),
                Map.of("recordType", recordType));
    }

    /**
     * Runs one code-set query; a missing/broken view yields an empty list
     * with a warning so a single absent Denodo view never fails codes().
     */
    private List<CodeEntry> querySet(UiLanguage language, String setName, String sql,
                                     Map<String, ?> params) {
        // The overlay-view queries arrive with their {name:alias} placeholders
        // still in place — unlike CTLTAB_SET they are written inline, so this
        // is where they are resolved.
        sql = language.resolve(sql);
        // Every one of these SQL strings carries the BankingDate predicate, so
        // the binding is added here once rather than at each call site.
        Map<String, Object> bound = new LinkedHashMap<>(params);
        bound.put("bankingDate", bankingDate.bankingDate());
        try {
            return jdbc.query(sql, bound, (rs, i) -> new CodeEntry(
                    trimmed(rs.getString("code")),
                    trimmed(rs.getString("description"))));
        } catch (DataAccessException e) {
            log.warn("Reference data set '{}' ({}) unavailable from archival DB ({}); returning empty list",
                    setName, language.code(), e.getMostSpecificCause().getMessage());
            return List.of();
        }
    }

    private static String trimmed(String value) {
        return value == null ? "" : value.trim();
    }
}
