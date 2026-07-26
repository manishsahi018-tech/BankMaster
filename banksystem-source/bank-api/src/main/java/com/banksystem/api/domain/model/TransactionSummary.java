package com.banksystem.api.domain.model;

/** BM transaction enquiry row — thd0data columns (QUERY-SPECS §18). */
public record TransactionSummary(
        String transRef,
        String postDate,
        String valueDate,
        String userId,
        String transAmt,
        String transCounter,
        String transType) {
}
