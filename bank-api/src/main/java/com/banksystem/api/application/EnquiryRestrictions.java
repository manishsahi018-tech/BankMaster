package com.banksystem.api.application;

/**
 * The master switch for the legacy's <b>access</b> restrictions — the rules
 * that refused an enquiry, or blanked its amounts, because of WHO was asking
 * rather than what they asked for.
 *
 * <p>Turned OFF: every authenticated operator may search any customer and print
 * any statement. The ported rules are kept, not deleted, because each one is a
 * transcription of a specific line of the legacy (the C server or the VB6 form)
 * and that transcription is the expensive part. Flip {@link #ENABLED} back to
 * {@code true} and all of them come back at once, together with the tests that
 * pin them.
 *
 * <p>What this switch governs, and nothing else:
 * <ul>
 *   <li><b>Balance-enquiry restriction</b> — {@code AccountService}'s per-row
 *       rule (cbbranch2.c:5867-5888), which zeroed the four money columns on an
 *       account whose branch carried {@code stctltab.balEnqRestrictedFlag} and
 *       which the client then refused to drill into. This is the one the legacy
 *       reported as "private banking" (errPrivateBankingAcc, msg 1272).</li>
 *   <li><b>Staff branch 0175</b> — the refusals in {@code StatementService}
 *       (frmHistStmt.frm:782, both the BM and PDP screens) and in
 *       {@code OnlineEnquiryService} (OnlineStmt.frm:677-690,
 *       frmTransaction.frm:410-413), which hid a staff account's statements and
 *       transactions from every branch but 0175 itself.</li>
 *   <li><b>Restricted statement branch 0176</b> — the second branch the online
 *       statement screen alone checked (OnlineStmt.frm:677-690).</li>
 * </ul>
 *
 * <p>It deliberately does NOT govern input validation (blank account, malformed
 * dates, a backwards range), the gateway's own reply codes, or the
 * deleted-account route's "this account still exists" rule — none of those turn
 * on the operator's identity, and switching them off would produce wrong or
 * empty answers rather than more permissive ones.
 */
final class EnquiryRestrictions {

    /**
     * {@code false} — no identity-based enquiry restriction is applied anywhere.
     * The only knob; there is no per-rule override on purpose.
     */
    static final boolean ENABLED = false;

    private EnquiryRestrictions() {
    }
}
