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
import java.util.Collections;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;
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
 *   <li><b>AD group</b> — when {@code bank.ldap.required-groups} names one or
 *       more groups (comma-separated), a directory-authenticated user must be a
 *       direct member of at least one of them; otherwise the login is refused with
 *       "User is not allowed to access the application." Who may log in is
 *       therefore managed entirely in Active Directory — adding or removing a user
 *       from the group takes effect on their next login, with no change here.
 *       A BLANK setting turns the check off: every user AD authenticates is let in.
 *       The check applies only to the directory path; the local fallback ladder
 *       has no group information (and is off by default when AD is enabled).</li>
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
    /** Non-000 status for the AD-group refusal; the UI shows the message verbatim. */
    private static final String STATUS_NOT_ALLOWED = "106";

    private final UserProfileRepository profiles;
    private final PasswordCipher cipher;
    private final DirectoryAuthenticator directory;
    private final String adminAuthority;
    private final String adminBranch;
    /** Group CNs, any one of which admits a directory user. EMPTY = no group check. */
    private final Set<String> requiredGroups;

    public AuthService(
            UserProfileRepository profiles,
            PasswordCipher cipher,
            DirectoryAuthenticator directory,
            // ~99 (enquiry-only marker) is intentionally excluded — it disables
            // customer search in the UI; an all-access admin must not carry it.
            @Value("${bank.auth.admin-authority:"
                    + "~00~01~02~04~06~32~41~42~43~45~50~60~61~62~81~86~87~94~}") String adminAuthority,
            @Value("${bank.auth.admin-branch:0001}") String adminBranch,
            @Value("${bank.ldap.required-groups:}") String requiredGroupsCsv) {
        this.profiles = profiles;
        this.cipher = cipher;
        this.directory = directory;
        this.adminAuthority = adminAuthority;
        this.adminBranch = adminBranch;
        this.requiredGroups = parseGroups(requiredGroupsCsv);
        if (directory.isEnabled()) {
            if (requiredGroups.isEmpty()) {
                log.warn("[Login] bank.ldap.required-groups is BLANK — no AD group check: every "
                        + "user Active Directory authenticates is allowed in.");
            } else {
                log.info("[Login] AD group check ON — a user must be a direct member of one of {}.",
                        requiredGroups);
            }
        }
    }

    /**
     * @param rawUserId         the operator id, used everywhere in the case it was typed
     *                          ({@code ANB\}/{@code @domain} prefixes/suffixes accepted)
     * @param encryptedPassword AES-encrypted password from the SPA (Base64(IV ‖ ciphertext))
     * @param homeBranch        the operating branch the operator logs into (may be blank)
     */
    public LoginResult login(String rawUserId, String encryptedPassword, String homeBranch) {
        // The id is used EXACTLY as the operator typed it — the AD bind, the
        // stuser/stusrbrn lookups and the JWT subject all get
        // that same string. Nothing upcases it; the lookups that must tolerate
        // a different stored case compare case-insensitively instead.
        String userId = DirectoryUsername.bare(rawUserId);
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

        // 2) AD group gate — authenticated, but is this user permitted in? Only
        // the directory path carries groups; a blank setting means no check.
        if (auth.viaDirectory && !requiredGroups.isEmpty()
                && auth.groups.stream().noneMatch(requiredGroups::contains)) {
            log.info("[Login] {} authenticated against Active Directory but is not a direct "
                    + "member of any of {} (member of {}) — denied.",
                    userId, requiredGroups, auth.groups);
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
                    return AuthResult.directory(dir.displayName(), dir.groups());
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
        return AuthResult.local(user); // local path: name comes from the profile
    }

    /**
     * {@code required-groups} as a case-insensitive set of group CNs. Each entry
     * may be the bare name ({@code BankMaster-Users}) or the full DN copied from
     * AD ({@code CN=BankMaster-Users,OU=Groups,DC=anb,DC=com,DC=sa}); a DN is
     * reduced to its CN, because that is the form Spring reports memberships in.
     */
    static Set<String> parseGroups(String csv) {
        if (csv == null || csv.isBlank()) {
            return Set.of();
        }
        Set<String> groups = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        // Names are comma-separated. A full DN contains commas itself, so DNs are
        // separated with ';' instead ("CN=A,OU=G,DC=x;CN=B,OU=G,DC=x"); a single
        // DN needs no separator at all.
        String[] entries = csv.contains(";") || csv.contains("=") ? csv.split(";") : csv.split(",");
        Arrays.stream(entries)
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .map(AuthService::commonName)
                .filter(s -> !s.isEmpty())
                .forEach(groups::add);
        return Collections.unmodifiableSet(groups);
    }

    /** {@code CN=Name,OU=...} &rarr; {@code Name}; anything else is returned as-is. */
    private static String commonName(String entry) {
        if (!entry.toUpperCase(Locale.ROOT).startsWith("CN=")) {
            return entry;
        }
        String rest = entry.substring(3);
        int comma = rest.indexOf(',');
        return (comma < 0 ? rest : rest.substring(0, comma)).trim();
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

    /**
     * Internal carrier. On success: which path authenticated the user, the local
     * profile (local path only), and the AD display name and groups (directory
     * path only). Otherwise a failure to return.
     */
    private record AuthResult(boolean viaDirectory, UserProfile profile, String displayName,
            Set<String> groups, LoginResult failure) {
        static AuthResult directory(String displayName, Set<String> groups) {
            return new AuthResult(true, null, displayName == null ? "" : displayName,
                    groups == null ? Set.of() : groups, null);
        }

        static AuthResult local(UserProfile profile) {
            return new AuthResult(false, profile, "", Set.of(), null);
        }

        static AuthResult fail(LoginResult failure) {
            return new AuthResult(false, null, "", Set.of(), failure);
        }
    }
}
