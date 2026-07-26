package com.banksystem.api.infrastructure.auth;

import com.banksystem.api.domain.auth.Authenticator;
import java.util.Map;
import java.util.Set;
import org.springframework.stereotype.Component;

/**
 * In-memory stand-in for the LDAP bind. Any user in PASSWORDS logs in with
 * the shared demo password; LOCKED1/CLOSED1 exercise the directory's
 * locked/disabled outcomes. Like a real bind, unknown user and wrong
 * password are indistinguishable (both INVALID_CREDENTIALS).
 */
@Component
public class MockAuthenticator implements Authenticator {

    private static final Map<String, String> PASSWORDS = Map.of(
            "DEVUSER", "Passw0rd",
            "OPER1", "Passw0rd",
            "ENQ1", "Passw0rd",
            "MERCH1", "Passw0rd",
            "NOAUTH1", "Passw0rd");

    private static final Set<String> LOCKED = Set.of("LOCKED1");
    private static final Set<String> DISABLED = Set.of("CLOSED1");

    @Override
    public AuthStatus authenticate(String userId, String password) {
        if (LOCKED.contains(userId)) {
            return AuthStatus.ACCOUNT_LOCKED;
        }
        if (DISABLED.contains(userId)) {
            return AuthStatus.ACCOUNT_DISABLED;
        }
        String expected = PASSWORDS.get(userId);
        if (expected == null || !expected.equals(password)) {
            return AuthStatus.INVALID_CREDENTIALS;
        }
        return AuthStatus.OK;
    }
}
