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

    /**
     * The same detail with a different customer name — the crd0data half of
     * getCustName (cbothers.c:8210-8231), applied after the read because the
     * key it needs is a PACKED form no SQL expression produces.
     */
    public TransferDetail withCustName(String name) {
        return new TransferDetail(transRef, issueDate, valueDate, crAccNo, drAccNo,
                transCurrCode, payCurrCode, netAmt, payAmt, applicantName,
                benefName, benefAddr1, benefAddr2, benefBank, transType,
                paymentType, branchCode, name, transferPurpose, exchangeRate,
                message1);
    }
}
