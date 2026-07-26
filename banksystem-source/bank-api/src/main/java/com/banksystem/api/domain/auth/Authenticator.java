package com.banksystem.api.domain.auth;

/**
 * Credential verification port. The production implementation will be an
 * LDAP bind against the bank directory (which also owns password expiry,
 * history and lockout policy); MockAuthenticator stands in until the
 * directory details are known.
 */
public interface Authenticator {

    enum AuthStatus { OK, INVALID_CREDENTIALS, ACCOUNT_LOCKED, ACCOUNT_DISABLED }

    AuthStatus authenticate(String userId, String password);
}
