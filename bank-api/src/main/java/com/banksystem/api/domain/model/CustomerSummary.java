package com.banksystem.api.domain.model;

/**
 * One customer-search result row — mirrors the legacy search response detail
 * (cbserver.h reqMsgSearch/resMsg, service 16) consumed by EnquirySelect.
 */
public record CustomerSummary(
        String custNo,
        String idType,
        String idNo,
        String telNo,
        String telExt,
        String firstName,
        String secondName,
        String lastName,
        String shortName,
        String branchCode,
        String mainCategoryCode,
        String subCategoryCode) {
}
