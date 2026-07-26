package com.banksystem.api.domain.model;

/** SADAD transaction history row — stsadadlog columns (QUERY-SPECS §19). */
public record SadadTransaction(
        String transDateTime,
        String branchCode,
        String tellerId,
        String companyId,
        String subscriptionNo,
        String drAccNo,
        String billAmt,
        String transRefNo,
        String valueDate,
        String transType,
        String paymentType,
        String preOrPostpaid,
        String postingStatus,
        String cashOrAcc,
        String supervisorId) {
}
