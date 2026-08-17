package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.domain.model.BlockedAmountBreakup;
import com.banksystem.api.domain.model.BlockedAmountItem;
import com.banksystem.api.domain.model.ChequeBookHistory;
import com.banksystem.api.domain.model.StandingOrderDetail;
import com.banksystem.api.domain.model.StopChequeDetail;
import com.banksystem.api.domain.model.AcctUpdateHistoryEntry;
import com.banksystem.api.domain.model.ChequeBookRequest;
import com.banksystem.api.domain.model.SamaStatusEntry;
import com.banksystem.api.domain.model.StandingOrder;
import com.banksystem.api.domain.model.StopCheque;
import com.banksystem.api.domain.repository.AccountRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Mock data shaped like the archival records (raw YYYYMMDD /
 * YYYYMMDDHH24MISS values; the UI formats them). Replaced by JDBC
 * implementations once the two database engines are known.
 *
 * <p>Every collection is derived from the account number via {@link DemoData},
 * so each customer holds their own accounts and each account its own cheque
 * books, standing orders and history — rather than the single fixed set the
 * earlier fixtures returned for every key.
 */
@Profile("!denodo")
@Repository
public class MockAccountRepository implements AccountRepository {

    /** Ledger codes and their descriptions, as stctltab would carry them. */
    private static final List<String[]> LEDGERS = List.of(
            new String[] {"008", "تحت الطلب - قطاع خاص مقيــم"},
            new String[] {"012", "حساب توفير - أفراد"},
            new String[] {"031", "وديعة لأجل - قطاع خاص"},
            new String[] {"108", "حساب تحت الطلب - شركات"});

    private static final List<String> STATUSES =
            List.of("00-Open", "00-Open", "00-Open", "04-No debits", "02-Dormant", "08-Enquiry restricted");

    @Override
    public List<AccountSummary> accountsForCustomer(String custNo) {
        DemoData.Customer c = DemoData.customer(custNo);
        List<AccountSummary> rows = new ArrayList<>();
        for (String accNo : c.accountNumbers()) {
            rows.add(summary(accNo));
        }
        return List.copyOf(rows);
    }

    /**
     * One account's balances and status. Blocked amounts only appear on some
     * accounts so the Blocked Amount Breakup button has both states to show,
     * and the cleared balance trails the book balance where funds are held.
     */
    private static AccountSummary summary(String accNo) {
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        int sub = DemoData.subAccount(accNo);
        String status = DemoData.pick(accNo, 1, STATUSES);

        // A closed/restricted account shows nothing; the rest carry balances
        // scaled to the customer type, so a company looks like a company.
        long book = 0;
        if (!status.startsWith("08")) {
            long floor = c.juristic() ? 250_000_00L : 1_500_00L;
            long span = c.juristic() ? 4_000_000_00L : 180_000_00L;
            book = floor + DemoData.seed(accNo, 2) % span;
            if (sub == 0 && !c.juristic()) {
                book = book / 3; // the first account is usually the small one
            }
        }
        // Most accounts hold nothing back; the rest hold an arbitrary slice
        // rather than a round percentage, so the breakup screen has both states
        // and the figures do not look computed.
        long blocked = DemoData.pick(accNo, 3, 3) == 0
                ? 0
                : 25_00L + DemoData.seed(accNo, 4) % Math.max(1, book / 3);
        blocked = Math.min(blocked, book);
        long cleared = book - blocked;

        return new AccountSummary(accNo,
                DemoData.amount2(book), DemoData.amount2(cleared), DemoData.amount2(blocked),
                status,
                c.juristic() ? String.valueOf(50_000 * (1 + DemoData.pick(accNo, 5, 8))) : "0",
                status.startsWith("02") ? "1" : "0",
                c.branchCode(),
                "0");
    }

    /** Mock: branch 0127 restricts balance enquiry, everything else is open. */
    @Override
    public String branchBalEnqRestrictedFlag(String branchCode) {
        return "0127".equals(branchCode == null ? "" : branchCode.trim()) ? "1" : "0";
    }

    /** Mock: DEVUSER may enquire on 0127; other users have no stusrbrn row. */
    @Override
    public List<String> enquiryAllowedBranches(String userId) {
        return "DEVUSER".equals(userId == null ? "" : userId.trim())
                ? List.of("0127") : List.of();
    }

    @Override
    public java.util.Optional<AccountSummary> accountByNumber(String accNo) {
        // Legacy ISEQUAL exact read: that account or nothing. In mock mode any
        // well-formed 14-char number resolves, so a typed account number stays
        // navigable the same way a typed customer number does.
        String wanted = accNo == null ? "" : accNo.trim();
        if (wanted.length() < 12) {
            return Optional.empty();
        }
        return Optional.of(summary(wanted));
    }

    @Override
    public List<AcctUpdateHistoryEntry> updateHistory(String accNo) {
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        int count = 3 + DemoData.pick(accNo, 6, 10); // 3-12
        List<AcctUpdateHistoryEntry> rows = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            int daysAgo = 60 + i * (30 + DemoData.pick(accNo, 100 + i, 90));
            String user = String.valueOf(52000 + DemoData.pick(accNo, 200 + i, 3000));
            rows.add(new AcctUpdateHistoryEntry(c.branchCode(), user,
                    DemoData.dateTimeBack(daysAgo, 9 + i % 8, 15 + i % 40, i % 60),
                    DemoData.pick(accNo, 300 + i, 8) == 0
                            ? "3-Rejected by the branch" : "9-Update successful",
                    String.valueOf(54000 + DemoData.pick(accNo, 400 + i, 800)),
                    DemoData.dateTimeBack(daysAgo, 11 + i % 6, 30 + i % 25, i % 60)));
        }
        // Newest first, as the log grids show them.
        return rows.stream()
                .sorted((a, b) -> b.dateTime().compareTo(a.dateTime()))
                .toList();
    }

    @Override
    public List<ChequeBookRequest> chequeBookRequests(String accNo) {
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        int count = DemoData.pick(accNo, 7, 5); // 0-4; some accounts have none
        List<ChequeBookRequest> rows = new ArrayList<>();
        int firstCheque = 12500 + DemoData.pick(accNo, 8, 40000);
        for (int i = 0; i < count; i++) {
            int books = 1 + DemoData.pick(accNo, 500 + i, 3);
            int from = firstCheque + i * 100;
            rows.add(new ChequeBookRequest(c.branchCode(),
                    String.valueOf(54000 + DemoData.pick(accNo, 600 + i, 900)),
                    DemoData.pick(accNo, 700 + i, 3) == 0 ? "2" : "1",
                    String.format("%02d", books),
                    DemoData.dateBack(90 + i * (120 + DemoData.pick(accNo, 800 + i, 200))),
                    // 3 = issued to customer, 1 = requested, 4 = rejected
                    List.of("3", "3", "1", "4").get(DemoData.pick(accNo, 900 + i, 4)),
                    String.format("%08d", from),
                    String.format("%08d", from + books * 50 - 1)));
        }
        return List.copyOf(rows);
    }

    private static final List<String> PAYEES = List.of(
            "SAUDI ELECTRICITY CO", "NATIONAL WATER CO", "AL RAJHI TRADING",
            "MOBILY POSTPAID", "STC BUSINESS", "TAMKEEN LEASING",
            "AL NAHDA MEDICAL CENTRE", "JARIR MARKETING CO");

    @Override
    public List<StandingOrder> standingOrders(String accNo) {
        int count = DemoData.pick(accNo, 9, 4); // 0-3
        List<StandingOrder> rows = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            rows.add(new StandingOrder(String.format("%06d", i + 1),
                    String.valueOf(DemoData.pick(accNo, 1000 + i, 3)),
                    DemoData.amount(250 + DemoData.pick(accNo, 1100 + i, 9750), 0),
                    beneficiaryAccount(accNo, i),
                    DemoData.pick(accNo, 1200 + i, 2) == 0 ? "0" : "1",
                    List.of("M", "M", "Q", "Y").get(DemoData.pick(accNo, 1300 + i, 4))));
        }
        return List.copyOf(rows);
    }

    /** A beneficiary account belonging to some other roster customer. */
    private static String beneficiaryAccount(String accNo, int i) {
        DemoData.Customer other = DemoData.CUSTOMERS.get(
                DemoData.pick(accNo, 1400 + i, DemoData.CUSTOMERS.size()));
        return other.accNo(DemoData.pick(accNo, 1500 + i, Math.max(1, other.accountCount())));
    }

    @Override
    public List<StopCheque> stopCheques(String accNo) {
        int count = DemoData.pick(accNo, 10, 4); // 0-3
        List<StopCheque> rows = new ArrayList<>();
        int base = 12500 + DemoData.pick(accNo, 8, 40000);
        for (int i = 0; i < count; i++) {
            // A range stop carries chequeFrom and no amount/payee; a single
            // stop carries both — the legacy grid shows the two forms.
            boolean range = DemoData.pick(accNo, 1600 + i, 3) == 0;
            int chequeNo = base + 7 + i * 13;
            rows.add(new StopCheque(String.format("%08d", chequeNo),
                    range ? "0.000" : DemoData.amount(500 + DemoData.pick(accNo, 1700 + i, 24500), 0),
                    DemoData.dateBack(20 + i * (45 + DemoData.pick(accNo, 1800 + i, 160))),
                    range ? "" : DemoData.pick(accNo, 1900 + i, PAYEES),
                    range ? String.format("%08d", chequeNo - 3) : ""));
        }
        return List.copyOf(rows);
    }

    @Override
    public Optional<StopChequeDetail> stopChequeDetail(String accNo, String chequeNo) {
        return stopCheques(accNo).stream()
                .filter(s -> s.chequeNo().equals(chequeNo))
                .findFirst()
                .map(s -> new StopChequeDetail(accNo, s.chequeNo(), s.amount(), s.dateStop(),
                        s.payeeName(), s.chequeFrom(),
                        String.valueOf(54000 + DemoData.pick(accNo + chequeNo, 1, 900))));
    }

    @Override
    public Optional<StandingOrderDetail> standingOrderDetail(String accNo, String sodNo) {
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        return standingOrders(accNo).stream()
                .filter(s -> s.sodNo().equals(sodNo))
                .findFirst()
                .map(s -> {
                    String key = accNo + sodNo;
                    int made = DemoData.pick(key, 2, 40);
                    int total = made + 1 + DemoData.pick(key, 3, 40);
                    long instalment = Long.parseLong(s.paymentAmt().split("\\.")[0]);
                    return new StandingOrderDetail(accNo, s.sodNo(), s.orderType(),
                            s.paymentType(), "0", s.paymentFrequency(),
                            DemoData.dateBack(900), DemoData.dateBack(-30),
                            DemoData.dateBack(-900), DemoData.dateBack(1),
                            String.format("%03d", total), String.format("%03d", made),
                            "0", "0", "0",
                            "0000000000", s.paymentAmt(),
                            DemoData.amount((int) (instalment * made), 0),
                            DemoData.amount((int) (instalment * total), 0),
                            s.payAccNo(),
                            DemoData.customerForAccount(s.payAccNo()).shortName(),
                            "STANDING ORDER DR", "", "STANDING ORDER CR", "",
                            "0", c.branchCode(),
                            DemoData.pick(key, 4, PAYEES).length() > 0
                                    ? DemoData.pick(key, 4, PAYEES) : "MONTHLY TRANSFER",
                            c.branchCode(),
                            String.valueOf(54000 + DemoData.pick(key, 5, 900)),
                            DemoData.dateBack(30 + DemoData.pick(key, 6, 400)),
                            DemoData.pick(key, 7, 5) == 0);
                });
    }

    @Override
    public Optional<ChequeBookHistory> chequeBookHistory(String accNo, String reqDate) {
        return chequeBookRequests(accNo).stream()
                .filter(c -> c.reqDate().equals(reqDate))
                .findFirst()
                .map(c -> {
                    String key = accNo + reqDate;
                    boolean rejected = "4".equals(c.requestStatus());
                    boolean issued = "3".equals(c.requestStatus());
                    String producedUser = "CHQPRDCTR";
                    String branchUser = String.valueOf(54000 + DemoData.pick(key, 1, 900));
                    return new ChequeBookHistory(accNo, c.reqDate() + "103000", c.requestUserId(),
                            rejected ? "" : shiftDays(c.reqDate(), 2), rejected ? "" : "020000",
                            rejected ? "" : producedUser,
                            rejected ? "" : shiftDays(c.reqDate(), 5), rejected ? "" : "094500",
                            rejected ? "" : branchUser,
                            issued ? shiftDays(c.reqDate(), 7) : "", issued ? "113000" : "",
                            issued ? branchUser : "",
                            rejected ? shiftDays(c.reqDate(), 1) : "", rejected ? "141500" : "",
                            rejected ? branchUser : "",
                            rejected ? "Signature mismatch on the request form" : "");
                });
    }

    /** YYYYMMDD + n days, kept as a raw archival string. */
    private static String shiftDays(String yyyymmdd, int days) {
        return java.time.LocalDate
                .parse(yyyymmdd, java.time.format.DateTimeFormatter.BASIC_ISO_DATE)
                .plusDays(days)
                .format(java.time.format.DateTimeFormatter.BASIC_ISO_DATE);
    }

    @Override
    public BlockedAmountBreakup blockedAmountBreakup(String accNo) {
        AccountSummary a = summary(accNo);
        long blocked = Math.round(Double.parseDouble(a.blockedBalance()) * 100);
        if (blocked == 0) {
            return BlockedAmountBreakup.complete(accNo, "0.000", List.of());
        }
        // Splits the account's blocked balance across the three product types
        // the legacy breakup shows, so the parts add up to the header figure.
        List<BlockedAmountItem> items = new ArrayList<>();
        long remaining = blocked;
        String[][] kinds = {
                {"B", accNo},
                {"O", "RF" + String.format("%08d", DemoData.pick(accNo, 20, 90000000))},
                {"A", accNo},
        };
        for (int i = 0; i < kinds.length && remaining > 0; i++) {
            long part = i == kinds.length - 1
                    ? remaining
                    : Math.max(1, remaining / (kinds.length - i) + DemoData.pick(accNo, 30 + i, 500) * 100L);
            part = Math.min(part, remaining);
            remaining -= part;
            items.add(new BlockedAmountItem(kinds[i][0], kinds[i][1],
                    DemoData.amount2(part) + "0",
                    i == 0 ? "" : String.valueOf(540 + DemoData.pick(accNo, 40 + i, 400))));
        }
        return BlockedAmountBreakup.complete(accNo, DemoData.amount2(blocked) + "0",
                List.copyOf(items));
    }

    private static final List<String> SAMA_REASONS = List.of(
            "Court order", "Order released", "SAMA circular 361000098504",
            "Public prosecution request", "Customer request at branch",
            "Compliance review completed");

    @Override
    public List<SamaStatusEntry> samaStatusHistory(String accNo) {
        return statusEntries(accNo, 50, List.of("00", "03", "01", "00"));
    }

    @Override
    public List<SamaStatusEntry> statusHistory(String accNo) {
        return statusEntries(accNo, 60, List.of("1", "2", "1", "4"));
    }

    /** Shared shape for both status logs: a walk through the status values. */
    private static List<SamaStatusEntry> statusEntries(String accNo, int salt, List<String> states) {
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        int count = 2 + DemoData.pick(accNo, salt, 4); // 2-5
        List<SamaStatusEntry> rows = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            int daysAgo = 120 + i * (150 + DemoData.pick(accNo, salt + 100 + i, 220));
            rows.add(new SamaStatusEntry(
                    DemoData.dateTimeBack(daysAgo, 10 + i % 7, 20 + i % 35, i % 60),
                    String.valueOf(52000 + DemoData.pick(accNo, salt + 200 + i, 3000)),
                    String.valueOf(54000 + DemoData.pick(accNo, salt + 300 + i, 800)),
                    DemoData.dateTimeBack(daysAgo, 11 + i % 6, 40 + i % 19, i % 60),
                    states.get(i % states.size()),
                    states.get((i + 1) % states.size()),
                    DemoData.pick(accNo, salt + 400 + i, SAMA_REASONS)));
        }
        rows.sort((a, b) -> b.dateTime().compareTo(a.dateTime()));
        // Keep the branch out of the reason text but make the record coherent.
        return rows.stream().filter(r -> !c.branchCode().isBlank()).toList();
    }

    @Override
    public Map<String, String> snapshot(String accNo, String dateTime) {
        // Mock stacclog snapshot: the account looked different back then —
        // dormant with a lower credit limit and the old statement frequency.
        Map<String, String> live = new java.util.HashMap<>(accountDetail(accNo));
        live.put("accountStatus", "02");
        live.put("dormant", "Yes");
        live.put("stmtFrequency", "05");
        live.put("creditLimit", "5000");
        live.put("memoNote1", "Pre-migration record");
        return Map.copyOf(live);
    }

    @Override
    public Map<String, String> accountDetail(String accNo) {
        // Mock current account master (gld0data stand-in): the live values the
        // AccountMaintenance screen shows outside history mode.
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        AccountSummary a = summary(accNo);
        String[] ledger = DemoData.pick(accNo, 70, LEDGERS);
        boolean dormant = "1".equals(a.dormantFlag());
        return Map.ofEntries(
                Map.entry("customerNo", c.custNo()),
                Map.entry("customerName", c.shortName()),
                // RAW codes: accStatus and stmtFreq are served code sets now, and
                // the screens resolve them through /api/codes. Pre-formatted
                // strings here would look right in a demo while hiding that the
                // Denodo path returns codes — and these particular labels were
                // wrong anyway (01 is Non-automatic, not "None"; 02 is Daily).
                Map.entry("accountStatus", a.accountStatus()),
                Map.entry("samaStatus", dormant ? "03 - Blocked" : "00 - Open"),
                Map.entry("dormant", dormant ? "Yes" : "No"),
                Map.entry("stmtFrequency",
                        List.of("01", "02", "04", "05").get(DemoData.pick(accNo, 71, 4))),
                Map.entry("statementDay", "Br.Stmt.Day"),
                Map.entry("intApplication", "0-Capitalise"),
                Map.entry("crInterestRate", String.valueOf(DemoData.pick(accNo, 72, 4))),
                Map.entry("drInterestRate", String.valueOf(18 + DemoData.pick(accNo, 73, 6))),
                Map.entry("creditLimit", a.creditLimit()),
                Map.entry("branchCode", c.branchCode()),
                Map.entry("ledgerCode", ledger[0]),
                Map.entry("ledgerName", ledger[1]),
                Map.entry("currencyCode", "01"),
                Map.entry("currencyName", "Saudi Riyal"),
                Map.entry("subAccount", String.format("%02d", DemoData.subAccount(accNo))),
                Map.entry("memoNote1", String.valueOf(30000 + DemoData.pick(accNo, 74, 9000))),
                Map.entry("acOpenDate", c.openDate()),
                Map.entry("lastTransDate", DemoData.dateBack(DemoData.pick(accNo, 75, 30))),
                Map.entry("lastAmendDate", DemoData.dateBack(60 + DemoData.pick(accNo, 76, 500))),
                Map.entry("lastAmendUser", String.valueOf(83000 + DemoData.pick(accNo, 77, 900))),
                Map.entry("supervisorId", String.valueOf(54000 + DemoData.pick(accNo, 78, 800))),
                Map.entry("lastUpdateCsd", DemoData.dateBack(30 + DemoData.pick(accNo, 79, 300))),
                Map.entry("supervisorApproved", DemoData.dateBack(30 + DemoData.pick(accNo, 79, 300))));
    }
}
