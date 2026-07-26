package com.banksystem.api.domain.model;

/**
 * Login outcome. Status codes reuse the legacy resMsgLogin values the VB6
 * client knew (cblogin.c) so UI messages stay faithful: 000 success,
 * 102 unknown user / no profile, 103 invalid credentials, 104 account
 * locked, 105 account disabled. Password lifecycle (expiry, history,
 * lockout policy) is owned by the directory (LDAP), not this API.
 * status "000" carries the session; every other status only the message.
 */
public record LoginResult(
        String status,
        String message,
        SessionInfo session) {

    public static LoginResult failure(String status, String message) {
        return new LoginResult(status, message, null);
    }
}
