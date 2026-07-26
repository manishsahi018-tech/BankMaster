package com.banksystem.api.domain.repository;

import java.util.Optional;

/**
 * The operator login record — the read model of the legacy <b>stuser</b> row
 * that {@code cblogin.c processLoginRequest} used: identity + authority + home
 * branch, plus the three credential/status fields the login ladder needs
 * ({@code password}, {@code liveStatus}, {@code lastChangeDate}). Login follows
 * the original stuser approach (no LDAP); the mock supplies these until the real
 * stuser/stctltab views are accessible, at which point the same shape is served
 * by JdbcUserProfileRepository.
 */
public interface UserProfileRepository {

    record UserProfile(
            String userId,
            String userName,
            String branchCode,
            String authorityLevel,
            String authorityLevel2,
            String langPref,
            String nameSearchAllowed,
            // --- stuser credential/status fields used by the login ladder ---
            /** stuser.password. Mock holds it in clear; the real stuser stores a
             *  crypt hash, so the DB path must hash the entered password before
             *  comparing (legacy getCryptPassword). */
            String password,
            /** stuser.liveStatus: '0' new/password-reset, '1' active, '2' locked, '3' closed. */
            String liveStatus,
            /** stuser.lastChangeDate (YYYYMMDD) for the 30-day expiry; blank = no expiry. */
            String lastChangeDate) {
    }

    /**
     * @param userId     the operator id
     * @param homeBranch the login request's operating branch — the legacy keys
     *                   nameSearchAllowed on this (cblogin.c:233), NOT the user's
     *                   own branch; blank/unknown must fail closed.
     */
    Optional<UserProfile> findByUserId(String userId, String homeBranch);
}
