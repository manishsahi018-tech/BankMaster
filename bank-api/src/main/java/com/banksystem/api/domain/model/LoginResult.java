package com.banksystem.api.domain.model;

/**
 * Login outcome. Status codes are the legacy resMsgLogin values the VB6 client
 * knew (cblogin.c / cbserver.h) so UI messages stay faithful:
 * 000 success, 101 new user / password reset, 102 unknown user,
 * 103 invalid password, 104 account locked, 105 account closed,
 * 107 password expired. The original stuser-based ladder (password + liveStatus
 * + 30-day expiry) is reproduced in AuthService — not delegated to LDAP.
 * status "000" carries the session; every other status only the message.
 */
public record LoginResult(
        String status,
        String message,
        SessionInfo session,
        String token) {

    public static LoginResult failure(String status, String message) {
        return new LoginResult(status, message, null, null);
    }

    /** Copy of a successful result with the issued JWT attached. */
    public LoginResult withToken(String token) {
        return new LoginResult(status, message, session, token);
    }
}
