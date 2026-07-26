package com.banksystem.api.domain.model;

/**
 * Standing order detail — legacy processStdOrdDetail (QUERY-SPECS §11).
 * sod0data joined with gld0data (custBranchCode), stcusttab (payeeCustName)
 * and the latest stsodlog row; pending = any stsodlog row with
 * bmUpdateStatus in ('1','2').
 */
public record StandingOrderDetail(
        String accNo,
        String sodNo,
        String orderType,
        String paymentType,
        String paymentMode,
        String paymentFrequency,
        String firstPaymentDate,
        String nextPaymentDate,
        String finalPaymentDate,
        String lastProcessedDate,
        String paymentsToBeMade,
        String paymentsMade,
        String limitInExcessFlag,
        String commissionFlag,
        String processNextDayFlag,
        String thresholdAmt,
        String paymentAmt,
        String totalPaidToDate,
        String totalToPay,
        String payAccNo,
        String payeeCustName,
        String drNarrative1,
        String drNarrative2,
        String crNarrative1,
        String crNarrative2,
        String transactionDateFlag,
        String branchCode,
        String remarks,
        String custBranchCode,
        String lastUpdateUserId,
        String lastUpdateDate,
        boolean pending) {
}
