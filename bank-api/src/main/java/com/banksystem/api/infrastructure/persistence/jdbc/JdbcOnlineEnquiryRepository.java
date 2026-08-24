package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.application.NotAvailableException;
import com.banksystem.api.domain.model.BmForms;
import com.banksystem.api.domain.model.OnlineStatementPage;
import com.banksystem.api.domain.model.OnlineTransaction;
import com.banksystem.api.domain.model.UiLanguage;
import com.banksystem.api.domain.repository.OnlineEnquiryRepository;
import com.banksystem.api.infrastructure.language.RequestLanguage;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * On-demand Statement (service 07) and Transaction Inquiry (service 11) —
 * QUERY-SPECS.md §21.1, legacy {@code getOndemandStmt()} (cbrt01.c:545) and
 * {@code getTransEnquiry()} (:915).
 *
 * <h2>Why these are here at all</h2>
 * The VB6 client reached both over a SECOND socket ({@code bmrtServer} on
 * {@code OnlinePort}), which for a long time was read as "these have no
 * archival source". They do. The server on the far end is cbrt01, and both
 * handlers are plain local ISAM reads over gld0data, crd0data and thd0data —
 * the same thd0data {@link JdbcTransferRepository} already queries. Nothing in
 * either handler touches Tuxedo or the core host.
 *
 * <p>So this class IS the gateway now, and two things the legacy did on the
 * server side are done here rather than passed through: the absent toDate on
 * service 11 is filled with the server's own current date, and the reply's
 * status codes are produced rather than relayed.
 *
 * <h2>The one difference that matters</h2>
 * The handlers are near-identical copies. What separates them is a single
 * predicate: 07 skips any row with {@code statmentFlag >= '1'} ("do not print",
 * cbslib/layout.h:1583), 11 keeps every row. That filter also governs the
 * balance brought forward, because B/F is {@code bookBal} walked back over
 * exactly the rows that survived it — so the two screens legitimately report
 * DIFFERENT opening balances for the same account and range. Do not "fix" that
 * into agreement.
 *
 * <h2>Schema notes</h2>
 * <ul>
 *   <li>thd0data has no {@code recType} column — the workbook folded the
 *       recType '1' continuation into the header row, so narratives 2/3 come
 *       from the same row and the C's {@code recType != '0'} skip is satisfied
 *       for free. (thd0data1 is the rate-change family; not read here.)</li>
 *   <li>{@code accNo} is the 14-char ACTUAL form in the views, not the C's
 *       13-char BM key.</li>
 *   <li>{@code postDate}/{@code valueDate} are real date columns, so predicates
 *       bind through {@link BmForms#bmToIso} and rows read back through
 *       {@link BmForms#isoToBmDate}.</li>
 *   <li>{@code transAmt} and {@code bookBal} are {@code numeric(16,3)} holding
 *       MAJOR units — the ETL scaled them, so a balance reads 1552.49 and not
 *       155249 (measured, 2026-08-19). They go back out in the GATEWAY's format
 *       (sign character then 14 zero-padded MINOR-unit digits), so
 *       {@link #gatewayAmount} scales them UP by decimalPlace on the way — a
 *       conversion the C never needed, because the ISAM field was minor units
 *       to begin with.</li>
 * </ul>
 *
 * <h2>Hard-fail, by instruction</h2>
 * crd0data — the customer register the header name/address/language come from —
 * is a required view like every other one named here. If the query for it fails
 * anyway, this throws {@link NotAvailableException} BEFORE fetching a single
 * transaction: the enquiry is not shown at all rather than shown with a blank
 * customer. A missing crd0data ROW is a different thing and stays the legacy's
 * answer for it ({@code NOMAINACC}, status "05").
 */
@Repository
@Profile("denodo")
public class JdbcOnlineEnquiryRepository implements OnlineEnquiryRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcOnlineEnquiryRepository.class);

    private static final DateTimeFormatter YYYYMMDD = DateTimeFormatter.BASIC_ISO_DATE;

    /** transDetails[50] — the reply array both handlers fill (cbrt.h). */
    private static final int GATEWAY_PAGE = 50;

    /** The pointer a first page carries; also what an empty page returns. */
    private static final String FIRST_POINTER = "00000";

    // Reply codes, from cbrt.h's #defines. Only the ones these handlers emit.
    private static final String SUCCESS = "00";
    private static final String NOMAINACC = "05";

    /**
     * readCnd's fallback (cbrt01.c:3154). A currency code with no stctltabXC
     * row is the case this covers — the same per-account corruption the C
     * defaulted through. A currency lookup that FAILS is not this case; see
     * {@link #decimalPlace}.
     */
    private static final String DEFAULT_DECIMAL_PLACE = "2";

    /**
     * The alphanumeric-customer guard both handlers open with
     * (cbrt01.c:568 / :936), on the 7 customer characters of the actual account.
     */
    private static final String MAX_CUSTOMER = "6199999";

    private static final String CUSTOMER_SQL = """
            SELECT shortName, address1, address2, language
            FROM   crd0data
            WHERE  BankingDate = :bankingDate
              AND  custNo = :custNo
            """;

    /**
     * One rendering per language: stctltabBD carries the branch name in both,
     * and the statement header shows it to the operator.
     */
    private static final Map<UiLanguage, String> ACCOUNT_SQL = UiLanguage.localise("""
            SELECT g.bookBal, g.branchCode,
                   (SELECT {name:b}
                    FROM   stctltabBD b
                    WHERE  b.BankingDate = :bankingDate
                      AND  b.branchCode = g.branchCode) AS branchName
            FROM   gld0data g
            WHERE  g.BankingDate = :bankingDate
              AND  g.accNo = :accNo
            """);

    private final NamedParameterJdbcTemplate jdbc;
    private final BankingDateProvider bankingDate;
    private final RequestLanguage requestLanguage;

    public JdbcOnlineEnquiryRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc,
            BankingDateProvider bankingDate,
            RequestLanguage requestLanguage) {
        this.jdbc = jdbc;
        this.bankingDate = bankingDate;
        this.requestLanguage = requestLanguage;
    }

    @Override
    public OnlineStatementPage onDemandStatement(
            String accNo, String fromDate, String toDate, String lastTransPtr) {
        return page(accNo, fromDate, toDate, lastTransPtr, true);
    }

    /**
     * Service 11 sends eight spaces for toDate and lets the SERVER substitute
     * its own current date, because the branch PC's clock could not be trusted
     * (cbrt01.c:971-976; the client-side half is frmTransaction.frm:860-864).
     * We are the server now, so the substitution happens here — not in the
     * controller, and never from a date the client supplied.
     */
    @Override
    public OnlineStatementPage transactionEnquiry(
            String accNo, String fromDate, String lastTransPtr) {
        return page(accNo, fromDate, LocalDate.now().format(YYYYMMDD), lastTransPtr, false);
    }

    // ------------------------------------------------------------------
    // The shared body — the two handlers are copies apart from statementOnly
    // ------------------------------------------------------------------

    private OnlineStatementPage page(
            String accNo, String fromDate, String toDate, String lastTransPtr,
            boolean statementOnly) {

        String actualAcc = actualAccForm(accNo);
        String from = trim(fromDate);
        String to = trim(toDate);
        String pointer = pointer(lastTransPtr);

        if (customerOf(actualAcc).compareTo(MAX_CUSTOMER) > 0) {
            log.warn("Customer {} in account {} is above {} — rejecting as NOMAINACC, as cbrt01 does",
                    customerOf(actualAcc), actualAcc, MAX_CUSTOMER);
            return empty(actualAcc, from, to, NOMAINACC, DEFAULT_DECIMAL_PLACE);
        }

        // crd0data FIRST. Hard-fail here means nothing is fetched and nothing
        // is shown, which is the whole point of doing it before the rest.
        Customer customer = customer(actualAcc);
        Account account = account(actualAcc);
        if (customer == null || account == null) {
            // Both handlers answer a missing gld0data or crd0data record the
            // same way (cbrt01.c:625/661 and :1000/:1036).
            return empty(actualAcc, from, to, NOMAINACC, DEFAULT_DECIMAL_PLACE);
        }

        String decimalPlace = decimalPlace(actualAcc);
        int minorScale = minorScale(decimalPlace);
        List<Row> rows = transactions(actualAcc, from, to, pointer, statementOnly, minorScale);

        boolean complete = rows.size() <= GATEWAY_PAGE;
        List<Row> shown = complete ? rows : rows.subList(0, GATEWAY_PAGE);

        // B/F and the total count are computed on the FIRST page only — the C
        // scans the whole history there and returns zeros on every page after
        // (cbrt01.c:867-884 / :1244-1261). That asymmetry is deliberate: it is
        // what stops each continuation page re-walking the account.
        String bfBalance = FIRST_POINTER.equals(pointer)
                ? gatewayAmount(
                        account.bookBal().subtract(movementSince(actualAcc, from, statementOnly)),
                        minorScale)
                : gatewayAmount(BigDecimal.ZERO, minorScale);

        return new OnlineStatementPage(
                SUCCESS,
                actualAcc,
                customer.custName(),
                customer.custAddress(),
                account.branchCode(),
                account.branchName(),
                customer.langCode(),
                decimalPlace,
                bfBalance,
                from,
                to,
                shown.stream().map(Row::transaction).toList(),
                shown.isEmpty() ? FIRST_POINTER : shown.get(shown.size() - 1).transCounter(),
                complete ? "1" : "0");
    }

    // ------------------------------------------------------------------
    // Header — crd0data (hard-fail) then gld0data
    // ------------------------------------------------------------------

    private record Customer(String custName, String custAddress, String langCode) {
    }

    private record Account(BigDecimal bookBal, String branchCode, String branchName) {
    }

    /**
     * {@code actualToBmCust(&inBuf->accNo[5])}, then the customer into crd0data.
     *
     * <p>Two things to know about this query. First, the KEY is
     * {@code crd0data.custNo} holding the plain 7-digit customer — the column
     * the archival view actually carries (crd0data.ts: custNo, string, size 7).
     * This read was originally written as {@code accNo = :custNo} bound to the
     * 6-char PACKED form {@link BmForms#bmCust} produces, because that is what
     * {@code actualToBmCust(&inBuf->accNo[5])} hands the C, on the rule that the
     * legacy read is the specification rather than a neighbouring view's
     * convention. The rule was right about the LOGIC and wrong about the column:
     * the view has no {@code accNo}, so the query could only ever throw. Below
     * 1,000,000 the packed and actual forms differ only by a leading zero, so
     * the two keyings would have agreed on low customers and diverged on high
     * ones — the kind of bug that surfaces months later, on a subset of
     * accounts, had the column name not made it fail loudly first.
     *
     * <p>Second, {@code custAddress} is address1 CONCATENATED with address2.
     * The C copies 60 bytes out of {@code crdRec.address1}, which is only 30
     * wide (cbslib/layout.h:751), so it runs straight into address2. address1
     * is padded back to its fixed 30 before appending, or the second line would
     * slide left of where every legacy printout puts it.
     *
     * @return {@code null} when the customer has no row — the legacy's
     *         NOMAINACC case, NOT the missing-view case.
     * @throws NotAvailableException when the view itself cannot be read
     */
    private Customer customer(String actualAcc) {
        List<Customer> rows;
        try {
            rows = jdbc.query(CUSTOMER_SQL,
                    new MapSqlParameterSource("custNo", customerOf(actualAcc).trim())
                            .addValue("bankingDate", bankingDate.bankingDate()),
                    (rs, i) -> new Customer(
                            scrub(rs.getString("shortName")),
                            scrub(pad(rs.getString("address1"), 30) + str(rs.getString("address2"))),
                            "1".equals(trim(rs.getString("language"))) ? "1" : "0"));
        } catch (DataAccessException e) {
            log.warn("crd0data is not readable ({}); refusing the online enquiry for {}",
                    e.getMostSpecificCause().getMessage(), actualAcc);
            throw new NotAvailableException(
                    "The customer register (crd0data) is not available in this environment, "
                            + "so this enquiry cannot be shown.");
        }
        return rows.isEmpty() ? null : rows.get(0);
    }

    /** gld0data supplies the balance the B/F walks back from, plus the branch. */
    private Account account(String actualAcc) {
        List<Account> rows = jdbc.query(ACCOUNT_SQL.get(requestLanguage.current()),
                new MapSqlParameterSource("accNo", actualAcc)
                        .addValue("bankingDate", bankingDate.bankingDate()),
                (rs, i) -> new Account(
                        amount(rs.getString("bookBal")),
                        scrub(rs.getString("branchCode")),
                        scrub(rs.getString("branchName"))));
        return rows.isEmpty() ? null : rows.get(0);
    }

    /**
     * readCnd (cbrt01.c:3144) — cnd0data key "XC00" + the account's 2-char
     * currency, whose archival counterpart is the stctltabXC overlay.
     *
     * <p>A currency with no row defaults to 2 decimals exactly as the C does.
     * A query that FAILS does not: {@code decimalPlace} is the divisor the
     * screens apply to every amount, so guessing it wrong renders each figure
     * off by a factor of ten with nothing on screen to say so. That is worse
     * than not showing the enquiry, so it fails the same way crd0data does.
     *
     * <p>The column was confirmed present on the Denodo view (2026-08-19), so
     * that throw is a regression guard now rather than a state anyone expects
     * to hit — but the reasoning for it is unchanged, so it stays.
     */
    private String decimalPlace(String actualAcc) {
        String currCode = actualAcc.length() >= 2 ? actualAcc.substring(0, 2) : "";
        try {
            List<String> rows = jdbc.queryForList("""
                    SELECT decimalPlace
                    FROM   stctltabXC
                    WHERE  BankingDate = :bankingDate
                      AND  currCode = :currCode
                    """,
                    new MapSqlParameterSource("currCode", currCode)
                            .addValue("bankingDate", bankingDate.bankingDate()),
                    String.class);
            String value = rows.isEmpty() ? "" : trim(rows.get(0));
            if (value.isEmpty()) {
                log.warn("No stctltabXC row for currency {} — defaulting to {} decimals, as readCnd does",
                        currCode, DEFAULT_DECIMAL_PLACE);
                return DEFAULT_DECIMAL_PLACE;
            }
            return value;
        } catch (DataAccessException e) {
            log.warn("stctltabXC.decimalPlace is not readable ({}); refusing the online enquiry for {}",
                    e.getMostSpecificCause().getMessage(), actualAcc);
            throw new NotAvailableException(
                    "The currency table (stctltabXC.decimalPlace) is not available in this "
                            + "environment, so amounts on this enquiry cannot be scaled correctly.");
        }
    }

    // ------------------------------------------------------------------
    // thd0data — the page, and the first page's balance walk-back
    // ------------------------------------------------------------------

    private record Row(String transCounter, OnlineTransaction transaction) {
    }

    /**
     * One gateway page.
     *
     * <p>Paging is the legacy's, not ours. Index 1 is 26 bytes —
     * {@code accNo[13] + filler1[7] + transCounter[5] + recType}
     * (cbslib/layout.h:1575-1578) — and the seek is
     * {@code isstart(..., 26, ISGREAT)} seeded with the caller's pointer, so
     * within one account the order is transCounter and the resume is strictly
     * greater than the last one returned. transCounter is compared as TEXT
     * because that is what the ISAM key comparison was; it is fixed-width and
     * zero-padded, so the two orders agree.
     *
     * <p>One row past the page is fetched so its presence answers
     * completionFlag without a second count — the same n+1 probe
     * {@link JdbcTransferRepository} uses.
     */
    private List<Row> transactions(
            String actualAcc, String fromDate, String toDate, String pointer,
            boolean statementOnly, int minorScale) {
        StringBuilder sql = new StringBuilder("""
                SELECT userId, postDate, valueDate, transType, transAmt,
                       narrative1, narrative2, narrative3,
                       transRef, supervisorId, transCounter, statmentFlag
                FROM   thd0data
                WHERE  BankingDate = :bankingDate
                  AND  accNo = :accNo
                  AND  transCounter > :pointer
                """);
        MapSqlParameterSource params = new MapSqlParameterSource()
                .addValue("bankingDate", bankingDate.bankingDate())
                .addValue("accNo", actualAcc)
                .addValue("pointer", pointer);
        appendDateRange(sql, params, fromDate, toDate);
        appendStatementFilter(sql, statementOnly);
        sql.append("ORDER  BY transCounter\n")
                .append("FETCH FIRST %d ROWS ONLY\n".formatted(GATEWAY_PAGE + 1));

        return jdbc.query(sql.toString(), params, (rs, i) -> new Row(
                trim(rs.getString("transCounter")),
                new OnlineTransaction(
                        scrub(rs.getString("userId")),
                        BmForms.isoToBmDate(trim(rs.getString("postDate"))),
                        BmForms.isoToBmDate(trim(rs.getString("valueDate"))),
                        scrub(rs.getString("transType")),
                        gatewayAmount(amount(rs.getString("transAmt")), minorScale),
                        scrub(rs.getString("narrative1")),
                        scrub(rs.getString("narrative2")),
                        scrub(rs.getString("narrative3")),
                        scrub(rs.getString("transRef")),
                        scrub(rs.getString("supervisorId")),
                        trim(rs.getString("transCounter")),
                        scrub(rs.getString("statmentFlag")))));
    }

    /**
     * The signed movement the B/F balance is walked back over.
     *
     * <p>Note what is NOT here: a toDate bound. The C accumulates
     * totDebitAmt/totCreditAmt between its two date tests — after the fromDate
     * skip and BEFORE the toDate skip (cbrt01.c:786-812 / :1157-1183) — so
     * every row from fromDate to the end of the account counts, not just the
     * rows on screen. That is correct rather than sloppy: bookBal is today's
     * balance, and reversing everything posted since fromDate is exactly what
     * produces the opening balance AT fromDate. Adding the toDate bound here
     * would silently corrupt the B/F on any range that does not end today.
     */
    private BigDecimal movementSince(String actualAcc, String fromDate, boolean statementOnly) {
        StringBuilder sql = new StringBuilder("""
                SELECT transAmt
                FROM   thd0data
                WHERE  BankingDate = :bankingDate
                  AND  accNo = :accNo
                """);
        MapSqlParameterSource params = new MapSqlParameterSource("accNo", actualAcc)
                .addValue("bankingDate", bankingDate.bankingDate());
        appendDateRange(sql, params, fromDate, "");
        appendStatementFilter(sql, statementOnly);

        // Summed in Java, not SQL: transAmt carries the BM trailing overpunch
        // sign, so it is text to the view and SUM() would either fail or drop
        // every debit's sign.
        return jdbc.queryForList(sql.toString(), params, String.class).stream()
                .map(JdbcOnlineEnquiryRepository::amount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    /**
     * {@code postDate >= fromDate} and {@code postDate <= toDate}, each omitted
     * when its bound is blank.
     *
     * <p>Blank is a real case, not a defensive one: service 11 starting from a
     * transaction NUMBER sends no fromDate, and the C's {@code strncmp} against
     * eight spaces then passes every row (any date sorts above spaces). An
     * omitted predicate reproduces that; a predicate bound to spaces would not.
     */
    private static void appendDateRange(
            StringBuilder sql, MapSqlParameterSource params, String fromDate, String toDate) {
        if (!isBlank(fromDate)) {
            sql.append("  AND  postDate >= :fromDate\n");
            params.addValue("fromDate", BmForms.bmToIso(fromDate));
        }
        if (!isBlank(toDate)) {
            sql.append("  AND  postDate <= :toDate\n");
            params.addValue("toDate", BmForms.bmToIso(toDate));
        }
    }

    /**
     * The single predicate that separates service 07 from service 11
     * (cbrt01.c:790-791 vs :1162).
     *
     * <p>{@code IS NULL} is part of the condition, not padding: the ISAM field
     * is a char that is BLANK on an ordinary posting, and blank sorts below
     * '1', so the C keeps those rows. A bare {@code statmentFlag < '1'} would
     * evaluate to unknown on a null and drop every normal transaction from the
     * statement — leaving only the rows the statement is supposed to hide.
     */
    private static void appendStatementFilter(StringBuilder sql, boolean statementOnly) {
        if (statementOnly) {
            sql.append("  AND  (statmentFlag IS NULL OR statmentFlag < '1')\n");
        }
    }

    // ------------------------------------------------------------------
    // Helpers
    // ------------------------------------------------------------------

    /** A reply carrying a status and nothing else — the C's early returns. */
    private static OnlineStatementPage empty(
            String accNo, String fromDate, String toDate, String status, String decimalPlace) {
        return new OnlineStatementPage(
                status, accNo, "", "", "", "", "0", decimalPlace,
                gatewayAmount(BigDecimal.ZERO, 0), fromDate, toDate,
                List.of(), FIRST_POINTER, "1");
    }

    /**
     * The gateway's amount format: a sign character followed by 14 zero-padded
     * digits of MINOR units, 15 characters in all
     * ({@code sprintf("%015.0f")} for negatives, {@code sprintf("+%014.0f")}
     * for the rest — cbrt01.c:797-808). The leading character is the Dr/Cr flag
     * the screens test, so it is never dropped, even on zero.
     *
     * <p><b>The scaling is the part to be careful about.</b> The C read
     * {@code thd0data.transAmt} as the raw BM field — minor units already, so
     * it copied the bytes across untouched. The archival view does not hold
     * that: its amount columns are {@code numeric(16,3)} carrying MAJOR units
     * (a balance reads 1552.49, not 155249), because the ETL scaled them on the
     * way in. The workbook still describes the columns as "decimal places are
     * currency dependent", which is the pre-ETL field documentation and not a
     * description of the loaded value — measured against real data, 2026-08-19.
     *
     * <p>So the conversion the C never needed has to happen here, or the screen
     * divides by the denomination a second time and shows 1.552 for 1552.49.
     * Multiplying is right rather than dropping the division client-side,
     * because the CONTRACT is the gateway's — {@code decimalPlace} travels with
     * the page and the screens are shared with the mock.
     *
     * @param major      the value as the view holds it, in major units
     * @param minorScale how many decimal places this currency carries
     */
    private static String gatewayAmount(BigDecimal major, int minorScale) {
        BigDecimal value = major == null ? BigDecimal.ZERO : major;
        // HALF_UP only ever matters if the view carries MORE decimals than the
        // currency has, which should not happen; truncating there would shed
        // value silently, so round rather than drop.
        BigDecimal amount = value.movePointRight(minorScale)
                .setScale(0, java.math.RoundingMode.HALF_UP);
        String digits = amount.abs().toPlainString();
        String padded = digits.length() >= 14 ? digits : "0".repeat(14 - digits.length()) + digits;
        return (amount.signum() < 0 ? "-" : "+") + padded;
    }

    /**
     * decimalPlace &rarr; the power of ten the screens divide by
     * (coinDenomination, OnlineStmt.frm:748-760): "1"/"2"/"3" scale, and
     * ANYTHING else — including the "0" real stctltabXC data carries for
     * whole-unit currencies — means no scaling at all.
     */
    private static int minorScale(String decimalPlace) {
        return switch (decimalPlace == null ? "" : decimalPlace.trim()) {
            case "1" -> 1;
            case "2" -> 2;
            case "3" -> 3;
            default -> 0;
        };
    }

    /**
     * The view's amount as a number, in MAJOR units.
     *
     * <p>Still routed through {@link BmForms#amountOrNull} rather than a plain
     * parse: the ETL scaled these columns, but the overpunch branch is inert on
     * a value that does not end in P-Y, so keeping it costs nothing and covers
     * any column that turns out not to have been converted.
     */
    private static BigDecimal amount(String raw) {
        BigDecimal value = BmForms.amountOrNull(raw);
        return value == null ? BigDecimal.ZERO : value;
    }

    /**
     * The 7 customer characters embedded in a 14-char actual account — the form
     * the {@code > "6199999"} guard compares, since the C compares
     * {@code accNo+5} directly.
     */
    private static String customerOf(String actualAcc) {
        return actualAcc.length() >= 12 ? actualAcc.substring(5, 12) : actualAcc;
    }

    /** The views store the 14-char actual form; convert a 13-char BM argument. */
    private static String actualAccForm(String accNo) {
        String a = trim(accNo);
        return a.length() == 13 ? BmForms.actualAcc(a) : a;
    }

    private static String pointer(String lastTransPtr) {
        String value = trim(lastTransPtr);
        return value.isEmpty() ? FIRST_POINTER : value;
    }

    private static String pad(String value, int width) {
        String v = str(value);
        return v.length() >= width ? v.substring(0, width) : v + " ".repeat(width - v.length());
    }

    /**
     * The non-printable scrub both handlers run over the name, the address and
     * all three narratives ({@code >= 0 && < 27 → ' '}, e.g. cbrt01.c:681-690).
     * The C's signed-char test also catches high bytes; this keeps to the
     * control range, which is what the Arabic code pages actually put there.
     */
    private static String scrub(String value) {
        if (value == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder(value.length());
        for (int i = 0; i < value.length(); i++) {
            char ch = value.charAt(i);
            sb.append(ch < 0x20 ? ' ' : ch);
        }
        return sb.toString().trim();
    }

    private static String str(String value) {
        return value == null ? "" : value;
    }

    private static String trim(String value) {
        return value == null ? "" : value.trim();
    }

    private static boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
