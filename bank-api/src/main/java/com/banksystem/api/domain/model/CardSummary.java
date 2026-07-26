package com.banksystem.api.domain.model;

/** Card grid row — stcardtab columns (QUERY-SPECS §13). */
public record CardSummary(
        String cardNo,
        String nameOnTheCard,
        String firstIssueDate,
        String expireDate,
        String cardStatus,
        String requestStatus,
        String pinRequestStatus,
        String coreAccNo) {
}
