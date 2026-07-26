package com.banksystem.api.domain.model;

/**
 * Customer update history row (legacy service 67, msgType 0).
 * Field names = archival table stcustlog columns.
 */
public record CustUpdateHistoryEntry(
        String branchCode,
        String userId,
        String dateTime,
        String bmUpdateStatus,
        String supervisorId,
        String lastUpdateDateTime,
        String samaMainCategory,
        String samaSubCategory) {
}
