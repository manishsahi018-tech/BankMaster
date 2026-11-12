package com.banksystem.api.domain.auth;

/**
 * Port for verifying a username/password against the corporate directory (Active
 * Directory). Implemented in the infrastructure layer by
 * {@code ActiveDirectoryAuthenticator}; kept as a domain port so the login use
 * case stays free of Spring Security LDAP types and can be unit-tested with a fake.
 *
 * <p>Copied from the LoanOriginationSystem auth slice. On success it returns the
 * account's direct AD group names, which {@code AuthService} checks against
 * {@code bank.ldap.required-groups}. It returns no authority — BankMaster grants a
 * fixed admin authority for now; the groups are the seam for a real
 * group-to-authority mapping when one arrives.
 */
public interface DirectoryAuthenticator {

    /**
     * True when a directory is configured and should be consulted. False on
     * machines with no domain (local dev, offline PC), where login falls through
     * to the local credential store.
     */
    boolean isEnabled();

    /**
     * Attempts a bind as {@code username} with {@code password}. Never throws —
     * transport and configuration failures surface as
     * {@link DirectoryAuthOutcome#UNAVAILABLE}. On success the result also carries
     * the directory {@code displayName} for the session/UI and the account's direct
     * group memberships (group CNs).
     *
     * <p>{@code username} may be bare ({@code alice}), domain-qualified
     * ({@code ANB\alice}) or a UPN ({@code alice@anb.com.sa}); implementations
     * normalise it.
     */
    DirectoryAuthResult authenticate(String username, String password);

    /**
     * Whether an {@link DirectoryAuthOutcome#UNAVAILABLE} result may fall back to
     * the local credential store. Policy lives with the implementation because the
     * switch is a deployment concern, not a domain rule.
     */
    boolean allowLocalFallbackWhenUnavailable();
}
