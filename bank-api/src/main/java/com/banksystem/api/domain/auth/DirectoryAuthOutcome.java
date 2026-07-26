package com.banksystem.api.domain.auth;

/**
 * Result of a directory (Active Directory / LDAP) bind attempt.
 *
 * <p>The distinction between {@link #REJECTED} and {@link #UNAVAILABLE} is
 * security-critical, which is why this is a three-state enum and not a boolean.
 * Falling back to the local {@code stuser}/mock credential store is legitimate
 * when the directory could not be reached (a machine with no domain — local dev,
 * an offline PC), but falling back after the directory has actively said "wrong
 * password" would let anyone with a stale local password walk past AD. Only
 * {@link #UNAVAILABLE} may fall back; {@link #REJECTED} is final.
 *
 * <p>Copied from the LoanOriginationSystem auth slice (DirectoryAuthOutcome).
 */
public enum DirectoryAuthOutcome {

    /** The directory accepted the bind — the credentials are valid. */
    AUTHENTICATED,

    /**
     * The directory answered and refused: unknown user, wrong password,
     * disabled/locked/expired account. Authoritative — never fall back.
     */
    REJECTED,

    /**
     * The directory could not be consulted at all — host unreachable, TLS
     * failure, timeout, misconfiguration. Says nothing about the credentials, so
     * a local fallback is permissible when policy allows it.
     */
    UNAVAILABLE
}
