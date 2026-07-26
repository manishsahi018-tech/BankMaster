package com.banksystem.api.domain.model;

/** Joint account holder row — stjointtab columns. */
public record JointHolderEntry(
        String jointCustNo,
        String shortName,
        String idType,
        String idNo,
        String nationality,
        String mobileNo,
        String jointOpenDate,
        String activeStatus,
        String branchCode) {
}
