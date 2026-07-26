package com.banksystem.api.domain.model;

import java.util.List;

/**
 * Blocked amount breakup — legacy getBlockingBreakup (QUERY-SPECS §16).
 * Five-source union (gld0data, aad0data, bkd0data, ccarrblk, staccblk),
 * capped at 31 rows. NOTE: bkd0data and ccarrblk are missing from the
 * archival workbook — schema gap raised with the DB team.
 */
public record BlockedAmountBreakup(
        String accNo,
        String blockedBal,
        List<BlockedAmountItem> details) {
}
