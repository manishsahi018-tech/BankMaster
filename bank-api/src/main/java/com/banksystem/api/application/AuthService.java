package com.banksystem.api.application;

import com.banksystem.api.domain.auth.DirectoryAuthResult;
import com.banksystem.api.domain.auth.DirectoryAuthenticator;
import com.banksystem.api.domain.auth.DirectoryUsername;
import com.banksystem.api.domain.auth.PasswordCipher;
import com.banksystem.api.domain.model.LoginResult;
import com.banksystem.api.domain.model.SessionInfo;
import com.banksystem.api.domain.repository.UserProfileRepository;
import com.banksystem.api.domain.repository.UserProfileRepository.UserProfile;
import java.time.LocalDate;
import java.time.chrono.HijrahDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * Logon use case. Credentials are now verified against <b>Active Directory</b>
 * (a bind via {@link DirectoryAuthenticator}); the local {@code stuser}/mock
 * ladder ported from legacy {@code cblogin.c} remains only as the fallback used
 * on machines with no domain (local dev) or when the directory is unreachable.
 * Two gates then apply before a session is issued:
 *
 * <ol>
 *   <li><b>Directory bind</b> — AUTHENTICATED proceeds; REJECTED is final (never
 *       falls back); UNAVAILABLE may fall back to the local ladder when policy
 *       allows it. This is the LoanOriginationSystem three-state pattern.</li>
 *   <li><b>Allow-list</b> — the userId must appear in {@code bank.auth.allowed-users}
 *       (comma-separated). A directory-authenticated user who is not on the list is
 *       refused with "User is not allowed to access the application." An empty list
 *       means "allow all" (dev convenience) and logs a warning.</li>
 * </ol>
 *
 * <p><b>Authority (interim):</b> per the porting brief, every authenticated user
 * is granted one fixed <i>admin</i> authority ({@code bank.auth.admin-authority})
 * that unlocks the whole enquiry application; per-user authority mapping is
 * deferred. The password/liveStatus/expiry fields of the local profile are still
 * honoured on the fallback path, but the resulting session's authority is always
 * the admin string.
 *
 * <p>The password arrives AES-encrypted from the SPA (see {@code AesPasswordCipher}
 * / {@code pocCrypto.ts}) and is decrypted here — a bind needs the plaintext.
 */
@Service
public class AuthService {

    private static final Logger log = LoggerFactory.getLogger(AuthService.class);

    private static final DateTimeFormatter YMD = DateTimeFormatter.ofPattern("yyyyMMdd");
    /** Legacy: password older than 30 days is expired (cblogin.c:405). Fallback path only. */
    private static final long MAX_PASSWORD_AGE_DAYS = 30;
    /** Non-000 status for the allow-list refusal; the UI shows the message verbatim. */
    private static final String STATUS_NOT_ALLOWED = "106";

    private final UserProfileRepository profiles;
    private final PasswordCipher cipher;
    private final DirectoryAuthenticator directory;
    private final String adminAuthority;
    private final String adminBranch;
    private final Set<String> allowedUsers;

    public AuthService(
            UserProfileRepository profiles,
            PasswordCipher cipher,
            DirectoryAuthenticator directory,
            // ~99 (enquiry-only marker) is intentionally excluded — it disables
            // customer search in the UI; an all-access admin must not carry it.
            @Value("${bank.auth.admin-authority:"
                    + "~00~01~02~04~06~32~41~42~43~45~50~60~61~62~81~86~87~94~}") String adminAuthority,
            @Value("${bank.auth.admin-branch:0001}") String adminBranch,
            @Value("${bank.auth.allowed-users:}") String allowedUsersCsv) {
        this.profiles = profiles;
        this.cipher = cipher;
        this.directory = directory;
        this.adminAuthority = adminAuthority;
        this.adminBranch = adminBranch;
        this.allowedUsers = parseAllowedUsers(allowedUsersCsv);
        if (this.allowedUsers.isEmpty()) {
            log.warn("[Login] bank.auth.allowed-users is empty — ALL directory-authenticated "
                    + "users are allowed. Set the list before any real deployment.");
        }
    }

    /**
     * @param rawUserId         the operator id (any case; {@code ANB\}/{@code @domain} accepted)
     * @param encryptedPassword AES-encrypted password from the SPA (Base64(IV ‖ ciphertext))
     * @param homeBranch        the operating branch the operator logs into (may be blank)
     */
    public LoginResult login(String rawUserId, String encryptedPassword, String homeBranch) {
        String userId = DirectoryUsername.bare(rawUserId).toUpperCase();
        if (userId.isEmpty() || encryptedPassword == null || encryptedPassword.isEmpty()) {
            return LoginResult.failure("102", "Invalid User Id");
        }

        String password;
        try {
            password = cipher.decrypt(encryptedPassword);
        } catch (RuntimeException e) {
            // Malformed ciphertext — wrong key/format. Treat as an invalid password.
            log.warn("[Login] {} — could not decrypt the supplied password.", userId, e);
            return LoginResult.failure("103", "Invalid Password. Password is case sensitive");
        }
        if (password.isEmpty()) {
            return LoginResult.failure("102", "Invalid User Id");
        }

        String branch = homeBranch == null ? "" : homeBranch.trim().toUpperCase();

        // 1) Authenticate — directory first, local ladder as the narrow fallback.
        AuthResult auth = authenticate(userId, password, branch);
        if (auth.failure != null) {
            return auth.failure;
        }

        // 2) Allow-list gate — authenticated, but is this user permitted in?
        if (!allowedUsers.isEmpty() && !allowedUsers.contains(userId)) {
            log.info("[Login] {} authenticated but is not in bank.auth.allowed-users — denied.", userId);
            return LoginResult.failure(STATUS_NOT_ALLOWED, "User is not allowed to access the application.");
        }

        // 3) Success — issue the (admin-authority) session; the controller attaches the JWT.
        return new LoginResult("000", "Login successful",
                session(userId, auth.profile, auth.displayName, branch), null);
    }

    /** Directory bind with the three-state fallback; returns the local profile when that path ran. */
    private AuthResult authenticate(String userId, String password, String branch) {
        if (directory.isEnabled()) {
            DirectoryAuthResult dir = directory.authenticate(userId, password);
            switch (dir.outcome()) {
                case AUTHENTICATED -> {
                    log.info("[Login] {} authenticated against Active Directory (name='{}').",
                            userId, dir.displayName());
                    return AuthResult.ok(null, dir.displayName());
                }
                case REJECTED -> {
                    // Authoritative refusal — never fall back to the local store.
                    return AuthResult.fail(
                            LoginResult.failure("103", "Invalid Password. Password is case sensitive"));
                }
                case UNAVAILABLE -> {
                    if (!directory.allowLocalFallbackWhenUnavailable()) {
                        log.error("[Login] {} — directory unreachable and local fallback is "
                                + "disabled; refusing the login.", userId);
                        return AuthResult.fail(LoginResult.failure("103",
                                "Directory unavailable. Please try again later"));
                    }
                    log.warn("[Login] {} — directory unreachable; falling back to the local store.", userId);
                }
            }
        }
        return authenticateLocally(userId, password, branch);
    }

    // (authenticateLocally supplies the profile; AD display name is empty on that path.)

    /**
     * The local fallback: the legacy {@code cblogin.c} ladder against the
     * {@code stuser}/mock profile. Status codes/remarks match {@code resMsgLogin}.
     */
    private AuthResult authenticateLocally(String userId, String password, String branch) {
        UserProfile user = profiles.findByUserId(userId, branch).orElse(null);
        if (user == null) {
            return AuthResult.fail(
                    LoginResult.failure("102", "UserId does not exist. Please contact Support"));
        }
        // liveStatus gates come before the password check (cblogin.c order).
        if ("2".equals(user.liveStatus())) {
            return AuthResult.fail(LoginResult.failure("104", "User Account is locked. Call HO to activate"));
        }
        if ("3".equals(user.liveStatus())) {
            return AuthResult.fail(LoginResult.failure("105", "Your Account has been closed"));
        }
        if (!user.password().equals(password)) {
            return AuthResult.fail(
                    LoginResult.failure("103", "Invalid Password. Password is case sensitive"));
        }
        if ("0".equals(user.liveStatus())) {
            return AuthResult.fail(LoginResult.failure("101", "Please change your password"));
        }
        if (!isSystemUser(user) && isPasswordExpired(user.lastChangeDate())) {
            return AuthResult.fail(LoginResult.failure("107", "Your password has expired. Please change it"));
        }
        return AuthResult.ok(user, ""); // local path: name comes from the profile
    }

    /** Authority code ~99 marks system/installation users, exempt from expiry (cblogin.c:389). */
    private static boolean isSystemUser(UserProfile p) {
        return (p.authorityLevel() + p.authorityLevel2()).contains("~99");
    }

    /** True when lastChangeDate is a valid YYYYMMDD more than 30 days ago; blank/invalid = not expired. */
    private static boolean isPasswordExpired(String lastChangeDate) {
        if (lastChangeDate == null || lastChangeDate.isBlank()) {
            return false;
        }
        try {
            LocalDate changed = LocalDate.parse(lastChangeDate.trim(), YMD);
            return java.time.temporal.ChronoUnit.DAYS.between(changed, LocalDate.now()) > MAX_PASSWORD_AGE_DAYS;
        } catch (RuntimeException e) {
            return false; // mirrors the legacy dateErr fallback (daysBetween = 0)
        }
    }

    /**
     * Builds the session. Authority is always the fixed admin string (interim).
     * The display name is the AD {@code displayName} on the directory path, the
     * local profile's name on the fallback path, and the userId only if neither
     * supplied one. Branch comes from the profile, else the login branch, else the
     * configured admin branch.
     */
    private SessionInfo session(String userId, UserProfile profile, String adDisplayName, String branch) {
        LocalDate today = LocalDate.now();
        String gregorian = today.format(YMD);
        String hijri = HijrahDate.from(today).format(YMD);
        String userName;
        if (profile != null) {
            userName = profile.userName();
        } else if (adDisplayName != null && !adDisplayName.isBlank()) {
            userName = adDisplayName;
        } else {
            userName = userId;
        }
        String branchCode = profile != null ? profile.branchCode()
                : (!branch.isEmpty() ? branch : adminBranch);
        String langPref = profile != null ? profile.langPref() : "1";
        return new SessionInfo(
                userId, userName, branchCode,
                adminAuthority, "",
                langPref, gregorian, hijri, gregorian,
                "1", "0900");
    }

    private static Set<String> parseAllowedUsers(String csv) {
        if (csv == null || csv.isBlank()) {
            return Set.of();
        }
        return Arrays.stream(csv.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(s -> s.toUpperCase())
                .collect(Collectors.toCollection(LinkedHashSet::new));
    }

    /**
     * Internal carrier: on success, the resolved (possibly null) profile plus the
     * AD display name (blank on the local path); otherwise a failure to return.
     */
    private record AuthResult(UserProfile profile, String displayName, LoginResult failure) {
        static AuthResult ok(UserProfile profile, String displayName) {
            return new AuthResult(profile, displayName == null ? "" : displayName, null);
        }

        static AuthResult fail(LoginResult failure) {
            return new AuthResult(null, "", failure);
        }
    }
}
