package com.banksystem.api.domain.model;

/**
 * One transaction line of an archived statement — a row of STMT_TXN or
 * PDP_STMT_TXN (DB #3).
 *
 * <p>These are NOT archival BM values and must not be run through
 * {@link BmForms}: CR_AMT/DR_AMT/RUN_BAL are Oracle {@code NUMBER(30,3)} and
 * carry a real sign, not the trailing overpunch the BM files use, and
 * TXN_DATE/VALUE_DATE are real {@code DATE} columns rather than packed BM
 * dates. Amounts are therefore passed through as plain decimal strings and
 * dates normalised to YYYYMMDD for the client's existing date renderer.
 *
 * @param runBalType RUN_BAL_TYPE, 2 chars — the sign/side marker the printed
 *                   statement showed beside the running balance. Carried
 *                   verbatim; the legacy never interpreted it either, because
 *                   the page arrived already rendered.
 */
public record HistoricalStatementLine(
        String txnOrder,
        String txnBranchCode,
        String txnDate,
        String valueDate,
        String narrative1,
        String narrative2,
        String narrative3,
        String narrative4,
        String crAmt,
        String drAmt,
        String runBal,
        String runBalType) {
}
