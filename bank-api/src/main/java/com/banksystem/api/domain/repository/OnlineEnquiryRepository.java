package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.OnlineStatementPage;

/**
 * The two enquiries served by the ONLINE GATEWAY (legacy {@code bmrtServer}) —
 * On-demand Statement and Transaction Inquiry, the frmAccount cmdStatement and
 * cmdTransaction buttons.
 *
 * <p>Neither goes through cbcmssrv, so neither has an archival source. The
 * legacy opens a SECOND socket, to {@code onlineHostName:OnlinePort}, and
 * speaks a different envelope from every other screen — msgLen(4), checkSum,
 * branchName, Source, service, then the payload, terminated by "Z"
 * (OnlineStmt.frm formatRequest / frmTransaction.frm formatTransEnquiryRequest,
 * both driven through {@code HandleOnlineTraffic}). Service "07" is the
 * statement, "11" the transaction enquiry.
 *
 * <p>This is what DB #2 ({@code bank.online-db}) is reserved for. Until it
 * exists, {@code UnavailableOnlineEnquiryRepository} answers under the denodo
 * profile and the mock stands in for the gateway under the mock profile — the
 * same arrangement MerchantRepository has, and for the same reason: the data
 * belongs to a system we do not yet talk to.
 */
public interface OnlineEnquiryRepository {

    /**
     * On-demand Statement, service 07 — a day-ranged statement.
     *
     * @param accNo        14 chars
     * @param fromDate     YYYYMMDD
     * @param toDate       YYYYMMDD
     * @param lastTransPtr "00000" for the first page, else the previous reply's
     */
    OnlineStatementPage onDemandStatement(
            String accNo, String fromDate, String toDate, String lastTransPtr);

    /**
     * Transaction Inquiry, service 11.
     *
     * <p>There is no toDate: the legacy deliberately sends eight SPACES and
     * lets the gateway substitute its own current date, because "sometimes, PC
     * date is not set properly" (frmTransaction.frm:860-864). Passing the
     * client's today would reintroduce the bug that comment records, so the
     * parameter does not exist here either.
     *
     * @param fromDate     YYYYMMDD, or blank when starting from a transaction
     *                     number instead — the legacy clears the date controls
     *                     the moment a start transaction is typed (:343-347)
     * @param lastTransPtr "00000" for the first page. When the operator gives a
     *                     start transaction number the legacy seeds this with
     *                     that number MINUS ONE (:371-375), so the numbered
     *                     transaction is the first one returned.
     */
    OnlineStatementPage transactionEnquiry(String accNo, String fromDate, String lastTransPtr);
}
