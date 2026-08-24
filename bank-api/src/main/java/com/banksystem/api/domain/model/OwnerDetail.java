package com.banksystem.api.domain.model;

/**
 * One owner / management member in full — the record the legacy opens by
 * DOUBLE-CLICKING a row on frmJuristicOwner (service 77, readOwnerTabInfo in
 * cbsama.c:2302-2450). The grid itself carries eight columns; everything else
 * on that form comes from here.
 *
 * <p>Assembled from three views, exactly as the C assembles it:
 * <ul>
 *   <li>{@code stowntab} keyed custNo + ownerNo — type, ID, share, parent
 *       company and the Arabic/English name set (the C copies 213 bytes from
 *       parentCompanyName through eShortName in one go)</li>
 *   <li>{@code stidtab} keyed custNo + idType + idNo with {@code idCategory}
 *       'W' — the owner ID bucket, which is what separates these rows from the
 *       customer's own 'C' documents</li>
 *   <li>{@code staddrtab} keyed custNo with {@code addressNo = ownerNo}: type
 *       '03' is the owner's LOCAL address, type '04' the HOME one, and both
 *       carry their own phones, fax, mobile, pager and e-mail</li>
 * </ul>
 */
public record OwnerDetail(
        String custNo,
        String ownerNo,
        String ownerType,
        String ownerEnabled,
        String branchCode,
        String shareHoldingPerc,
        String parentCompanyName,
        // Names, both scripts (stowntab).
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
        // Identity document (stidtab, idCategory 'W').
        String idType,
        String idNo,
        String idIssuedAt,
        String idDateType,
        String idIssueDateH,
        String idIssueDateG,
        String idExpiryDateH,
        String idExpiryDateG,
        // Local address, staddrtab addressType '03'.
        Address local,
        // Home address, staddrtab addressType '04'.
        Address home) {

    /** One staddrtab row as the owner form lays it out. */
    public record Address(
            String address1,
            String address2,
            String poBox,
            String cityName,
            String zipCode,
            String country,
            String addrType,
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
            String eMail) {

        public static Address empty() {
            return new Address("", "", "", "", "", "", "", "", "", "", "",
                    "", "", "", "", "", "", "", "", "");
        }
    }
}
