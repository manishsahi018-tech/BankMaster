package com.banksystem.api.domain.model;

/**
 * Stop cheque detail — legacy processStopChqDetail (QUERY-SPECS §10).
 * pyd0data point read + latest ststchqlog entry for stopChqUserId.
 */
public record StopChequeDetail(
        String accNo,
        String chequeNo,
        String amount,
        String dateStop,
        String payeeName,
        String chequeFrom,
        String stopChqUserId) {
}
