package com.banksystem.api.application;

import static org.assertj.core.api.Assertions.assertThat;

import com.banksystem.api.domain.auth.DirectoryAuthResult;
import com.banksystem.api.domain.auth.DirectoryAuthenticator;
import com.banksystem.api.domain.auth.PasswordCipher;
import com.banksystem.api.domain.model.LoginResult;
import com.banksystem.api.domain.repository.UserProfileRepository;
import com.banksystem.api.domain.repository.UserProfileRepository.UserProfile;
import com.banksystem.api.infrastructure.auth.AesPasswordCipher;
import com.banksystem.api.infrastructure.runtimeconfig.RuntimeSettings;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.Optional;
import org.junit.jupiter.api.Test;

/**
 * Verifies the ported cblogin.c login ladder — exercised here via the LOCAL
 * fallback path (directory disabled), with the AES password cipher in the loop.
 */
class AuthServiceTest {

    private static final DateTimeFormatter YMD = DateTimeFormatter.ofPattern("yyyyMMdd");

    /** Directory off — every test runs the local (stuser/mock) ladder. */
    private static final DirectoryAuthenticator NO_DIRECTORY = new DirectoryAuthenticator() {
        @Override
        public boolean isEnabled() {
            return false;
        }

        @Override
        public DirectoryAuthResult authenticate(String username, String password) {
            return DirectoryAuthResult.UNAVAILABLE;
        }

        @Override
        public boolean allowLocalFallbackWhenUnavailable() {
            return true;
        }
    };

    private final PasswordCipher cipher = new AesPasswordCipher("TEST-PASSPHRASE");

    private final Map<String, UserProfile> users = Map.of(
            "OPER1", user("OPER1", "~32~", "", "1", "Passw0rd", ""),
            "SYS1", user("SYS1", "~99~", "", "1", "Passw0rd", "20200101"), // ~99 = expiry-exempt
            "LOCKED1", user("LOCKED1", "~32~", "", "2", "Passw0rd", ""),
            "CLOSED1", user("CLOSED1", "~32~", "", "3", "Passw0rd", ""),
            "NEW1", user("NEW1", "~32~", "", "0", "Passw0rd", ""),
            "OLD1", user("OLD1", "~32~", "", "1", "Passw0rd", "20200101")); // >30 days -> expired

    // Empty allowed-users => allow all, so these tests exercise the credential
    // ladder without the allow-list gate interfering.
    private final AuthService auth = new AuthService(
            new StubRepo(users), cipher, NO_DIRECTORY, "~ADMIN~", "0001",
            RuntimeSettings.fixed("", ""));

    @Test
    void validLoginReturns000WithSession() {
        LoginResult r = login("OPER1", "Passw0rd");
        assertThat(r.status()).isEqualTo("000");
        assertThat(r.session()).isNotNull();
        assertThat(r.session().userId()).isEqualTo("OPER1");
    }

    /**
     * The id is NEVER upcased: a lower-case operator still logs in (the lookup is
     * case-insensitive), and the session carries back exactly what was typed.
     */
    @Test
    void userIdKeepsTheCaseItWasTypedIn() {
        LoginResult r = login("oper1", "Passw0rd");
        assertThat(r.status()).isEqualTo("000");
        assertThat(r.session().userId()).isEqualTo("oper1");
    }

    /** The allow-list matches regardless of the case the operator typed. */
    @Test
    void allowListMatchesAnyCase() {
        AuthService gated = new AuthService(
                new StubRepo(users), cipher, NO_DIRECTORY, "~ADMIN~", "0001",
                RuntimeSettings.fixed("OPER1", ""));
        assertThat(gated.login("oper1", cipher.encrypt("Passw0rd"), "").status()).isEqualTo("000");
        assertThat(gated.login("ghost", cipher.encrypt("Passw0rd"), "").status()).isNotEqualTo("000");
    }

    @Test
    void emptyCredentialsReturn102() {
        assertThat(login("", "x").status()).isEqualTo("102");
        assertThat(login("OPER1", "").status()).isEqualTo("102");
    }

    @Test
    void unknownUserReturns102() {
        assertThat(login("GHOST", "Passw0rd").status()).isEqualTo("102");
    }

    @Test
    void lockedReturns104BeforePasswordCheck() {
        // wrong password, but locked status is reported first (legacy order)
        assertThat(login("LOCKED1", "wrong").status()).isEqualTo("104");
    }

    @Test
    void closedReturns105() {
        assertThat(login("CLOSED1", "Passw0rd").status()).isEqualTo("105");
    }

    @Test
    void wrongPasswordReturns103() {
        assertThat(login("OPER1", "nope").status()).isEqualTo("103");
    }

    @Test
    void newUserReturns101AfterCorrectPassword() {
        assertThat(login("NEW1", "Passw0rd").status()).isEqualTo("101");
    }

    @Test
    void expiredPasswordReturns107() {
        assertThat(login("OLD1", "Passw0rd").status()).isEqualTo("107");
    }

    @Test
    void systemUserIsExemptFromExpiry() {
        assertThat(login("SYS1", "Passw0rd").status()).isEqualTo("000");
    }

    @Test
    void blankLastChangeDateNeverExpires() {
        assertThat(login("OPER1", "Passw0rd").status()).isEqualTo("000");
    }

    private static UserProfile user(String id, String auth1, String auth2,
            String liveStatus, String password, String lastChangeDate) {
        return new UserProfile(id, id + " NAME", "0001", auth1, auth2, "1", "1",
                password, liveStatus, lastChangeDate);
    }

    /**
     * homeBranch is irrelevant to these credential/status tests — the stub ignores
     * it. The password is encrypted exactly as the SPA sends it, so the service
     * decrypts a real ciphertext.
     */
    private LoginResult login(String userId, String password) {
        return auth.login(userId, cipher.encrypt(password), "0001");
    }

    /**
     * Mirrors the real repositories: the operator's id is never upcased, so the
     * lookup itself is case-insensitive (JdbcUserProfileRepository compares with
     * UPPER() on both sides).
     */
    private record StubRepo(Map<String, UserProfile> users) implements UserProfileRepository {
        @Override
        public Optional<UserProfile> findByUserId(String userId, String homeBranch) {
            return users.entrySet().stream()
                    .filter(e -> e.getKey().equalsIgnoreCase(userId == null ? "" : userId.trim()))
                    .map(Map.Entry::getValue)
                    .findFirst();
        }
    }
}
