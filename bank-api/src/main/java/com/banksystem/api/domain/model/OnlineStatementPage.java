package com.banksystem.api.domain.model;

import java.util.List;

/**
 * One page of an online-gateway reply — shared by On-demand Statement
 * (service 07) and Transaction Inquiry (service 11), which return the same
 * shape and differ only in what the caller does with it.
 *
 * <p>Paging is the gateway's, not ours: the caller re-sends with
 * {@code lastTransPtr} while {@code completionFlag} is not "1", exactly as
 * OnlineStmt.frm generateReport and frmTransaction.frm cmdGo_Click both loop.
 *
 * @param responseStatus the gateway's own status. "00" and "01" are success;
 *                       the legacy maps 03/05/06/08/12 to distinct messages
 *                       (OnlineStmt.frm:662-674) and those are reproduced in
 *                       OnlineEnquiryService.
 * @param decimalPlace   "1"/"2"/"3" — how many decimals the currency carries.
 *                       The legacy turns this into coinDenomination and DIVIDES
 *                       every amount by it before display, so amounts arrive in
 *                       MINOR units and are meaningless without it.
 * @param bfBalance      balance brought forward, in minor units. The running
 *                       balance down the statement starts here.
 */
public record OnlineStatementPage(
        String responseStatus,
        String accNo,
        String custName,
        String address,
        String branchCode,
        String branchName,
        String langCode,
        String decimalPlace,
        String bfBalance,
        String fromDate,
        String toDate,
        List<OnlineTransaction> transactions,
        String lastTransPtr,
        String completionFlag) {
}
