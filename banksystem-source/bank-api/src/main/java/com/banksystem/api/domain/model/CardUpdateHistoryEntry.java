package com.banksystem.api.domain.model;

/**
 * Card update history row — legacy getCardHistoryDetails msgType '1'
 * (QUERY-SPECS §15). stcardlog columns; supervisor fields blanked while
 * bmUpdateStatus is '1'/'2'.
 */
public record CardUpdateHistoryEntry(
        String branchCode,
        String userId,
        String dateTime,
        String bmUpdateStatus,
        String supervisorId,
        String lastUpdateDateTime,
        String requestType) {
}
