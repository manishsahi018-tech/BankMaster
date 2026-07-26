package com.banksystem.api.domain.model;

/** Reference / legal representative row — stcreftab columns. */
public record ReferenceEntry(
        String referenceNo,
        String referenceType,
        String referenceReqdFor,
        String shortName,
        String idType,
        String idNo,
        String activeStatus,
        String branchCode) {
}
