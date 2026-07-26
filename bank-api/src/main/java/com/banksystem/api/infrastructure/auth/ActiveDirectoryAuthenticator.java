package com.banksystem.api.infrastructure.auth;

import com.banksystem.api.domain.auth.DirectoryAuthResult;
import com.banksystem.api.domain.auth.DirectoryAuthenticator;
import com.banksystem.api.domain.auth.DirectoryUsername;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.env.Environment;
import org.springframework.ldap.core.DirContextAdapter;
import org.springframework.ldap.core.DirContextOperations;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.ldap.authentication.ad.ActiveDirectoryLdapAuthenticationProvider;
import org.springframework.security.ldap.userdetails.UserDetailsContextMapper;
import org.springframework.stereotype.Component;

/**
 * Verifies credentials with a bind against Active Directory, via Spring
 * Security's {@link ActiveDirectoryLdapAuthenticationProvider} — the AD-specific
 * path that binds as {@code user@domain} and locates the account with
 * {@code (&(objectClass=user)(userPrincipalName={0}))} under the root DN. That is
 * why it needs no service account, no bind DN and no user-DN pattern: AD resolves
 * the UPN itself, so a URL and a domain are sufficient.
 *
 * <p>Copied from the LoanOriginationSystem auth slice; only the config prefix
 * changed ({@code los.ldap.} &rarr; {@code bank.ldap.}). The classic ADsPath form
 * {@code LDAP://server/DC=x,DC=y} is accepted verbatim — {@link #parseUrl} and
 * {@link #parseRootDn} split host and root DN so the value can be pasted straight
 * from the bank's existing configuration.
 */
@Component
public class ActiveDirectoryAuthenticator implements DirectoryAuthenticator {

    private static final Logger log = LoggerFactory.getLogger(ActiveDirectoryAuthenticator.class);

    private static final String PREFIX = "bank.ldap.";

    private final String domain;
    private final String url;
    private final String rootDn;
    private final boolean enabled;
    private final boolean allowLocalFallback;

    /**
     * Built lazily on first use, not in the constructor: the provider opens no
     * socket until it authenticates, but constructing it against a malformed URL
     * throws, and a directory misconfiguration must not stop the application from
     * booting on a machine that is going to use the local fallback anyway.
     */
    private volatile ActiveDirectoryLdapAuthenticationProvider provider;

    public ActiveDirectoryAuthenticator(Environment env) {
        String rawUrl = env.getProperty(PREFIX + "url", "").trim();
        this.domain = env.getProperty(PREFIX + "domain", "").trim();
        this.url = parseUrl(rawUrl);
        String configuredRoot = env.getProperty(PREFIX + "root-dn", "").trim();
        this.rootDn = configuredRoot.isEmpty() ? parseRootDn(rawUrl) : configuredRoot;
        this.allowLocalFallback =
                Boolean.parseBoolean(env.getProperty(PREFIX + "fallback-to-local-users", "true"));

        boolean requested = Boolean.parseBoolean(env.getProperty(PREFIX + "enabled", "false"));
        this.enabled = requested && !url.isEmpty() && !domain.isEmpty();
        if (requested && !this.enabled) {
            log.warn("[LDAP] bank.ldap.enabled=true but url/domain are incomplete "
                    + "(url='{}', domain='{}') — directory authentication is OFF.", url, domain);
        } else if (this.enabled) {
            log.info("[LDAP] Active Directory authentication enabled — url={}, domain={}, rootDn={}",
                    url, domain, rootDn.isEmpty() ? "(derived from domain)" : rootDn);
        }
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    @Override
    public boolean allowLocalFallbackWhenUnavailable() {
        return allowLocalFallback;
    }

    @Override
    public DirectoryAuthResult authenticate(String username, String password) {
        if (!enabled) {
            return DirectoryAuthResult.UNAVAILABLE;
        }
        // AD treats an empty password as an *unauthenticated* bind, which succeeds
        // against any valid DN. Sending one through would authenticate every user
        // with a blank password, so it is refused here rather than at the directory.
        String bare = DirectoryUsername.bare(username);
        if (bare.isEmpty() || password == null || password.isEmpty()) {
            return DirectoryAuthResult.REJECTED;
        }

        ActiveDirectoryLdapAuthenticationProvider ad;
        try {
            ad = provider();
        } catch (RuntimeException ex) {
            log.error("[LDAP] {} — could not build the AD provider (url={}, domain={}).",
                    bare, url, domain, ex);
            return DirectoryAuthResult.UNAVAILABLE;
        }

        try {
            Authentication result = ad.authenticate(new UsernamePasswordAuthenticationToken(bare, password));
            // The mapper below stashed the AD displayName on the principal; fall
            // back to the login id if the attribute was absent.
            String displayName = bare;
            if (result != null && result.getPrincipal() instanceof AdUserDetails u) {
                displayName = u.displayName();
            }
            return DirectoryAuthResult.authenticated(displayName);
        } catch (BadCredentialsException | UsernameNotFoundException ex) {
            // The directory answered and said no — unknown user, bad password, or a
            // disabled/locked/expired account. Authoritative: the caller must NOT
            // fall back. AD's sub-error code says *why* (525 no such user vs 52e
            // wrong password, etc.); the full stack goes to DEBUG.
            log.info("[LDAP] {} — rejected by the directory: {}.", bare, describeAdRejection(ex));
            log.debug("[LDAP] {} — rejection detail.", bare, ex);
            return DirectoryAuthResult.REJECTED;
        } catch (AuthenticationServiceException ex) {
            // Spring wraps transport failures (host down, DNS, TLS, timeout) in this,
            // and in its subclass InternalAuthenticationServiceException — one catch
            // covers both.
            log.error("[LDAP] {} — directory unreachable at {}; credentials were not verified.",
                    bare, url, ex);
            return DirectoryAuthResult.UNAVAILABLE;
        } catch (AuthenticationException ex) {
            // Any other Spring Security outcome: account policy failures land here
            // (disabled, expired, must-reset). Refusal is the safe reading — this is
            // never a success.
            log.info("[LDAP] {} — refused by the directory: {}.", bare, describeAdRejection(ex));
            log.debug("[LDAP] {} — refusal detail.", bare, ex);
            return DirectoryAuthResult.REJECTED;
        } catch (RuntimeException ex) {
            log.error("[LDAP] {} — unexpected failure talking to {}.", bare, url, ex);
            return DirectoryAuthResult.UNAVAILABLE;
        }
    }

    private ActiveDirectoryLdapAuthenticationProvider provider() {
        ActiveDirectoryLdapAuthenticationProvider existing = provider;
        if (existing != null) {
            return existing;
        }
        synchronized (this) {
            if (provider == null) {
                ActiveDirectoryLdapAuthenticationProvider built = rootDn.isEmpty()
                        ? new ActiveDirectoryLdapAuthenticationProvider(domain, url)
                        : new ActiveDirectoryLdapAuthenticationProvider(domain, url, rootDn);
                // Turn AD's sub-error codes (525 no such user, 52e bad password, 532
                // expired password, 533 disabled, 701 expired account, 773 must
                // change password, 775 locked) into distinct Spring exceptions — all
                // still a refusal here, but the log line can say *why*.
                built.setConvertSubErrorCodesToExceptions(true);
                // Capture the AD entry's displayName (falling back to cn/name) on
                // the returned principal, so a successful bind carries a real name.
                built.setUserDetailsContextMapper(new DisplayNameMapper());
                provider = built;
            }
            return provider;
        }
    }

    /** Reads the operator's display name off the AD entry into {@link AdUserDetails}. */
    private static final class DisplayNameMapper implements UserDetailsContextMapper {
        @Override
        public UserDetails mapUserFromContext(DirContextOperations ctx, String username,
                Collection<? extends GrantedAuthority> authorities) {
            String display = firstNonBlank(
                    ctx.getStringAttribute("displayName"),
                    ctx.getStringAttribute("cn"),
                    ctx.getStringAttribute("name"),
                    username);
            return new AdUserDetails(username, display, authorities);
        }

        @Override
        public void mapUserToContext(UserDetails user, DirContextAdapter ctx) {
            throw new UnsupportedOperationException("read-only: AD is not written back");
        }

        private static String firstNonBlank(String... values) {
            for (String v : values) {
                if (v != null && !v.isBlank()) {
                    return v.trim();
                }
            }
            return "";
        }
    }

    /** Minimal {@link UserDetails} that also carries the AD display name. */
    private static final class AdUserDetails implements UserDetails {
        private final String username;
        private final String displayName;
        private final Collection<? extends GrantedAuthority> authorities;

        AdUserDetails(String username, String displayName,
                Collection<? extends GrantedAuthority> authorities) {
            this.username = username;
            this.displayName = displayName;
            this.authorities = authorities == null ? List.of() : authorities;
        }

        String displayName() {
            return displayName;
        }

        @Override
        public Collection<? extends GrantedAuthority> getAuthorities() {
            return authorities;
        }

        @Override
        public String getPassword() {
            return ""; // never retained after the bind
        }

        @Override
        public String getUsername() {
            return username;
        }

        @Override
        public boolean isAccountNonExpired() {
            return true;
        }

        @Override
        public boolean isAccountNonLocked() {
            return true;
        }

        @Override
        public boolean isCredentialsNonExpired() {
            return true;
        }

        @Override
        public boolean isEnabled() {
            return true;
        }
    }

    /**
     * Names <em>why</em> Active Directory refused a bind, for the log line. AD
     * packs the reason into the bind error as {@code ...data 52e, vXXXX} — the hex
     * token after {@code data }. Spring maps some codes to typed exceptions, but
     * 525 (no such user) and 52e (wrong password) both surface as
     * {@link BadCredentialsException}, so only the raw code tells them apart. Walks
     * the whole cause chain because the code lives on the wrapped exception.
     */
    static String describeAdRejection(Throwable ex) {
        for (Throwable t = ex; t != null; t = t.getCause()) {
            String message = t.getMessage();
            if (message == null) {
                continue;
            }
            int marker = message.indexOf("data ");
            if (marker < 0) {
                continue;
            }
            String code = message.substring(marker + 5)
                    .split("[^0-9A-Fa-f]", 2)[0]
                    .toLowerCase(Locale.ROOT);
            String reason = switch (code) {
                case "525" -> "user not found (check the username / UPN suffix)";
                case "52e" -> "invalid credentials — wrong password";
                case "530" -> "not permitted to log on at this time";
                case "531" -> "not permitted to log on at this workstation";
                case "532" -> "password expired";
                case "533" -> "account disabled";
                case "701" -> "account expired";
                case "773" -> "user must reset password";
                case "775" -> "account locked out";
                default -> "see AD sub-error codes";
            };
            return "AD data " + code + " — " + reason;
        }
        // No AD code in the chain — fall back to the exception's own wording.
        String message = ex.getMessage();
        return message == null ? ex.getClass().getSimpleName() : message;
    }

    /**
     * {@code LDAP://dc01.anb.com.sa/DC=anb,DC=com,DC=sa} &rarr;
     * {@code ldap://dc01.anb.com.sa:389}. A plain {@code ldap://host:port} or
     * {@code ldaps://host:port} is returned unchanged (minus any path).
     */
    static String parseUrl(String raw) {
        if (raw == null || raw.isBlank()) {
            return "";
        }
        String value = raw.trim();
        int scheme = value.indexOf("://");
        if (scheme < 0) {
            // Bare hostname — assume plain LDAP on the default port.
            return "ldap://" + stripPath(value);
        }
        // JNDI is case-sensitive about the scheme; ADsPath spells it "LDAP://".
        String protocol = value.substring(0, scheme).toLowerCase(Locale.ROOT);
        String remainder = stripPath(value.substring(scheme + 3));
        if (remainder.isEmpty()) {
            return "";
        }
        boolean secure = "ldaps".equals(protocol);
        String defaultPort = secure ? ":636" : ":389";
        // Only append a port when none is present. Guard against an IPv6 literal,
        // where the colons live inside the brackets.
        String hostPart = remainder.startsWith("[")
                ? remainder.substring(remainder.indexOf(']') + 1)
                : remainder;
        String port = hostPart.contains(":") ? "" : defaultPort;
        return (secure ? "ldaps://" : "ldap://") + remainder + port;
    }

    /**
     * Pulls the root DN out of an ADsPath — {@code LDAP://host/DC=anb,DC=com}
     * &rarr; {@code DC=anb,DC=com}. Returns {@code ""} when the URL carries no
     * path, in which case Spring derives the root DN from the domain instead.
     */
    static String parseRootDn(String raw) {
        if (raw == null || raw.isBlank()) {
            return "";
        }
        String value = raw.trim();
        int scheme = value.indexOf("://");
        String afterScheme = scheme < 0 ? value : value.substring(scheme + 3);
        int slash = afterScheme.indexOf('/');
        if (slash < 0 || slash == afterScheme.length() - 1) {
            return "";
        }
        return afterScheme.substring(slash + 1).trim();
    }

    private static String stripPath(String hostAndPath) {
        int slash = hostAndPath.indexOf('/');
        return (slash < 0 ? hostAndPath : hostAndPath.substring(0, slash)).trim();
    }
}
