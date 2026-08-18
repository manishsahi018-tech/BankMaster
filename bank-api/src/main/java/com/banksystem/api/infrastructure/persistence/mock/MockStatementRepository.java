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
 * <p>Only the BM shape is produced — a single CUST_NAME plus IBAN, REF_NUM and
 * STMT_NUM. Selecting PDP returns that same fixture tagged {@code PDP} rather
 * than a differently shaped one: standing in for both would mean inventing the
 * very distinction that no source in the project records, and the screen still
 * has to show that the selector reaches the repository — see
 * {@code JdbcStatementRepository}.
 */
@Profile("!denodo")
@Repository
public class MockStatementRepository implements StatementRepository {

    private static final DateTimeFormatter YYYYMMDD = DateTimeFormatter.BASIC_ISO_DATE;

    /** Longest period the fixture will materialise, so a wild range cannot hang the demo. */
    private static final int MAX_MONTHS = 60;

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
        YearMonth from = YearMonth.of(
                Integer.parseInt(fromYearMonth.substring(0, 4)),
                Integer.parseInt(fromYearMonth.substring(4, 6)));
        YearMonth to = YearMonth.of(
                Integer.parseInt(toYearMonth.substring(0, 4)),
                Integer.parseInt(toYearMonth.substring(4, 6)));

        String account = acctNum == null ? "" : acctNum.trim();
        List<HistoricalStatement> statements = new ArrayList<>();
        YearMonth month = from;
        int stmtNum = 1;
        while (!month.isAfter(to) && statements.size() < MAX_MONTHS) {
            // A real archive has gaps — a dormant month produces no statement.
            // Skipping some makes "No report found for this account for a given
            // period" reachable in the mock, which is half the screen's behaviour.
            if (seededFor(account, month).nextInt(10) != 0) {
                statements.add(statementFor(account, month, stmtNum, system));
            }
            stmtNum++;
            month = month.plusMonths(1);
        }
        return statements;
    }

    private HistoricalStatement statementFor(
            String acctNum, YearMonth month, int stmtNum, String system) {
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

        return new HistoricalStatement(
                system,
                acctNum,
                stmtDate.format(YYYYMMDD),
                String.valueOf(stmtNum),
                "0127",
                "OLAYA MAIN BRANCH",
                "CURRENT ACCOUNT",
                "",
                "MR DEMO ACCOUNT HOLDER",
                "PO BOX 56921",
                "OLAYA STREET",
                "RIYADH 11564",
                "SAUDI ARABIA",
                "SAR",
                "SA0380000000608010167519",
                "REF" + stmtDate.format(YYYYMMDD),
                "E",
                "",
                1,
                "",
                "s0127" + stmtDate.format(YYYYMMDD) + ".prt",
                ordered);
    }

    /** Same account + month always yields the same statement. */
    private static Random seededFor(String acctNum, YearMonth month) {
        return new Random(31L * acctNum.hashCode() + month.hashCode());
    }
}
