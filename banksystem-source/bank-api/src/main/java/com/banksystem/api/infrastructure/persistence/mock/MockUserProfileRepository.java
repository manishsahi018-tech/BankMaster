package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.repository.UserProfileRepository;
import java.util.Map;
import java.util.Optional;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

/**
 * Authority strings follow legacy formatAuthLevel (globalFunctions.bas):
 * each 2-digit stuser role code wrapped as ~xx~, e.g. "~00~41~60~".
 * Single-digit gates in the UI are family matches (~4 hits ~41/~42/~45).
 * Fixture users exercise the gating spread: DEVUSER everything, OPER1 a
 * typical branch operator, ENQ1 enquiry-only, MERCH1 merchant-only,
 * NOAUTH1 fails the legacy "insufficient privileges" login gate.
 */
@Profile("!denodo")
@Repository
public class MockUserProfileRepository implements UserProfileRepository {

    private static final Map<String, UserProfile> PROFILES = Map.of(
            "DEVUSER", new UserProfile("DEVUSER", "DEV USER", "0001",
                    "~00~01~02~32~41~42~45~60~61~62~", "~81~87~94~", "1", "1"),
            "OPER1", new UserProfile("OPER1", "BRANCH OPERATOR", "0001",
                    "~00~32~41~60~87~", "", "1", "1"),
            "ENQ1", new UserProfile("ENQ1", "ENQUIRY USER", "0001",
                    "~99~", "", "1", "0"),
            "MERCH1", new UserProfile("MERCH1", "MERCHANT USER", "0001",
                    "~81~", "", "1", "0"),
            "NOAUTH1", new UserProfile("NOAUTH1", "UNAUTHORISED USER", "0001",
                    "~50~", "", "1", "0"));

    @Override
    public Optional<UserProfile> findByUserId(String userId) {
        return Optional.ofNullable(PROFILES.get(userId));
    }
}
