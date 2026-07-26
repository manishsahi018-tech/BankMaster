package com.banksystem.api.domain.model;

/**
 * One blocked-amount breakup row. productType: B=BM loan, F=FINNONE loan,
 * O=other BM blocking, M=manual card block, C=auto card-arrear block,
 * A=manual account block (QUERY-SPECS §16).
 */
public record BlockedAmountItem(
        String productType,
        String productNo,
        String blockedAmt,
        String userIdBlocked) {
}
