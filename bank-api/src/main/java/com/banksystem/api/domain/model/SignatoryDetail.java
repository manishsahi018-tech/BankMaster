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
        String signatoryShortName,
        // The rest of frmJuristicSignatory's panel, all stsigntab's own columns.
        String aFirstName,
        String aSecondName,
        String aThirdName,
        String aLastName,
        String aShortName,
        String eFirstName,
        String eSecondName,
        String eThirdName,
        String eLastName,
        String eShortName,
        /** "Signature Enabled" — the panel's Yes/No pair. */
        String activeStatus,
        /** "Reasons for Disabled Signature", shown when the signature is off. */
        String reason,
        String signatureActionDate,
        String diplomaticPpNo) {
}
