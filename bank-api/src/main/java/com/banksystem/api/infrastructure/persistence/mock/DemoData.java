package com.banksystem.api.infrastructure.persistence.mock;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

/**
 * The demo roster the mock repositories draw from.
 *
 * <p>Before this existed each mock held its own handful of literals, so the
 * same four accounts came back for every customer and the transaction enquiry
 * returned three rows whatever date range you asked for. Everything here hangs
 * off one customer list instead, and the per-account collections are DERIVED
 * from the account number, so any customer you navigate to has a plausible,
 * self-consistent set of accounts, cards, transactions and related parties.
 *
 * <p>Values are shaped like archival records — raw {@code YYYYMMDD} /
 * {@code YYYYMMDDHH24MISS}, amounts as plain decimal strings, codes as the
 * 2-4 char values the reference tables carry. The UI formats them.
 *
 * <p>All of it is synthetic. Names, ID numbers, CRs, card numbers and IBAN-ish
 * account numbers are invented to look right for an ANB demo; none of it
 * corresponds to a real customer, and the ID/card numbers deliberately fail a
 * real checksum so they cannot be mistaken for live data.
 *
 * <p>Generation is deterministic — every list is a pure function of its key, so
 * a demo shows the same rows on every run and across restarts.
 */
final class DemoData {

    private DemoData() {
    }

    /** Account numbers are prefix(5) + custNo(7) + subAccount(2) — the legacy
     *  reads the owning customer straight out of accNo[5..11]
     *  (cbbranch2.c:5653), and App.tsx relies on that when resolving an
     *  account number typed on the search screen. */
    static final String ACC_PREFIX = "01008";

    record Customer(
            String custNo,
            String idType,
            String idNo,
            String telNo,
            String telExt,
            String mobileNo,
            String aFirstName, String aSecondName, String aThirdName, String aLastName,
            String eFirstName, String eSecondName, String eThirdName, String eLastName,
            String shortName,
            String branchCode,
            String mainCategory,
            String subCategory,
            String crNo,
            String city,
            String poBox,
            String zipCode,
            String openDate,
            /** how many accounts this customer holds */
            int accountCount) {

        boolean juristic() {
            return !"01".equals(mainCategory);
        }

        String accNo(int index) {
            return ACC_PREFIX + custNo + String.format("%02d", index);
        }

        List<String> accountNumbers() {
            return IntStream.range(0, accountCount).mapToObj(this::accNo).toList();
        }
    }

    /**
     * Ten customers spanning the three profile routes EnquirySelect switches on:
     * main category 01 + idType "I" opens the editable Saudi profile, 01 with a
     * non-"I" idType the read-only Others profile, anything else the juristic
     * one. The first three keep their original numbers because the profile
     * fixtures, the verify skill's navigation map and the screenshots all
     * reference them.
     */
    static final List<Customer> CUSTOMERS = List.of(
            new Customer("0415741", "I", "1009326404", "6642791", "", "0555877547",
                    "حسين", "سعيد", "عبدالوهاب", "كاظم",
                    "Hussain", "Saeed", "Abdulwahab", "Kadem",
                    "كاظم حسين سعيد عبدالوهاب", "0127", "01", "01", "",
                    "صفوى", "724", "31921", "19980704", 4),
            new Customer("0415742", "Q", "1004458821", "6641150", "24", "0533120988",
                    "", "", "", "",
                    "Ahmed", "Khalid", "", "Al-Otaibi",
                    // Sub category 04, "Expatriate with valid Iqama" — matches this
                    // fixture's Iqama ID type and routes to the Others
                    // profile. It carried "02" (Saudi with special
                    // circumstance), which getScreenSetNo sends to the SAUDI
                    // form; the old idType-based routing hid the mismatch.
                    "Ahmed K. Al-Otaibi", "0001", "01", "04", "",
                    "الرياض", "61128", "11565", "20040119", 2),
            // Sub category 10 = an establishment, which getScreenSetNo maps to
            // screen set 3 (frmJuristicMain). It used to carry "01", an
            // INDIVIDUAL sub category that the legacy rule answers '-1' for —
            // harmless while the port routed on main category alone, but it
            // would have refused to open once the real rule went in.
            new Customer("0417003", "C", "4030099812", "6607744", "", "0505512240",
                    "", "", "", "",
                    "", "", "", "",
                    "Al Noor Trading Est.", "0127", "02", "10", "4030099812",
                    "جدة", "9921", "21423", "20011115", 3),
            // The only SAUDI POST customer in the fixtures (addressType "1").
            // Every other one is a P.O. Box address, which left the whole
            // Saudi-Post branch of the profile screens unreachable in the mock
            // — and that is precisely where the unitNo and gprsNo columns were
            // being mis-read. Sub category 04 routes it to frmIndividualOthers.
            new Customer("0415743", "Q", "1006677341", "6648120", "", "0544120983",
                    "", "", "", "",
                    "Omar", "Faisal", "", "Al-Harbi",
                    "Omar F. Al-Harbi", "0127", "01", "04", "",
                    "الدمام", "", "34212", "20120311", 2),
            // Sub category 39 → screen set 5, frmJuristicDiplomats.
            new Customer("0417050", "D", "3014778220", "6601180", "", "0533771902",
                    "", "", "", "",
                    "", "", "", "",
                    "Embassy of Malaysia", "0127", "02", "39", "3014778220",
                    "الرياض", "94301", "11693", "19960212", 2),
            // Sub category 45 → screen set 6, frmJuristicNonResident.
            new Customer("0417061", "T", "7002119045", "6604412", "", "0556230118",
                    "", "", "", "",
                    "", "", "", "",
                    "Gulf Marine Contracting Co.", "0127", "02", "45", "7002119045",
                    "الخبر", "31952", "34411", "20050803", 4),
            new Customer("0418220", "I", "1023456789", "6672310", "", "0561140277",
                    "نورة", "عبدالله", "محمد", "الشمري",
                    "Noura", "Abdullah", "Mohammed", "Al-Shammari",
                    "نورة عبدالله محمد الشمري", "0003", "01", "01", "",
                    "الدمام", "31411", "31411", "20120308", 2),
            new Customer("0419134", "I", "1078451236", "6698042", "", "0544903318",
                    "فهد", "ناصر", "سعد", "القحطاني",
                    "Fahad", "Nasser", "Saad", "Al-Qahtani",
                    "فهد ناصر سعد القحطاني", "0127", "01", "01", "",
                    "الخبر", "3392", "31952", "20090621", 3),
            new Customer("0420877", "Q", "2312445678", "6612907", "11", "0598447120",
                    "", "", "", "",
                    "Rajesh", "Kumar", "", "Menon",
                    "Rajesh Kumar Menon", "0001", "01", "02", "",
                    "الرياض", "22110", "11495", "20150902", 2),
            new Customer("0421905", "Q", "2298331076", "6634418", "", "0577261034",
                    "", "", "", "",
                    "Maria", "Santos", "", "Delacruz",
                    "Maria Santos Delacruz", "0045", "01", "02", "",
                    "جدة", "14477", "21434", "20180514", 1),
            new Customer("0422640", "C", "1010234567", "6650033", "08", "0551907744",
                    "", "", "", "",
                    "", "", "", "",
                    "شركة الفيصلية للمقاولات", "0001", "02", "01", "1010234567",
                    "الرياض", "50662", "11533", "20061002", 4),
            new Customer("0423118", "C", "4030112233", "6683551", "", "0568330192",
                    "", "", "", "",
                    "", "", "", "",
                    "Gulf Marine Services Ltd.", "0127", "02", "02", "4030112233",
                    "الجبيل", "10214", "31951", "20131127", 3),
            new Customer("0424002", "I", "1055667788", "6645720", "", "0503374861",
                    "سلطان", "محمد", "علي", "العتيبي",
                    "Sultan", "Mohammed", "Ali", "Al-Otaibi",
                    "سلطان محمد علي العتيبي", "0003", "01", "01", "",
                    "مكة المكرمة", "7788", "21955", "20200216", 2));

    private static final Map<String, Customer> BY_CUST_NO =
            CUSTOMERS.stream().collect(java.util.stream.Collectors.toMap(Customer::custNo, c -> c));

    /** Pads to the 7-char stcusttab key, as the legacy does before every read. */
    static String padCust(String custNo) {
        String t = custNo == null ? "" : custNo.trim();
        return t.length() >= 7 ? t.substring(t.length() - 7) : "0".repeat(7 - t.length()) + t;
    }

    /**
     * Any customer number resolves, so a demo never dead-ends on a typo: known
     * numbers return their own record, unknown ones borrow the first fixture's
     * shape under the number that was asked for. Every other lookup here keys
     * off the same resolution, so the whole navigation stays consistent.
     */
    static Customer customer(String custNo) {
        String padded = padCust(custNo);
        Customer known = BY_CUST_NO.get(padded);
        if (known != null) {
            return known;
        }
        Customer base = CUSTOMERS.get(0);
        return new Customer(padded, base.idType(), base.idNo(), base.telNo(), base.telExt(),
                base.mobileNo(), base.aFirstName(), base.aSecondName(), base.aThirdName(),
                base.aLastName(), base.eFirstName(), base.eSecondName(), base.eThirdName(),
                base.eLastName(), base.shortName(), base.branchCode(), base.mainCategory(),
                base.subCategory(), base.crNo(), base.city(), base.poBox(), base.zipCode(),
                base.openDate(), base.accountCount());
    }

    /** The customer that owns an account, read out of accNo[5..11] like the C. */
    static Customer customerForAccount(String accNo) {
        String t = accNo == null ? "" : accNo.trim();
        String padded = t.length() >= 12 ? t.substring(5, 12) : padCust(t);
        return customer(padded);
    }

    /** Sub-account index encoded in the last two characters. */
    static int subAccount(String accNo) {
        String t = accNo == null ? "" : accNo.trim();
        if (t.length() < 2) {
            return 0;
        }
        try {
            return Integer.parseInt(t.substring(t.length() - 2));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    // ---------------------------------------------------------------------
    // Deterministic pseudo-randomness
    // ---------------------------------------------------------------------

    /**
     * A stable hash so every generated list is a pure function of its key —
     * the same account shows the same transactions on every run, which matters
     * when a demo is walked through more than once.
     *
     * <p>This AVALANCHES, and it has to. A plain {@code h * 31 + c} hash maps
     * adjacent keys to adjacent values, so sibling sub-accounts
     * (…00, …01, …02) came out with balances differing only in the last few
     * halalas — 58060.69, 58060.38, 58060.07 — which reads as obviously
     * generated. FNV-1a plus a 32-bit mix finalizer decorrelates neighbouring
     * keys, so sibling accounts look unrelated.
     */
    static int seed(String key, int salt) {
        int h = 0x811c9dc5;                       // FNV-1a offset basis
        for (int i = 0; i < key.length(); i++) {
            h = (h ^ key.charAt(i)) * 0x01000193; // FNV prime
        }
        h = (h ^ salt) * 0x01000193;
        // MurmurHash3 finalizer — spreads every input bit across the output.
        h ^= h >>> 16;
        h *= 0x85ebca6b;
        h ^= h >>> 13;
        h *= 0xc2b2ae35;
        h ^= h >>> 16;
        return h & 0x7fffffff;                    // non-negative, no Math.abs overflow
    }

    static int pick(String key, int salt, int bound) {
        return bound <= 0 ? 0 : seed(key, salt) % bound;
    }

    static <T> T pick(String key, int salt, List<T> from) {
        return from.get(pick(key, salt, from.size()));
    }

    // ---------------------------------------------------------------------
    // Calendar helpers — everything is generated relative to the demo's
    // "banking date" so the data never looks stale, and a date-range filter
    // always has something on both sides of it.
    // ---------------------------------------------------------------------

    /** Days back from today, as YYYYMMDD. */
    static String dateBack(int daysAgo) {
        return java.time.LocalDate.now().minusDays(daysAgo)
                .format(java.time.format.DateTimeFormatter.BASIC_ISO_DATE);
    }

    static String dateTimeBack(int daysAgo, int hour, int minute, int second) {
        return dateBack(daysAgo) + String.format("%02d%02d%02d", hour, minute, second);
    }

    static boolean inRange(String date, String fromDate, String toDate) {
        if (date == null || date.isBlank()) {
            return false;
        }
        boolean afterFrom = fromDate == null || fromDate.isBlank() || date.compareTo(fromDate) >= 0;
        boolean beforeTo = toDate == null || toDate.isBlank() || date.compareTo(toDate) <= 0;
        return afterFrom && beforeTo;
    }

    static String amount(int riyals, int halalas) {
        return riyals + "." + String.format("%03d", halalas);
    }

    /** Two-decimal form used by the balance columns. */
    static String amount2(long halalas) {
        return (halalas / 100) + "." + String.format("%02d", Math.abs(halalas % 100));
    }

    static List<String> repeat(String value, int times) {
        List<String> out = new ArrayList<>(times);
        for (int i = 0; i < times; i++) {
            out.add(value);
        }
        return out;
    }
}
