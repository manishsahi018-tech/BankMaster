package com.banksystem.api.domain.model;

/** SARIE transfer enquiry row — rid0data columns (QUERY-SPECS §17). */
public record TransferSummary(
        String transRef,
        String issueDate,
        String valueDate,
        String drAccNo,
        String transCurrCode,
        String netAmt,
        String payCurrCode,
        String payAmt,
        String statusFlag) {
}
