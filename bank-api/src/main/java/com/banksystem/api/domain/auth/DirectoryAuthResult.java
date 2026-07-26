package com.banksystem.api.domain.auth;

/**
 * Outcome of a directory bind, plus the operator's display name when the bind
 * succeeded. Widening the old bare {@link DirectoryAuthOutcome} return was the
 * seam {@link DirectoryAuthenticator} always anticipated: on
 * {@link DirectoryAuthOutcome#AUTHENTICATED} the AD entry's {@code displayName}
 * rides back so the session/UI can show a real name instead of the login id.
 *
 * <p>{@code displayName} is always non-null (empty when unknown or on a
 * non-success outcome).
 */
public record DirectoryAuthResult(DirectoryAuthOutcome outcome, String displayName) {

    /** The directory answered and refused — no name. */
    public static final DirectoryAuthResult REJECTED =
            new DirectoryAuthResult(DirectoryAuthOutcome.REJECTED, "");

    /** The directory could not be consulted — no name. */
    public static final DirectoryAuthResult UNAVAILABLE =
            new DirectoryAuthResult(DirectoryAuthOutcome.UNAVAILABLE, "");

    /** A successful bind carrying the operator's display name (may be blank). */
    public static DirectoryAuthResult authenticated(String displayName) {
        return new DirectoryAuthResult(
                DirectoryAuthOutcome.AUTHENTICATED, displayName == null ? "" : displayName);
    }
}
