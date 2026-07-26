package com.banksystem.api.presentation.rest;

/**
 * Login request — subset of the legacy reqMsgLogin (cbserver.h, service 00).
 * homeBranch is the operating branch the operator logs into; the legacy keys the
 * branch permission flags (e.g. nameSearchAllowed) on it, distinct from the
 * user's own registered branch. May be blank until the UI captures it — the
 * server then fails closed on those flags, like the legacy with no BD row.
 */
public record LoginRequest(String userId, String password, String homeBranch) {
}
