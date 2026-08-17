package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.CustUpdateHistoryEntry;
import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.HeirEntry;
import com.banksystem.api.domain.model.IdDocument;
import com.banksystem.api.domain.model.JointHolderEntry;
import com.banksystem.api.domain.model.JuristicAccountInfo;
import com.banksystem.api.domain.model.OpenUpdateInfo;
import com.banksystem.api.domain.model.OwnerEntry;
import com.banksystem.api.domain.model.ReferenceEntry;
import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import com.banksystem.api.domain.model.SearchScan;
import com.banksystem.api.domain.repository.CustomerRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Mock data matching bank-ui's current fixtures (sample values from the
 * legacy screenshots). Replaced by a JDBC implementation against the
 * archival-schema DB once its engine is known.
 */
@Profile("!denodo")
@Repository
public class MockCustomerRepository implements CustomerRepository {

    /** The roster, projected into the search-result shape. */
    private static final List<CustomerSummary> RESULTS = DemoData.CUSTOMERS.stream()
            .map(c -> new CustomerSummary(c.custNo(), c.idType(), c.idNo(), c.telNo(), c.telExt(),
                    firstOf(c.aFirstName(), c.eFirstName()),
                    firstOf(c.aSecondName(), c.eSecondName()),
                    firstOf(c.aLastName(), c.eLastName()),
                    c.shortName(), c.branchCode(), c.mainCategory(), c.subCategory()))
            .toList();

    private static String firstOf(String preferred, String fallback) {
        return preferred == null || preferred.isBlank() ? fallback : preferred;
    }

    private static List<CustUpdateHistoryEntry> buildHistory() {
        var rows = new java.util.ArrayList<>(BASE_HISTORY);
        for (int i = 0; i < 17; i++) {
            rows.add(new CustUpdateHistoryEntry("0191", String.format("%05d", 55000 + i),
                    String.format("201001%02d1015%02d", (i % 27) + 1, i % 60),
                    "9-Update successful", "54124",
                    String.format("201001%02d1130%02d", (i % 27) + 1, i % 60), "01", "01"));
        }
        return List.copyOf(rows);
    }

    private static final List<CustUpdateHistoryEntry> BASE_HISTORY = List.of(
            new CustUpdateHistoryEntry("0128", "BMBRCHG", "20020528220419", "9-Update successful", "BMBRCHG", "20020528193053", "", ""),
            new CustUpdateHistoryEntry("0711", "99607", "20030930101638", "9-Update successful", "51969", "20030930124818", "", ""),
            new CustUpdateHistoryEntry("0173", "80233", "20060502155957", "9-Update successful", "52453", "20060502164400", "01", "01"),
            new CustUpdateHistoryEntry("0716", "81407", "20070717130114", "9-Update successful", "55001", "20070718135440", "01", "01"),
            new CustUpdateHistoryEntry("0125", "54124", "20080623133852", "9-Update successful", "53680", "20080623143043", "01", "01"),
            new CustUpdateHistoryEntry("0191", "55629", "20081013122815", "9-Update successful", "54124", "20081013123237", "01", "01"),
            new CustUpdateHistoryEntry("0191", "54139", "20081018144844", "9-Update successful", "54124", "20081018145554", "01", "01"),
            new CustUpdateHistoryEntry("0191", "57127", "20090120105712", "3-Rejected by the branch", "54124", "20090120105753", "01", "01"));

    // 25 rows so the UI's "More" pagination (20/page) has a second page.
    // Declared after BASE_HISTORY: static initializers run in source order.
    private static final List<CustUpdateHistoryEntry> HISTORY = buildHistory();

    @Override
    public SearchScan<CustomerSummary> search(CustomerSearchCriteria c) {
        // Legacy doSearch: customer-no lookups resolve to a single customer.
        // Mock mode is a data stand-in, so ANY customer number resolves: known
        // fixtures keep their own category/idType (so loadCorrespondingForm
        // routing stays exercisable), unknown ones borrow the first fixture's
        // shape. Every downstream read (profile, accounts, cards) resolves the
        // same way, so any number stays navigable end to end.
        if (notBlank(c.custNo())) {
            DemoData.Customer cust = DemoData.customer(c.custNo());
            return SearchScan.complete(List.of(new CustomerSummary(cust.custNo(), cust.idType(),
                    cust.idNo(), cust.telNo(), cust.telExt(),
                    firstOf(cust.aFirstName(), cust.eFirstName()),
                    firstOf(cust.aSecondName(), cust.eSecondName()),
                    firstOf(cust.aLastName(), cust.eLastName()),
                    cust.shortName(), cust.branchCode(), cust.mainCategory(), cust.subCategory())));
        }

        // Every other criterion narrows the roster, so the demo's search screen
        // behaves like a search rather than always returning everyone. The
        // legacy's own precedence is ID, then CR, then phone, then category,
        // then branch, then name (cbbranch.c processSearchRequest); each branch
        // there is a distinct keyed scan, so they are not combined here either.
        List<CustomerSummary> rows = RESULTS;
        if (notBlank(c.idNo())) {
            rows = filter(rows, r -> r.idNo().equals(c.idNo().trim()));
        } else if (notBlank(c.crNo())) {
            rows = filter(rows, r -> crNoOf(r.custNo()).equals(c.crNo().trim()));
        } else if (notBlank(c.telNo())) {
            rows = filter(rows, r -> r.telNo().equals(c.telNo().trim()));
        } else if (notBlank(c.mobileNo())) {
            rows = filter(rows, r -> DemoData.customer(r.custNo()).mobileNo().equals(c.mobileNo().trim()));
        } else if (notBlank(c.mainCategoryCode()) || notBlank(c.subCategoryCode())) {
            rows = filter(rows, r -> (!notBlank(c.mainCategoryCode())
                            || r.mainCategoryCode().equals(code(c.mainCategoryCode())))
                    && (!notBlank(c.subCategoryCode())
                            || r.subCategoryCode().equals(code(c.subCategoryCode()))));
        } else if (notBlank(c.branchCode())) {
            rows = filter(rows, r -> r.branchCode().equals(code(c.branchCode())));
        } else if (notBlank(c.firstName()) || notBlank(c.secondName()) || notBlank(c.lastName())) {
            rows = filter(rows, r -> matchesName(r, c));
        }
        // Mock scans are instant, so they are never incomplete.
        return SearchScan.complete(rows);
    }

    /** Combo values arrive as "<code>-<description>"; the code is the key. */
    private static String code(String value) {
        String t = value.trim();
        int dash = t.indexOf('-');
        return dash > 0 ? t.substring(0, dash) : t;
    }

    private static String crNoOf(String custNo) {
        return DemoData.customer(custNo).crNo();
    }

    /**
     * Name search is a case-insensitive prefix match over both scripts, which
     * is close enough to the legacy's partial-key ISGTEQ scan for a demo and
     * lets an operator type "al" and see the Al-Otaibis.
     */
    private static boolean matchesName(CustomerSummary r, CustomerSearchCriteria c) {
        DemoData.Customer cust = DemoData.customer(r.custNo());
        return startsWith(c.firstName(), cust.aFirstName(), cust.eFirstName())
                && startsWith(c.secondName(), cust.aSecondName(), cust.eSecondName())
                && startsWith(c.lastName(), cust.aLastName(), cust.eLastName());
    }

    private static boolean startsWith(String typed, String arabic, String english) {
        if (!notBlank(typed)) {
            return true;
        }
        String t = typed.trim().toLowerCase(java.util.Locale.ROOT);
        return arabic.toLowerCase(java.util.Locale.ROOT).startsWith(t)
                || english.toLowerCase(java.util.Locale.ROOT).startsWith(t);
    }

    private static List<CustomerSummary> filter(
            List<CustomerSummary> rows, java.util.function.Predicate<CustomerSummary> p) {
        return rows.stream().filter(p).toList();
    }

    private static boolean notBlank(String s) {
        return s != null && !s.isBlank();
    }

    @Override
    public List<CustUpdateHistoryEntry> updateHistory(String custNo) {
        return HISTORY;
    }

    // Values mirror the legacy frmIndividualSaudi screenshot for 0415741, so the
    // rebuilt screen can be compared against the original field for field.
    private static final Map<String, CustomerProfile> PROFILES = Map.of(
            "0415741", new CustomerProfile("0415741", "P", "01", "01", "0127", "001", "0",
                    "I", "1009326404", "القطيف", "14140128", "19930717", "14340402", "20130212",
                    "حسين", "سعيد", "عبدالوهاب", "كاظم", "كاظم حسين سعيد عبدالوهاب",
                    "Hussain", "Saeed", "Abdulwahab", "Kadem", "Kadem Hussain Saeed Abdulwahab",
                    "", "", "", "", "", "", "", "",
                    "13980117", "19771228", "M", "M", "266",
                    "المنطقة الشرقية", "البنك العربي الوطني-السويدي", "724", "صفوى", "31921", "001",
                    "6642791", "4261200", "0555877547", "hkadem@anb.com.sa", "19980704", "",
                    "0000", "01", "", "0000000000",
                    "0", "0", "1", "0",
                    "0", "", "",
                    "", "1009326404", "", "", "",
                    "01", "", "01", "", "01", "4261827", "", "37948",
                    "52551", "20060531000000", "0", "",
                    "", "", "", "", "", "", "", "0", "", "",
                    List.of(
                            new IdDocument("I", "1009326404", "القطيف", "0", "",
                                    "14140128", "19930717", "14340402", "20130212", ""),
                            new IdDocument("H", "1009326404", "القطيف", "0", "",
                                    "14140114", "19930703", "14340101", "20121115", "")),
                    new OpenUpdateInfo("19980704", "0127", "MIGRATION", "MIGRATION",
                            "20060531", "0127", "54302", "52551")),
            "0415742", new CustomerProfile("0415742", "P", "01", "02", "0001", "002", "1",
                    "Q", "1004458821", "الرياض", "14250310", "20040429", "14480515", "20261125",
                    "احمد", "خالد", "", "العتيبي", "احمد خالد العتيبي",
                    "Ahmed", "Khalid", "", "Al-Otaibi", "Ahmed K. Al-Otaibi",
                    "", "", "", "", "", "", "", "",
                    "13990505", "19790401", "M", "S", "002",
                    "OLAYA DISTRICT", "KING FAHD ROAD", "9034", "RIYADH", "11413", "002",
                    "6641150", "4614500", "0501234567", "ahmed.k@example.com", "20040502", "",
                    "0000", "01", "", "0100000000",
                    "0", "0", "0", "1",
                    "0", "", "",
                    "K1234567", "", "", "", "",
                    "01", "220", "01", "", "01", "4614501", "", "",
                    "54302", "20190812103000", "1", "V4471209",
                    "", "", "", "", "", "", "", "0", "", "",
                    List.of(
                            new IdDocument("Q", "1004458821", "الرياض", "0", "1",
                                    "14250310", "20040429", "14480515", "20261125", ""),
                            new IdDocument("P", "K1234567", "الرياض", "1", "",
                                    "14300101", "20081229", "14400101", "20181211", ""),
                            new IdDocument("V", "V4471209", "الرياض", "1", "",
                                    "14400210", "20181019", "14420210", "20200928", "")),
                    new OpenUpdateInfo("20040502", "0001", "MIGRATION", "MIGRATION",
                            "20190812", "0001", "54302", "51002")),
            "0417003", new CustomerProfile("0417003", "C", "02", "01", "0127", "001", "1",
                    "C", "4030099812", "جدة", "", "", "", "",
                    "", "", "", "", "",
                    "", "", "", "", "",
                    "مؤسسة النور التجارية", "النور", "Al Noor Trading Establishment", "Al Noor Trading Est.",
                    "4030099812", "جدة", "14150601", "19941104",
                    // dobDateH/dobDateG double as the Date of Establishment here
                    "14150601", "19941104", "", "", "049",
                    "INDUSTRIAL AREA PHASE 2", "GATE 14", "3456", "جدة", "21471", "001",
                    "", "6607744", "0567788990", "info@alnoor-trading.com", "19941120", "RM-042",
                    "0000", "", "", "0000000000",
                    "0", "0", "", "0",
                    "0", "", "",
                    "", "", "", "", "",
                    "02", "", "02", "", "02", "6607745", "", "",
                    "51002", "20120204090000", "0", "",
                    "التجارية", "Trading Establishment", "ALNOOR",
                    "Commercial trading operations and imports", "000", "100", "000",
                    "0", "L-4030-2211", "AP-330219",
                    List.of(
                            new IdDocument("C", "4030099812", "جدة", "0", "",
                                    "14150601", "19941104", "14200601", "19991011", ""),
                            new IdDocument("L", "L-4030-2211", "جدة", "0", "",
                                    "14160210", "19960707", "14260210", "20050320", ""),
                            new IdDocument("S", "SA-77120", "الرياض", "0", "",
                                    "14170401", "19970814", "14270401", "20060428", ""),
                            new IdDocument("A", "AP-330219", "جدة", "1", "",
                                    "14180505", "19980906", "14280505", "20070522",
                                    "عبدالرحمن النور")),
                    new OpenUpdateInfo("19941120", "0127", "MIGRATION", "MIGRATION",
                            "20120204", "0127", "51002", "51002")));

    /** 7-char BM customer number, zero-padded — same form the JDBC side uses. */
    private static String padCust(String custNo) {
        return DemoData.padCust(custNo);
    }

    /**
     * Mock mode is a data stand-in, so EVERY customer number resolves. The
     * three detailed fixtures return themselves; every other roster customer is
     * stamped onto whichever fixture matches its profile route (individual
     * Saudi / individual other / juristic), so the screens show that person's
     * own names, ID, branch and contact details rather than Kadem's. Anything
     * off the roster borrows the first fixture's shape under the number asked
     * for, so a made-up number stays navigable instead of 404-ing on Enquiry.
     */
    private static CustomerProfile profileFor(String custNo) {
        String padded = padCust(custNo);
        CustomerProfile known = PROFILES.get(padded);
        if (known != null) {
            return known;
        }
        DemoData.Customer c = DemoData.customer(padded);
        return stamp(template(c), c);
    }

    /** The fixture whose shape matches this customer's profile route. */
    private static CustomerProfile template(DemoData.Customer c) {
        if (c.juristic()) {
            return PROFILES.get("0417003");
        }
        return PROFILES.get("I".equals(c.idType()) ? "0415741" : "0415742");
    }

    /**
     * Copies a fixture, replacing only the fields that identify the customer.
     * Everything else — the dates, flags, memos, address lines and the ID
     * document list — is deliberately inherited, because the point is a
     * plausible screen, not a second hand-written record per customer.
     */
    private static CustomerProfile stamp(CustomerProfile t, DemoData.Customer c) {
        boolean juristic = c.juristic();
        String domain = juristic ? slug(c.shortName()) : "";
        String email = juristic
                ? "info@" + ("demo".equals(domain) ? "cust" + c.custNo() : domain) + ".com.sa"
                : slug(c.eFirstName() + "." + c.eLastName()).replace("-", ".") + "@example.com";
        return new CustomerProfile(
                c.custNo(), t.custType(), c.mainCategory(), c.subCategory(), c.branchCode(),
                t.nationality(), t.preferredLang(), c.idType(), c.idNo(), t.idIssuedAt(),
                t.idIssueDateH(), t.idIssueDateG(), t.idExpiryDateH(), t.idExpiryDateG(),
                c.aFirstName(), c.aSecondName(), c.aThirdName(), c.aLastName(),
                juristic ? "" : c.shortName(),
                c.eFirstName(), c.eSecondName(), c.eThirdName(), c.eLastName(),
                juristic ? "" : englishShortName(c),
                juristic ? c.shortName() : "", juristic ? c.shortName() : "",
                juristic ? c.shortName() : "", juristic ? c.shortName() : "",
                c.crNo(), t.crIssuedAt(), t.crIssueDateH(), t.crIssueDateG(),
                t.dobDateH(), t.dobDateG(), t.sexCode(), t.marritalStatus(), t.businessType(),
                t.address1(), t.address2(), c.poBox(), c.city(), c.zipCode(), t.country(),
                c.telNo(), t.telOffNo(), c.mobileNo(), email, c.openDate(), t.relationshipManager(),
                t.altBranchCode(), t.titleCode(), t.certificateOfBirthNo(), t.referenceReqdFor(),
                t.idDateType(), t.dobDateType(), t.noOfDependents(), t.residentStatus(),
                t.addressType(), t.gprsNo(), t.unitNo(),
                t.passportNo(), t.hafizaNo(), t.samaAuthNo(), t.familyRegnNo(), t.succDeedNo(),
                t.telOffAreaCode(), t.telOffExt(), t.telHomeAreaCode(), c.telExt(),
                t.faxAreaCode(), t.faxNo(), t.faxExt(), t.pagerNo(),
                t.lastUpdateUser(), t.lastUpdateDateTime(), t.vipCode(), t.visaNo(),
                t.aOrgName2(), t.eOrgName2(), t.orgAlphaSearchCode(), t.purposeOfAccount(),
                t.govtShareHoldingPerc(), t.saudiShareHoldingPerc(), t.foreignShareHoldingPerc(),
                t.crIssueDateType(), t.licenseNo(), t.approvalRefNo(),
                List.of(new IdDocument(c.idType(), c.idNo(), t.idIssuedAt(), t.idDateType(), "",
                        t.idIssueDateH(), t.idIssueDateG(), t.idExpiryDateH(), t.idExpiryDateG(), "")),
                new OpenUpdateInfo(c.openDate(), c.branchCode(), "MIGRATION", "MIGRATION",
                        t.openUpdate().lastUpdateDate(), c.branchCode(),
                        t.openUpdate().updateMakerId(), t.openUpdate().updateSupervisorId()));
    }

    private static String englishShortName(DemoData.Customer c) {
        return (c.eFirstName() + " " + c.eSecondName() + " " + c.eLastName())
                .replaceAll("\\s+", " ").trim();
    }

    /**
     * Latin domain slug for a demo email address. An Arabic-only company name
     * has nothing left after stripping, which produced "info@.com.sa" — so the
     * customer number is the fallback rather than an empty domain.
     */
    private static String slug(String name) {
        String s = name.toLowerCase(java.util.Locale.ROOT)
                .replaceAll("[^a-z0-9]+", "-")
                .replaceAll("(^-+|-+$)", "");
        return s.isBlank() ? "demo" : s;
    }

    @Override
    public Optional<CustomerProfile> profile(String custNo) {
        return Optional.of(profileFor(custNo));
    }

    @Override
    public Optional<CustomerProfile> profileAsOf(String custNo, String dateTime) {
        // Mock: the stcustlog snapshot differs from the live record only in
        // the mobile number and email, so the history view is visibly older.
        CustomerProfile p = profileFor(custNo);
        return Optional.of(p.withIdentity(p.custNo(), "0509990000", "old-address@example.com"));
    }

    @Override
    public Optional<JuristicAccountInfo> juristicAccountInfo(String custNo) {
        CustomerProfile p = profileFor(custNo);
        if ("01".equals(p.samaMainCategory())) {
            return Optional.empty(); // juristic customers only
        }
        return Optional.of(new JuristicAccountInfo(custNo,
                p.address1(), p.address2(), p.poBox(), p.zipCode(), p.cityName(), p.country(),
                p.telOffNo(), p.telHomeNo(), "6607745", p.mobileNo(), "", p.eMail(),
                "1", "SAR", "01 - Monthly", "1", "00 - Open",
                "0", "", "", "",
                "108 - Call Deposit", "SAR", "03 - Quarterly", "0", "00 - Open",
                "J", "1", "1", "0",
                p.relationshipManager(), "Trade licence renewed 1994", "", "0"));
    }

    // Related-party name pools. Kept small and obviously synthetic; the point is
    // that two customers never show the same heirs, not that any name is real.
    private static final List<String> ARABIC_NAMES = List.of(
            "فاطمة حسين سعيد كاظم", "سالم عبدالله المري", "خالد محمد الدوسري",
            "نورة سعيد الكاظم", "عبدالرحمن ناصر النور", "هند فهد القحطاني",
            "ماجد سلطان الحربي", "لطيفة عبدالعزيز الزهراني", "بدر خالد العنزي",
            "منى راشد الغامدي", "طارق يوسف البقمي", "أمل صالح السبيعي");

    private static final List<String> ENGLISH_NAMES = List.of(
            "Ibrahim A. Hakeem", "Faisal S. Al-Harbi", "Yousef M. Bin Salem",
            "Layla H. Al-Amoudi", "Omar T. Baeshen", "Sara N. Al-Juhani",
            "Tariq R. Al-Mutairi", "Huda K. Al-Sudairi", "Nabil W. Kassem",
            "Reem A. Al-Faisal", "Hassan D. Al-Yami", "Dana S. Al-Rashid");

    private static String partyName(String custNo, int salt, boolean arabic) {
        return DemoData.pick(custNo, salt, arabic ? ARABIC_NAMES : ENGLISH_NAMES);
    }

    /** Synthetic 10-digit national/iqama number, stable per party. */
    private static String partyId(String custNo, int salt) {
        return String.valueOf(1000000000L + DemoData.seed(custNo, salt) % 899999999L);
    }

    @Override
    public List<HeirEntry> heirs(String custNo) {
        DemoData.Customer c = DemoData.customer(custNo);
        if (c.juristic()) {
            return List.of(); // heirs are an individual-customer concept
        }
        int count = 1 + DemoData.pick(c.custNo(), 11, 3); // 1-3
        var rows = new java.util.ArrayList<HeirEntry>();
        for (int i = 0; i < count; i++) {
            boolean proxy = i % 2 == 1;
            rows.add(new HeirEntry(String.format("%03d", i + 1), proxy ? "P" : "H",
                    partyName(c.custNo(), 20 + i, true), "I", partyId(c.custNo(), 20 + i),
                    proxy ? "PRX-" + (2000 + DemoData.pick(c.custNo(), 30 + i, 900)) : "",
                    proxy ? "14290305" : "", proxy ? "20080312" : "",
                    "1", c.branchCode()));
        }
        return List.copyOf(rows);
    }

    @Override
    public List<JointHolderEntry> jointHolders(String custNo) {
        DemoData.Customer c = DemoData.customer(custNo);
        if (c.juristic()) {
            return List.of();
        }
        int count = DemoData.pick(c.custNo(), 12, 3); // 0-2, so some customers have none
        var rows = new java.util.ArrayList<JointHolderEntry>();
        for (int i = 0; i < count; i++) {
            DemoData.Customer other =
                    DemoData.CUSTOMERS.get(DemoData.pick(c.custNo(), 40 + i, DemoData.CUSTOMERS.size()));
            rows.add(new JointHolderEntry(other.custNo(), other.shortName(), other.idType(),
                    other.idNo(), "001", other.mobileNo(),
                    DemoData.dateBack(600 + DemoData.pick(c.custNo(), 50 + i, 2000)),
                    "1", c.branchCode()));
        }
        return List.copyOf(rows);
    }

    @Override
    public List<ReferenceEntry> references(String custNo) {
        DemoData.Customer c = DemoData.customer(custNo);
        int count = 1 + DemoData.pick(c.custNo(), 13, 3); // 1-3
        var rows = new java.util.ArrayList<ReferenceEntry>();
        for (int i = 0; i < count; i++) {
            boolean arabic = i % 2 == 0;
            rows.add(new ReferenceEntry(String.format("%03d", i + 1),
                    i % 2 == 0 ? "L" : "R", i % 2 == 0 ? "N" : "M",
                    partyName(c.custNo(), 60 + i, arabic), arabic ? "I" : "Q",
                    partyId(c.custNo(), 60 + i), "1", c.branchCode()));
        }
        return List.copyOf(rows);
    }

    @Override
    public List<OwnerEntry> owners(String custNo) {
        DemoData.Customer c = DemoData.customer(custNo);
        if (!c.juristic()) {
            return List.of(); // owners/management are a juristic concept
        }
        int count = 2 + DemoData.pick(c.custNo(), 14, 3); // 2-4
        var rows = new java.util.ArrayList<OwnerEntry>();
        // Shares are apportioned so the column sums to 100%, as a real
        // shareholding register would.
        int remaining = 100;
        for (int i = 0; i < count; i++) {
            int share = i == count - 1
                    ? remaining
                    : Math.max(5, Math.min(remaining - 5 * (count - i - 1),
                            10 + DemoData.pick(c.custNo(), 70 + i, 40)));
            remaining -= share;
            boolean arabic = i % 2 == 0;
            rows.add(new OwnerEntry(String.format("%03d", i + 1), i == 0 ? "O" : "M",
                    partyName(c.custNo(), 70 + i, arabic), arabic ? "I" : "Q",
                    partyId(c.custNo(), 70 + i),
                    i == 0 ? "" : c.shortName() + " Holding",
                    String.format("%03d.00", share), "1", c.branchCode()));
        }
        return List.copyOf(rows);
    }

    @Override
    public java.util.Map<String, String> acctInfo(String custNo) {
        return java.util.Map.ofEntries(
                java.util.Map.entry("education", "0003"),
                java.util.Map.entry("profession", "0006"),
                java.util.Map.entry("position", "0005"),
                java.util.Map.entry("monthlyIncome", "0003"),
                java.util.Map.entry("segmentation", "1"),
                java.util.Map.entry("employerName", "البنك العربي الوطني"),
                java.util.Map.entry("employerPoBox", "61128"),
                java.util.Map.entry("employerCity", "الرياض"),
                java.util.Map.entry("employerZipCode", "11565"),
                java.util.Map.entry("packageAcc", "0"),
                java.util.Map.entry("signatureNature", "S"),
                java.util.Map.entry("custAdviceFlag", "1"),
                java.util.Map.entry("updatedForSama", "1"),
                java.util.Map.entry("relationshipManager", ""),
                java.util.Map.entry("generalMemo", ""),
                java.util.Map.entry("marketingMemo", ""),
                java.util.Map.entry("freezingGracePeriod", "0"),
                // Account-facility rows, as the Jdbc side derives them from
                // stacclog. The "flag" slots carry "1" when a row was found —
                // the legacy screen's facility check-box. Saving is present but
                // has no cheque book; "other" carries its ledger code.
                java.util.Map.entry("currentAcFlag", "1"),
                java.util.Map.entry("currentAcCurrency", "01"),
                java.util.Map.entry("currentAcStmtFreq", "01"),
                java.util.Map.entry("currentAcChequeBook", "1"),
                java.util.Map.entry("currentAcStatus", "00"),
                java.util.Map.entry("savingAcFlag", "1"),
                java.util.Map.entry("savingAcCurrency", "01"),
                java.util.Map.entry("savingAcStmtFreq", "03"),
                java.util.Map.entry("savingAcStatus", "00"),
                java.util.Map.entry("otherAcLedger", "108"),
                java.util.Map.entry("otherAcCurrency", "01"),
                java.util.Map.entry("otherAcStmtFreq", "03"),
                java.util.Map.entry("otherAcChequeBook", "0"),
                java.util.Map.entry("otherAcStatus", "00"));
    }

    @Override
    public List<String> requiredDocuments(String custNo) {
        return List.of("001", "002", "008", "009", "025", "051", "074");
    }
}
