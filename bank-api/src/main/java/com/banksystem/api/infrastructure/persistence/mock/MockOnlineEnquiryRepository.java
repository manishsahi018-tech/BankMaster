package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.OnlineStatementPage;
import com.banksystem.api.domain.model.OnlineTransaction;
import com.banksystem.api.domain.repository.OnlineEnquiryRepository;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

/**
 * Stands in for the online gateway under the mock profile — as
 * MockMerchantRepository stands in for the acquiring system, this stands in for
 * bmrtServer rather than for a database.
 *
 * <p>It reproduces the gateway's CONTRACT, not just its rows, because that is
 * the part the screens are built against and the part a real client will have
 * to satisfy: amounts in MINOR units with the sign as the Dr/Cr flag, a
 * {@code decimalPlace} the caller must divide by, a balance brought forward
 * that the running balance continues from, and pointer-based paging that ends
 * on {@code completionFlag = "1"}. A fixture returning tidy display-ready
 * numbers would let the screens quietly skip all four and break the day a real
 * gateway is wired in.
 */
@Profile("!denodo")
@Repository
public class MockOnlineEnquiryRepository implements OnlineEnquiryRepository {

    private static final DateTimeFormatter YYYYMMDD = DateTimeFormatter.BASIC_ISO_DATE;

    /** Transactions per reply, so the screens exercise the paging loop. */
    private static final int PAGE_SIZE = 20;

    /**
     * decimalPlace by CURRENCY, because that is what it is: readCnd
     * (cbrt01.c:3144) reads cnd0data key "XC00" + the account's 2-char currency,
     * and real stctltabXC data carries a mix — 0, 2 and 3 all occur. A single
     * constant here would have let the screens pass while silently skipping the
     * whole-unit path, which is the one where dividing by the wrong power of ten
     * is least obvious on screen.
     *
     * <p>Every demo account is currency "01" (DemoData.ACC_PREFIX), so the
     * others only show up if you ask for an account number that starts with a
     * different pair — {@code /api/accounts/03008...} renders a 0-decimal,
     * whole-unit statement. That is deliberate: same currency, same scale, as
     * the real thing guarantees.
     *
     * <p>The values are illustrative, not the bank's table. "01" is SAR; the
     * rest are stand-ins picked to cover each branch of coinDenomination.
     */
    private static final Map<String, String> DECIMAL_PLACE_BY_CURRENCY = Map.of(
            "01", "3",
            "02", "2",
            "03", "0",
            "04", "1");

    /** readCnd's own fallback for a currency it cannot read (cbrt01.c:3154). */
    private static final String DEFAULT_DECIMAL_PLACE = "2";

    /** langCode: the legacy reads "0" as Arabic and anything else as English. */
    private static final String LANG_ENGLISH = "3";

    private static final String[][] KINDS = {
            {"SALARY CREDIT", "MONTHLY PAYROLL", ""},
            {"ATM WITHDRAWAL", "ANB ATM OLAYA", ""},
            {"POS PURCHASE", "MERCHANT SETTLEMENT", "TERMINAL 004512"},
            {"TRANSFER OUT", "SARIE OUTWARD", ""},
            {"SERVICE CHARGE", "MONTHLY FEE", ""},
            {"CHEQUE PAID", "CLEARING", ""},
            {"INWARD TRANSFER", "SARIE INWARD", "REMITTANCE"},
    };

    @Override
    public OnlineStatementPage onDemandStatement(
            String accNo, String fromDate, String toDate, String lastTransPtr) {
        return page(accNo, fromDate, toDate, lastTransPtr);
    }

    @Override
    public OnlineStatementPage transactionEnquiry(
            String accNo, String fromDate, String lastTransPtr) {
        // The gateway substitutes today when the request carries no toDate.
        return page(accNo, fromDate, LocalDate.now().format(YYYYMMDD), lastTransPtr);
    }

    private OnlineStatementPage page(
            String accNo, String fromDate, String toDate, String lastTransPtr) {
        LocalDate from = parse(fromDate, LocalDate.now().minusMonths(3));
        LocalDate to = parse(toDate, LocalDate.now());
        if (to.isBefore(from)) {
            to = from;
        }

        int offset = parseInt(lastTransPtr);
        // Total transactions in the range, capped so a wide range still ends.
        long days = Math.min(java.time.temporal.ChronoUnit.DAYS.between(from, to) + 1, 400);
        int total = (int) Math.min(days * 2, 137);

        long denomination = denomination(decimalPlace(accNo));
        Random random = new Random(31L * accNo.hashCode() + from.hashCode());
        // Replay from the start so page N is deterministic and the running
        // balance is continuous across pages, exactly as a cursor would be.
        List<OnlineTransaction> all = new ArrayList<>(total);
        for (int i = 0; i < total; i++) {
            String[] kind = KINDS[random.nextInt(KINDS.length)];
            boolean credit = kind[0].contains("CREDIT") || kind[0].contains("INWARD")
                    || random.nextInt(3) == 0;
            // Minor units, scaled to THIS currency so the displayed figure lands in
            // 25 - 9024.xxx whatever the decimalPlace is. Generating a fixed
            // 3-decimal magnitude would have shown a whole-unit currency
            // amounts in the millions — plausible-looking nonsense that hides
            // whether the screen divided by anything at all.
            long minor = (25L + random.nextInt(9_000)) * denomination
                    + (denomination > 1 ? random.nextInt((int) denomination) : 0);
            LocalDate posted = from.plusDays(random.nextInt((int) days));

            all.add(new OnlineTransaction(
                    "TLR" + (100 + random.nextInt(99)),
                    posted.format(YYYYMMDD),
                    posted.format(YYYYMMDD),
                    credit ? "01" : "02",
                    (credit ? "+" : "-") + minor,
                    kind[0],
                    kind[1],
                    kind[2],
                    "REF" + (1_000_000 + random.nextInt(8_999_999)),
                    random.nextInt(8) == 0 ? "SUP01" : "",
                    String.valueOf(i + 1),
                    "1"));
        }
        all.sort(java.util.Comparator.comparing(OnlineTransaction::postDate));

        int end = Math.min(offset + PAGE_SIZE, all.size());
        List<OnlineTransaction> slice =
                offset >= all.size() ? List.of() : List.copyOf(all.subList(offset, end));
        boolean complete = end >= all.size();

        // Brought forward only on the FIRST page; later pages continue from the
        // caller's running total, which is how the legacy treats it (cfBalance
        // is seeded once from bfBalance, then carried).
        String bfBalance = offset == 0
                ? String.valueOf(2_000_000L + Math.abs(accNo.hashCode() % 40_000_000L))
                : "0";

        return new OnlineStatementPage(
                "00",
                accNo,
                "MR DEMO ACCOUNT HOLDER",
                "PO BOX 56921 OLAYA STREET RIYADH 11564 SAUDI ARABIA",
                "0127",
                "OLAYA MAIN BRANCH",
                LANG_ENGLISH,
                decimalPlace(accNo),
                bfBalance,
                from.format(YYYYMMDD),
                to.format(YYYYMMDD),
                slice,
                String.valueOf(end),
                complete ? "1" : "0");
    }

    /** coinDenomination — what the screens divide by (gateway.ts, OnlineStmt.frm:748). */
    private static long denomination(String decimalPlace) {
        return switch (decimalPlace) {
            case "1" -> 10L;
            case "2" -> 100L;
            case "3" -> 1000L;
            default -> 1L;
        };
    }

    /** The account's currency is its first two characters, as in the real repository. */
    private static String decimalPlace(String accNo) {
        String currCode = accNo != null && accNo.length() >= 2 ? accNo.substring(0, 2) : "";
        return DECIMAL_PLACE_BY_CURRENCY.getOrDefault(currCode, DEFAULT_DECIMAL_PLACE);
    }

    private static LocalDate parse(String yyyymmdd, LocalDate fallback) {
        if (yyyymmdd == null || yyyymmdd.trim().length() != 8) {
            return fallback;
        }
        try {
            return LocalDate.parse(yyyymmdd.trim(), YYYYMMDD);
        } catch (RuntimeException e) {
            return fallback;
        }
    }

    private static int parseInt(String value) {
        try {
            return Math.max(0, Integer.parseInt(value == null ? "0" : value.trim()));
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
