package com.banksystem.api.domain.model;

/**
 * One joint account holder in full — the panel frmIndividualJoint opens on a
 * grid DOUBLE-CLICK (jointInfoGrid_DblClick :?, fetchJointDetailInfo), and the
 * largest of the related-party panels at 56 labels, 42 text boxes and 19 option
 * buttons.
 *
 * <p>Unlike the reference, heir and owner panels this needs NO side reads:
 * stjointtab stores a joint holder as a near-complete customer record — 73
 * columns carrying the names, the identity document with both calendars, the
 * personal block, the whole address and contact set, and the employment block.
 * Everything below comes from one point read on custNo + jointCustNo.
 *
 * <p>Two column names differ from stcusttab's and are NOT typos here:
 * {@code a2ndName}/{@code a3rdName} (stcusttab says aSecondName) and
 * {@code segmenation}, which is misspelled in the view itself.
 */
public record JointHolderDetail(
        String custNo,
        String jointCustNo,
        String branchCode,
        String activeStatus,
        String jointOpenDate,
        // Names, both scripts.
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
        // Identity document.
        String idType,
        String idNo,
        String idIssuedAt,
        String idDateType,
        String idIssueDateH,
        String idIssueDateG,
        String idExpiryDateH,
        String idExpiryDateG,
        // Personal.
        String preferredLang,
        String nationality,
        String titleCode,
        String dobDateType,
        String dobDateH,
        String dobDateG,
        String sexCode,
        String vipCode,
        String marritalStatus,
        String noOfDependents,
        String residentStatus,
        String businessType,
        // Address and contact.
        String address1,
        String address2,
        String poBox,
        String cityName,
        String zipCode,
        String country,
        String addressType,
        String gprsNo,
        String unitNo,
        String telOffAreaCode,
        String telOffNo,
        String telOffExt,
        String telHomeAreaCode,
        String telHomeNo,
        String telHomeExt,
        String faxAreaCode,
        String faxNo,
        String faxExt,
        String mobileNo,
        String pagerNo,
        String eMail,
        // Employment and income.
        String educationCode,
        String professionCode,
        String positionCode,
        String monthlyIncome,
        String ownerShip,
        String segmenation,
        String employerName,
        String department,
        String employerPoBox,
        String employerCity,
        String employerZipCode) {
}
