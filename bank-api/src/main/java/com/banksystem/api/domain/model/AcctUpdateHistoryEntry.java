package com.banksystem.api.domain.model;

/** Account update history row. Field names = archival table stacclog columns. */
public record AcctUpdateHistoryEntry(
        String branchCode,
        String userId,
        String dateTime,
        String bmUpdateStatus,
        String supervisorId,
        String lastUpdateDateTime) {
}
