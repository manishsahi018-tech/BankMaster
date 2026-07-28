package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.domain.model.AcctUpdateHistoryEntry;
import com.banksystem.api.domain.model.BlockedAmountBreakup;
import com.banksystem.api.domain.model.BlockedAmountItem;
import com.banksystem.api.domain.model.BmForms;
import com.banksystem.api.domain.model.ChequeBookHistory;
import com.banksystem.api.domain.model.ChequeBookRequest;
import com.banksystem.api.domain.model.SamaStatusEntry;
import com.banksystem.api.domain.model.StandingOrder;
import com.banksystem.api.domain.model.StandingOrderDetail;
import com.banksystem.api.domain.model.StopCheque;
import com.banksystem.api.domain.model.StopChequeDetail;
import com.banksystem.api.domain.repository.AccountRepository;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Account enquiries from the Denodo views of the BM archival schema
 * (QUERY-SPECS.md §3–§8, §10–§12, §16; legacy cbbranch2.c / cbothers.c /
 * cbblock.c).
 *
 * Spec-vs-workbook discrepancies resolved here (workbook column names win):
 * <ul>
 *   <li>gld0data: the legacy {@code passwd} field (single account-status
 *       char, QUERY-SPECS §3 / cross-cutting finding 4) is named
 *       {@code accStatus} in the archival workbook (label "PSSWORD
 *       PROTECTION FLAG", size 1; the neighbouring passwdBeforeFreeze /
 *       passwdBeforeDormantRestriction columns kept the old name).
 *       Account status = CONCAT('0', accStatus).</li>
 *   <li>aad0data (§16 source 2): the spec's productNo column "accNo" does
 *       not exist — the workbook's account column is
 *       {@code FinoneAlcoAccNo}, used instead.</li>
 *   <li>stchqtab carries a physical {@code reqDate} column, but the spec
 *       (§4/§12) derives the request date from
 *       SUBSTR(requestDateTime,1,8); we follow the spec so the grid value
 *       and the history key are guaranteed to agree.</li>
 *   <li>bkd0data and ccarrblk (§16 sources 3–4) are missing from the
 *       archival workbook; their column names are assumed from the spec
 *       table (bkd0data: refNo/amount/userId; ccarrblk:
 *       cardNo/blockedAmt/lastBlockedUserId). Each §16 source runs in its
 *       own try/catch so a missing view degrades to a warning.</li>
 *   <li>Key forms follow the WORKBOOK (new-DB truth), not the legacy files:
 *       the legacy C keyed gld0data / sod0data / pyd0data / ststchqlog /
 *       stsodlog on the 13-char BM account form (and gld0data index 3 on
 *       the 6-char BM customer embedded at accNo[5..10]). The workbook
 *       documents every one of those accNo columns as the 14-char ACTUAL
 *       layout ("CCMMMNNNNNNNSS", 7-char customer at digits 6–12; see the
 *       gld0data matchingLoan note "Length is changed from 13 to 14") and
 *       adds a dedicated 7-char {@code custNo} index column to gld0data.
 *       All account predicates therefore use the 14-char actual form
 *       (13-char inputs converted defensively via {@link #actualAccOf}) and
 *       the customer scan uses {@code gld0data.custNo}. ⚠ Confirm with one
 *       real-data probe on the office PC — first thing to validate.
 *       bkd0data (absent from the workbook) keeps the legacy 13-char BM
 *       key.</li>
 * </ul>
 *
 * <p>Future work (present in the C, deliberately not ported yet): the
 * stop-cheque grid's {@code destroyChequeFlag=='1'} mode (only destroyed
 * cheques, cbbranch2.c:9807-9811), and grid extras the C returns but the
 * domain records don't carry — gld0data {@code transCount} + per-row
 * {@code branchCode} (§3), sod0data {@code branchCode} (§5), and the cheque
 * book search's crd0data {@code alternativeBranchCode} (§4, fatal-if-missing
 * in the C).
 */
@Repository
@Profile("denodo")
public class JdbcAccountRepository implements AccountRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcAccountRepository.class);


    /** Status/SAMA histories are specced at max 50 rows, no cursor (§7-8). */
    static final int HISTORY_MAX_ROWS = 50;

    /** Legacy getBlockingBreakup caps the detail list at 31 rows (§16). */
    static final int MAX_BLOCKED_ITEMS = 31;

    private final NamedParameterJdbcTemplate jdbc;

    public JdbcAccountRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    // ------------------------------------------------------------------
    // §3 account grid
    // ------------------------------------------------------------------

    /** Shared by both service-21 branches (customer scan / account exact read). */
    private static final org.springframework.jdbc.core.RowMapper<AccountSummary>
            ACCOUNT_SUMMARY_MAPPER = (rs, i) -> new AccountSummary(
                    actualAccOf(rs.getString("accNo")),
                    trim(rs.getString("bookBal")),
                    trim(rs.getString("clearedBal")),
                    trim(rs.getString("blockedAmt")),
                    trim(rs.getString("accStatusCode")),
                    trim(rs.getString("accLimit")),
                    trim(rs.getString("anbDormantFlag")),
                    trim(rs.getString("branchCode")),
                    "0"); // decided per operator in AccountService (cbbranch2.c:5867)

    @Override
    public List<AccountSummary> accountsForCustomer(String custNo) {
        // Legacy: gld0data index 3 range scan on the 6-char BM customer
        // embedded at accNo[5..10] (cbbranch2.c:5646-5648):
        //     actualToBmCust(custNo, tCustNo);          7-char actual -> 6-char BM
        //     isindexinfo(gldFile, &gldKey, 3);
        //     strncpy(&gldRec.accNo[5], tCustNo, 6);    seed accNo[5..10]
        //     isstart(gldFile, &gldKey, 6, ..., ISGTEQ);
        // The key IS the customer embedded in the account number — gld0data has
        // no custNo field in the legacy record (cbslib/layout.h struct gld0data).
        // The archival accNo is the 14-char ACTUAL layout (CCMMMNNNNNNNSS), so
        // the customer sits at accNo[5..11] — BmForms.custFromActualAcc, and the
        // same SUBSTR(accNo, 6, 7) key JdbcSignatoryRepository already uses.
        // stcusttab's custNo column is deliberately not used: it is an ETL
        // addition ("introduced for index purpose on Cloudera"), not BM data.
        // AccountSummary carries no customer-header fields (verified against
        // the record and the mock), so no stcusttab enrichment is needed.
        return jdbc.query("""
                SELECT accNo, bookBal, clearedBal, blockedAmt,
                       CONCAT('0', accStatus) AS accStatusCode,
                       accLimit, anbDormantFlag, branchCode
                FROM   gld0data
                WHERE  SUBSTR(accNo, 6, 7) = :custNo
                ORDER  BY accNo
                """,
                Map.of("custNo", actualCust7(custNo)),
                ACCOUNT_SUMMARY_MAPPER);
    }

    // ------------------------------------------------------------------
    // §7-8 stacclog histories (service 57 requestType switch)
    // ------------------------------------------------------------------

    @Override
    public java.util.Optional<AccountSummary> accountByNumber(String accNo) {
        // cbbranch2.c:5720-5723 seeds gld0data index 1 with the 13-char BM
        // account, then :5823 does isRead(..., ISEQUAL) — one account or none.
        // The archival view stores the 14-char ACTUAL form, so key on that.
        return jdbc.query("""
                SELECT accNo, bookBal, clearedBal, blockedAmt,
                       CONCAT('0', accStatus) AS accStatusCode,
                       accLimit, anbDormantFlag, branchCode
                FROM   gld0data
                WHERE  accNo = :accNo
                """,
                Map.of("accNo", actualAccOf(accNo)),
                ACCOUNT_SUMMARY_MAPPER).stream().findFirst();
    }

    /** getRestrictedFlag (cbothers.c:7877-7902): stctltab recType 'BD'. */
    @Override
    public String branchBalEnqRestrictedFlag(String branchCode) {
        try {
            return jdbc.query("""
                    SELECT balEnqRestrictedFlag
                    FROM   stctltabBD
                    WHERE  branchCode = :branchCode
                    """,
                    Map.of("branchCode", trim(branchCode)),
                    (rs, i) -> trim(rs.getString("balEnqRestrictedFlag")))
                    .stream().findFirst().orElse("");
        } catch (DataAccessException e) {
            // "Error is IGNORED since it can cause total account enquiry
            // failure" (cbbranch2.c:5872) — unset means not restricted.
            log.warn("stctltabBD read failed for branch {}; treating as unrestricted: {}",
                    branchCode, e.getMessage());
            return "";
        }
    }

    /**
     * stusrbrn allowed branches (cbbranch2.c:5791-5809).
     *
     * <p>FIDELITY GAP: the legacy record holds up to 500 branches
     * (allowedBranch[500][4], cbslib/stlayout.h:2615) but the archival view
     * materialises only Branchcode1..Branchcode5. When noOfBranchesDefined
     * exceeds 5 the extra branches are simply absent from the data, and this
     * operator will be restricted on branches they are in fact permitted — so
     * it is logged loudly rather than passing silently.
     */
    @Override
    public List<String> enquiryAllowedBranches(String userId) {
        try {
            return jdbc.query("""
                    SELECT noOfBranchesDefined,
                           Branchcode1, Branchcode2, Branchcode3, Branchcode4, Branchcode5
                    FROM   stusrbrn
                    WHERE  userId = :userId
                    """,
                    Map.of("userId", trim(userId)),
                    (rs, i) -> {
                        List<String> branches = new ArrayList<>();
                        for (int n = 1; n <= 5; n++) {
                            String b = trim(rs.getString("Branchcode" + n));
                            // the C stops at the first blank slot (:5805-5806)
                            if (b.isEmpty()) {
                                break;
                            }
                            branches.add(b);
                        }
                        String defined = trim(rs.getString("noOfBranchesDefined"));
                        try {
                            if (!defined.isEmpty() && Integer.parseInt(defined) > 5) {
                                log.warn("stusrbrn for user {} declares {} allowed branches but the "
                                        + "archival view carries only 5 — this operator may be wrongly "
                                        + "restricted on the missing branches", userId, defined);
                            }
                        } catch (NumberFormatException ignored) {
                            // non-numeric count: nothing useful to warn about
                        }
                        return branches;
                    })
                    .stream().findFirst().orElseGet(List::of);
        } catch (DataAccessException e) {
            // The C logs and carries on with an empty list (:5795-5799).
            log.warn("stusrbrn read failed for user {}: {}", userId, e.getMessage());
            return List.of();
        }
    }

    @Override
    public List<AcctUpdateHistoryEntry> updateHistory(String accNo) {
        // requestType '2'. stacclog is keyed on the 14-char actual account.
        // The letter-prefix skip rule and the pending-blank rule are legacy
        // per-row logic, applied in Java rather than SQL-92.
        List<AcctUpdateHistoryEntry> rows = jdbc.query("""
                SELECT branchCode, userId, datetime_bigdata AS dateTime, bmUpdateStatus,
                       supervisorId, lastUpdateDateTime
                FROM   stacclog
                WHERE  accNo = :accNo
                ORDER  BY datetime_bigdata
                """,
                Map.of("accNo", accNo),
                (rs, i) -> {
                    String userId = trim(rs.getString("userId"));
                    String supervisorId = trim(rs.getString("supervisorId"));
                    // Skip rows where userId or supervisorId starts with a
                    // letter, unless userId is the migration marker.
                    if ((startsWithLetter(userId) || startsWithLetter(supervisorId))
                            && !"MIGRATION".equals(userId)) {
                        return null;
                    }
                    String status = trim(rs.getString("bmUpdateStatus"));
                    boolean pending = "1".equals(status) || "2".equals(status);
                    // requestType '2' copies userId/supervisorId RAW — the
                    // branch overlay exists only in the type-'0'/'1' path
                    // (cbothers.c:8015-8022 vs 8034-8038).
                    return new AcctUpdateHistoryEntry(
                            trim(rs.getString("branchCode")),
                            userId,
                            BmForms.isoToBmTimestamp(rs.getString("dateTime")),
                            status,
                            pending ? "" : supervisorId,
                            pending ? "" : BmForms.isoToBmTimestamp(rs.getString("lastUpdateDateTime")));
                });
        return rows.stream().filter(Objects::nonNull).toList();
    }

    @Override
    public List<SamaStatusEntry> samaStatusHistory(String accNo) {
        // requestType '1' — SAMA columns of stacclog (NOT stsamaacc);
        // type 1 has no reason field.
        return stacclogStatusHistory(accNo, "samaAccStatusChanged",
                "fromSamaAccStatus", "toSamaAccStatus", false);
    }

    @Override
    public List<SamaStatusEntry> statusHistory(String accNo) {
        // requestType '0' — account status changes including the reason.
        return stacclogStatusHistory(accNo, "statusChanged",
                "fromStatus", "toStatus", true);
    }

    private List<SamaStatusEntry> stacclogStatusHistory(
            String accNo, String changedFlagCol, String fromCol, String toCol,
            boolean withReason) {
        String reasonSelect = withReason ? ", accStatusChangeReason" : "";
        return jdbc.query("""
                SELECT datetime_bigdata AS dateTime, userId, supervisorId, lastUpdateDateTime,
                       branchCode, %s AS fromStatus, %s AS toStatus%s
                FROM   stacclog
                WHERE  accNo = :accNo
                  AND  %s = '1' AND bmUpdateStatus = '9'
                ORDER  BY datetime_bigdata
                """.formatted(fromCol, toCol, reasonSelect, changedFlagCol, HISTORY_MAX_ROWS),
                Map.of("accNo", accNo),
                (rs, i) -> {
                    // bmUpdateStatus='9' rows only, so the pending-blank rule
                    // never triggers here; the numeric-id branch overlay does.
                    String branch = trim(rs.getString("branchCode"));
                    return new SamaStatusEntry(
                            BmForms.isoToBmTimestamp(rs.getString("dateTime")),
                            overlayBranch(trim(rs.getString("userId")), branch),
                            overlayBranch(trim(rs.getString("supervisorId")), branch),
                            BmForms.isoToBmTimestamp(rs.getString("lastUpdateDateTime")),
                            trim(rs.getString("fromStatus")),
                            trim(rs.getString("toStatus")),
                            withReason ? trim(rs.getString("accStatusChangeReason")) : "");
                });
    }

    @Override
    public Map<String, String> snapshot(String accNo, String dateTime) {
        // Point read of the stacclog row behind an update-history entry.
        // Map keys = the AccountMaintenance screen field names (same keys as
        // the mock / the screen's SAMPLE object); values are the raw archival
        // column values (the UI formats codes), except dormant which the
        // screen's Yes/No toggle needs as a word. Blank columns are omitted
        // so the screen keeps its current values for untouched fields.
        List<Map<String, Object>> rows = jdbc.queryForList("""
                SELECT accStatus, samaAccStatus, accStatusChangeReason,
                       statementFreq, statementDay, inactiveAccFlag,
                       intApplication, crIntRate, drIntRate, payAccNo,
                       uniqueNo, uniqueSub, creditLimit, intLastRun,
                       intFreqCode, intApplDay, custBranchCode,
                       supervisorComments, acctDesc,
                       userId, supervisorId, s.datetime_bigdata AS dateTime, lastUpdateDateTime,
                       bmUpdateStatus, SUBSTR(s.accNo, 6, 7) AS customerNo,
                       -- Currency (1..2) and ledger (3..5) are encoded in the
                       -- account number (currency+ledger+custNo+00), resolved to
                       -- names via stctltabXC / stctltabMM.
                       SUBSTR(s.accNo, 1, 2) AS currencyCode,
                       SUBSTR(s.accNo, 3, 3) AS ledgerCode,
                       SUBSTR(s.accNo, 13, 2) AS subAccount,
                       (SELECT COALESCE(NULLIF(TRIM(c.eShortName), ''), c.aShortName)
                        FROM stcusttab c
                        WHERE  c.custNo = SUBSTR(s.accNo, 6, 7)) AS customerName,
                       (SELECT COALESCE(NULLIF(TRIM(x.arabicName), ''), x.englishName)
                        FROM stctltabXC x
                        WHERE  x.currCode = SUBSTR(s.accNo, 1, 2)) AS currencyName,
                       (SELECT COALESCE(NULLIF(TRIM(m.arabicName), ''), m.englishName)
                        FROM stctltabMM m
                        WHERE  m.ledgerCode = SUBSTR(s.accNo, 3, 3)) AS ledgerName
                FROM   stacclog s
                WHERE  s.accNo = :accNo AND s.datetime_bigdata = :dateTime
                FETCH FIRST 1 ROWS ONLY
                """,
                Map.of("accNo", accNo, "dateTime", dateTime));
        if (rows.isEmpty()) {
            return Map.of();
        }
        Map<String, Object> row = rows.get(0);
        String status = str(row, "bmUpdateStatus");
        boolean pending = "1".equals(status) || "2".equals(status);

        Map<String, String> snapshot = new LinkedHashMap<>();
        put(snapshot, "accountStatus", str(row, "accStatus"));
        put(snapshot, "samaStatus", str(row, "samaAccStatus"));
        put(snapshot, "statusUpdReason", str(row, "accStatusChangeReason"));
        put(snapshot, "stmtFrequency", str(row, "statementFreq"));
        put(snapshot, "statementDay", str(row, "statementDay"));
        String inactive = str(row, "inactiveAccFlag");
        put(snapshot, "dormant", inactive.isEmpty() ? "" : ("1".equals(inactive) ? "Yes" : "No"));
        put(snapshot, "intApplication", str(row, "intApplication"));
        put(snapshot, "crInterestRate", str(row, "crIntRate"));
        put(snapshot, "drInterestRate", str(row, "drIntRate"));
        put(snapshot, "payAccountNo", str(row, "payAccNo"));
        put(snapshot, "uniqueNo", str(row, "uniqueNo"));
        put(snapshot, "uniqueSub", str(row, "uniqueSub"));
        put(snapshot, "creditLimit", str(row, "creditLimit"));
        put(snapshot, "intLastRun", str(row, "intLastRun"));
        put(snapshot, "intFreqCode", str(row, "intFreqCode"));
        put(snapshot, "intApplDay", str(row, "intApplDay"));
        // acOpenDate / lastAmendDate: the C explicitly BLANKS both in the
        // service-33 response (cbbranch2.c:7716-7717), so neither is emitted.
        // The screen's branchCode is the CUSTOMER branch, not the maker's key
        // branch (cbbranch2.c:7701 copies acctLogRec.custBranchCode).
        put(snapshot, "branchCode", str(row, "custBranchCode"));
        put(snapshot, "supervisorComments", str(row, "supervisorComments"));
        put(snapshot, "acctDesc", str(row, "acctDesc"));
        // Header customer (parity with accountDetail) — the account's own
        // customer from stcusttab, short name preferred Arabic-else-English.
        put(snapshot, "customerNo", str(row, "customerNo"));
        put(snapshot, "customerName", str(row, "customerName"));
        put(snapshot, "currencyCode", str(row, "currencyCode"));
        put(snapshot, "currencyName", str(row, "currencyName"));
        put(snapshot, "ledgerCode", str(row, "ledgerCode"));
        put(snapshot, "ledgerName", str(row, "ledgerName"));
        put(snapshot, "subAccount", str(row, "subAccount"));
        // Additive keys (not in the C response, which never copies the maker/
        // checker ids); ids are raw like the type-'2' history rows — the C
        // never overlays them in this flow (cbothers.c:8015-8022).
        put(snapshot, "lastAmendUser", str(row, "userId"));
        put(snapshot, "lastUpdateCsd", str(row, "dateTime"));
        // Pending rows ('1'/'2') have no approval yet — blanked like §7-8.
        put(snapshot, "supervisorId", pending ? "" : str(row, "supervisorId"));
        put(snapshot, "supervisorApproved", pending ? "" : str(row, "lastUpdateDateTime"));
        return snapshot;
    }

    @Override
    public Map<String, String> accountDetail(String accNo) {
        // CURRENT account master from gld0data (the same source the account
        // search reads, keyed by the 14-char actual account like the blocked-
        // amount header). Keys mirror snapshot() / the AccountMaintenance screen
        // fields; log-only attributes (maker/checker ids, status-change reason,
        // supervisor comments — the service-33 update trail) are not part of the
        // current master and are left for the screen. Blank columns are omitted
        // so untouched fields keep their existing values.
        List<Map<String, Object>> rows = jdbc.queryForList("""
                SELECT g.ledgerCode, g.accDesc, g.iban, g.branchCode,
                       g.accStatus, g.samaAccStatus, g.inactiveAccFlag,
                       g.statementFrequency, g.statementDay,
                       g.intApplication, g.intApplicationFreq, g.intApplicationDay,
                       g.crIntRate, g.drIntRate, g.payAccNo, g.accLimit,
                       g.uniqueNo, g.uniqueSubNo1, g.intLastRun, g.custNo,
                       g.memorandumField1, g.memorandumField2,
                       g.accOpenDate, g.lastTransDate, g.lastAmendmentDate,
                       -- Service 33 prefers the ENGLISH short name (cbbranch2.c:7478).
                       COALESCE(NULLIF(TRIM(c.eShortName), ''), c.aShortName) AS customerName,
                       (SELECT COALESCE(NULLIF(TRIM(m.arabicName), ''), m.englishName)
                        FROM stctltabMM m
                        WHERE m.ledgerCode = g.ledgerCode) AS ledgerName,
                       -- Currency is encoded in the first 2 chars of the account
                       -- number (legacy: currency+ledger+custNo+00,
                       -- cbtdopen.c:1229 / cbothers.c:8563); resolved to a name
                       -- via stctltabXC. NOTE: never put an apostrophe in a SQL
                       -- comment — the Denodo driver does not strip -- comments
                       -- before counting ? placeholders, so a stray quote opens
                       -- a string literal that swallows the bind parameter
                       -- ("This statement has no parameters").
                       SUBSTR(g.accNo, 1, 2) AS currencyCode,
                       SUBSTR(g.accNo, 13, 2) AS subAccount,
                       (SELECT COALESCE(NULLIF(TRIM(x.arabicName), ''), x.englishName)
                        FROM stctltabXC x
                        WHERE x.currCode = SUBSTR(g.accNo, 1, 2)) AS currencyName
                FROM   gld0data g
                LEFT JOIN stcusttab c
                       ON  c.custNo = g.custNo
                WHERE  g.accNo = :accNo
                FETCH FIRST 1 ROWS ONLY
                """,
                // gld0data is keyed by the 14-char actual account (same as the
                // blocked-amount header); actualAccOf converts a 13-char BM input
                // defensively and passes a 14-char actual through.
                Map.of("accNo", actualAccOf(accNo)));
        if (rows.isEmpty()) {
            return Map.of();
        }
        Map<String, Object> row = rows.get(0);
        Map<String, String> d = new LinkedHashMap<>();
        put(d, "accountStatus", str(row, "accStatus"));
        put(d, "samaStatus", str(row, "samaAccStatus"));
        String inactive = str(row, "inactiveAccFlag");
        put(d, "dormant", inactive.isEmpty() ? "" : ("1".equals(inactive) ? "Yes" : "No"));
        put(d, "stmtFrequency", str(row, "statementFrequency"));
        put(d, "statementDay", str(row, "statementDay"));
        put(d, "intApplication", str(row, "intApplication"));
        put(d, "intFreqCode", str(row, "intApplicationFreq"));
        put(d, "intApplDay", str(row, "intApplicationDay"));
        put(d, "crInterestRate", str(row, "crIntRate"));
        put(d, "drInterestRate", str(row, "drIntRate"));
        put(d, "payAccountNo", str(row, "payAccNo"));
        put(d, "creditLimit", str(row, "accLimit"));
        put(d, "uniqueNo", str(row, "uniqueNo"));
        put(d, "uniqueSub", str(row, "uniqueSubNo1"));
        put(d, "intLastRun", str(row, "intLastRun"));
        put(d, "branchCode", str(row, "branchCode"));
        put(d, "ledgerCode", str(row, "ledgerCode"));
        put(d, "ledgerName", str(row, "ledgerName"));  // stctltabMM lookup
        put(d, "currencyCode", str(row, "currencyCode"));   // accNo[1..2]
        put(d, "currencyName", str(row, "currencyName"));   // stctltabXC lookup
        put(d, "subAccount", str(row, "subAccount"));       // accNo[13..14]
        put(d, "iban", str(row, "iban"));
        put(d, "acctDesc", str(row, "accDesc"));
        // Header customer from the gld0data.custNo -> stcusttab join (short name
        // preferred Arabic-else-English, like the card search header).
        put(d, "customerNo", str(row, "custNo"));
        put(d, "customerName", str(row, "customerName"));
        // gld0data master fields (cbbranch2.c:7456-7467); dates are BM-packed.
        put(d, "memoNote1", str(row, "memorandumField1"));
        put(d, "memoNote2", str(row, "memorandumField2"));
        put(d, "acOpenDate", BmForms.actualDate(str(row, "accOpenDate")));
        put(d, "lastTransDate", BmForms.actualDate(str(row, "lastTransDate")));
        put(d, "lastAmendDate", BmForms.actualDate(str(row, "lastAmendmentDate")));
        // collateral (gldRec.drawerName, cbbranch2.c:7455) is NOT carried by the
        // archival gld0data view (no drawer/name column) — left to the screen.

        // Maker/checker from the most-recent non-'9' stacclog row
        // (getAccLastUpdateUserId, cbbranch2.c): last amend user/date + supervisor.
        List<Map<String, Object>> logRows = jdbc.queryForList("""
                SELECT userId, supervisorId, datetime_bigdata AS dateTime, lastUpdateDateTime, accStatusChangeReason
                FROM   stacclog
                WHERE  accNo = :accNo AND bmUpdateStatus <> '9'
                ORDER  BY lastUpdateDateTime DESC
                FETCH FIRST 1 ROWS ONLY
                """,
                Map.of("accNo", actualAccOf(accNo)));
        if (!logRows.isEmpty()) {
            Map<String, Object> lr = logRows.get(0);
            put(d, "lastAmendUser", str(lr, "userId"));
            put(d, "lastUpdateCsd", str(lr, "dateTime"));
            put(d, "supervisorId", str(lr, "supervisorId"));
            put(d, "supervisorApproved", str(lr, "lastUpdateDateTime"));
            put(d, "statusUpdReason", str(lr, "accStatusChangeReason"));
        }
        return d;
    }

    // ------------------------------------------------------------------
    // §4 cheque book requests
    // ------------------------------------------------------------------

    @Override
    public List<ChequeBookRequest> chequeBookRequests(String accNo) {
        // stchqtab key 1 — 14-char actual account. deliveryBranchCode falls
        // back to custBranchCode when blank or '0000'; requestUserId gets the
        // numeric-id branch overlay (both Java-side per-row rules).
        return jdbc.query("""
                SELECT deliveryBranchCode, custBranchCode, requestUserId, branchCode,
                       chequeType, booksRequested, requestDateTime, requestStatus,
                       chequeNoFrom, chequeNoTo
                FROM   stchqtab
                WHERE  accNo = :accNo
                ORDER  BY requestDateTime
                """,
                Map.of("accNo", accNo),
                (rs, i) -> {
                    String delivery = trim(rs.getString("deliveryBranchCode"));
                    if (delivery.isEmpty() || "0000".equals(delivery)) {
                        delivery = trim(rs.getString("custBranchCode"));
                    }
                    String requestDateTime = BmForms.isoToBmTimestamp(rs.getString("requestDateTime"));
                    return new ChequeBookRequest(
                            delivery,
                            overlayBranch(trim(rs.getString("requestUserId")),
                                    trim(rs.getString("branchCode"))),
                            trim(rs.getString("chequeType")),
                            trim(rs.getString("booksRequested")),
                            // reqDate = first 8 chars of requestDateTime (§4);
                            // matches the §12 history key.
                            requestDateTime.length() > 8
                                    ? requestDateTime.substring(0, 8) : requestDateTime,
                            trim(rs.getString("requestStatus")),
                            trim(rs.getString("chequeNoFrom")),
                            trim(rs.getString("chequeNoTo")));
                });
    }

    // ------------------------------------------------------------------
    // §5 standing orders
    // ------------------------------------------------------------------

    @Override
    public List<StandingOrder> standingOrders(String accNo) {
        // sod0data key 1. Legacy C keyed on the 13-char BM form (isstart
        // length 13, cbbranch2.c:10379-10380); the workbook documents accNo
        // as the 14-char actual form, used here (⚠ confirm with a real-data
        // probe). payAccNo converted defensively for display (13-char BM
        // values expanded, 14-char passed through).
        return jdbc.query("""
                SELECT sodNo, paymentType, paymentAmt, payAccNo, orderType, paymentFrequency
                FROM   sod0data
                WHERE  accNo = :accNo
                ORDER  BY sodNo
                """,
                Map.of("accNo", actualAccOf(accNo)),
                (rs, i) -> new StandingOrder(
                        trim(rs.getString("sodNo")),
                        trim(rs.getString("paymentType")),
                        trim(rs.getString("paymentAmt")),
                        actualAccOf(rs.getString("payAccNo")),
                        trim(rs.getString("orderType")),
                        trim(rs.getString("paymentFrequency"))));
    }

    // ------------------------------------------------------------------
    // §6 stop cheques
    // ------------------------------------------------------------------

    @Override
    public List<StopCheque> stopCheques(String accNo) {
        // pyd0data key 1 — recType 'CH' + account. Legacy C seeded the
        // 13-char BM form (isstart length 15 = recType 2 + accNo 13,
        // cbbranch2.c:9787-9789); the workbook documents accNo as the
        // 14-char actual form, used here (⚠ confirm with a real-data probe).
        // The interface carries no destroyChequeFlag, so all rows are
        // returned (the legacy exclusion of destroyed cheques is commented
        // out anyway).
        return jdbc.query("""
                SELECT chequeNo, amount, dateStop, payeeName, chequeFrom
                FROM   pyd0data
                WHERE  recType = 'CH' AND accNo = :accNo
                ORDER  BY chequeNo
                """,
                Map.of("accNo", actualAccOf(accNo)),
                (rs, i) -> new StopCheque(
                        trim(rs.getString("chequeNo")),
                        trim(rs.getString("amount")),
                        BmForms.actualDate(rs.getString("dateStop")),
                        trim(rs.getString("payeeName")),
                        trim(rs.getString("chequeFrom"))));
    }

    // ------------------------------------------------------------------
    // §10 stop cheque detail
    // ------------------------------------------------------------------

    @Override
    public Optional<StopChequeDetail> stopChequeDetail(String accNo, String chequeNo) {
        // Point read + latest ststchqlog userId. The log's chequeNo is
        // matched on the first 8 bytes only (legacy quirk). "Latest row" is
        // expressed as nested scalar subqueries (max lastUpdateBmDate, then
        // max userId at that date) — Denodo/Hive has no LATERAL and no
        // ORDER BY inside scalar subqueries.
        // Legacy C keyed both tables on the 13-char BM account
        // (cbbranch2.c:9853, 9918); the workbook documents accNo as the
        // 14-char actual form, used here (⚠ confirm with a real-data probe).
        String actualAccNo = actualAccOf(accNo);
        String cheque = trim(chequeNo);
        String cheque8 = cheque.length() > 8 ? cheque.substring(0, 8) : cheque;
        Map<String, String> params = new HashMap<>();
        params.put("accNo", actualAccNo);
        params.put("chequeNo", cheque);
        params.put("chequeNo8", cheque8);
        List<StopChequeDetail> rows = jdbc.query("""
                SELECT p.chequeNo, p.amount, p.dateStop, p.payeeName, p.chequeFrom,
                       (SELECT MAX(l.userId) FROM ststchqlog l
                         WHERE  l.recType = 'CH'
                           AND l.accNo = :accNo AND SUBSTR(l.chequeNo, 1, 8) = :chequeNo8
                           AND l.lastUpdateBmDate =
                               (SELECT MAX(l2.lastUpdateBmDate) FROM ststchqlog l2
                                 WHERE  l2.recType = 'CH'
                                   AND l2.accNo = :accNo
                                   AND SUBSTR(l2.chequeNo, 1, 8) = :chequeNo8)) AS stopChqUserId
                FROM   pyd0data p
                WHERE  p.recType = 'CH'
                  AND  p.accNo = :accNo AND p.chequeNo = :chequeNo
                """,
                params,
                (rs, i) -> new StopChequeDetail(
                        accNo,
                        trim(rs.getString("chequeNo")),
                        trim(rs.getString("amount")),
                        BmForms.actualDate(rs.getString("dateStop")),
                        trim(rs.getString("payeeName")),
                        trim(rs.getString("chequeFrom")),
                        trim(rs.getString("stopChqUserId"))));
        return rows.stream().findFirst();
    }

    // ------------------------------------------------------------------
    // §11 standing order detail
    // ------------------------------------------------------------------

    @Override
    public Optional<StandingOrderDetail> standingOrderDetail(String accNo, String sodNo) {
        // The spec's LEFT JOIN LATERAL over stsodlog is rewritten as two
        // scalar subqueries (latest lastUpdateDateTime, then the userId of
        // that latest row); custBranchCode comes from gld0data via a scalar
        // subquery whose absence — like the legacy ignored read error —
        // just yields blank. Payee name and the pending flag are separate
        // queries (see below).
        // Legacy C keyed sod0data/stsodlog/gld0data on the 13-char BM form
        // (cbbranch2.c:10544, 10623, 10662); the workbook documents these
        // accNo columns as the 14-char actual form, used here (⚠ confirm
        // with a real-data probe).
        String actualAccNo = actualAccOf(accNo);
        Map<String, String> params = Map.of(
                "accNo", actualAccNo,
                "sodNo", sodNo);
        List<Map<String, Object>> rows = jdbc.queryForList("""
                SELECT s.sodNo, s.orderType, s.paymentType, s.paymentMode,
                       s.paymentFrequency, s.firstPaymentDate, s.nextPaymentDate,
                       s.finalPaymentDate, s.lastProcessedDate, s.paymentsToBeMade,
                       s.paymentsMade, s.limitInExcessFlag, s.commissionFlag,
                       s.processNextDayFlag, s.thresholdAmt, s.paymentAmt,
                       s.totalPaidToDate, s.totalToPay, s.payAccNo,
                       s.drNarrative1, s.drNarrative2, s.crNarrative1, s.crNarrative2,
                       s.transactionDateFlag, s.branchCode, s.remarks,
                       (SELECT MAX(g.branchCode) FROM gld0data g
                         WHERE  g.accNo = :accNo) AS custBranchCode,
                       (SELECT MAX(l.lastUpdateDateTime) FROM stsodlog l
                         WHERE  l.accNo = :accNo AND l.sodNo = :sodNo) AS lastUpdateDate,
                       (SELECT MAX(l.userId) FROM stsodlog l
                         WHERE  l.accNo = :accNo AND l.sodNo = :sodNo
                           AND l.lastUpdateDateTime =
                               (SELECT MAX(l2.lastUpdateDateTime) FROM stsodlog l2
                                 WHERE  l2.accNo = :accNo AND l2.sodNo = :sodNo)) AS lastUpdateUserId
                FROM   sod0data s
                WHERE  s.accNo = :accNo AND s.sodNo = :sodNo
                """, params);
        if (rows.isEmpty()) {
            return Optional.empty();
        }
        Map<String, Object> row = rows.get(0);
        String payAccActual = actualAccOf(str(row, "payAccNo"));
        // C copies only the DATE part of the latest stsodlog timestamp into
        // lastUpdateDate (cbbranch2.c:10680, strncpy ..., 8).
        String lastUpdateDate = str(row, "lastUpdateDate");
        if (lastUpdateDate.length() > 8) {
            lastUpdateDate = lastUpdateDate.substring(0, 8);
        }
        return Optional.of(new StandingOrderDetail(
                accNo,
                str(row, "sodNo"),
                str(row, "orderType"),
                str(row, "paymentType"),
                str(row, "paymentMode"),
                str(row, "paymentFrequency"),
                BmForms.actualDate(str(row, "firstPaymentDate")),
                BmForms.actualDate(str(row, "nextPaymentDate")),
                BmForms.actualDate(str(row, "finalPaymentDate")),
                BmForms.actualDate(str(row, "lastProcessedDate")),
                str(row, "paymentsToBeMade"),
                str(row, "paymentsMade"),
                str(row, "limitInExcessFlag"),
                str(row, "commissionFlag"),
                str(row, "processNextDayFlag"),
                str(row, "thresholdAmt"),
                str(row, "paymentAmt"),
                str(row, "totalPaidToDate"),
                str(row, "totalToPay"),
                payAccActual,
                payeeCustName(payAccActual),
                str(row, "drNarrative1"),
                str(row, "drNarrative2"),
                str(row, "crNarrative1"),
                str(row, "crNarrative2"),
                str(row, "transactionDateFlag"),
                str(row, "branchCode"),
                str(row, "remarks"),
                str(row, "custBranchCode"),
                str(row, "lastUpdateUserId"),
                lastUpdateDate,
                standingOrderPending(actualAccNo, sodNo)));
    }

    /**
     * Payee short name from the customer embedded in the ACTUAL (14-char)
     * payee account. Legacy getCustName (cbothers.c:8195) substitutes the
     * ORGANISATION short names when {@code custType != '0'}
     * (cbothers.c:8235-8239) before the aShortName-blank → eShortName pick
     * (cbbranch2.c:10604-10607); reproduced in SQL below. The C's secondary
     * fallback — reading crd0data.shortName when the customer is missing
     * from stcusttab (cbothers.c:8209-8230) — is deliberately NOT ported;
     * missing customers degrade to "Invalid Customer" like the legacy
     * error path.
     */
    private String payeeCustName(String payAccActual) {
        if (trim(payAccActual).isEmpty()) {
            return "Invalid Customer";
        }
        try {
            List<String> names = jdbc.query("""
                    SELECT CASE WHEN custType <> '0'
                                THEN COALESCE(NULLIF(TRIM(aOrgShortName), ''), eOrgShortName)
                                ELSE COALESCE(NULLIF(TRIM(aShortName), ''), eShortName)
                           END AS payeeCustName
                    FROM   stcusttab
                    WHERE  custNo = :custNo
                    FETCH FIRST 1 ROWS ONLY
                    """,
                    Map.of("custNo", BmForms.custFromActualAcc(payAccActual)),
                    (rs, i) -> trim(rs.getString("payeeCustName")));
            return names.isEmpty() || names.get(0).isEmpty() ? "Invalid Customer" : names.get(0);
        } catch (DataAccessException e) {
            log.warn("payeeCustName lookup failed for payAccNo {}: {}", payAccActual, e.getMessage());
            return "Invalid Customer";
        }
    }

    /** checkStdOrdPendingStatus — any stsodlog row still pending ('1'/'2').
     *  accNo in the 14-char actual form (workbook; legacy C used BM-13). */
    private boolean standingOrderPending(String actualAccNo, String sodNo) {
        return !jdbc.queryForList("""
                SELECT 1
                FROM   stsodlog
                WHERE  accNo = :accNo AND sodNo = :sodNo
                  AND  bmUpdateStatus IN ('1', '2')
                FETCH FIRST 1 ROWS ONLY
                """,
                Map.of("accNo", actualAccNo, "sodNo", sodNo))
                .isEmpty();
    }

    // ------------------------------------------------------------------
    // §12 cheque book history
    // ------------------------------------------------------------------

    @Override
    public Optional<ChequeBookHistory> chequeBookHistory(String accNo, String reqDate) {
        // Unique-key read: 14-char actual accNo + first 8 chars of
        // requestDateTime. Per-user-id overlay rules applied in Java — see
        // the comment at the mapping below (they differ per lifecycle step).
        List<Map<String, Object>> rows = jdbc.queryForList("""
                SELECT requestUserId, requestDateTime,
                       producedDate, producedTime, producedUserId,
                       recdByBranchDate, recdByBranchTime, recdByBranchUserId,
                       issuedToCustDate, issuedToCustTime, issuedToCustUserId,
                       rejectedDate, rejectedTime, rejectedUserId, rejectedReason,
                       branchCode
                FROM   stchqtab
                WHERE  accNo = :accNo
                  AND  SUBSTR(requestDateTime, 1, 8) = :reqDate
                FETCH FIRST 1 ROWS ONLY
                """,
                Map.of("accNo", accNo, "reqDate", reqDate));
        if (rows.isEmpty()) {
            return Optional.empty();
        }
        Map<String, Object> row = rows.get(0);
        String branch = str(row, "branchCode");
        // Per the C history branch (cbbranch2.c:10278-10301): request/
        // recdByBranch/issuedToCust user ids get the branchCode overlay;
        // producedUserId is copied RAW (10283 — no digit check/overlay);
        // rejectedUserId is overlaid with ITS OWN chars [1..3] instead of
        // the branch (10294-10295) — reproduced verbatim below.
        return Optional.of(new ChequeBookHistory(
                accNo,
                str(row, "requestDateTime"),
                overlayBranch(str(row, "requestUserId"), branch),
                BmForms.actualDate(str(row, "producedDate")),
                str(row, "producedTime"),
                str(row, "producedUserId"),
                BmForms.actualDate(str(row, "recdByBranchDate")),
                str(row, "recdByBranchTime"),
                overlayBranch(str(row, "recdByBranchUserId"), branch),
                BmForms.actualDate(str(row, "issuedToCustDate")),
                str(row, "issuedToCustTime"),
                overlayBranch(str(row, "issuedToCustUserId"), branch),
                BmForms.actualDate(str(row, "rejectedDate")),
                str(row, "rejectedTime"),
                overlaySelf(str(row, "rejectedUserId")),
                str(row, "rejectedReason")));
    }

    // ------------------------------------------------------------------
    // §16 blocked amount breakup
    // ------------------------------------------------------------------

    @Override
    public BlockedAmountBreakup blockedAmountBreakup(String accNo) {
        // Fixed-order five-source union, capped at 31 rows, each amount
        // ABS()-ed and zero rows skipped (except manual ccarrblk rows — see
        // source 4). Legacy C keyed sources 1-3 on the 13-char BM account /
        // 6-char BM customer; the workbook documents gld0data/aad0data in
        // the 14-char actual form with a dedicated gld0data.custNo column,
        // used here (⚠ confirm with a real-data probe). bkd0data has no
        // workbook entry, so it keeps the legacy 13-char BM key. Each source
        // runs in its own guarded query because bkd0data and ccarrblk are
        // missing from the archival workbook — a missing view logs a
        // warning and the remaining sources still contribute.
        String actualAccNo = actualAccOf(accNo);
        String bmAccNo = BmForms.bmAcc(actualAccNo); // bkd0data only (no workbook schema)

        // NOTE: the C treats a failed gld0data header read as fatal
        // (NOT_FOUND "Invalid Account number", cbblock.c:274-291); this
        // enquiry port degrades to total "0" and still returns the details.
        String total = "0";
        try {
            List<String> totals = jdbc.query("""
                    SELECT blockedAmt
                    FROM   gld0data
                    WHERE  accNo = :accNo
                    FETCH FIRST 1 ROWS ONLY
                    """,
                    Map.of("accNo", actualAccNo),
                    // Decode the overpunch-signed header total (sign preserved,
                    // NOT ABS'd) to match cbblock.c:293-295, consistent with the
                    // decoded detail rows.
                    (rs, i) -> signedAmount(rs.getString("blockedAmt")));
            if (!totals.isEmpty() && !totals.get(0).isEmpty()) {
                total = totals.get(0);
            }
        } catch (DataAccessException e) {
            log.warn("blockedAmountBreakup header read failed for {}: {}", accNo, e.getMessage());
        }

        List<BlockedAmountItem> items = new ArrayList<>();

        // 1. gld0data — BM loans blocking this settlement account ('B');
        //    productNo = matchingLoan when present, else the loan account.
        //    Legacy: index 3 on the BM customer at accNo[5..10], seeded from
        //    the account being viewed, then a settlementAccNo filter per row
        //    (cbblock.c:300-310):
        //        isindexinfo(gldFile, &gldKey, 3);  /* based on customer number */
        //        strncpy(&gldRec.accNo[5], &bmAccNo[5], 6);
        //        isstart(gldFile, &gldKey, 6, ..., ISGTEQ);
        //        ... if (strncmp(&gldRec.accNo[5], &bmAccNo[5], 6)) break;
        //            if (strncmp(gldRec.settlementAccNo, bmAccNo, 13)) continue;
        //    The customer comes from the account number itself — gld0data has no
        //    custNo field in the legacy record; the archival column is an ETL
        //    addition and is deliberately not used.
        blockedSource(items, "gld0data", """
                SELECT accNo AS productNo, matchingLoan, blockedArrear2 AS blockedAmt
                FROM   gld0data
                WHERE  SUBSTR(accNo, 6, 7) = SUBSTR(:accNo, 6, 7)
                  AND  settlementAccNo = :accNo AND blockedArrear2 <> 0
                ORDER  BY accNo
                """.formatted(MAX_BLOCKED_ITEMS),
                Map.of("accNo", actualAccNo),
                row -> {
                    String matchingLoan = str(row, "matchingLoan");
                    String productNo = matchingLoan.isEmpty()
                            ? actualAccOf(str(row, "productNo"))
                            : actualAccOf(matchingLoan);
                    return new BlockedAmountItem("B", productNo, str(row, "blockedAmt"), "");
                });

        // 2. aad0data — FINONE loans ('F'). Spec names the productNo column
        //    "accNo"; the workbook's column is FinoneAlcoAccNo (used here).
        //    The C displays it through bmAccToActual (cbblock.c:357), which
        //    turns the 13-char Memo(5)+Loan(8) value into the 14-char form
        //    with a '0' inserted — actualAccOf reproduces that exactly.
        blockedSource(items, "aad0data", """
                SELECT FinoneAlcoAccNo AS productNo, loanBlockBal AS blockedAmt
                FROM   aad0data
                WHERE  settlementAccNo = :accNo
                  AND  loanBlockBal <> 0
                """.formatted(MAX_BLOCKED_ITEMS),
                Map.of("accNo", actualAccNo),
                row -> new BlockedAmountItem("F", actualAccOf(str(row, "productNo")),
                        str(row, "blockedAmt"), ""));

        // 3. bkd0data — other BM blocking ('O'). NOT in the archival
        //    workbook; column names (refNo, amount, userId) assumed from the
        //    spec's source table, and the legacy 13-char BM account key is
        //    kept (no workbook evidence of a converted form).
        blockedSource(items, "bkd0data", """
                SELECT refNo AS productNo, amount AS blockedAmt, userId
                FROM   bkd0data
                WHERE  accNo = :bmAccNo
                  AND  recType = '1' AND amount <> 0
                """.formatted(MAX_BLOCKED_ITEMS),
                Map.of("bmAccNo", bmAccNo),
                // Legacy copies only the FIRST 3 chars of the blocking userId for
                // the 'O' source (cbblock.c:399, strncpy(...,3)) — unique to this
                // branch; every other source keeps the full 10.
                row -> new BlockedAmountItem("O", str(row, "productNo"),
                        str(row, "blockedAmt"), first3(str(row, "userId"))));

        // 4. ccarrblk — credit-card arrear blocks. NOT in the archival
        //    workbook; column names assumed (they exist in the legacy record
        //    layout, layout.h:3162-3182). Keyed on the 14-char form.
        //    Faithful to cbblock.c:422-460: the discriminator is the
        //    record's autoManualFlag ('M' = manual, anything else = auto
        //    batch row); manual rows are kept EVEN WITH a zero amount and
        //    get the requestBranch overlay on the blocking user; auto rows
        //    skip zero amounts and are attributed to the CCARRBLK batch.
        //    Handled inline (not via blockedSource) because of the
        //    manual-rows-keep-zero rule; same try/catch degradation.
        if (items.size() < MAX_BLOCKED_ITEMS) {
            try {
                for (Map<String, Object> row : jdbc.queryForList("""
                        SELECT cardNo AS productNo, blockedAmt, autoManualFlag,
                               lastBlockedUserId, requestBranch
                        FROM   ccarrblk
                        WHERE  bmAccNo = :displayAccNo
                        """.formatted(MAX_BLOCKED_ITEMS),
                        Map.of("displayAccNo", actualAccNo))) {
                    if (items.size() >= MAX_BLOCKED_ITEMS) {
                        break;
                    }
                    String amount = absAmount(str(row, "blockedAmt"));
                    if ("M".equals(str(row, "autoManualFlag"))) {
                        items.add(new BlockedAmountItem("M", str(row, "productNo"),
                                amount.isEmpty() ? "0" : amount,
                                overlayBranch(str(row, "lastBlockedUserId"),
                                        str(row, "requestBranch"))));
                    } else {
                        if (amount.isEmpty()) {
                            continue; // zero auto rows skipped (cbblock.c:440-441)
                        }
                        items.add(new BlockedAmountItem("C", str(row, "productNo"),
                                amount, "CCARRBLK"));
                    }
                }
            } catch (DataAccessException e) {
                log.warn("Blocked-amount source ccarrblk unavailable (schema gap?): {}",
                        e.getMessage());
            }
        }

        // 5. staccblk — manual account blocks ('A'). Keyed on the 14-char
        //    form; blockedAmt is a string column in the workbook, so the
        //    non-zero/ABS handling stays in Java. The blocking user gets the
        //    requestBranch overlay when it starts with a digit
        //    (cbblock.c:482-484).
        blockedSource(items, "staccblk", """
                SELECT bmAccNo AS productNo, blockedAmt, lastBlockedUserId, requestBranch
                FROM   staccblk
                WHERE  bmAccNo = :displayAccNo
                """.formatted(MAX_BLOCKED_ITEMS),
                Map.of("displayAccNo", actualAccNo),
                row -> new BlockedAmountItem("A", str(row, "productNo"),
                        str(row, "blockedAmt"),
                        overlayBranch(str(row, "lastBlockedUserId"),
                                str(row, "requestBranch"))));

        return new BlockedAmountBreakup(accNo, total, items);
    }

    /**
     * Runs one §16 source query, ABS-ing amounts and skipping zero/blank
     * rows, respecting the overall 31-item cap. A failing source (e.g. the
     * bkd0data / ccarrblk views absent from the archival schema) only logs
     * a warning so the other sources still contribute.
     */
    private void blockedSource(List<BlockedAmountItem> items, String source, String sql,
            Map<String, String> params,
            java.util.function.Function<Map<String, Object>, BlockedAmountItem> mapper) {
        if (items.size() >= MAX_BLOCKED_ITEMS) {
            return;
        }
        try {
            for (Map<String, Object> row : jdbc.queryForList(sql, params)) {
                if (items.size() >= MAX_BLOCKED_ITEMS) {
                    return;
                }
                BlockedAmountItem item = mapper.apply(row);
                String amount = absAmount(item.blockedAmt());
                if (amount.isEmpty()) {
                    continue; // zero / unparsable amounts are skipped
                }
                items.add(new BlockedAmountItem(item.productType(), item.productNo(),
                        amount, item.userIdBlocked()));
            }
        } catch (DataAccessException e) {
            log.warn("Blocked-amount source {} unavailable (schema gap?): {}",
                    source, e.getMessage());
        }
    }

    // ------------------------------------------------------------------
    // helpers
    // ------------------------------------------------------------------

    private static String trim(String value) {
        return value == null ? "" : value.trim();
    }

    /** Column value from a queryForList row (case-insensitive keys). */
    private static String str(Map<String, Object> row, String column) {
        Object value = row.get(column);
        return value == null ? "" : value.toString().trim();
    }

    private static void put(Map<String, String> map, String key, String value) {
        if (value != null && !value.isEmpty()) {
            map.put(key, value);
        }
    }

    private static boolean startsWithLetter(String value) {
        return !value.isEmpty() && Character.isLetter(value.charAt(0));
    }

    /**
     * Stored account value → 14-char actual/display form. BM-form (13-char)
     * values are converted with BmForms; values already in the 14-char
     * actual form (stchqtab / stacclog / staccblk) pass through unchanged.
     */
    private static String actualAccOf(String stored) {
        String value = trim(stored);
        return value.length() == 13 ? BmForms.actualAcc(value) : value;
    }

    /**
     * Legacy user-id normalisation: ids that start with a digit get
     * branchCode[1..3] overlaid at offset 7 of the 10-char id field
     * (§4/§7-8/§12). Alphabetic ids (system users) are left untouched.
     */
    private static String overlayBranch(String userId, String branchCode) {
        String id = trim(userId);
        String branch = trim(branchCode);
        if (id.isEmpty() || !Character.isDigit(id.charAt(0)) || branch.length() < 4) {
            return id;
        }
        StringBuilder sb = new StringBuilder(id);
        while (sb.length() < 10) {
            sb.append(' ');
        }
        sb.replace(7, 10, branch.substring(1, 4));
        return sb.toString().trim();
    }

    /**
     * Legacy rejectedUserId quirk, reproduced VERBATIM from
     * cbbranch2.c:10294-10295: when the id starts with a digit, its own
     * chars [1..3] (not the branch code) are copied onto positions 7..9 of
     * the 10-char field —
     * {@code strncpy(&resp.rejectedUserId[7], &chqTabRec.rejectedUserId[1], 3)}.
     * Almost certainly a legacy bug (every other lifecycle id uses
     * branchCode[1..3]), but the C is ground truth.
     */
    private static String overlaySelf(String userId) {
        String id = trim(userId);
        if (id.isEmpty() || !Character.isDigit(id.charAt(0))) {
            return id;
        }
        StringBuilder sb = new StringBuilder(id);
        while (sb.length() < 10) {
            sb.append(' ');
        }
        sb.replace(7, 10, sb.substring(1, 4));
        return sb.toString().trim();
    }

    /**
     * Customer number normalised to the 7-char actual form used by the
     * archival {@code gld0data.custNo} index column (zero-padded, like the
     * BmForms conversions' input handling).
     */
    private static String actualCust7(String custNo) {
        String v = trim(custNo);
        if (v.length() >= 7) {
            return v.substring(0, 7);
        }
        return "0".repeat(7 - v.length()) + v;
    }

    /**
     * ABS()-ed amount, or "" for blank / zero / unparsable values (§16).
     * Decoded via BmForms.amountOrNull — BM amounts carry a
     * trailing-overpunch sign ('P'..'Y' last byte = negative), so a plain
     * BigDecimal parse would drop every negative amount.
     */
    private static String absAmount(String raw) {
        BigDecimal amount = BmForms.amountOrNull(raw);
        return amount == null || amount.signum() == 0 ? "" : amount.abs().toPlainString();
    }

    /** Sign-preserving decode for the GL blocked-amount header total: the C
     *  formats it %014.0f without ABS (cbblock.c:293-295), unlike the ABS'd
     *  detail rows. Raw overpunch string -> signed plain number; null/blank -> "0". */
    private static String signedAmount(String raw) {
        BigDecimal amount = BmForms.amountOrNull(raw);
        return amount == null ? "0" : amount.toPlainString();
    }

    /** First 3 chars of the blocking userId — the 'O' (other-BM) source width (cbblock.c:399). */
    private static String first3(String s) {
        return s.length() > 3 ? s.substring(0, 3) : s;
    }
}
