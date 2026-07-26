package com.banksystem.api.domain.model;

import java.util.List;

/**
 * Card grid response — legacy processCardSearchRequest (QUERY-SPECS §13).
 * Card rows are local (stcardtab); the customer header came from the
 * Finacle gateway services 04/05 in legacy → DB #2 in the revamp.
 */
public record CardSearchResult(
        String custNo,
        String shortName,
        String address1,
        String poBox,
        String cityName,
        String zipCode,
        String custBranchCode,
        String custType,
        String customerLang,
        List<CardSummary> rows,
        boolean hasMore) {
}
