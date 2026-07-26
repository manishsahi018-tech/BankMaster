package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.CardDetail;
import com.banksystem.api.domain.model.CardHistoryEntry;
import com.banksystem.api.domain.model.CardSearchResult;
import com.banksystem.api.domain.model.CardSummary;
import com.banksystem.api.domain.model.CardUpdateHistoryEntry;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.repository.CardRepository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * ATM cards from Denodo views stcardtab / stcardlog (QUERY-SPECS.md
 * §13–15, legacy cbbranch2.c processCardSearchRequest /
 * processCardDetailRequest / getCardHistoryDetails).
 *
 * TODO(DB #2): legacy sourced the card-grid customer header and the
 * detail's custName/custCategory from the Finacle gateway (services
 * 04/05). That view's schema is not yet known, so both are read from
 * archival stcusttab on this connection for now.
 */
@Repository
@Profile("denodo")
public class JdbcCardRepository implements CardRepository {

    /** Repositories return complete result lists (services/this class page
     *  in memory); this cap only guards against runaway scans on the Hive
     *  views. */
    static final int MAX_ROWS = 1000;

    /** Legacy tracking-history cap (non-'1' msgType). The C's
     *  post-increment check — {@code noOfCardRec++; if (noOfCardRec > 50)
     *  break;} (cbbranch2.c:7186-7189) — stores the 51st record before
     *  breaking, so legacy emits up to 51 rows, not the 50 §15 states. */
    static final int MAX_TRACKING_ROWS = 51;

    /** Card produced at the branch printer — legacy suppresses
     *  processDateTime for these rows (QUERY-SPECS §15). */
    private static final String BRANCH_PRINTER_USER = "BRCARDPRNT";

    private final NamedParameterJdbcTemplate jdbc;
    private final BankingDateProvider bankingDate;

    public JdbcCardRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc,
            BankingDateProvider bankingDate) {
        this.jdbc = jdbc;
        this.bankingDate = bankingDate;
    }

    // ------------------------------------------------------------------
    // §13 card grid
    // ------------------------------------------------------------------

    private record CardRow(CardSummary summary, String custNo) {
    }

    @Override
    public CardSearchResult search(String custNo, String accNo, String cardNo, int page) {
        // Legacy checks the criteria in the order custNo > accNo > cardNo
        // (cbbranch2.c:6524 / 6549 / 6585; indexes 10 / 9 / 1 — cardNo is
        // an exact single-row read).
        //
        // Legacy bound the core-form identifiers (8-char coreCustNo,
        // 16-char coreAccNo) because the VB6 client carried gateway-sourced
        // core numbers. The revamp UI sends the archival BM forms (7-char
        // stcusttab custNo, 14-char actual accNo), so dispatch on input
        // length: 7 → s.custNo (workbook key k2) / 8 → s.coreCustNo, and
        // 14 → s.bmAccNo / 16 → s.coreAccNo.
        String where;
        String paramName;
        String paramValue;
        if (notBlank(custNo)) {
            paramName = "custNo";
            paramValue = custNo.trim();
            where = paramValue.length() <= 7
                    ? "s.custNo = :custNo" : "s.coreCustNo = :custNo";
        } else if (notBlank(accNo)) {
            paramName = "accNo";
            paramValue = accNo.trim();
            where = paramValue.length() <= 14
                    ? "s.bmAccNo = :accNo" : "s.coreAccNo = :accNo";
        } else {
            where = "s.cardNo = :cardNo";
            paramName = "cardNo";
            paramValue = cardNo == null ? "" : cardNo.trim();
        }

        List<CardRow> all = jdbc.query("""
                SELECT s.cardNo, s.nameOnTheCard, s.firstIssueDate, s.expireDate,
                       s.cardStatus, s.requestStatus, s.pinRequestStatus,
                       s.coreAccNo, s.custNo
                FROM   stcardtab s
                WHERE  s.BankingDate = :bankingDate AND %s
                ORDER  BY s.coreCustNo, s.cardNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(where, MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), paramName, paramValue),
                (rs, i) -> new CardRow(new CardSummary(
                        s(rs, "cardNo"), s(rs, "nameOnTheCard"),
                        s(rs, "firstIssueDate"), s(rs, "expireDate"),
                        s(rs, "cardStatus"), s(rs, "requestStatus"),
                        s(rs, "pinRequestStatus"), s(rs, "coreAccNo")),
                        s(rs, "custNo")));

        PagedResult<CardRow> paged = PagedResult.page(all, page);

        // Header customer: prefer the 7-char BM custNo carried on the card
        // rows (stcusttab is keyed on it); fall back to the search input.
        String headerCustNo = all.stream()
                .map(CardRow::custNo)
                .filter(JdbcCardRepository::notBlank)
                .findFirst()
                .orElse(notBlank(custNo) ? custNo.trim() : "");

        CardSearchResult header = customerHeader(headerCustNo);
        return new CardSearchResult(
                header.custNo(), header.shortName(), header.address1(),
                header.poBox(), header.cityName(), header.zipCode(),
                header.custBranchCode(), header.custType(), header.customerLang(),
                paged.rows().stream().map(CardRow::summary).toList(),
                paged.hasMore());
    }

    /**
     * Customer header for the card grid. Legacy took this from Finacle
     * gateway service 05 (validateCustNo) — TODO(DB #2): switch to that
     * connection once its view schema is known; stcusttab stands in.
     */
    private CardSearchResult customerHeader(String custNo) {
        if (!notBlank(custNo)) {
            return emptyHeader("");
        }
        List<CardSearchResult> rows = jdbc.query("""
                SELECT c.custNo,
                       COALESCE(NULLIF(TRIM(c.aShortName), ''), c.eShortName) AS shortName,
                       c.address1, c.poBox, c.cityName, c.zipCode,
                       c.branchCode, c.custType, c.preferredLang
                FROM   stcusttab c
                WHERE  c.BankingDate = :bankingDate AND c.custNo = :custNo
                """,
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", custNo),
                (rs, i) -> new CardSearchResult(
                        s(rs, "custNo"), s(rs, "shortName"), s(rs, "address1"),
                        s(rs, "poBox"), s(rs, "cityName"), s(rs, "zipCode"),
                        s(rs, "branchCode"), s(rs, "custType"), s(rs, "preferredLang"),
                        List.of(), false));
        return rows.isEmpty() ? emptyHeader(custNo) : rows.get(0);
    }

    private static CardSearchResult emptyHeader(String custNo) {
        return new CardSearchResult(custNo, "", "", "", "", "", "", "", "",
                List.of(), false);
    }

    // ------------------------------------------------------------------
    // §14 card detail
    // ------------------------------------------------------------------

    @Override
    public Optional<CardDetail> detail(String cardNo) {
        // Point read on stcardtab key 1. §14 says coreCustNo→custNo, but the
        // model's custNo (and the stcusttab join for custName) use the
        // 7-char BM form, so we return stcardtab.custNo. custName/custType
        // come from stcusttab — TODO(DB #2): legacy used the gateway lookup.
        List<CardDetail> rows = jdbc.query("""
                SELECT s.cardNo, s.custNo,
                       COALESCE(NULLIF(TRIM(c.aShortName), ''), c.eShortName) AS custName,
                       c.packageAcc,
                       s.requestStatus, s.deliveryBranchCode, s.cardType,
                       s.nameOnTheCard, s.bmAccNo, s.coreAccNo, s.sequenceNo,
                       s.requestType
                FROM   stcardtab s
                LEFT JOIN stcusttab c
                       ON  c.BankingDate = s.BankingDate
                       AND c.custNo = s.custNo
                WHERE  s.BankingDate = :bankingDate AND s.cardNo = :cardNo
                """,
                Map.of("bankingDate", bankingDate.bankingDate(), "cardNo", cardNo),
                (rs, i) -> new CardDetail(
                        s(rs, "cardNo"), s(rs, "custNo"), s(rs, "custName"),
                        custCategory(s(rs, "packageAcc")), s(rs, "requestStatus"),
                        s(rs, "deliveryBranchCode"), s(rs, "cardType"),
                        s(rs, "nameOnTheCard"), s(rs, "bmAccNo"),
                        s(rs, "coreAccNo"), s(rs, "sequenceNo"),
                        newOrUpdate(s(rs, "requestType"))));
        return rows.stream().findFirst();
    }

    /** §14: requestType '0' (initial card) → 'N', anything else → 'U'. */
    private static String newOrUpdate(String requestType) {
        return "0".equals(requestType) ? "N" : "U";
    }

    /**
     * Legacy custCategory (cbbranch2.c:7046-7051): 'K' (package account
     * holder) when the gateway packageCustFlag > '0', 'P' (pension) when
     * gateway businessType is A0029/A0290, else blank. The archival
     * stcusttab.packageAcc supports the 'K' half; 'P' needs the DB #2
     * businessType mapping (TODO(DB #2)) — until then those customers get
     * blank, never stcusttab.custType's '0'/'1' domain.
     */
    private static String custCategory(String packageAcc) {
        return !packageAcc.isEmpty() && packageAcc.charAt(0) > '0' ? "K" : "";
    }

    // ------------------------------------------------------------------
    // §15 card update history (legacy msgType '1')
    // ------------------------------------------------------------------

    @Override
    public List<CardUpdateHistoryEntry> updateHistory(String cardNo) {
        // Full list (service pages in memory); legacy paged 20 via
        // lastRecCount. Supervisor fields are blanked while the row is
        // still pending ('1'/'2') — done here, not in SQL (per-row rule).
        return jdbc.query("""
                SELECT l.branchCode, l.userId, l.dateTime, l.bmUpdateStatus,
                       l.supervisorId, l.lastUpdateDateTime, l.requestType
                FROM   stcardlog l
                WHERE  l.BankingDate = :bankingDate AND l.cardNo = :cardNo
                ORDER  BY l.cardNo, l.dateTime
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "cardNo", cardNo),
                (rs, i) -> {
                    String status = s(rs, "bmUpdateStatus");
                    boolean pending = "1".equals(status) || "2".equals(status);
                    return new CardUpdateHistoryEntry(
                            s(rs, "branchCode"), s(rs, "userId"), s(rs, "dateTime"),
                            decorateUpdateStatus(status),
                            pending ? "" : s(rs, "supervisorId"),
                            pending ? "" : s(rs, "lastUpdateDateTime"),
                            s(rs, "requestType"));
                });
    }

    /**
     * "code-label" form the grids expect (see MockCardRepository fixtures
     * and bank-ui StatusBadge.statusTone, which matches on "9-"/"3-").
     * Labels per the stcardlog.bmUpdateStatus valid values; '9' keeps the
     * legacy "Update successful" wording used across the update histories.
     */
    private static String decorateUpdateStatus(String status) {
        return switch (status) {
            case "1" -> "1-Pending with Supervisor";
            case "2" -> "2-Pending with CSO";
            case "3" -> "3-Rejected";
            case "9" -> "9-Update successful";
            default -> status;
        };
    }

    // ------------------------------------------------------------------
    // §15 card/PIN tracking history (legacy non-'1' msgType)
    // ------------------------------------------------------------------

    @Override
    public List<CardHistoryEntry> trackingHistory(String cardNo) {
        // Completed lifecycle records only (bmUpdateStatus '9'), capped at
        // 51 as in legacy (see MAX_TRACKING_ROWS — the C loop's
        // post-increment check lets a 51st row through).
        // Note: CardHistoryEntry's requestUserId /
        // requestDateTime map to stcardlog's userId / dateTime — the log
        // has no request*-named columns (schema file wins over the spec's
        // naming).
        return jdbc.query("""
                SELECT l.branchCode, l.requestType, l.userId, l.dateTime,
                       l.cardGeneratedDate, l.cardGeneratedTime, l.cardGeneratedUserId,
                       l.cBranchReceiptDate, l.cBranchReceiptTime, l.cBranchReceiptUserId,
                       l.cCustIssueDate, l.cCustIssueTime, l.cCustIssueUserId,
                       l.pinGeneratedDate, l.pinGeneratedTime, l.pinGeneratedUserId,
                       l.pBranchReceiptDate, l.pBranchReceiptTime, l.pBranchReceiptUserId,
                       l.pCustIssueDate, l.pCustIssueTime, l.pCustIssueUserId,
                       l.supervisorId, l.lastUpdateDateTime, l.processDateTime,
                       l.rejectedUserId, l.rejectedDate, l.rejectedTime, l.rejectedReason
                FROM   stcardlog l
                WHERE  l.BankingDate = :bankingDate AND l.cardNo = :cardNo
                  AND  l.bmUpdateStatus = '9'
                ORDER  BY l.cardNo, l.dateTime
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_TRACKING_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "cardNo", cardNo),
                (rs, i) -> {
                    String branchCode = s(rs, "branchCode");
                    String cardGeneratedUserId = s(rs, "cardGeneratedUserId");
                    // processDateTime suppressed when the card was produced
                    // by the branch printer (legacy BRCARDPRNT rule).
                    String processDateTime = BRANCH_PRINTER_USER.equals(cardGeneratedUserId)
                            ? "" : s(rs, "processDateTime");
                    return new CardHistoryEntry(
                            s(rs, "requestType"),
                            overlayBranch(s(rs, "userId"), branchCode),
                            s(rs, "dateTime"),
                            s(rs, "cardGeneratedDate"), s(rs, "cardGeneratedTime"),
                            overlayBranch(cardGeneratedUserId, branchCode),
                            s(rs, "cBranchReceiptDate"), s(rs, "cBranchReceiptTime"),
                            overlayBranch(s(rs, "cBranchReceiptUserId"), branchCode),
                            s(rs, "cCustIssueDate"), s(rs, "cCustIssueTime"),
                            overlayBranch(s(rs, "cCustIssueUserId"), branchCode),
                            s(rs, "pinGeneratedDate"), s(rs, "pinGeneratedTime"),
                            overlayBranch(s(rs, "pinGeneratedUserId"), branchCode),
                            s(rs, "pBranchReceiptDate"), s(rs, "pBranchReceiptTime"),
                            overlayBranch(s(rs, "pBranchReceiptUserId"), branchCode),
                            s(rs, "pCustIssueDate"), s(rs, "pCustIssueTime"),
                            overlayBranch(s(rs, "pCustIssueUserId"), branchCode),
                            overlayBranch(s(rs, "supervisorId"), branchCode),
                            s(rs, "lastUpdateDateTime"),
                            processDateTime,
                            overlayBranch(s(rs, "rejectedUserId"), branchCode),
                            s(rs, "rejectedDate"), s(rs, "rejectedTime"),
                            s(rs, "rejectedReason"));
                });
    }

    /**
     * Legacy branch-code overlay: user IDs whose FIRST character is a
     * digit — the C tests only userId[0], cbbranch2.c:7140-7141 — get
     * branchCode[1..3] written at offset 7 of the fixed 10-char user-id
     * field (see QUERY-SPECS §12/§15). Named IDs (e.g. CRDPRDCTR) pass
     * through untouched.
     */
    private static String overlayBranch(String userId, String branchCode) {
        if (userId.isEmpty() || branchCode.length() < 4
                || userId.charAt(0) < '0' || userId.charAt(0) > '9') {
            return userId;
        }
        StringBuilder buf = new StringBuilder(String.format("%-10s", userId));
        buf.replace(7, 10, branchCode.substring(1, 4));
        return buf.toString().stripTrailing();
    }

    // ------------------------------------------------------------------
    // helpers
    // ------------------------------------------------------------------

    /** Trimmed, never-null column read (Hive CHAR padding, NULLs → ""). */
    private static String s(ResultSet rs, String column) throws SQLException {
        String value = rs.getString(column);
        return value == null ? "" : value.trim();
    }

    private static boolean notBlank(String value) {
        return value != null && !value.isBlank();
    }
}
