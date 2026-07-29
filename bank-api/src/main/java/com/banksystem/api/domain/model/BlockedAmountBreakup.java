package com.banksystem.api.domain.model;

import java.util.List;

/**
 * Blocked amount breakup — legacy getBlockingBreakup (QUERY-SPECS §16).
 * Five-source union (gld0data, aad0data, bkd0data, ccarrblk, staccblk),
 * capped at 31 rows. NOTE: bkd0data and ccarrblk are missing from the
 * archival workbook — schema gap raised with the DB team.
 *
 * <p>{@code blockedBal} is the gld0data header total and is read INDEPENDENTLY
 * of the detail rows, so the two can legitimately disagree: a source view may
 * be absent (bkd0data / ccarrblk), a source query may fail at runtime, or the
 * 31-row cap may truncate. Without {@code unavailableSources} / {@code
 * truncated} the screen showed a total larger than the rows it listed and gave
 * no reason for it, which reads as wrong data rather than as partial data.
 * Both fields let the UI say which it is.
 *
 * @param unavailableSources legacy view names whose query failed, in the order
 *                           they were attempted; empty when every source ran
 * @param truncated          true when the 31-row cap stopped further rows
 */
public record BlockedAmountBreakup(
        String accNo,
        String blockedBal,
        List<BlockedAmountItem> details,
        List<String> unavailableSources,
        boolean truncated) {

    /** Every source contributed and nothing was capped. */
    public static BlockedAmountBreakup complete(
            String accNo, String blockedBal, List<BlockedAmountItem> details) {
        return new BlockedAmountBreakup(accNo, blockedBal, details, List.of(), false);
    }
}
