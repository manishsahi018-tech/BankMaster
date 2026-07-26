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
        String dormantFlag) {
}
