package com.banksystem.api.domain.model;

/**
 * Card/PIN lifecycle tracking row — legacy getCardHistoryDetails, non-'1'
 * msgType (QUERY-SPECS §15). stcardlog completed records only
 * (bmUpdateStatus='9'), max 50.
 */
public record CardHistoryEntry(
        String requestType,
        String requestUserId,
        String requestDateTime,
        String cardGeneratedDate,
        String cardGeneratedTime,
        String cardGeneratedUserId,
        String cBranchReceiptDate,
        String cBranchReceiptTime,
        String cBranchReceiptUserId,
        String cCustIssueDate,
        String cCustIssueTime,
        String cCustIssueUserId,
        String pinGeneratedDate,
        String pinGeneratedTime,
        String pinGeneratedUserId,
        String pBranchReceiptDate,
        String pBranchReceiptTime,
        String pBranchReceiptUserId,
        String pCustIssueDate,
        String pCustIssueTime,
        String pCustIssueUserId,
        String supervisorId,
        String lastUpdateDateTime,
        String processDateTime,
        String rejectedUserId,
        String rejectedDate,
        String rejectedTime,
        String rejectedReason) {
}
