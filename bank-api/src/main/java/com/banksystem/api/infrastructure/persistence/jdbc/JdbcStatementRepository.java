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
 * there is nothing to check the NAME against.
 *
 * <p>There is, however, something to check the SHAPE against. The legacy screen
 * had two sources and made the operator choose between them with separate
 * buttons: Generate/View/Print built a statement from the BRANCH's own Btrieve
 * indexes, while View HO / Print HO read {@code reqPath\prtall.$s!} — a
 * pre-merged statement delivered by HEAD OFFICE and requested over FTP
 * (frmHistStmt cmdFtp -> frmSendFile), whose absence the screen reports as
 * "Please call HO". So "two archives for one account, operator picks" is the
 * legacy's own arrangement, not something the port invented, and it gives the
 * pairing a testable hypothesis rather than only a column-shape argument:
 * <b>BM as the branch archive, PDP as the HO one</b>. Treat that as a lead for
 * whoever confirms the table names — the split lines up, the naming still does
 * not.
 *
 * <p>Not ported, deliberately: the legacy's Analyse (an {@code analyse} utility
 * shelled over the merged print file, {@code prtall.$s! -> prtall.$a!}, plus
 * {@code prtall.$h!} for the HO variant, four buttons in all) and the FTP
 * request itself. Both operate on RENDERED TEXT on a mapped drive; neither has
 * a meaning against a relational archive. Descoped, not overlooked.
 *
 * <h2>Two entry points, one pair each</h2>
 * Which pair a request reads is decided by the SCREEN it came from, not by a
 * control: {@link #historicalStatements} serves Historical Statement Printing
 * and reads BM, {@link #pdpStatements} serves PDP Statements and reads PDP.
 * Exactly one pair is ever queried, and the answer is tagged with
 * {@code source} so a printed sheet says which archive produced it. All four
 * table names are configuration — correct them in application.yml, do not edit
 * the SQL.
 *
 * <p>The two differ in more than the tables. Only the PDP header carries
 * CUST_NUM, so only the PDP call can be keyed on a CUSTOMER, and only its
 * answer can therefore span several accounts.
 *
 * <h2>Branch code</h2>
 * Branch Code filters the PDP header query and NOTHING ELSE. The legacy never
 * filtered on it — branch chose which Btrieve file to open
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
     * One header/detail pair — one of the two archives DB #3 holds.
     *
     * @param source    {@code "BM"} or {@code "PDP"}; the tag every statement
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
    /** Keyed on the archive name: "BM" or "PDP". */
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
        String onAccount = "ACCT_NUM = :acctNum";
        List<HistoricalStatement> all = new ArrayList<>(
                load(pair, params, onAccount, onAccount,
                        pair.filterByBranch() ? "AND  BRANCH_CODE = :branchCode" : ""));
        all.sort(Comparator.comparing(HistoricalStatement::stmtDate)
                .thenComparing(HistoricalStatement::stmtNum));
        return all;
    }

    /**
     * PDP statements for a branch, by customer number OR account number — the
     * Historical Statement — PDP screen. Always the PDP pair; there is nothing
     * to select, which is the whole point of it being its own entry point.
     *
     * <p>StatementService passes exactly one of the two identifiers. Both are
     * still applied if both arrive: an argument that is silently dropped is
     * worse than one that narrows, and it keeps this method's answer a function
     * of its arguments alone.
     */
    @Override
    public List<HistoricalStatement> pdpStatements(
            String branchCode, String custNum, String acctNum,
            String fromYearMonth, String toYearMonth) {

        Pair pair = pairs.get("PDP");
        if (pair == null) {
            throw new NotAvailableException(
                    "The PDP statement archive is not configured: "
                            + "bank.statement-db.pdp-hdr-table and .pdp-txn-table are blank. "
                            + "Name the real tables there.");
        }

        LocalDate from = firstDayOf(fromYearMonth);
        LocalDate toExclusive = firstDayOf(toYearMonth).plusMonths(1);

        String customer = custNum == null ? "" : custNum.trim();
        String account = acctNum == null ? "" : acctNum.trim();

        MapSqlParameterSource params = new MapSqlParameterSource()
                .addValue("branchCode", branchCode == null ? "" : branchCode.trim())
                .addValue("custNum", customer)
                .addValue("acctNum", account)
                .addValue("fromDate", Date.valueOf(from))
                .addValue("toDate", Date.valueOf(toExclusive));

        // Branch always; the other two only when given. Validated upstream to be
        // exactly one of the two, so this can never degrade to "every account at
        // the branch". These are fixed fragments with BOUND parameters — no
        // operator value ever reaches the SQL text.
        List<String> filters = new ArrayList<>();
        filters.add("AND  BRANCH_CODE = :branchCode");
        if (!customer.isEmpty()) {
            filters.add("AND  CUST_NUM = :custNum");
        }
        if (!account.isEmpty()) {
            filters.add("AND  ACCT_NUM = :acctNum");
        }

        // The PDP DETAIL table has no CUST_NUM — it is keyed (ACCT_NUM,
        // STMT_DATE) — so a customer-number enquiry cannot filter it directly.
        // Rather than two round trips (headers, collect the accounts, then the
        // details) the detail query takes the header query as a subquery on
        // ACCT_NUM. That keeps it to one scan per table AND guarantees the two
        // halves agree on exactly the same set of statements. Used even when an
        // account number WAS given, so a customer/account pair that does not
        // belong together yields nothing rather than a pile of headerless lines.
        String lineAccounts = """
                ACCT_NUM IN (SELECT ACCT_NUM
                             FROM   %s
                             WHERE  STMT_DATE >= :fromDate
                               AND  STMT_DATE <  :toDate
                               %s)
                """.formatted(pair.hdrTable(), joined(filters, 15)).stripTrailing();

        // The account is no longer fixed, so it leads the ordering — one
        // customer's statements read account by account, oldest first within.
        List<HistoricalStatement> all = new ArrayList<>(
                load(pair, params, lineAccounts, "1 = 1", joined(filters, 2)));
        all.sort(Comparator.comparing(HistoricalStatement::acctNum)
                .thenComparing(HistoricalStatement::stmtDate)
                .thenComparing(HistoricalStatement::stmtNum));
        return all;
    }

    // ------------------------------------------------------------------
    // One pair: detail rows first, then headers, joined in memory
    // ------------------------------------------------------------------

    /**
     * @param lineAccounts   the DETAIL table's ACCT_NUM predicate
     * @param headerAccounts the HEADER table's ACCT_NUM predicate, or
     *                       {@code "1 = 1"} when the header is selected by other
     *                       columns instead
     * @param headerFilters  extra header-only predicates, each already prefixed
     *                       with {@code AND}, or empty
     */
    private List<HistoricalStatement> load(Pair pair, MapSqlParameterSource params,
            String lineAccounts, String headerAccounts, String headerFilters) {
        // Two range scans per pair rather than one header query plus a detail
        // query per statement — a five-year request would otherwise be 60+
        // round trips. Both are keyed on (ACCT_NUM, STMT_DATE), which both
        // detail tables are indexed on.
        Map<String, List<HistoricalStatementLine>> linesByStatement =
                lines(pair, params, lineAccounts);
        return headers(pair, params, headerAccounts, headerFilters, linesByStatement);
    }

    private Map<String, List<HistoricalStatementLine>> lines(
            Pair pair, MapSqlParameterSource params, String accounts) {
        String stmtNumCol = pair.usesStmtNum() ? "STMT_NUM," : "";
        String sql = """
                SELECT ACCT_NUM, STMT_DATE, %s TXN_ORDER, TXN_BRANCH_CODE, TXN_DATE, VALUE_DATE,
                       NARRATIVE1, NARRATIVE2, NARRATIVE3, NARRATIVE4,
                       CR_AMT, DR_AMT, RUN_BAL, RUN_BAL_TYPE
                FROM   %s
                WHERE  %s
                  AND  STMT_DATE >= :fromDate
                  AND  STMT_DATE <  :toDate
                ORDER  BY ACCT_NUM, STMT_DATE, %s TXN_ORDER
                """.formatted(stmtNumCol, pair.txnTable(), accounts, stmtNumCol);

        Map<String, List<HistoricalStatementLine>> byStatement = new LinkedHashMap<>();
        jdbc.query(sql, params, rs -> {
            String key = key(str(rs, "ACCT_NUM"), date(rs, "STMT_DATE"),
                    pair.usesStmtNum() ? str(rs, "STMT_NUM") : "");
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
            Pair pair, MapSqlParameterSource params, String accounts, String extraFilters,
            Map<String, List<HistoricalStatementLine>> linesByStatement) {

        // The two headers differ in their identity columns; everything else is
        // common. Selected explicitly (never *) so a schema drift fails loudly
        // on the column rather than silently returning nulls.
        String identity = pair.splitName()
                ? "CUST_NUM, TITLE, FIRST_NAME, SECOND_NAME, PAGE_NUM, BRANCH_DATA"
                : "STMT_NUM, CUST_NAME, IBAN, REF_NUM";
        String order = pair.usesStmtNum()
                ? "ACCT_NUM, STMT_DATE, STMT_NUM"
                : "ACCT_NUM, STMT_DATE, PAGE_NUM";
        // extraFilters are HEADER-only: the detail query is keyed on
        // (ACCT_NUM, STMT_DATE) and any line whose header they excluded simply
        // never finds one, which is what the orphan count below measures — so
        // read that warning with this in mind.
        String sql = """
                SELECT ACCT_NUM, STMT_DATE, BRANCH_CODE, BRANCH_NAME, ACCT_TYPE,
                       CUST_ADR1, CUST_ADR2, CUST_ADR3, CUST_ADR4,
                       CRNCY, LANG_CODE, FILE_NAME, %s
                FROM   %s
                WHERE  %s
                  AND  STMT_DATE >= :fromDate
                  AND  STMT_DATE <  :toDate
                  %s
                ORDER  BY %s
                """.formatted(identity, pair.hdrTable(), accounts, extraFilters, order);

        // The PDP header carries PAGE_NUM, so it may hold one row per printed
        // page of the same statement. Fold those into one statement keyed on
        // (STMT_DATE, STMT_NUM): the first row wins the header fields — the
        // ORDER BY puts the lowest page first — and pageCount records how many
        // there were, so a multi-page statement is not silently shown as one
        // page. A header with one row per statement simply yields pageCount 1.
        Map<String, HistoricalStatement> byStatement = new LinkedHashMap<>();
        jdbc.query(sql, params, rs -> {
            String acctNum = str(rs, "ACCT_NUM");
            String stmtDate = date(rs, "STMT_DATE");
            String stmtNum = pair.usesStmtNum() ? str(rs, "STMT_NUM") : "";
            String key = key(acctNum, stmtDate, stmtNum);
            HistoricalStatement existing = byStatement.get(key);
            if (existing != null) {
                byStatement.put(key, withPageCount(existing, existing.pageCount() + 1));
                return;
            }
            byStatement.put(key, new HistoricalStatement(
                    pair.source(),
                    acctNum,
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

    /**
     * Statement identity. ACCT_NUM is part of it because a PDP customer-number
     * enquiry spans every account that customer holds, and two accounts can
     * perfectly well carry a statement on the same STMT_DATE — without the
     * account in the key their lines would merge into one statement.
     */
    private static String key(String acctNum, String stmtDate, String stmtNum) {
        return acctNum + "|" + stmtDate + "|" + stmtNum;
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

    /**
     * Predicates as one SQL fragment, every line after the first indented to
     * {@code column} so the assembled query still reads as SQL. It is written
     * verbatim to the SQL audit log, which people read.
     */
    private static String joined(List<String> predicates, int column) {
        return String.join("\n" + " ".repeat(column), predicates);
    }

    private static boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
