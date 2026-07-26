package com.banksystem.api.domain.model;

/**
 * Customer profile — stcusttab subset covering the individual (Saudi and
 * other) and juristic detail screens. custType/category codes drive the
 * legacy loadCorrespondingForm routing: mainCategory 01 = individual
 * (idType 'I' = Saudi national), otherwise juristic.
 */
public record CustomerProfile(
        String custNo,
        String custType,
        String samaMainCategory,
        String samaSubCategory,
        String branchCode,
        String nationality,
        String preferredLang,
        String idType,
        String idNo,
        String idIssuedAt,
        String idIssueDateH,
        String idIssueDateG,
        String idExpiryDateH,
        String idExpiryDateG,
        String aFirstName,
        String a2ndName,
        String a3rdName,
        String aLastName,
        String aShortName,
        String eFirstName,
        String e2ndName,
        String e3rdName,
        String eLastName,
        String eShortName,
        String aOrgName1,
        String aOrgShortName,
        String eOrgName1,
        String eOrgShortName,
        String crNo,
        String crIssuedAt,
        String crIssueDateH,
        String crIssueDateG,
        String dobDateH,
        String dobDateG,
        String sexCode,
        String marritalStatus,
        String businessType,
        String address1,
        String address2,
        String poBox,
        String cityName,
        String zipCode,
        String country,
        String telHomeNo,
        String telOffNo,
        String mobileNo,
        String eMail,
        String custOpenDate,
        String relationshipManager) {
}
