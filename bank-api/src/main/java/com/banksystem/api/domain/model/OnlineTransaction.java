package com.banksystem.api.domain.model;

/**
 * One transaction as the ONLINE GATEWAY returns it — the {@code transDetails}
 * array of the service 07 / 11 replies (OnlineStmt.frm generateReport,
 * frmTransaction.frm loadLocalDb).
 *
 * <p>Not a BM archival record and not a DB #3 statement line. The gateway
 * speaks its own envelope (checkSum / branchName / Source / EOT) and its own
 * encodings, so nothing here goes through {@link BmForms}.
 *
 * @param transAmt the amount EXACTLY as the gateway sends it: a signed decimal
 *                 string whose leading character is the side. The legacy tests
 *                 {@code Mid$(transAmt, 1, 1) = "+"} for credit and treats
 *                 everything else as debit, then takes {@code Abs()} for
 *                 display — so the sign is the Dr/Cr flag, not part of the
 *                 magnitude. Kept unsplit so that rule stays in one place.
 * @param stmtFlag statement flag; {@code > "1"} marks a reversal, the same
 *                 convention thd0data uses for the archival enquiry.
 */
public record OnlineTransaction(
        String userId,
        String postDate,
        String valueDate,
        String transType,
        String transAmt,
        String narrative1,
        String narrative2,
        String narrative3,
        String referenceNo,
        String supervisorId,
        String transCounter,
        String stmtFlag) {
}
