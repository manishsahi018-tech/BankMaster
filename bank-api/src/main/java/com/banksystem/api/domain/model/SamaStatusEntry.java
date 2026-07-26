package com.banksystem.api.domain.model;

/**
 * SAMA account status history row — legacy service 57, requestType 1
 * (getAcctStatusHistory in cbothers.c). Reads archival table stacclog
 * (fromSamaAccStatus/toSamaAccStatus), NOT stsamaacc. See QUERY-SPECS.md §8.
 */
public record SamaStatusEntry(
        String dateTime,
        String userId,
        String supervisorId,
        String lastUpdateDateTime,
        String fromStatus,
        String toStatus,
        String accStatusChangeReason) {
}
