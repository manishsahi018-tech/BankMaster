package com.banksystem.api.domain.model;

import java.util.List;

/**
 * Customer profile — stcusttab subset covering the individual (Saudi and
 * other) and juristic detail screens. custType/category codes drive the
 * legacy loadCorrespondingForm routing: mainCategory 01 = individual
 * (idType 'I' = Saudi national), otherwise juristic.
 *
 * <p>The field set mirrors what legacy service 11 returns in one response —
 * frmIndividualSaudi renders the whole screen from a single call, so this
 * record is deliberately wide rather than split across endpoints.
 *
 * <p>{@code idDocuments} (stidtab) carries the full detail for the five ID
 * rows and is preferred over the bare passportNo/hafizaNo/samaAuthNo/
 * familyRegnNo columns, which stcusttab keeps only as a fallback.
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
        String relationshipManager,
        // --- header / classification ---
        String altBranchCode,
        String titleCode,
        String certificateOfBirthNo,
        /** 10-char bitmap; positions 1-6 = blind, veiled, incompetent, minor,
         *  minor-with-special-circumstances, mentally-disabled. 7-10 unused. */
        String referenceReqdFor,
        /** "0"/blank = Hijri, else Gregorian — picks which date form shows. */
        String idDateType,
        String dobDateType,
        String noOfDependents,
        String residentStatus,
        // --- address: "1" = GPS/Saudi Post, else PO Box ---
        String addressType,
        String gprsNo,
        String unitNo,
        // --- bare ID numbers; stidtab (idDocuments) is the richer source ---
        String passportNo,
        String hafizaNo,
        String samaAuthNo,
        String familyRegnNo,
        String succDeedNo,
        // --- contact parts the legacy renders as [area][number][ext] ---
        String telOffAreaCode,
        String telOffExt,
        String telHomeAreaCode,
        String telHomeExt,
        String faxAreaCode,
        String faxNo,
        String faxExt,
        String pagerNo,
        // --- audit ---
        String lastUpdateUser,
        String lastUpdateDateTime,
        /** "1" = VIP. Hidden on the Saudi form, shown on Others. */
        String vipCode,
        /** stcusttab fallback when stidtab carries no idType='V' row — cbothers.c:3882. */
        String visaNo,
        // --- juristic (frmJuristicMain) ---
        /** The legacy Arabic org name is the pair aOrgName1 + aOrgName2. */
        String aOrgName2,
        String eOrgName2,
        String orgAlphaSearchCode,
        String purposeOfAccount,
        String govtShareHoldingPerc,
        String saudiShareHoldingPerc,
        String foreignShareHoldingPerc,
        String crIssueDateType,
        /** stcusttab fallbacks; stidtab rows 'L' and 'A' are preferred. */
        String licenseNo,
        String approvalRefNo,
        List<IdDocument> idDocuments,
        OpenUpdateInfo openUpdate) {

    /**
     * Copy with a different identity — the mock stands any customer number up
     * this way, and its history view ages the contact details through it. Kept
     * beside the component list so the two cannot drift apart.
     */
    public CustomerProfile withIdentity(String custNo, String mobileNo, String eMail) {
        return new CustomerProfile(
                custNo, custType, samaMainCategory, samaSubCategory, branchCode,
                nationality, preferredLang, idType, idNo, idIssuedAt,
                idIssueDateH, idIssueDateG, idExpiryDateH, idExpiryDateG,
                aFirstName, a2ndName, a3rdName, aLastName, aShortName,
                eFirstName, e2ndName, e3rdName, eLastName, eShortName,
                aOrgName1, aOrgShortName, eOrgName1, eOrgShortName,
                crNo, crIssuedAt, crIssueDateH, crIssueDateG,
                dobDateH, dobDateG, sexCode, marritalStatus, businessType,
                address1, address2, poBox, cityName, zipCode, country,
                telHomeNo, telOffNo, mobileNo, eMail, custOpenDate, relationshipManager,
                altBranchCode, titleCode, certificateOfBirthNo, referenceReqdFor,
                idDateType, dobDateType, noOfDependents, residentStatus,
                addressType, gprsNo, unitNo,
                passportNo, hafizaNo, samaAuthNo, familyRegnNo, succDeedNo,
                telOffAreaCode, telOffExt, telHomeAreaCode, telHomeExt,
                faxAreaCode, faxNo, faxExt, pagerNo,
                lastUpdateUser, lastUpdateDateTime, vipCode, visaNo,
                aOrgName2, eOrgName2, orgAlphaSearchCode, purposeOfAccount,
                govtShareHoldingPerc, saudiShareHoldingPerc, foreignShareHoldingPerc,
                crIssueDateType, licenseNo, approvalRefNo,
                idDocuments, openUpdate);
    }

    /** Copy carrying the stidtab / stcustlog blocks, which are read separately. */
    public CustomerProfile withRelated(List<IdDocument> docs, OpenUpdateInfo audit) {
        return new CustomerProfile(
                custNo, custType, samaMainCategory, samaSubCategory, branchCode,
                nationality, preferredLang, idType, idNo, idIssuedAt,
                idIssueDateH, idIssueDateG, idExpiryDateH, idExpiryDateG,
                aFirstName, a2ndName, a3rdName, aLastName, aShortName,
                eFirstName, e2ndName, e3rdName, eLastName, eShortName,
                aOrgName1, aOrgShortName, eOrgName1, eOrgShortName,
                crNo, crIssuedAt, crIssueDateH, crIssueDateG,
                dobDateH, dobDateG, sexCode, marritalStatus, businessType,
                address1, address2, poBox, cityName, zipCode, country,
                telHomeNo, telOffNo, mobileNo, eMail, custOpenDate, relationshipManager,
                altBranchCode, titleCode, certificateOfBirthNo, referenceReqdFor,
                idDateType, dobDateType, noOfDependents, residentStatus,
                addressType, gprsNo, unitNo,
                passportNo, hafizaNo, samaAuthNo, familyRegnNo, succDeedNo,
                telOffAreaCode, telOffExt, telHomeAreaCode, telHomeExt,
                faxAreaCode, faxNo, faxExt, pagerNo,
                lastUpdateUser, lastUpdateDateTime, vipCode, visaNo,
                aOrgName2, eOrgName2, orgAlphaSearchCode, purposeOfAccount,
                govtShareHoldingPerc, saudiShareHoldingPerc, foreignShareHoldingPerc,
                crIssueDateType, licenseNo, approvalRefNo,
                docs, audit);
    }
}
