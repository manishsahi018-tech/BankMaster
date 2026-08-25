package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.MerchantStatementPage;
import com.banksystem.api.domain.repository.MerchantRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 * Stands in for the acquiring/POS system the legacy merchant screen talks to.
 *
 * <p>Unlike the other mocks this one does not stand in for a database — there
 * is no merchant table in the archival schema and no merchant Denodo view (see
 * {@link MerchantRepository} and QUERY-SPECS.md §21). It reproduces the ONE
 * thing that matters about the real server's contract: it answers with the
 * statement already rendered as fixed-width print lines, paged behind a
 * lastRecCount cursor, and the client is a dumb spool that parses nothing.
 *
 * <p>Everything it emits is synthetic — invented merchants, terminals, masked
 * card numbers and amounts. Nothing corresponds to a real acquiring record.
 */
@Profile("!denodo")
@Repository
public class MockMerchantRepository implements MerchantRepository {

    /** Print lines the server sends per reply, as the legacy pages them. */
    private static final int LINES_PER_PAGE = 22;

    /** Detail rows before a form feed starts a new printed page. */
    private static final int ROWS_PER_PRINT_PAGE = 40;

    private static final List<String> MERCHANT_NAMES = List.of(
            "AL FAISALIAH RETAIL GROUP", "TAMIMI MARKETS", "JARIR BOOKSTORE",
            "EXTRA STORES", "AL NAHDI PHARMACY", "PANDA RETAIL CO",
            "HERFY FOOD SERVICES", "AL OTHAIM MARKETS", "GULF MARINE SUPPLIES",
            "NOOR TRADING OUTLETS");

    private static final List<String> CITIES = List.of(
            "RIYADH", "JEDDAH", "DAMMAM", "KHOBAR", "MAKKAH", "MADINAH", "JUBAIL", "ABHA");

    private static final DateTimeFormatter RAW = DateTimeFormatter.BASIC_ISO_DATE;

    @Override
    public MerchantStatementPage statement(String merchantNo, String stmtType,
                                           String fromDate, String toDate, String lastTransPtr) {
        String merchant = merchantNo == null ? "" : merchantNo.trim();
        if (merchant.isEmpty()) {
            return MerchantStatementPage.empty(merchant);
        }

        // The server refusing is part of the contract, and a mock that can only
        // succeed lets the failure path ship untested. A merchant number ending
        // in the refusal marker asks for one — the server owns the wording, so
        // the mock supplies a sentence rather than a code for the client to
        // interpret.
        if (merchant.endsWith(REFUSAL_MARKER)) {
            return new MerchantStatementPage("012",
                    "\u0627\u0644\u062a\u0627\u062c\u0631 \u063a\u064a\u0631 "
                            + "\u0645\u0633\u062c\u0644 \u0641\u064a \u0627\u0644\u0646"
                            + "\u0638\u0627\u0645",
                    "Merchant is not registered in the acquiring system",
                    merchant, List.of(), "00000", "1");
        }

        List<String> all = render(merchant, stmtType, fromDate, toDate);

        int offset = parseCursor(lastTransPtr);
        if (offset >= all.size()) {
            return new MerchantStatementPage(MerchantStatementPage.SUCCESS, "", "", merchant,
                    List.of(), String.format("%05d", all.size()), "1");
        }
        int end = Math.min(all.size(), offset + LINES_PER_PAGE);
        boolean last = end >= all.size();
        return new MerchantStatementPage(MerchantStatementPage.SUCCESS, "", "", merchant,
                List.copyOf(all.subList(offset, end)),
                String.format("%05d", end), last ? "1" : "0");
    }

    /**
     * Merchant numbers ending in this get a refused reply. "99" keeps the number
     * the right LENGTH, so it still passes the screen's own validation and the
     * refusal comes from the server rather than from the client's checks —
     * which is the path being exercised.
     */
    private static final String REFUSAL_MARKER = "99";

    private static int parseCursor(String lastTransPtr) {
        try {
            return Math.max(0, Integer.parseInt(lastTransPtr == null ? "0" : lastTransPtr.trim()));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    // ---------------------------------------------------------------------
    // Report rendering — what the POS system would do before sending
    // ---------------------------------------------------------------------

    /**
     * The whole statement as print lines. Itemwise lists every transaction;
     * the other three summarise, which is why they are keyed on a 16-char
     * merchant number in the legacy's validation — they aggregate across
     * outlets rather than list one outlet's items.
     */
    private static List<String> render(String merchantNo, String stmtType,
                                       String fromDate, String toDate) {
        String name = DemoData.pick(merchantNo, 1, MERCHANT_NAMES);
        String period = formatDate(fromDate) + " - " + formatDate(toDate);
        int days = daysBetween(fromDate, toDate);
        if (days <= 0) {
            return List.of();
        }

        return switch (stmtType == null ? "0" : stmtType) {
            case "1" -> summary(merchantNo, name, period, "GROUPWISE", "GROUP", days);
            case "2" -> summary(merchantNo, name, period, "CHAIN", "OUTLET", days);
            case "3" -> summary(merchantNo, name, period, "OUTLET", "TERMINAL", days);
            default -> itemwise(merchantNo, name, period, fromDate, days);
        };
    }

    private static List<String> itemwise(String merchantNo, String name, String period,
                                         String fromDate, int days) {
        List<String> out = new ArrayList<>();
        long grossTotal = 0;
        long commTotal = 0;
        int count = 0;
        int rowsOnPage = 0;

        header(out, merchantNo, name, period, "ITEMWISE", true);
        LocalDate start = parse(fromDate);

        for (int day = 0; day < days; day++) {
            LocalDate date = start.plusDays(day);
            int perDay = DemoData.pick(merchantNo + day, 2, 4) == 0
                    ? 0 : 1 + DemoData.pick(merchantNo + day, 3, 4);

            // A day's takings are listed in the order they happened, so build
            // the day first and sort by time before emitting.
            record Sale(String time, String terminal, String pan, String ref, long gross) { }
            List<Sale> sales = new ArrayList<>();
            for (int k = 0; k < perDay; k++) {
                String key = merchantNo + day + "-" + k;
                sales.add(new Sale(
                        String.format("%02d:%02d", 8 + DemoData.pick(key, 5, 13),
                                DemoData.pick(key, 6, 60)),
                        "T" + String.format("%07d", DemoData.seed(key, 7) % 9_999_999),
                        maskedPan(key),
                        String.format("%012d", DemoData.seed(key, 8) % 999_999_999_999L),
                        2_500 + DemoData.seed(key, 4) % 450_000L)); // halalas
            }
            sales.sort(java.util.Comparator.comparing(Sale::time));

            for (Sale s : sales) {
                long comm = Math.round(s.gross() * 0.01);
                grossTotal += s.gross();
                commTotal += comm;
                count++;

                if (rowsOnPage >= ROWS_PER_PRINT_PAGE) {
                    rowsOnPage = 0;
                    // Leading form feed = new printed page, as the legacy's
                    // cmdPrintStmt_Click looks for (Chr(12)).
                    out.add("\f" + headerLine(period, "ITEMWISE"));
                    out.add(merchantLine(merchantNo, name));
                    columnTitles(out);
                }

                out.add(String.format("%-10s%-8s%-11s%-21s%-12s%14s%11s%15s",
                        date.format(DateTimeFormatter.ofPattern("dd/MM/yy")),
                        s.time(), s.terminal(), s.pan(), s.ref(),
                        money(s.gross()), money(comm), money(s.gross() - comm)));
                rowsOnPage++;
            }
        }

        rule(out);
        out.add(String.format("%-50s%-12s%14s%11s%15s",
                "TOTAL", count + " TXNS", money(grossTotal), money(commTotal),
                money(grossTotal - commTotal)));
        out.add("");
        out.add("END OF STATEMENT");
        return List.copyOf(out);
    }

    /**
     * The three aggregated variants share a shape: one line per group, outlet
     * or terminal with its transaction count and settled totals.
     */
    private static List<String> summary(String merchantNo, String name, String period,
                                        String title, String unit, int days) {
        List<String> out = new ArrayList<>();
        header(out, merchantNo, name, period, title, false);
        out.add(String.format("%-14s%-28s%10s%12s%14s%11s%15s",
                unit, "LOCATION", "TXNS", "REFUNDS", "GROSS AMT", "COMM", "NET AMT"));
        rule(out);

        int units = 3 + DemoData.pick(merchantNo + title, 10, 8); // 3-10
        long grossTotal = 0;
        long commTotal = 0;
        int countTotal = 0;
        for (int i = 0; i < units; i++) {
            String key = merchantNo + title + i;
            int txns = 20 + DemoData.pick(key, 11, days * 6 + 40);
            int refunds = DemoData.pick(key, 12, Math.max(1, txns / 25));
            long gross = (long) txns * (4_000 + DemoData.seed(key, 13) % 90_000L);
            long comm = Math.round(gross * 0.01);
            grossTotal += gross;
            commTotal += comm;
            countTotal += txns;
            out.add(String.format("%-14s%-28s%10s%12s%14s%11s%15s",
                    unitCode(unit, key),
                    DemoData.pick(key, 14, CITIES) + " - "
                            + DemoData.pick(key, 15, List.of("MALL", "MAIN ST", "AIRPORT",
                                    "CORNICHE", "INDUSTRIAL", "UNIVERSITY")),
                    String.valueOf(txns), String.valueOf(refunds),
                    money(gross), money(comm), money(gross - comm)));
        }

        rule(out);
        out.add(String.format("%-14s%-28s%10s%12s%14s%11s%15s",
                "TOTAL", units + " " + unit + "S", String.valueOf(countTotal), "",
                money(grossTotal), money(commTotal), money(grossTotal - commTotal)));
        out.add("");
        out.add("END OF STATEMENT");
        return List.copyOf(out);
    }

    private static String unitCode(String unit, String key) {
        String prefix = switch (unit) {
            case "GROUP" -> "GRP";
            case "OUTLET" -> "OUT";
            default -> "T";
        };
        return prefix + String.format("%06d", DemoData.seed(key, 16) % 999_999);
    }

    private static void header(List<String> out, String merchantNo, String name,
                               String period, String title, boolean withColumns) {
        out.add(headerLine(period, title));
        out.add(merchantLine(merchantNo, name));
        if (withColumns) {
            columnTitles(out);
        }
    }

    /**
     * Bank / report title / period.
     *
     * <p>No page number. This line is repeated at the top of every page of the
     * spool, and the number was the only thing that differed between them —
     * which is the one field a reader gains nothing from once the pages are
     * separate sheets, and the one that made three identical headers look like
     * three different ones. The period column is the widest field and must fit
     * "PERIOD: dd/MM/yyyy - dd/MM/yyyy" (31 chars).
     */
    private static String headerLine(String period, String title) {
        return String.format("%-28s%-34s%s",
                "ARAB NATIONAL BANK",
                "MERCHANT STATEMENT - " + title,
                "PERIOD: " + period);
    }

    /** Second header line: which merchant the statement is for. Wide enough
     *  for "MERCHANT NO: " plus the longest (16-char) merchant number. */
    private static String merchantLine(String merchantNo, String name) {
        return String.format("%-32s%s", "MERCHANT NO: " + merchantNo, name);
    }

    private static void columnTitles(List<String> out) {
        out.add(String.format("%-10s%-8s%-11s%-21s%-12s%14s%11s%15s",
                "DATE", "TIME", "TERMINAL", "CARD NUMBER", "REF NO",
                "GROSS AMT", "COMM", "NET AMT"));
        rule(out);
    }

    private static void rule(List<String> out) {
        out.add("-".repeat(102));
    }

    /** PAN as the acquirer prints it: first six and last four only. */
    private static String maskedPan(String key) {
        return "448937******" + String.format("%04d", DemoData.seed(key, 20) % 10_000);
    }

    /** Halalas as a grouped decimal, right-aligned by the caller's format. */
    private static String money(long halalas) {
        return String.format("%,d.%02d", halalas / 100, Math.abs(halalas % 100));
    }

    private static LocalDate parse(String yyyymmdd) {
        try {
            return LocalDate.parse(yyyymmdd.trim(), RAW);
        } catch (RuntimeException e) {
            return LocalDate.now().minusMonths(1);
        }
    }

    private static int daysBetween(String fromDate, String toDate) {
        LocalDate from = parse(fromDate);
        LocalDate to = parse(toDate);
        long d = java.time.temporal.ChronoUnit.DAYS.between(from, to) + 1;
        // Bound a silly range so one request cannot render years of lines.
        return (int) Math.max(0, Math.min(d, 400));
    }

    private static String formatDate(String yyyymmdd) {
        return parse(yyyymmdd).format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }
}
