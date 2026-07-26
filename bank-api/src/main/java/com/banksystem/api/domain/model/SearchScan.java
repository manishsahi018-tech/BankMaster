package com.banksystem.api.domain.model;

import java.util.List;

/**
 * The result of a customer-search scan: the rows read, and whether the scan
 * ran out of time before it finished.
 *
 * <p>The legacy imposes NO row limit on a search — its only row-count guard is
 * commented out (cbbranch.c:1735-1740). What it has instead is a clock:
 * processSearchRequest arms {@code alarm(searchTimeOut)} before the scan
 * (:1728-1730, SEARCHTIME=30 in cbcmssrv.cfg), the handler sets
 * {@code searchTimeoutFlag} (:909), and the read loop checks it once per row
 * (:1742). On expiry the C flushes the rows it already has, sets
 * {@code incompleteFlag = '1'} and returns SUCCESS (:1746-1755) — a partial
 * answer the operator is told about, never a silent truncation.
 */
public record SearchScan<T>(List<T> rows, boolean incomplete) {

    public static <T> SearchScan<T> complete(List<T> rows) {
        return new SearchScan<>(rows, false);
    }
}
