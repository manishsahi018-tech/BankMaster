package com.banksystem.api.domain.model;

import java.util.List;

/**
 * One archived statement — a STMT_HDR (BM) or PDP_STMT_HDR header with its
 * STMT_TXN / PDP_STMT_TXN lines attached (DB #3).
 *
 * <p>This is the relational replacement for what the legacy Historical
 * Statement screen produced. There, one "statement" was a pre-rendered text
 * file: frmHistStmt.processStmt read a Btrieve index record
 * ({@code stmtSpec}: accNo, lang, stmtFile, zipFileNo), unzipped the page file
 * it named, language-fixed it and merged it into a print spool. Nothing was
 * ever parsed into fields. The header columns that look odd here —
 * {@code fileName}, {@code pageNum}, {@code langCode} — are that lineage:
 * they are what {@code stmtSpec.stmtFile}, the page structure and
 * {@code stmtSpec.lang} became once the archive went relational.
 *
 * <p>The two table pairs differ in which identity fields they carry, so the
 * fields only one of them has are empty on the other:
 * <ul>
 *   <li>BM only — {@code stmtNum}, {@code iban}, {@code refNum}, and a
 *       single CUST_NAME</li>
 *   <li>PDP only — {@code custNum}, {@code pageNum}, {@code branchData}, and a
 *       name split across TITLE / FIRST_NAME / SECOND_NAME (joined into
 *       {@code custName} here)</li>
 * </ul>
 *
 * @param source which pair the row came from: {@code "BM"} or {@code "PDP"} —
 *               the system the operator selected on the screen. Echoed back
 *               rather than assumed by the client because nothing in the legacy
 *               source says what separates the two archives, so a printed sheet
 *               has to say which one produced it. See
 *               {@code JdbcStatementRepository} for how the pairing was
 *               derived — it is an inference from the keys, not a documented
 *               fact.
 * @param pageCount how many header rows shared this (stmtDate, stmtNum). The
 *               PDP header carries PAGE_NUM, so it may hold one row per
 *               printed page; the lowest-numbered page supplies the header
 *               fields above and this records how many there were.
 */
public record HistoricalStatement(
        String source,
        String acctNum,
        String stmtDate,
        String stmtNum,
        String branchCode,
        String branchName,
        String acctType,
        String custNum,
        String custName,
        String custAdr1,
        String custAdr2,
        String custAdr3,
        String custAdr4,
        String crncy,
        String iban,
        String refNum,
        String langCode,
        String pageNum,
        int pageCount,
        String branchData,
        String fileName,
        List<HistoricalStatementLine> lines) {
}
