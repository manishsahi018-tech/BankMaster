package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.repository.UserProfileRepository;
import java.util.Map;
import java.util.Optional;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

/**
 * In-memory stand-in for the legacy <b>stuser</b> table, so login runs the
 * original cblogin.c ladder (password + liveStatus + expiry) against fixtures
 * until the real stuser view is accessible. Every demo user's password is
 * {@code Passw0rd}.
 *
 * <p>Authority strings follow legacy formatAuthLevel (globalFunctions.bas):
 * each 2-digit stuser role code wrapped as ~xx~, e.g. "~00~41~60~"; single-digit
 * UI gates are family matches (~4 hits ~41/~42/~45). Fixtures exercise both the
 * authority spread and every login outcome:
 * <ul>
 *   <li>DEVUSER everything, OPER1 branch operator, ENQ1 enquiry-only (~99 =
 *       expiry-exempt system user), MERCH1 merchant-only, NOAUTH1 no privileges</li>
 *   <li>LOCKED1 (104), CLOSED1 (105), NEWUSER1 (101 reset), EXPIRED1 (107)</li>
 * </ul>
 * Active users carry a blank lastChangeDate (no expiry); EXPIRED1 carries an old
 * one to force the 30-day check.
 */
// Login is a directory/stuser concern, not archival data: it stays on these
// fixtures in EVERY profile (including denodo) until the real stuser/stctltab
// views are accessible. Opt into the DB-backed profile (JdbcUserProfileRepository)
// via the "db-userprofile" profile once that source is ready.
@Profile("!db-userprofile")
@Repository
public class MockUserProfileRepository implements UserProfileRepository {

    private static final String PW = "Passw0rd";

    private static final Map<String, UserProfile> PROFILES = Map.ofEntries(
            Map.entry("DEVUSER", new UserProfile("DEVUSER", "DEV USER", "0001",
                    "~00~01~02~32~41~42~45~60~61~62~", "~81~87~94~", "1", "1", PW, "1", "")),
            Map.entry("OPER1", new UserProfile("OPER1", "BRANCH OPERATOR", "0001",
                    "~00~32~41~60~87~", "", "1", "1", PW, "1", "")),
            Map.entry("ENQ1", new UserProfile("ENQ1", "ENQUIRY USER", "0001",
                    "~99~", "", "1", "0", PW, "1", "")),
            Map.entry("MERCH1", new UserProfile("MERCH1", "MERCHANT USER", "0001",
                    "~81~", "", "1", "0", PW, "1", "")),
            Map.entry("NOAUTH1", new UserProfile("NOAUTH1", "UNAUTHORISED USER", "0001",
                    "~50~", "", "1", "0", PW, "1", "")),
            Map.entry("LOCKED1", new UserProfile("LOCKED1", "LOCKED USER", "0001",
                    "~32~", "", "1", "0", PW, "2", "")),
            Map.entry("CLOSED1", new UserProfile("CLOSED1", "CLOSED USER", "0001",
                    "~32~", "", "1", "0", PW, "3", "")),
            Map.entry("NEWUSER1", new UserProfile("NEWUSER1", "NEW USER", "0001",
                    "~32~", "", "1", "0", PW, "0", "")),
            Map.entry("EXPIRED1", new UserProfile("EXPIRED1", "EXPIRED PW USER", "0001",
                    "~32~", "", "1", "0", PW, "1", "20240101")));

    @Override
    public Optional<UserProfile> findByUserId(String userId, String homeBranch) {
        // Stand-in directory: the fixture's baked nameSearchAllowed is used
        // as-is. The real homeBranch-keyed, fail-closed BD lookup lives in
        // JdbcUserProfileRepository; the mock has no branch BD rows to key on.
        // Keys are uppercase but the operator's id is never upcased — match
        // case-insensitively so 'devuser' finds DEVUSER.
        return PROFILES.entrySet().stream()
                .filter(e -> e.getKey().equalsIgnoreCase(userId == null ? "" : userId.trim()))
                .map(Map.Entry::getValue)
                .findFirst();
    }
}
