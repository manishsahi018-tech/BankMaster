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

    /**
     * The same detail with a different customer name — the crd0data half of
     * getCustName (cbothers.c:8210-8231), applied after the read because the
     * key it needs is a PACKED form no SQL expression produces.
     */
    public TransactionDetail withCustName(String name) {
        return new TransactionDetail(accNo, transRef, name, postDate, valueDate,
                transAmt, transType, userId, supervisorId, stmtFlag,
                narrative1, narrative2, narrative3);
    }
}
