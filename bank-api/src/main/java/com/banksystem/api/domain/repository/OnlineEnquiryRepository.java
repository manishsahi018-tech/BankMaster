package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.OnlineStatementPage;

/**
 * The two enquiries served by the ONLINE GATEWAY (legacy {@code bmrtServer}) —
 * On-demand Statement and Transaction Inquiry, the frmAccount cmdStatement and
 * cmdTransaction buttons.
 *
 * <p>Neither goes through cbcmssrv. The legacy opens a SECOND socket, to
 * {@code onlineHostName:OnlinePort} (default 2006), and speaks a different
 * envelope from every other screen — msgLen(4), checkSum, branchName, Source,
 * service, then the payload, terminated by "Z" (OnlineStmt.frm formatRequest /
 * frmTransaction.frm formatTransEnquiryRequest, both driven through
 * {@code HandleOnlineTraffic}). Service "07" is the statement, "11" the
 * transaction enquiry.
 *
 * <p><b>A different socket does NOT mean a different data source.</b> The
 * server on the far end is {@code cbrt01} (docs/cbrt.h, docs/cbrt01.c — the
 * "Real Time Update process"), and both handlers are fully local ISAM reads:
 * {@code getOndemandStmt()} at cbrt01.c:545 and {@code getTransEnquiry()} at
 * :915 read gld0data (bookBal, branchCode), crd0data (name, address, language)
 * and thd0data (recType '0' rows plus the recType '1' narrative continuation).
 * Neither touches Tuxedo or the core host — {@code dealWithFingw()} lives in
 * the same file but serves only the card services. So these are DB #1
 * enquiries over the SAME thd0data as the BM transaction enquiry, and both are
 * portable to JDBC. See QUERY-SPECS.md §21.1.
 *
 * <p>{@code JdbcOnlineEnquiryRepository} implements both under the denodo
 * profile; the mock stands in under the mock profile. crd0data is still being
 * created on the Denodo side, so the JDBC implementation refuses the enquiry
 * outright while it is absent rather than showing an unnamed customer.
 */
public interface OnlineEnquiryRepository {

    /**
     * On-demand Statement, service 07 — a day-ranged statement.
     *
     * <p>Against service 11 this one is NARROWER by design: cbrt01.c:790-791 skips
     * any row with {@code statmentFlag >= '1'} ("do not print",
     * cbslib/layout.h:1583), where the transaction enquiry keeps every row.
     * That filter also governs the B/F balance — the opening balance is
     * {@code bookBal} walked back over exactly the rows that survived it, so
     * the two screens legitimately report DIFFERENT opening balances for the
     * same account and range. It is a definition, not a discrepancy.
     *
     * <p>Its reply rows are also 111 bytes, not 130: no refNo, supervisorId,
     * transCounter or statementFlag. {@code OnlineTransaction} is the union of
     * both shapes, so those four arrive blank here.
     *
     * @param accNo        14 chars
     * @param fromDate     YYYYMMDD
     * @param toDate       YYYYMMDD — required, unlike service 11: a blank one
     *                     is not substituted and fails validation as "03"
     * @param lastTransPtr "00000" for the first page, else the previous reply's
     */
    OnlineStatementPage onDemandStatement(
            String accNo, String fromDate, String toDate, String lastTransPtr);

    /**
     * Transaction Inquiry, service 11.
     *
     * <p>There is no toDate: the legacy deliberately sends eight SPACES and
     * lets the gateway substitute its own current date, because "sometimes, PC
     * date is not set properly" (frmTransaction.frm:860-864). The server side
     * of that is cbrt01.c:971-976, which is present in getTransEnquiry() and
     * ABSENT from getOndemandStmt(). Passing the client's today would
     * reintroduce the bug that comment records, so the parameter does not
     * exist here either — the substitution belongs on the server.
     *
     * <p>Returns every recType '0' row, including those the statement
     * suppresses; see {@link #onDemandStatement} for what that costs.
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
