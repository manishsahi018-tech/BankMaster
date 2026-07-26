package com.banksystem.api.infrastructure.auth;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Instant;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * Sliding-session refresh. Runs after the resource-server has validated the
 * bearer token: when the caller's still-valid token is more than halfway to
 * expiry, a fresh token (same claims, new expiry) is minted and returned in the
 * {@code X-Refresh-Token} response header. The SPA swaps its stored token for it,
 * so an operator who keeps working never gets logged out — the 15-minute clock
 * only runs down during genuine inactivity (no API calls).
 *
 * <p>Registered inside the security chain (see {@code SecurityConfig}), not as a
 * {@code @Component}, so it sits right after {@code BearerTokenAuthenticationFilter}
 * and can read the authenticated {@link Jwt} from the security context.
 */
public class TokenSlidingRefreshFilter extends OncePerRequestFilter {

    /** Response header carrying the refreshed token; exposed via CORS. */
    public static final String HEADER = "X-Refresh-Token";

    private final JwtAccessTokenIssuer issuer;
    /** Re-issue once the remaining lifetime drops below this (half the TTL). */
    private final long refreshBelowSeconds;

    public TokenSlidingRefreshFilter(JwtAccessTokenIssuer issuer, long ttlSeconds) {
        this.issuer = issuer;
        this.refreshBelowSeconds = Math.max(1, ttlSeconds / 2);
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
            FilterChain chain) throws ServletException, IOException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.getPrincipal() instanceof Jwt jwt) {
            Instant exp = jwt.getExpiresAt();
            if (exp != null) {
                long remaining = exp.getEpochSecond() - Instant.now().getEpochSecond();
                // Only slide a token that is still valid but past the halfway mark;
                // the header must be set before the response body is committed.
                if (remaining > 0 && remaining < refreshBelowSeconds) {
                    response.setHeader(HEADER, issuer.issue(
                            jwt.getSubject(),
                            str(jwt.getClaim("authorityLevel")),
                            str(jwt.getClaim("authorityLevel2")),
                            str(jwt.getClaim("branchCode"))));
                }
            }
        }
        chain.doFilter(request, response);
    }

    private static String str(Object value) {
        return value == null ? "" : String.valueOf(value);
    }
}
