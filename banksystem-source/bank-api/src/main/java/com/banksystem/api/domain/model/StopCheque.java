package com.banksystem.api.domain.model;

/**
 * Stopped cheque / stop payment row. Field names = archival table pyd0data
 * columns (recType CH = stopped cheque, SP = stop payment).
 */
public record StopCheque(
        String chequeNo,
        String amount,
        String dateStop,
        String payeeName,
        String chequeFrom) {
}
