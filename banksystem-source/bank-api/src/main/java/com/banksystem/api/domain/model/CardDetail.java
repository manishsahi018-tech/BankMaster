package com.banksystem.api.domain.model;

/**
 * Card maintenance detail — legacy processCardDetailRequest (QUERY-SPECS §14).
 * Point read on stcardtab; custName/custCategory from the customer source.
 * newOrUpdate: requestType '0' → 'N' else 'U'.
 */
public record CardDetail(
        String cardNo,
        String custNo,
        String custName,
        String custCategory,
        String requestStatus,
        String deliveryBranchCode,
        String cardType,
        String nameOnTheCard,
        String bmAccNo,
        String coreAccNo,
        String sequenceNo,
        String newOrUpdate) {
}
