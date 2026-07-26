package com.banksystem.api.domain.repository;

import java.util.Optional;

/**
 * Operator profile — the app-side attributes that survive the move to LDAP
 * authentication: authority codes (legacy stuser authorityLevel +
 * authorityLevel2), home branch and language. Whether this maps from LDAP
 * groups/attributes or a profile table is still open; the mock keeps the
 * shape stable either way.
 */
public interface UserProfileRepository {

    record UserProfile(
            String userId,
            String userName,
            String branchCode,
            String authorityLevel,
            String authorityLevel2,
            String langPref,
            String nameSearchAllowed) {
    }

    Optional<UserProfile> findByUserId(String userId);
}
