package com.banksystem.api.domain.model;

/** Signatory list row — stsigntab columns (QUERY-SPECS §20). */
public record SignatorySummary(
        String accNo,
        String signatoryNo,
        String idType,
        String idNo,
        String branchCode,
        String signatoryShortName) {
}
