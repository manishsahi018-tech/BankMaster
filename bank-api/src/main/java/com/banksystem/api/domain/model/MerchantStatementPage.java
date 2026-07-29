package com.banksystem.api.domain.model;

import java.util.List;

/**
 * One page of a merchant statement, mirroring the reply the legacy's merchant
 * server sends (frmMerchantStmt.frm parseMerchStmtMessage):
 *
 * <pre>
 *   status(3) service(2) aRemarks(50) eRemarks(50) lastRecCount(5)
 *   noOfRecs(2) merchNo(16) completionFlag(1) filler(10) then noOfRecs x 150
 * </pre>
 *
 * <p>The rows are pre-rendered 150-character print lines, not structured
 * records — the acquiring/POS system does the formatting, pagination and
 * totalling, and the client only spools what it is given. {@code lines} is
 * therefore a list of strings and nothing here parses them.
 *
 * @param merchantNo     the merchant this page belongs to
 * @param lines          the page's print lines, each up to 150 chars; a leading
 *                       form feed (\f) marks a page break for the printer
 * @param lastRecCount   cursor to send back as lastTransPtr for the next page
 * @param completionFlag "1" when this is the final page
 */
public record MerchantStatementPage(
        String merchantNo,
        List<String> lines,
        String lastRecCount,
        String completionFlag) {

    public static MerchantStatementPage empty(String merchantNo) {
        return new MerchantStatementPage(merchantNo, List.of(), "00000", "1");
    }
}
