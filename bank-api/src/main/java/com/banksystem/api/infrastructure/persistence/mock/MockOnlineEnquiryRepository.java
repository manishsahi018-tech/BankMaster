package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.OnlineStatementPage;
import com.banksystem.api.domain.model.OnlineTransaction;
import com.banksystem.api.domain.repository.OnlineEnquiryRepository;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
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

    /** Three decimals, as SAR carries — so coinDenomination is 1000. */
    private static final String DECIMAL_PLACE = "3";

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

        Random random = new Random(31L * accNo.hashCode() + from.hashCode());
        // Replay from the start so page N is deterministic and the running
        // balance is continuous across pages, exactly as a cursor would be.
        List<OnlineTransaction> all = new ArrayList<>(total);
        for (int i = 0; i < total; i++) {
            String[] kind = KINDS[random.nextInt(KINDS.length)];
            boolean credit = kind[0].contains("CREDIT") || kind[0].contains("INWARD")
                    || random.nextInt(3) == 0;
            // Minor units, three decimals: 25.000 - 9024.999
            long minor = (25L + random.nextInt(9_000)) * 1000L + random.nextInt(1000);
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
                DECIMAL_PLACE,
                bfBalance,
                from.format(YYYYMMDD),
                to.format(YYYYMMDD),
                slice,
                String.valueOf(end),
                complete ? "1" : "0");
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
