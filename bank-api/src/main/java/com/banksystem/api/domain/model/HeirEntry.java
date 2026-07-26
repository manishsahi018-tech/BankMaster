package com.banksystem.api.domain.model;

/** Heir/proxy row — stheirtab columns (heirType H = heir, P = proxy). */
public record HeirEntry(
        String heirNo,
        String heirType,
        String shortName,
        String idType,
        String idNo,
        String proxyNo,
        String proxyIssueDateH,
        String proxyIssueDateG,
        String activeStatus,
        String branchCode) {
}
