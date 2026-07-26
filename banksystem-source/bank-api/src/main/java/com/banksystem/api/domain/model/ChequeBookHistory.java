package com.banksystem.api.domain.model;

/**
 * Cheque book lifecycle history — legacy getChequeBookHistoryDetails
 * (QUERY-SPECS §12). One stchqtab record's audit trail.
 */
public record ChequeBookHistory(
        String accNo,
        String requestDateTime,
        String requestUserId,
        String producedDate,
        String producedTime,
        String producedUserId,
        String recdByBranchDate,
        String recdByBranchTime,
        String recdByBranchUserId,
        String issuedToCustDate,
        String issuedToCustTime,
        String issuedToCustUserId,
        String rejectedDate,
        String rejectedTime,
        String rejectedUserId,
        String rejectedReason) {
}
