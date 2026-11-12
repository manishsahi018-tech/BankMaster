package com.banksystem.api.domain.auth;

import java.util.Collection;
import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;

/**
 * Outcome of a directory bind, plus what the directory said about the operator
 * when the bind succeeded: the AD entry's {@code displayName} (so the session/UI
 * can show a real name instead of the login id) and the names of the groups the
 * account is a direct member of (its {@code memberOf}, each reduced to the
 * group's CN), which the login use case checks against the configured
 * required groups.
 *
 * <p>{@code displayName} is always non-null (empty when unknown or on a
 * non-success outcome). {@code groups} is always non-null and compares
 * case-insensitively — AD treats group names that way, so the membership test
 * must too.
 */
public record DirectoryAuthResult(DirectoryAuthOutcome outcome, String displayName, Set<String> groups) {

    /** The directory answered and refused — no name, no groups. */
    public static final DirectoryAuthResult REJECTED =
            new DirectoryAuthResult(DirectoryAuthOutcome.REJECTED, "", Set.of());

    /** The directory could not be consulted — no name, no groups. */
    public static final DirectoryAuthResult UNAVAILABLE =
            new DirectoryAuthResult(DirectoryAuthOutcome.UNAVAILABLE, "", Set.of());

    /**
     * A successful bind carrying the operator's display name (may be blank) and
     * group names (may be empty).
     */
    public static DirectoryAuthResult authenticated(String displayName, Collection<String> groups) {
        return new DirectoryAuthResult(
                DirectoryAuthOutcome.AUTHENTICATED,
                displayName == null ? "" : displayName,
                caseInsensitive(groups));
    }

    /**
     * {@code Collections.unmodifiableSet}, not {@code Set.copyOf}: copyOf hashes,
     * which would lose {@code CASE_INSENSITIVE_ORDER} and with it the
     * case-tolerant {@code contains}.
     */
    private static Set<String> caseInsensitive(Collection<String> groups) {
        Set<String> set = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        if (groups != null) {
            groups.stream()
                    .filter(g -> g != null && !g.isBlank())
                    .map(String::trim)
                    .forEach(set::add);
        }
        return Collections.unmodifiableSet(set);
    }
}
