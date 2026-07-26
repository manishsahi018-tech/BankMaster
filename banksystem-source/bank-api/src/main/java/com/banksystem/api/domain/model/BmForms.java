package com.banksystem.api.domain.model;

/**
 * BankMaster &harr; "actual" number-form conversions.
 *
 * <p>Ported from the legacy cbslib helpers. Prototypes are declared in
 * {@code docs/CSD C Code/cbslib/layout.h:3528-3533}
 * ({@code actualToBmAcc/bmAccToActual/actualToBmCust/bmCustToActual/
 * bmDateToActual/bmAmtToDbl}). The source lives in {@code usr_util.c}
 * (compiled to {@code cbslib/usr_util.o}) which was archived without its
 * {@code .c}; the algorithms below were recovered by disassembling the linked
 * PA-RISC executable {@code docs/CSD C Code/cbcmssrv} (HP-UX SOM). Cited
 * virtual addresses are within that binary:
 * <ul>
 *   <li>{@code actualToBmCust}  @ 0x139efc</li>
 *   <li>{@code bmCustToActual}  @ 0x139bb4</li>
 *   <li>{@code actualToBmAcc}   @ 0x13a38c</li>
 *   <li>{@code bmAccToActual}   @ 0x13a2ac</li>
 *   <li>{@code bmDateToActual}  @ 0x139804</li>
 *   <li>{@code bmAmtToDbl}      @ 0x0ce8f4 (not ported here &mdash; see class notes)</li>
 * </ul>
 *
 * <p>Forms:
 * <pre>
 *   actual account  14 chars: branch(4)+prodDigit(1) + actualCust(7) + serial(2)
 *   BM account      13 chars: branch(4)+prodDigit(1) + bmCust(6)     + serial(2)
 *   actual customer  7 chars &harr; BM customer 6 chars
 *   BM date          6-char YYMMDD (century/sign packed) &rarr; 8-char YYYYMMDD
 * </pre>
 *
 * <p>The C converters branch on a global {@code alphaFlag}
 * ({@code cbcmssrv} data 0x400113c8): when it is zero they degrade to a raw
 * truncating {@code strncpy}; when non-zero (this bank's configuration, and
 * the behaviour the enquiry port depends on) they run the numeric/alpha
 * conversion reproduced below. Only the {@code alphaFlag != 0} path is ported.
 *
 * <p><b>Customer packing.</b> A 7-digit actual customer number is stored in
 * 6 BM chars: values &lt; 1,000,000 keep their 6 low digits ({@code %06ld},
 * dropping a leading zero); values 1,000,000..6,199,999 encode the leading two
 * digits (10..61) as a single letter ('A'..'Z' = 10..35, 'a'..'z' = 36..61)
 * followed by the last 5 digits. {@code bmCustToActual} inverts this.
 */
public final class BmForms {

    private BmForms() {
    }

    /**
     * 7-char actual customer &rarr; 6-char BM form.
     * Ported from {@code actualToBmCust} (cbcmssrv @ 0x139efc, alphaFlag!=0 path).
     */
    public static String bmCust(String custNo) {
        String c = pad(custNo, 7);
        if (!allDigits(c, 0, 6)) {          // C: isdigit() loop over the first 6 chars
            return "      ";                // non-numeric -> 6 blanks
        }
        long v = Long.parseLong(c);         // atol() of the 7-char string
        if (v < 1_000_000L) {
            return String.format("%06d", v);            // "%06ld"
        }
        if (v <= 6_199_999L) {                          // alpha-packed high customers
            int hi = Integer.parseInt(c.substring(0, 2)); // atoi() of first 2 chars (10..61)
            char letter = hi <= 35 ? (char) ('A' + (hi - 10))
                                   : (char) ('a' + (hi - 36));
            return letter + c.substring(2, 7);          // "%c%.5s" -> 6 chars
        }
        return "      ";                    // out of range -> 6 blanks
    }

    /**
     * 6-char BM customer &rarr; 7-char actual form.
     * Ported from {@code bmCustToActual} (cbcmssrv @ 0x139bb4, alphaFlag!=0 path).
     */
    public static String actualCust(String bmCustNo) {
        String s = pad(bmCustNo, 6);
        if (!allDigits(s, 1, 6)) {          // C: chars [1..5] must be digits
            return "       ";              // invalid -> 7 blanks
        }
        char c0 = s.charAt(0);
        if (isDigit(c0)) {
            return "0" + s;                 // "0%.6s" -> 7 chars
        }
        int hi;
        if (c0 >= 'A' && c0 <= 'Z') {
            hi = c0 - 'A' + 10;
        } else if (c0 >= 'a' && c0 <= 'z') {
            hi = c0 - 'a' + 36;
        } else {
            return "       ";              // invalid leading char -> 7 blanks
        }
        return String.format("%02d", hi) + s.substring(1); // "%02d%.5s" -> 7 chars
    }

    /**
     * 14-char actual account &rarr; 13-char BM form.
     * Ported from {@code actualToBmAcc} (cbcmssrv @ 0x13a38c): copies branch+prod
     * (5), converts the embedded 7-char customer via {@link #bmCust}, keeps the
     * 2-char serial: {@code "%.5s%.6s%.2s"}.
     */
    public static String bmAcc(String accNo) {
        String a = pad(accNo, 14);
        String bm = bmCust(a.substring(5, 12));
        if (bm.trim().isEmpty()) {          // C: bmCust == 6 blanks -> conversion failed
            return " ".repeat(13);
        }
        return a.substring(0, 5) + bm + a.substring(12, 14);
    }

    /**
     * 13-char BM account &rarr; 14-char actual form.
     * Ported from {@code bmAccToActual} (cbcmssrv @ 0x13a2ac): copies branch+prod
     * (5), converts the embedded 6-char customer via {@link #actualCust}, keeps
     * the 2-char serial: {@code "%.5s%.7s%.2s"}.
     */
    public static String actualAcc(String bmAccNo) {
        String b = pad(bmAccNo, 13);
        String ac = actualCust(b.substring(5, 11));
        if (ac.trim().isEmpty()) {          // C: actualCust blank -> conversion failed
            return " ".repeat(14);
        }
        return b.substring(0, 5) + ac + b.substring(11, 13);
    }

    /** Customer embedded in a 14-char actual account: accNo[5..11] (7 chars). */
    public static String custFromActualAcc(String accNo) {
        return pad(accNo, 14).substring(5, 12);
    }

    /** 6-char BM customer embedded in a 13-char BM account: accNo[5..10]. */
    public static String bmCustFromBmAcc(String bmAccNo) {
        return pad(bmAccNo, 13).substring(5, 11);
    }

    /**
     * BM-stored date &rarr; actual {@code YYYYMMDD}.
     * Ported from {@code bmDateToActual} (cbcmssrv @ 0x139804). The BM record
     * holds a 6-char {@code YYMMDD}; the century is packed into the year digits:
     * if both year chars are plain digits the date is 19xx ({@code "19%.6s"}),
     * otherwise it is 20xx and each year char is un-packed (letters carry
     * {@code +0x20}, so {@code ch-0x20} recovers the digit): {@code "20%c%c%.4s"}.
     * The C returns 8 spaces for blank/zero/short input; here that is normalised
     * to {@code ""} for the UI.
     *
     * <p>Pragmatic guard (NOT in the C): if the archival column already holds an
     * 8-digit {@code YYYYMMDD} it is returned unchanged rather than re-expanded.
     */
    public static String actualDate(String bmDate) {
        if (bmDate == null) {
            return "";
        }
        String trimmed = bmDate.trim();
        if (trimmed.length() == 8 && allDigits(trimmed, 0, 8)) {
            return trimmed;                 // archival already-expanded date
        }
        String d = bmDate.length() >= 6 ? bmDate.substring(0, 6) : bmDate; // "%.6s"
        if (d.length() < 6 || d.trim().isEmpty() || d.equals("000000")) {
            return "";                      // C: 8 blanks; normalised to ""
        }
        char y0 = d.charAt(0);
        char y1 = d.charAt(1);
        if (isDigit(y0) && isDigit(y1)) {
            return "19" + d;                // 19YYMMDD
        }
        char c0 = isDigit(y0) ? y0 : (char) (y0 - 0x20);
        char c1 = isDigit(y1) ? y1 : (char) (y1 - 0x20);
        return "20" + c0 + c1 + d.substring(2, 6); // 20YYMMDD
    }

    /**
     * BM amount string &rarr; numeric value, handling the trailing-overpunch
     * sign recovered from {@code bmAmtToDbl} (cbcmssrv @ 0x0ce8f4): a
     * negative amount stores its last byte as {@code 'P'..'Y'}
     * ({@code 'P'}=0 &hellip; {@code 'Y'}=9, i.e. digit {@code +0x20}) and
     * there is no implied decimal scaling — values are whole minor units.
     * Returns {@code null} for blank or unparsable input.
     */
    public static java.math.BigDecimal amountOrNull(String raw) {
        if (raw == null) {
            return null;
        }
        String v = raw.trim();
        if (v.isEmpty()) {
            return null;
        }
        boolean negative = false;
        char last = v.charAt(v.length() - 1);
        if (last >= 'P' && last <= 'Y') {
            v = v.substring(0, v.length() - 1) + (char) (last - 0x20);
            negative = true;
        }
        try {
            java.math.BigDecimal amount = new java.math.BigDecimal(v);
            return negative ? amount.negate() : amount;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private static boolean isDigit(char ch) {
        return ch >= '0' && ch <= '9';
    }

    private static boolean allDigits(String s, int from, int to) {
        for (int i = from; i < to; i++) {
            if (!isDigit(s.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    private static String pad(String value, int length) {
        String v = value == null ? "" : value.trim();
        if (v.length() >= length) {
            return v.substring(0, length);
        }
        return "0".repeat(length - v.length()) + v;
    }
}
