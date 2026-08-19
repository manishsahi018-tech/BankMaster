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
 * <p>Note which side owns the ERROR TEXT here, because it is the opposite of
 * the online gateway. There, the reply carries a numeric code and the CLIENT
 * maps it to its own wording ({@code OnlineEnquiryService.checkStatus}). Here
 * the SERVER sends the sentence, in both languages, and the client only chooses
 * between them by user language (frmMerchantStmt.frm:421-428). So the remarks
 * are not decoration to be replaced with a tidier message of our own — they are
 * the only account anyone gets of why the acquiring system refused.
 *
 * @param status         the server's own code; {@code "000"} is success and
 *                       anything else means the statement was not produced
 * @param aRemarks       the server's Arabic explanation, shown when the
 *                       operator's language is Arabic
 * @param eRemarks       the same in English
 * @param merchantNo     the merchant this page belongs to
 * @param lines          the page's print lines, each up to 150 chars; a leading
 *                       form feed (\f) marks a page break for the printer
 * @param lastRecCount   cursor to send back as lastTransPtr for the next page
 * @param completionFlag "1" when this is the final page
 */
public record MerchantStatementPage(
        String status,
        String aRemarks,
        String eRemarks,
        String merchantNo,
        List<String> lines,
        String lastRecCount,
        String completionFlag) {

    /** The server's success code — every other value stops the enquiry. */
    public static final String SUCCESS = "000";

    public static MerchantStatementPage empty(String merchantNo) {
        return new MerchantStatementPage(SUCCESS, "", "", merchantNo, List.of(), "00000", "1");
    }

    public boolean isSuccess() {
        return SUCCESS.equals(status == null ? "" : status.trim());
    }
}
