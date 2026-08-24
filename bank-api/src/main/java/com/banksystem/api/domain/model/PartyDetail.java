package com.banksystem.api.domain.model;

/**
 * A related party in full — one row of the Reference / Legal Representative or
 * Heirs / Proxy grid, as the legacy opens it on a DOUBLE-CLICK
 * (referenceInfoGrid_DblClick frmIndividualSaudi2.frm:2722,
 * heirInfoGrid_DblClick frmIndividualHeirs.frm:2807).
 *
 * <p>One record for both because the two panels are the same form with
 * different extras: the same name set, the same identity block, the same single
 * address, and then either the reference's type and required-for flags or the
 * heir's type and proxy. The fields the other kind does not use come back
 * empty; {@link #kind()} says which is which.
 *
 * <p>Sources, keyed as cbsama.c keys them:
 * <ul>
 *   <li>reference — stcreftab custNo + referenceNo, stidtab
 *       {@code idCategory 'R'}, staddrtab {@code addressType '02'} with
 *       {@code addressNo = referenceNo} (readReferenceTabInfo, :3400-3425)</li>
 *   <li>heir — stheirtab custNo + heirNo, stidtab {@code idCategory 'H'}
 *       (:1611/1632), staddrtab {@code addressType '05'} with
 *       {@code addressNo = heirNo} (:1792, :3687)</li>
 * </ul>
 * The idCategory letter is what separates these ID rows from the customer's own
 * 'C' documents, the owners' 'W' and the signatories' 'S'.
 */
public record PartyDetail(
        /** "reference" or "heir" — which panel this row belongs to. */
        String kind,
        String custNo,
        String partyNo,
        String partyType,
        String activeStatus,
        String disabledDate,
        String branchCode,
        // Names, both scripts.
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
        // Identity document.
        String idType,
        String idNo,
        String idIssuedAt,
        String idDateType,
        String idIssueDateH,
        String idIssueDateG,
        String idExpiryDateH,
        String idExpiryDateG,
        /** Reference only: the six packed flags the form shows as check boxes. */
        String referenceReqdFor,
        /** Heir only: proxy number and the date it was issued. */
        String proxyNo,
        String proxyDateType,
        String proxyIssueDateH,
        String proxyIssueDateG,
        OwnerDetail.Address address) {
}
