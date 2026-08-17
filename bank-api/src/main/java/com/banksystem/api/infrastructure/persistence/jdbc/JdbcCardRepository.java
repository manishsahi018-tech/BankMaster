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
 *
 * <p>stcardlog timestamps: the workbook documents a {@code dateTime}
 * column, but the Denodo view does not expose one — it carries the same
 * YYYYMMDDHH24MISS value as {@code datetime_bigdata}. Selecting the bare
 * name returns a 500 from the driver, so both log queries below read
 * {@code datetime_bigdata AS dateTime} and order on it. Same substitution
 * already applied to stacclog / stcustlog in JdbcAccountRepository and
 * JdbcCustomerRepository.
 */
@Repository
@Profile("denodo")
public class JdbcCardRepository implements CardRepository {


    /** Legacy tracking-history cap (non-'1' msgType). The C's
     *  post-increment check — {@code noOfCardRec++; if (noOfCardRec > 50)
     *  break;} (cbbranch2.c:7186-7189) — stores the 51st record before
     *  breaking, so legacy emits up to 51 rows, not the 50 §15 states. */
    static final int MAX_TRACKING_ROWS = 51;

    /** Card produced at the branch printer — legacy suppresses
     *  processDateTime for these rows (QUERY-SPECS §15). */
    private static final String BRANCH_PRINTER_USER = "BRCARDPRNT";

    private final NamedParameterJdbcTemplate jdbc;

    public JdbcCardRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc) {
        this.jdbc = jdbc;
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
            // A 7-char BM customer number matches EITHER the direct custNo
            // column OR the one embedded in the account number, and the second
            // test is a LIKE PATTERN rather than a SUBSTR comparison.
            //
            // stcardtab.custNo is declared size 7 and key k2 in the workbook, so
            // it looks like the obvious key — but it is not reliably populated,
            // and matching on it alone returns nothing for customers whose card
            // rows leave it blank. That is exactly why
            // JdbcCustomerRepository.resolveCardCustomer already reads it as
            // COALESCE(NULLIF(TRIM(custNo), ''), SUBSTR(bmAccNo, 6, 7)); the
            // search never got the same treatment.
            //
            // The legacy sidesteps the question entirely: SEARCH_BY_CUSTNO keys
            // on coreCustNo via index 10 (cbbranch2.c:6544-6546) and never
            // touches custNo. We cannot use that path because the UI carries the
            // 7-char archival form, not the 8-char core one.
            //
            // WHY A LIKE PATTERN AND NOT SUBSTR. Comparing SUBSTR(bmAccNo, 6, 7)
            // came back one character to the RIGHT of the customer against real
            // data: account 01000012345600 yielded 1234560 where the customer is
            // 0123456 — what a 0-based start position produces. LIKE wildcards
            // carry no such ambiguity. The account is currency(2) + ledger(3) +
            // custNo(7) + sub(2), so the pattern is five wildcards, the customer,
            // two more; it is built in Java (accountPattern) so no SQL string
            // function is involved at all.
            where = paramValue.length() <= 7
                    ? "(TRIM(s.custNo) = :custNo OR s.bmAccNo LIKE :accPattern)"
                    : "s.coreCustNo = :custNo";
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
                       s.coreAccNo, s.custNo, s.bmAccNo
                FROM   stcardtab s
                WHERE  %s
                ORDER  BY s.coreCustNo, s.cardNo
                """.formatted(where),
                params(paramName, paramValue),
                (rs, i) -> new CardRow(new CardSummary(
                        s(rs, "cardNo"), s(rs, "nameOnTheCard"),
                        s(rs, "firstIssueDate"), s(rs, "expireDate"),
                        s(rs, "cardStatus"), s(rs, "requestStatus"),
                        s(rs, "pinRequestStatus"), s(rs, "coreAccNo")),
                        rowCustomer(s(rs, "custNo"), s(rs, "bmAccNo"))));

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

    /** The bind set; a 7-char customer search also needs its LIKE pattern. */
    private static Map<String, Object> params(String name, String value) {
        return "custNo".equals(name) && value.length() <= 7
                ? Map.of(name, value, "accPattern", accountPattern(value))
                : Map.of(name, value);
    }

    /**
     * Account-number pattern for one customer: currency(2) + ledger(3) then the
     * customer then sub(2), as five single-character wildcards, the number, and
     * two more.
     */
    static String accountPattern(String custNo) {
        return "_____" + custNo + "__";
    }

    /**
     * The customer a card row belongs to.
     *
     * <p>Taken from the ACCOUNT NUMBER first and the custNo column only as a
     * fallback, which is the opposite of the obvious order and deliberate.
     * stcardtab.custNo is not reliably populated — the reason
     * JdbcCustomerRepository.resolveCardCustomer already coalesces past it —
     * and where it IS populated it has been seen holding the digits shifted a
     * place. bmAccNo is the column the account search matches on, so it is the
     * one demonstrably carrying the right value; positions 6..12, 1-based, are
     * the customer. Sliced in Java rather than SQL so the offset means exactly
     * what it says.
     *
     * <p>This is what fills the grid's customer header: getting it wrong is not
     * cosmetic, it leaves the whole header — name, branch, city — blank, because
     * the value is looked up against stcusttab.
     */
    static String rowCustomer(String custNo, String bmAccNo) {
        String acc = bmAccNo == null ? "" : bmAccNo.trim();
        if (acc.length() >= 12) {
            return acc.substring(5, 12);
        }
        return custNo == null ? "" : custNo.trim();
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
                WHERE  c.custNo = :custNo
                """,
                Map.of("custNo", custNo),
                (rs, i) -> new CardSearchResult(
                        s(rs, "custNo"), s(rs, "shortName"), s(rs, "address1"),
                        s(rs, "poBox"), s(rs, "cityName"), s(rs, "zipCode"),
                        s(rs, "branchCode"), s(rs, "custType"), custLang(s(rs, "preferredLang")),
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
                       ON  c.custNo = s.custNo
                WHERE  s.cardNo = :cardNo
                """,
                Map.of("cardNo", cardNo),
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
                SELECT l.branchCode, l.userId, l.datetime_bigdata AS dateTime,
                       l.bmUpdateStatus,
                       l.supervisorId, l.lastUpdateDateTime, l.requestType
                FROM   stcardlog l
                WHERE  l.cardNo = :cardNo
                ORDER  BY l.cardNo, l.datetime_bigdata
                """,
                Map.of("cardNo", cardNo),
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
                SELECT l.branchCode, l.requestType, l.userId,
                       l.datetime_bigdata AS dateTime,
                       l.cardGeneratedDate, l.cardGeneratedTime, l.cardGeneratedUserId,
                       l.cBranchReceiptDate, l.cBranchReceiptTime, l.cBranchReceiptUserId,
                       l.cCustIssueDate, l.cCustIssueTime, l.cCustIssueUserId,
                       l.pinGeneratedDate, l.pinGeneratedTime, l.pinGeneratedUserId,
                       l.pBranchReceiptDate, l.pBranchReceiptTime, l.pBranchReceiptUserId,
                       l.pCustIssueDate, l.pCustIssueTime, l.pCustIssueUserId,
                       l.supervisorId, l.lastUpdateDateTime, l.processDateTime,
                       l.rejectedUserId, l.rejectedDate, l.rejectedTime, l.rejectedReason
                FROM   stcardlog l
                WHERE  l.cardNo = :cardNo
                  AND  l.bmUpdateStatus = '9'
                ORDER  BY l.cardNo, l.datetime_bigdata
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_TRACKING_ROWS),
                Map.of("cardNo", cardNo),
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

    /** Legacy language normalization (cbbranch2.c:6745-6748): Arabic ('2') -> '0',
     *  anything else -> '1'. The grid header carries this normalized code, not raw
     *  stcusttab.preferredLang. */
    private static String custLang(String preferredLang) {
        return "2".equals(preferredLang) ? "0" : "1";
    }
}
