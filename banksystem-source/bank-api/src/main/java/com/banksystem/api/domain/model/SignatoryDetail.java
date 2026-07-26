package com.banksystem.api.domain.model;

/**
 * Signatory detail — legacy readSignTabInfo (QUERY-SPECS §20).
 * stsigntab point read joined to stidtab (idCategory 'S') for ID dates.
 */
public record SignatoryDetail(
        String accNo,
        String signatoryNo,
        String custBranchCode,
        String idType,
        String idNo,
        String idDateType,
        String idIssuedAt,
        String idIssueDateH,
        String idIssueDateG,
        String idExpiryDateH,
        String idExpiryDateG,
        String signatoryShortName) {
}
