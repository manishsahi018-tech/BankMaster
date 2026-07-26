package com.banksystem.api.domain.model;

/**
 * SARIE/SWIFT transfer detail — legacy processTransferDetail
 * (QUERY-SPECS §17). Core subset; the legacy response recycles several
 * rid0data fields under misleading names (applicantName is stored in
 * totAmt, benefAddr1 in pensionerName) — see the spec for the full list.
 */
public record TransferDetail(
        String transRef,
        String issueDate,
        String valueDate,
        String crAccNo,
        String drAccNo,
        String transCurrCode,
        String payCurrCode,
        String netAmt,
        String payAmt,
        String applicantName,
        String benefName,
        String benefAddr1,
        String benefAddr2,
        String benefBank,
        String transType,
        String paymentType,
        String branchCode,
        String custName,
        String transferPurpose,
        String exchangeRate,
        String message1) {
}
