package com.banksystem.api.domain.model;

/** Cheque book request row. Field names = archival table stchqtab columns. */
public record ChequeBookRequest(
        String deliveryBranchCode,
        String requestUserId,
        String chequeType,
        String booksRequested,
        String reqDate,
        String requestStatus,
        String chequeNoFrom,
        String chequeNoTo) {
}
