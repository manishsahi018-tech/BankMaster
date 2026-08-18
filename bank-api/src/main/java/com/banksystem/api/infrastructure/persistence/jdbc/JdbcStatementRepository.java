package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.application.NotAvailableException;
import com.banksystem.api.domain.model.HistoricalStatement;
import com.banksystem.api.domain.model.HistoricalStatementLine;
import com.banksystem.api.domain.repository.StatementRepository;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Archived statements from DB #3 — legacy frmHistStmt.
 *
 * <h2>What this replaces</h2>
 * The legacy screen never queried a database. generateReport (frmHistStmt.frm
 * :1252) looped YYYYMM from-to, opened one Btrieve index per branch per month,
 * and unzipped the pre-rendered page file each index record named. Two whole
 * mechanisms drop out as a result and are deliberately NOT ported:
 * <ul>
 *   <li>the month-by-month file loop becomes one indexed range scan — both
 *       detail tables are indexed on (ACCT_NUM, STMT_DATE);</li>
 *   <li>{@code convertAcc2Bm} (14-char account packed to 13) and
 *       {@code convertYear2Bm} (year digit shifted by 17) were Btrieve KEY
 *       encodings. ACCT_NUM is NVARCHAR2(20) holding the account as keyed, and
 *       STMT_DATE is a real DATE, so applying either would guarantee no match.
 *       {@link com.banksystem.api.domain.model.BmForms} is likewise not used
 *       here — this is not the archival schema.</li>
 * </ul>
 *
 * <h2>Which header goes with which detail</h2>
 * Four tables in two header/detail pairs, and only {@code PDP_STMT_TXN} was
 * confirmed by name. The pairing below is derived from the columns rather than
 * assumed: one header and one detail carry STMT_NUM and one of each does not,
 * and a detail table can only join a header that shares its key. So the pair
 * WITHOUT STMT_NUM — joining on (ACCT_NUM, STMT_DATE) alone — is the one
 * containing the confirmed PDP_STMT_TXN, which makes its header the one with
 * CUST_NUM / TITLE+FIRST_NAME+SECOND_NAME / PAGE_NUM / BRANCH_DATA; and the
 * pair WITH STMT_NUM is the non-PDP one, whose header carries a single
 * CUST_NAME plus IBAN and REF_NUM.
 *
 * <p>That is an inference from column shape, not a fact from the source:
 * "PDP" appears nowhere in the VB6, the C, or the archival dictionary, so
 * there is nothing to check it against. Which pair a request reads is the
 * OPERATOR's choice — the screen's System selector sends BM or PDP and exactly
 * that pair is queried — and the answer is still tagged with {@code source} so
 * a printed sheet says which archive produced it. All four names are
 * configuration — correct them in application.yml, do not edit the SQL.
 *
 * <h2>Branch code</h2>
 * The screen's Branch Code filters the PDP header query and NOTHING ELSE. The
 * legacy never filtered on it — branch chose which Btrieve file to open
 * ({@code <STMTPATH><brn3>\s<brn3><bmYY><MM>.idx}), and DB #3 has no such
 * partition — so for BM it stays what it was here: a validated input and the
 * staff-branch authorisation key, not a predicate. PDP filters on it by
 * request, pending confirmation against real PDP data that the same ACCT_NUM
 * genuinely appears under more than one branch; if it turns out not to, this
 * is one {@code false} in the Pair below.
 */
@Repository
@Profile("denodo")
@ConditionalOnProperty(name = "bank.statement-db.enabled", havingValue = "true")
public class JdbcStatementRepository implements StatementRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcStatementRepository.class);

    private static final DateTimeFormatter YYYYMMDD = DateTimeFormatter.BASIC_ISO_DATE;

    /**
     * One header/detail pair — one of the two SYSTEMS the screen offers.
     *
     * @param source    {@code "BM"} or {@code "PDP"}; this is both the value
     *                  the screen's selector sends and the tag every statement
     *                  from the pair carries.
     *
     * @param usesStmtNum whether STMT_NUM is part of the join key AND selected
     *                    from the detail table. False collapses the key to
     *                    (ACCT_NUM, STMT_DATE).
     * @param splitName   header holds TITLE + FIRST_NAME + SECOND_NAME and
     *                    CUST_NUM / PAGE_NUM / BRANCH_DATA (true), or a single
     *                    CUST_NAME plus IBAN / REF_NUM (false).
     * @param filterByBranch add {@code BRANCH_CODE = :branchCode} to the HEADER
     *                    query. PDP only, for now — see the class comment.
     */
    private record Pair(String source, String hdrTable, String txnTable,
                        boolean usesStmtNum, boolean splitName, boolean filterByBranch) {
    }

    private final NamedParameterJdbcTemplate jdbc;
    /** Keyed on the system the screen sends: "BM" or "PDP". */
    private final Map<String, Pair> pairs;

    public JdbcStatementRepository(
            @Qualifier("statementJdbc") NamedParameterJdbcTemplate jdbc,
            @Value("${bank.statement-db.hdr-table:}") String hdrTable,
            @Value("${bank.statement-db.txn-table:}") String txnTable,
            @Value("${bank.statement-db.pdp-hdr-table:}") String pdpHdrTable,
            @Value("${bank.statement-db.pdp-txn-table:}") String pdpTxnTable) {
        this.jdbc = jdbc;
        Map<String, Pair> configured = new LinkedHashMap<>();
        if (!isBlank(hdrTable) && !isBlank(txnTable)) {
            configured.put("BM",
                    new Pair("BM", hdrTable.trim(), txnTable.trim(), true, false, false));
        }
        if (!isBlank(pdpHdrTable) && !isBlank(pdpTxnTable)) {
            configured.put("PDP",
                    new Pair("PDP", pdpHdrTable.trim(), pdpTxnTable.trim(), false, true, true));
        }
        this.pairs = Map.copyOf(configured);
    }

    @Override
    public List<HistoricalStatement> historicalStatements(
            String acctNum, String branchCode, String fromYearMonth, String toYearMonth,
            String system) {
        // The requested system's tables were never named. Returning an empty
        // list would reach the operator as "No report found for this account for
        // a given period" — a data answer to a configuration mistake, and the
        // one outcome nobody would think to check the config over. Which half of
        // the config is missing is worth saying, because a site may legitimately
        // run with only one of the two archives loaded.
        Pair pair = pairs.get(system);
        if (pair == null) {
            String properties = "PDP".equals(system)
                    ? "bank.statement-db.pdp-hdr-table and .pdp-txn-table"
                    : "bank.statement-db.hdr-table and .txn-table";
            throw new NotAvailableException(
                    "The " + system + " statement archive is not configured: " + properties
                            + " are blank. Name the real tables there, or select the other "
                            + "system on the screen.");
        }

        // Both bounds are inclusive MONTHS, so the upper bound is expressed as
        // "< first day of the month after toYearMonth". Using a BETWEEN on the
        // last day would drop any statement stamped with a time component.
        LocalDate from = firstDayOf(fromYearMonth);
        LocalDate toExclusive = firstDayOf(toYearMonth).plusMonths(1);

        MapSqlParameterSource params = new MapSqlParameterSource()
                .addValue("acctNum", acctNum == null ? "" : acctNum.trim())
                .addValue("branchCode", branchCode == null ? "" : branchCode.trim())
                .addValue("fromDate", Date.valueOf(from))
                .addValue("toDate", Date.valueOf(toExclusive));

        // One pair only — the operator chose it. Oldest first, then by statement
        // number for the months that carry more than one.
        List<HistoricalStatement> all = new ArrayList<>(load(pair, params));
        all.sort(Comparator.comparing(HistoricalStatement::stmtDate)
                .thenComparing(HistoricalStatement::stmtNum));
        return all;
    }

    // ------------------------------------------------------------------
    // One pair: detail rows first, then headers, joined in memory
    // ------------------------------------------------------------------

    private List<HistoricalStatement> load(Pair pair, MapSqlParameterSource params) {
        // Two range scans per pair rather than one header query plus a detail
        // query per statement — a five-year request would otherwise be 60+
        // round trips. Both are keyed on (ACCT_NUM, STMT_DATE), which both
        // detail tables are indexed on.
        Map<String, List<HistoricalStatementLine>> linesByStatement = lines(pair, params);
        return headers(pair, params, linesByStatement);
    }

    private Map<String, List<HistoricalStatementLine>> lines(
            Pair pair, MapSqlParameterSource params) {
        String stmtNumCol = pair.usesStmtNum() ? "STMT_NUM," : "";
        String sql = """
                SELECT STMT_DATE, %s TXN_ORDER, TXN_BRANCH_CODE, TXN_DATE, VALUE_DATE,
                       NARRATIVE1, NARRATIVE2, NARRATIVE3, NARRATIVE4,
                       CR_AMT, DR_AMT, RUN_BAL, RUN_BAL_TYPE
                FROM   %s
                WHERE  ACCT_NUM = :acctNum
                  AND  STMT_DATE >= :fromDate
                  AND  STMT_DATE <  :toDate
                ORDER  BY STMT_DATE, %s TXN_ORDER
                """.formatted(stmtNumCol, pair.txnTable(), stmtNumCol);

        Map<String, List<HistoricalStatementLine>> byStatement = new LinkedHashMap<>();
        jdbc.query(sql, params, rs -> {
            String key = key(date(rs, "STMT_DATE"), pair.usesStmtNum() ? str(rs, "STMT_NUM") : "");
            byStatement.computeIfAbsent(key, k -> new ArrayList<>())
                    .add(new HistoricalStatementLine(
                            str(rs, "TXN_ORDER"),
                            str(rs, "TXN_BRANCH_CODE"),
                            date(rs, "TXN_DATE"),
                            date(rs, "VALUE_DATE"),
                            str(rs, "NARRATIVE1"),
                            str(rs, "NARRATIVE2"),
                            str(rs, "NARRATIVE3"),
                            str(rs, "NARRATIVE4"),
                            amount(rs, "CR_AMT"),
                            amount(rs, "DR_AMT"),
                            amount(rs, "RUN_BAL"),
                            str(rs, "RUN_BAL_TYPE")));
        });
        return byStatement;
    }

    private List<HistoricalStatement> headers(
            Pair pair, MapSqlParameterSource params,
            Map<String, List<HistoricalStatementLine>> linesByStatement) {

        // The two headers differ in their identity columns; everything else is
        // common. Selected explicitly (never *) so a schema drift fails loudly
        // on the column rather than silently returning nulls.
        String identity = pair.splitName()
                ? "CUST_NUM, TITLE, FIRST_NAME, SECOND_NAME, PAGE_NUM, BRANCH_DATA"
                : "STMT_NUM, CUST_NAME, IBAN, REF_NUM";
        String order = pair.usesStmtNum() ? "STMT_DATE, STMT_NUM" : "STMT_DATE, PAGE_NUM";
        // PDP only, for now. Applied to the HEADER alone: the detail query is
        // keyed on (ACCT_NUM, STMT_DATE) and any line whose header the filter
        // excluded simply never finds one, which is what the orphan count below
        // measures — so read that warning with this in mind for PDP.
        String branchFilter = pair.filterByBranch() ? "AND  BRANCH_CODE = :branchCode" : "";
        String sql = """
                SELECT ACCT_NUM, STMT_DATE, BRANCH_CODE, BRANCH_NAME, ACCT_TYPE,
                       CUST_ADR1, CUST_ADR2, CUST_ADR3, CUST_ADR4,
                       CRNCY, LANG_CODE, FILE_NAME, %s
                FROM   %s
                WHERE  ACCT_NUM = :acctNum
                  AND  STMT_DATE >= :fromDate
                  AND  STMT_DATE <  :toDate
                  %s
                ORDER  BY %s
                """.formatted(identity, pair.hdrTable(), branchFilter, order);

        // The PDP header carries PAGE_NUM, so it may hold one row per printed
        // page of the same statement. Fold those into one statement keyed on
        // (STMT_DATE, STMT_NUM): the first row wins the header fields — the
        // ORDER BY puts the lowest page first — and pageCount records how many
        // there were, so a multi-page statement is not silently shown as one
        // page. A header with one row per statement simply yields pageCount 1.
        Map<String, HistoricalStatement> byStatement = new LinkedHashMap<>();
        jdbc.query(sql, params, rs -> {
            String stmtDate = date(rs, "STMT_DATE");
            String stmtNum = pair.usesStmtNum() ? str(rs, "STMT_NUM") : "";
            String key = key(stmtDate, stmtNum);
            HistoricalStatement existing = byStatement.get(key);
            if (existing != null) {
                byStatement.put(key, withPageCount(existing, existing.pageCount() + 1));
                return;
            }
            byStatement.put(key, new HistoricalStatement(
                    pair.source(),
                    str(rs, "ACCT_NUM"),
                    stmtDate,
                    stmtNum,
                    str(rs, "BRANCH_CODE"),
                    str(rs, "BRANCH_NAME"),
                    str(rs, "ACCT_TYPE"),
                    pair.splitName() ? str(rs, "CUST_NUM") : "",
                    pair.splitName()
                            ? join(str(rs, "TITLE"), str(rs, "FIRST_NAME"), str(rs, "SECOND_NAME"))
                            : str(rs, "CUST_NAME"),
                    str(rs, "CUST_ADR1"),
                    str(rs, "CUST_ADR2"),
                    str(rs, "CUST_ADR3"),
                    str(rs, "CUST_ADR4"),
                    str(rs, "CRNCY"),
                    pair.splitName() ? "" : str(rs, "IBAN"),
                    pair.splitName() ? "" : str(rs, "REF_NUM"),
                    str(rs, "LANG_CODE"),
                    pair.splitName() ? str(rs, "PAGE_NUM") : "",
                    1,
                    pair.splitName() ? str(rs, "BRANCH_DATA") : "",
                    str(rs, "FILE_NAME"),
                    linesByStatement.getOrDefault(key, List.of())));
        });

        // Detail rows whose header is missing would otherwise vanish without
        // trace. The legacy had the same failure mode — an index entry pointing
        // at an absent page file — and logged it; log it rather than inventing
        // a header, and let the count speak in support.
        long orphans = linesByStatement.keySet().stream()
                .filter(k -> !byStatement.containsKey(k)).count();
        if (orphans > 0) {
            log.warn("{}: {} statement(s) have {} rows but no matching {} header — "
                            + "not returned. {}",
                    pair.source(), orphans, pair.txnTable(), pair.hdrTable(),
                    pair.filterByBranch()
                            // Expected, not a fault: the detail query is not
                            // branch-filtered, so an account with statements at
                            // more than one branch always leaves the other
                            // branches' lines headerless.
                            ? "Expected if this account has statements at branches other than "
                                    + "the one requested; otherwise check the header/detail "
                                    + "pairing."
                            : "Check the header/detail pairing.");
        }
        return new ArrayList<>(byStatement.values());
    }

    private static HistoricalStatement withPageCount(HistoricalStatement s, int pageCount) {
        return new HistoricalStatement(s.source(), s.acctNum(), s.stmtDate(), s.stmtNum(),
                s.branchCode(), s.branchName(), s.acctType(), s.custNum(), s.custName(),
                s.custAdr1(), s.custAdr2(), s.custAdr3(), s.custAdr4(), s.crncy(), s.iban(),
                s.refNum(), s.langCode(), s.pageNum(), pageCount, s.branchData(),
                s.fileName(), s.lines());
    }

    // ------------------------------------------------------------------
    // Column readers
    // ------------------------------------------------------------------

    private static String key(String stmtDate, String stmtNum) {
        return stmtDate + "|" + stmtNum;
    }

    private static String str(ResultSet rs, String column) throws SQLException {
        String value = rs.getString(column);
        return value == null ? "" : value.trim();
    }

    /** DATE column -> YYYYMMDD, the form the client's date renderer expects. */
    private static String date(ResultSet rs, String column) throws SQLException {
        Date value = rs.getDate(column);
        return value == null ? "" : value.toLocalDate().format(YYYYMMDD);
    }

    /**
     * NUMBER(30,3) -> plain decimal string. Deliberately not
     * {@code BmForms.amountOrNull}: these amounts are signed numerics, not the
     * trailing-overpunch strings the BM archival views hold, and running either
     * decoder over them would corrupt any value ending in P-Y.
     */
    private static String amount(ResultSet rs, String column) throws SQLException {
        BigDecimal value = rs.getBigDecimal(column);
        return value == null ? "" : value.toPlainString();
    }

    private static String join(String... parts) {
        return String.join(" ", List.of(parts).stream().filter(p -> !p.isEmpty()).toList());
    }

    private static LocalDate firstDayOf(String yearMonth) {
        // Validated by StatementService before it gets here.
        int year = Integer.parseInt(yearMonth.substring(0, 4));
        int month = Integer.parseInt(yearMonth.substring(4, 6));
        return LocalDate.of(year, month, 1);
    }

    private static boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
