package com.banksystem.api.domain.model;

/** Owner / management row (juristic customers) — stowntab columns. */
public record OwnerEntry(
        String ownerNo,
        String ownerType,
        String shortName,
        String idType,
        String idNo,
        String parentCompanyName,
        String shareHoldingPerc,
        String ownerEnabled,
        String branchCode) {
}
