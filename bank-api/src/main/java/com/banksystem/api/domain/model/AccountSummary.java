package com.banksystem.api.domain.model;

/**
 * Account grid row — legacy account search response (service 21,
 * reqMsgAccSearch) backed by the online source (Finacle gateway in legacy).
 */
public record AccountSummary(
        String accountNumber,
        String bookBalance,
        String clearedBalance,
        String blockedBalance,
        String accountStatus,
        String creditLimit,
        String dormantFlag,
        /** gld0data.branchCode — the account's branch (cbbranch2.c:5865). */
        String branchCode,
        /**
         * "1" when this operator may not see the balance (cbbranch2.c:5867-5888).
         * Per row, because the rule keys on the account's own branch.
         */
        String balEnqRestricted) {
}
