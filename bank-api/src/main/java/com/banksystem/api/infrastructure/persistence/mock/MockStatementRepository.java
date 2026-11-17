package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.HistoricalStatement;
import com.banksystem.api.domain.model.HistoricalStatementLine;
import com.banksystem.api.domain.repository.StatementRepository;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

/**
 * Archived statements for the mock profile — one statement per month across the
 * requested period, with a running balance that actually adds up.
 *
 * <p>Generated per (account, month) from a seeded Random so the same request
 * returns the same statement every time: a demo where the figures reshuffle on
 * each Generate looks broken, and the running balance has to be stable for the
 * RUN_BAL column to mean anything.
 *
 * <p>{@link #historicalStatements} produces the BM shape — a single CUST_NAME
 * plus IBAN, REF_NUM and STMT_NUM. {@link #pdpStatements} produces the PDP
 * shape — CUST_NUM, a name split across TITLE/FIRST/SECOND, PAGE_NUM and
 * BRANCH_DATA, and no STMT_NUM. The two shapes are what the SCHEMA records
 * (see {@code JdbcStatementRepository}); what actually distinguishes the two
 * archives' CONTENT is not recorded anywhere in the project, so the fixture
 * does not invent a distinction there — the same transaction generator feeds
 * both.
 */
@Profile("!denodo")
@Repository
public class MockStatementRepository implements StatementRepository {

    private static final DateTimeFormatter YYYYMMDD = DateTimeFormatter.BASIC_ISO_DATE;

    /** Longest period the fixture will materialise, so a wild range cannot hang the demo. */
    private static final int MAX_MONTHS = 60;

    /** PDP's ACCT_NUM width in DB #3. Wider than the 14 BM and the gateway use. */
    private static final int ACCOUNT_DIGITS = 19;

    private static final String[][] NARRATIVES = {
            {"SALARY CREDIT", "MONTHLY PAYROLL"},
            {"ATM WITHDRAWAL", "ANB ATM RIYADH"},
            {"POS PURCHASE", "MERCHANT SETTLEMENT"},
            {"TRANSFER OUT", "SARIE OUTWARD"},
            {"SERVICE CHARGE", "MONTHLY FEE"},
            {"CHEQUE PAID", "CLEARING"},
    };

    /**
     * {@code branchCode} is accepted and ignored here: every fixture statement
     * is branch 0127, so applying the PDP branch filter would turn any other
     * branch into an empty demo rather than exercising anything. The filter is
     * real in {@code JdbcStatementRepository}, against real data.
     */
    @Override
    public List<HistoricalStatement> historicalStatements(
            String acctNum, String branchCode, String fromYearMonth, String toYearMonth,
            String system) {
        return monthsFor(acctNum == null ? "" : acctNum.trim(), fromYearMonth, toYearMonth,
                system, "");
    }

    /**
     * The PDP fixture. {@code custNum} is what makes this call different from
     * the historical one — with no account number the answer covers every
     * account of that customer, so the fixture invents TWO, which is the only
     * way the screen's multi-account rendering gets exercised at all.
     *
     * <p>The accounts are derived from the customer number rather than random,
     * so the same enquiry keeps returning the same two.
     */
    @Override
    public List<HistoricalStatement> pdpStatements(
            String branchCode, String custNum, String acctNum,
            String fromYearMonth, String toYearMonth) {

        String customer = custNum == null ? "" : custNum.trim();
        String account = acctNum == null ? "" : acctNum.trim();

        List<String> accounts = account.isEmpty()
                ? List.of(accountFor(customer, 1), accountFor(customer, 2))
                : List.of(account);

        List<HistoricalStatement> statements = new ArrayList<>();
        for (String each : accounts) {
            statements.addAll(monthsFor(each, fromYearMonth, toYearMonth, "PDP",
                    // With an account number and no customer number there is
                    // nothing to report in CUST_NUM, so the fixture leaves it
                    // empty rather than fabricating one the operator never gave.
                    customer));
        }
        return statements;
    }

    /** One statement per month of the period, minus the gaps. */
    private List<HistoricalStatement> monthsFor(
            String account, String fromYearMonth, String toYearMonth,
            String system, String custNum) {
        YearMonth from = YearMonth.of(
                Integer.parseInt(fromYearMonth.substring(0, 4)),
                Integer.parseInt(fromYearMonth.substring(4, 6)));
        YearMonth to = YearMonth.of(
                Integer.parseInt(toYearMonth.substring(0, 4)),
                Integer.parseInt(toYearMonth.substring(4, 6)));

        List<HistoricalStatement> statements = new ArrayList<>();
        YearMonth month = from;
        int stmtNum = 1;
        while (!month.isAfter(to) && statements.size() < MAX_MONTHS) {
            // A real archive has gaps — a dormant month produces no statement.
            // Skipping some makes "No report found for this account for a given
            // period" reachable in the mock, which is half the screen's behaviour.
            if (seededFor(account, month).nextInt(10) != 0) {
                statements.add(statementFor(account, month, stmtNum, system, custNum));
            }
            stmtNum++;
            month = month.plusMonths(1);
        }
        return statements;
    }

    /**
     * A stable account for a customer's nth account, 19 digits — the width
     * PDP's ACCT_NUM actually is, not the 14 the BM archive and the online
     * gateway use. A 14-digit fixture would make the screen's own field limit
     * look wrong.
     */
    private static String accountFor(String custNum, int index) {
        String digits = custNum.replaceAll("\\D", "");
        String base = (digits.isEmpty() ? "0000000" : digits) + index;
        return ("0127" + base).length() >= ACCOUNT_DIGITS
                ? ("0127" + base).substring(0, ACCOUNT_DIGITS)
                : "0127" + "0".repeat(ACCOUNT_DIGITS - 4 - base.length()) + base;
    }

    private HistoricalStatement statementFor(
            String acctNum, YearMonth month, int stmtNum, String system, String custNum) {
        Random random = seededFor(acctNum, month);
        LocalDate stmtDate = month.atEndOfMonth();

        // Opening balance drifts with the account so different accounts do not
        // all show the same figures.
        BigDecimal balance = BigDecimal.valueOf(5_000 + Math.abs(acctNum.hashCode() % 45_000))
                .setScale(3, RoundingMode.HALF_UP);

        int count = 4 + random.nextInt(9);
        List<HistoricalStatementLine> lines = new ArrayList<>(count);
        for (int i = 0; i < count; i++) {
            String[] narrative = NARRATIVES[random.nextInt(NARRATIVES.length)];
            boolean credit = narrative[0].endsWith("CREDIT") || random.nextInt(3) == 0;
            BigDecimal amount = BigDecimal.valueOf(25 + random.nextInt(9_000))
                    .add(BigDecimal.valueOf(random.nextInt(1000), 3))
                    .setScale(3, RoundingMode.HALF_UP);

            balance = credit ? balance.add(amount) : balance.subtract(amount);
            LocalDate txnDate = month.atDay(1 + random.nextInt(month.lengthOfMonth()));

            lines.add(new HistoricalStatementLine(
                    String.valueOf(i + 1),
                    "0127",
                    txnDate.format(YYYYMMDD),
                    txnDate.format(YYYYMMDD),
                    narrative[0],
                    narrative[1],
                    "",
                    "",
                    credit ? amount.toPlainString() : "",
                    credit ? "" : amount.toPlainString(),
                    balance.abs().toPlainString(),
                    balance.signum() < 0 ? "DR" : "CR"));
        }
        // TXN_ORDER orders the printed page, so the lines must read in date
        // order for the running balance to make sense down the column.
        lines.sort(java.util.Comparator.comparing(HistoricalStatementLine::txnDate));
        List<HistoricalStatementLine> ordered = new ArrayList<>(lines.size());
        for (int i = 0; i < lines.size(); i++) {
            HistoricalStatementLine l = lines.get(i);
            ordered.add(new HistoricalStatementLine(String.valueOf(i + 1), l.txnBranchCode(),
                    l.txnDate(), l.valueDate(), l.narrative1(), l.narrative2(), l.narrative3(),
                    l.narrative4(), l.crAmt(), l.drAmt(), l.runBal(), l.runBalType()));
        }

        // The PDP header carries a different set of identity columns from the
        // BM one — see JdbcStatementRepository. A fixture that filled in both
        // sets would show the screen fields the real archive can never supply.
        boolean pdp = "PDP".equals(system);
        return new HistoricalStatement(
                system,
                acctNum,
                stmtDate.format(YYYYMMDD),
                pdp ? "" : String.valueOf(stmtNum),
                "0127",
                "OLAYA MAIN BRANCH",
                "CURRENT ACCOUNT",
                pdp ? custNum : "",
                "MR DEMO ACCOUNT HOLDER",
                "PO BOX 56921",
                "OLAYA STREET",
                "RIYADH 11564",
                "SAUDI ARABIA",
                "SAR",
                pdp ? "" : "SA0380000000608010167519",
                pdp ? "" : "REF" + stmtDate.format(YYYYMMDD),
                langCodeFor(acctNum),
                pdp ? "1" : "",
                1,
                pdp ? "0127" : "",
                "s0127" + stmtDate.format(YYYYMMDD) + ".prt",
                ordered);
    }

    /** Same account + month always yields the same statement. */
    /**
     * LANG_CODE — the language the statement was PRODUCED in, which the screens
     * now render it in ("A" is Arabic, anything else English).
     *
     * Derived from the account rather than fixed at "E" so both cases are
     * reachable in the demo: an account whose number ends in an odd digit is
     * Arabic. A real archive records whatever each statement was actually sent
     * in; this fixture only has to make the two renderings visible, and it has
     * to be stable per account — the screens take the language of the FIRST
     * statement for the whole pack, so a value that varied by month would make
     * the pack's language depend on which months happened to have statements.
     */
    private static String langCodeFor(String acctNum) {
        char last = acctNum == null || acctNum.isEmpty() ? '0' : acctNum.charAt(acctNum.length() - 1);
        return Character.isDigit(last) && (last - '0') % 2 == 1 ? "A" : "E";
    }

    private static Random seededFor(String acctNum, YearMonth month) {
        return new Random(31L * acctNum.hashCode() + month.hashCode());
    }
}
