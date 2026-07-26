package com.banksystem.api.domain.model;

/**
 * BM transaction detail — legacy processBmTransDetail (QUERY-SPECS §18).
 * thd0data recType '0' header + narratives 2/3 from the recType '1'
 * continuation record.
 */
public record TransactionDetail(
        String accNo,
        String transRef,
        String custName,
        String postDate,
        String valueDate,
        String transAmt,
        String transType,
        String userId,
        String supervisorId,
        String stmtFlag,
        String narrative1,
        String narrative2,
        String narrative3) {
}
