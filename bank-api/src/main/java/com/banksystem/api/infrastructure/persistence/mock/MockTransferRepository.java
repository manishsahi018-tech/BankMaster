package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.TransactionDetail;
import com.banksystem.api.domain.model.TransactionSummary;
import com.banksystem.api.domain.model.TransferDetail;
import com.banksystem.api.domain.model.TransferSummary;
import com.banksystem.api.domain.repository.TransferRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * SARIE transfers (rid0data) and BankMaster transactions (thd0data) —
 * fully local in legacy (cbswift.c). See QUERY-SPECS.md §17–18.
 *
 * <p>Both are generated per account across a rolling two-year window and then
 * filtered by the caller's date range, so the Transaction and Transfer Enquiry
 * screens' date pickers actually change the result — the previous fixtures
 * returned the same three rows whatever range was asked for, which made the
 * enquiry look broken in a demo.
 */
@Profile("!denodo")
@Repository
public class MockTransferRepository implements TransferRepository {

    /** How far back generated history runs. */
    private static final int WINDOW_DAYS = 730;

    // ---------------------------------------------------------------------
    // BankMaster transactions (thd0data)
    // ---------------------------------------------------------------------

    /** transType, then the two narrative lines the detail screen shows. */
    private static final List<String[]> TRANS_KINDS = List.of(
            new String[] {"01", "SALARY CREDIT", "MONTHLY PAYROLL"},
            new String[] {"01", "CASH DEPOSIT", "BRANCH COUNTER"},
            new String[] {"02", "ATM WITHDRAWAL", "ANB ATM"},
            new String[] {"02", "POS PURCHASE", "MADA POS"},
            new String[] {"02", "SADAD PAYMENT", "BILL SETTLEMENT"},
            new String[] {"02", "STANDING ORDER DR", "SCHEDULED TRANSFER"},
            new String[] {"01", "CHEQUE DEPOSIT", "CLEARING CYCLE"},
            new String[] {"02", "SERVICE FEE", "MONTHLY CHARGE"},
            new String[] {"01", "INWARD TRANSFER", "SARIE CREDIT"},
            new String[] {"02", "OUTWARD TRANSFER", "SARIE DEBIT"});

    private static final List<String> LOCATIONS = List.of(
            "RIYADH OLAYA", "JEDDAH TAHLIA", "DAMMAM CORNICHE", "KHOBAR RAKAH",
            "MAKKAH AZIZIYAH", "JUBAIL INDUSTRIAL", "QATIF CENTRAL");

    /**
     * A stable two-year transaction history for one account — a few per month,
     * so a one-month range returns a handful and a full-year range returns
     * enough to page and to make the Total line worth reading.
     */
    private static List<TransactionSummary> historyFor(String accNo) {
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        List<TransactionSummary> rows = new ArrayList<>();
        int counter = 1;
        for (int daysAgo = WINDOW_DAYS; daysAgo >= 0; daysAgo--) {
            int perDay = DemoData.pick(accNo + daysAgo, 1, 9) == 0
                    ? 1 + DemoData.pick(accNo + daysAgo, 2, 2) : 0;
            for (int k = 0; k < perDay; k++) {
                String key = accNo + daysAgo + k;
                String[] kind = DemoData.pick(key, 3, TRANS_KINDS);
                // Company accounts move larger sums than personal ones.
                long floor = c.juristic() ? 2_500 : 50;
                long span = c.juristic() ? 480_000 : 9_500;
                long riyals = floor + DemoData.seed(key, 4) % span;
                // Cheque deposits clear two days after posting; everything
                // else values same-day.
                int valueLag = "CHEQUE DEPOSIT".equals(kind[1]) ? 2 : 0;
                rows.add(new TransactionSummary(
                        "TR" + String.format("%08d", 100000 + DemoData.seed(key, 5) % 899999),
                        DemoData.dateBack(daysAgo),
                        DemoData.dateBack(daysAgo + valueLag),
                        String.valueOf(500 + DemoData.pick(key, 6, 400)),
                        DemoData.amount((int) riyals, DemoData.pick(key, 7, 100) * 10),
                        String.format("%05d", counter++),
                        kind[0]));
            }
        }
        // Newest first, as the legacy grid loads them.
        rows.sort((a, b) -> b.postDate().compareTo(a.postDate()));
        return List.copyOf(rows);
    }

    @Override
    public PagedResult<TransactionSummary> bmTransactions(String accNo, String fromDate,
                                                          String toDate, String transType,
                                                          int page) {
        List<TransactionSummary> all = historyFor(accNo).stream()
                .filter(t -> DemoData.inRange(t.postDate(), fromDate, toDate))
                // Legacy three-way filter: blank = all, RR = reversals
                // (statmentFlag > '1'), else an exact transType match.
                .filter(t -> transType == null || transType.isBlank()
                        || ("RR".equals(transType) ? isReversal(t) : t.transType().equals(transType)))
                .toList();
        return PagedResult.page(all, page);
    }

    /** Mock stand-in for statmentFlag > '1': roughly one in twenty. */
    private static boolean isReversal(TransactionSummary t) {
        return DemoData.pick(t.transRef(), 9, 20) == 0;
    }

    @Override
    public Optional<TransactionDetail> bmTransactionDetail(String accNo, String refNo) {
        return historyFor(accNo).stream()
                .filter(t -> t.transRef().equals(refNo))
                .findFirst()
                .map(t -> {
                    String[] kind = DemoData.pick(t.transRef(), 10, TRANS_KINDS);
                    return new TransactionDetail(accNo, t.transRef(),
                            DemoData.customerForAccount(accNo).shortName(),
                            t.postDate(), t.valueDate(), t.transAmt(), t.transType(), t.userId(),
                            String.valueOf(52000 + DemoData.pick(t.transRef(), 11, 3000)),
                            isReversal(t) ? "2" : "1",
                            kind[1], kind[2],
                            DemoData.pick(t.transRef(), 12, LOCATIONS));
                });
    }

    // ---------------------------------------------------------------------
    // SARIE transfers (rid0data)
    // ---------------------------------------------------------------------

    /**
     * ISO currency code and its rate against the riyal.
     *
     * <p>ALPHA, not the ISO numerics these fixtures used to carry. rid0data's
     * currency columns are matched against stctltabXC.isoCurrCode, and that
     * column holds the three-character alpha code: six legacy call sites read
     * it and substitute the literal "SAR" when the row is missing
     * (frmCustomer2.frm:2465-2471 and five beside it), which a numeric column
     * could not do. Seeding numerics here made mock and reference data agree
     * with each other while disagreeing with Denodo, so the screen read
     * "608-Saudi Riyal" under mock and "SAR-Saudi Riyal" in production —
     * a difference no amount of mock testing could surface.
     */
    private static final List<String[]> CURRENCIES = List.of(
            new String[] {"SAR", "1.0000000"},   // same-currency local transfer
            new String[] {"USD", "3.7500000"},
            new String[] {"EUR", "4.0800000"},
            new String[] {"GBP", "4.7600000"});

    private static final List<String[]> BENEFICIARIES = List.of(
            new String[] {"AL NOOR TRADING EST", "PO BOX 9921", "JEDDAH 21423", "ARAB NATIONAL BANK"},
            new String[] {"GULF MARINE SERVICES LTD", "PO BOX 10214", "JUBAIL 31951", "RIYAD BANK"},
            new String[] {"SIEMENS ENERGY AG", "FREYESLEBENSTRASSE 1", "ERLANGEN 91058", "DEUTSCHE BANK AG"},
            new String[] {"TRANS GULF LOGISTICS", "PO BOX 3392", "DAMMAM 31411", "SAUDI AWWAL BANK"},
            new String[] {"MEDITERRANEAN SHIPPING", "12 QUAI DU MONT BLANC", "GENEVA 1201", "UBS SWITZERLAND AG"});

    private static final List<String> PURPOSES = List.of(
            "TRADE", "FAMILY SUPPORT", "SERVICES", "GOODS IMPORT", "SALARY");

    /** Minor-unit string with three decimals, as the amount columns carry. */
    private static String milli(long thousandths) {
        return (thousandths / 1000) + "." + String.format("%03d", Math.abs(thousandths % 1000));
    }

    private static List<TransferSummary> transfersFor(String accNo) {
        List<TransferSummary> rows = new ArrayList<>();
        for (int daysAgo = WINDOW_DAYS; daysAgo >= 0; daysAgo--) {
            if (DemoData.pick(accNo + daysAgo, 20, 24) != 0) {
                continue; // transfers are rarer than counter transactions
            }
            String key = accNo + daysAgo;
            String[] currency = DemoData.pick(key, 21, CURRENCIES);
            long riyals = 2_000 + DemoData.seed(key, 22) % 750_000;
            long payThousandths = Math.round(riyals * 1000 / Double.parseDouble(currency[1]));
            rows.add(new TransferSummary(
                    "SR" + String.format("%08d", 1000000 + DemoData.seed(key, 23) % 8999999),
                    DemoData.dateBack(daysAgo),
                    DemoData.dateBack(Math.max(0, daysAgo - 1)),
                    accNo,
                    "SAR", DemoData.amount((int) riyals, 0),
                    currency[0], milli(payThousandths),
                    // P = pending, C = completed, R = rejected
                    List.of("C", "C", "C", "P", "R").get(DemoData.pick(key, 24, 5))));
        }
        rows.sort((a, b) -> b.issueDate().compareTo(a.issueDate()));
        return List.copyOf(rows);
    }

    /**
     * The fixtures are generated in memory, so the window the JDBC repository
     * pushes into SQL is applied here with {@link PagedResult#page} — same
     * contract (a page plus hasMore), no query to push it into.
     */
    @Override
    public PagedResult<TransferSummary> sarieTransfers(String accNo, String fromDate, String toDate,
                                                       String refNo, String status, int page) {
        List<TransferSummary> all = transfersFor(accNo).stream()
                .filter(t -> DemoData.inRange(t.issueDate(), fromDate, toDate))
                .filter(t -> refNo == null || refNo.isBlank() || t.transRef().equals(refNo))
                .filter(t -> status == null || status.isBlank() || "A".equals(status)
                        || t.statusFlag().equals(status))
                .toList();
        return PagedResult.page(all, page);
    }

    @Override
    public Optional<TransferDetail> transferDetail(String refNo, String transDate) {
        // The reference carries no account, so the detail is rebuilt from the
        // reference itself — stable because every field is seeded from it.
        String key = refNo == null ? "" : refNo;
        String[] benef = DemoData.pick(key, 30, BENEFICIARIES);
        String[] currency = DemoData.pick(key, 31, CURRENCIES);
        long riyals = 2_000 + DemoData.seed(key, 32) % 750_000;
        long payThousandths = Math.round(riyals * 1000 / Double.parseDouble(currency[1]));
        DemoData.Customer applicant =
                DemoData.CUSTOMERS.get(DemoData.pick(key, 33, DemoData.CUSTOMERS.size()));
        DemoData.Customer beneficiary =
                DemoData.CUSTOMERS.get(DemoData.pick(key, 34, DemoData.CUSTOMERS.size()));
        String issue = transDate == null || transDate.isBlank() ? DemoData.dateBack(30) : transDate;
        return Optional.of(new TransferDetail(refNo, issue, issue,
                beneficiary.accNo(0), applicant.accNo(0),
                "SAR", currency[0],
                DemoData.amount((int) riyals, 0), milli(payThousandths),
                applicant.shortName(), benef[0], benef[1], benef[2], benef[3],
                // transType is rid0data.paymentStatus (0-4) and paymentType is
                // its statusFlag (S/I/V/C/D/P/O/R/T). This passed a hardcoded
                // "0" for the status, which is not a member of that domain, so
                // the Status chip showed the fixture value raw instead of a
                // description. Both are seeded off the reference now, like
                // every other field on this record.
                String.valueOf(1 + DemoData.pick(key, 37, 4)),
                List.of("C", "C", "C", "P", "R").get(DemoData.pick(key, 38, 5)),
                applicant.branchCode(), applicant.shortName(),
                DemoData.pick(key, 35, PURPOSES), currency[1],
                DemoData.pick(key, 36, 3) == 0 ? "PLEASE ADVISE BENEFICIARY ON CREDIT" : ""));
    }
}
