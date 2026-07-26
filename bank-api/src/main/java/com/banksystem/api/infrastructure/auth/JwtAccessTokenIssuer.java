package com.banksystem.api.infrastructure.auth;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
import org.springframework.security.oauth2.jwt.JwsHeader;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.stereotype.Component;

/**
 * Issues the HS256 bearer token a successful login hands back to the UI. Mints
 * exactly the claim set {@code CallerResolver} reads back and {@code SecurityConfig}'s
 * decoder verifies (same key, issuer and audience).
 *
 * <p>Adapted from the LoanOriginationSystem {@code JwtAccessTokenIssuer}: the
 * mediator/roles model is dropped and the claim names are BankMaster's
 * ({@code authorityLevel} + {@code authorityLevel2} — the two legacy stuser
 * halves the C flattened, cbbranch2.c:5781-5788 — plus {@code branchCode}), so
 * the whole authority string survives into every server-side {@code ~NN} check.
 *
 * <p>Set a strong {@code bank.jwt.secret} (&ge; 32 chars) via env in any real
 * deployment; the blank/dev fallback is defined in {@code SecurityConfig}.
 */
@Component
public class JwtAccessTokenIssuer {

    private final JwtEncoder jwtEncoder;
    private final String issuer;
    private final String audience;
    private final long ttlSeconds;

    public JwtAccessTokenIssuer(
            JwtEncoder jwtEncoder,
            @Value("${bank.jwt.issuer:BankStaticData}") String issuer,
            @Value("${bank.jwt.audience:BankClients}") String audience,
            @Value("${bank.jwt.ttl-seconds:3600}") long ttlSeconds) {
        this.jwtEncoder = jwtEncoder;
        this.issuer = issuer;
        this.audience = audience;
        this.ttlSeconds = ttlSeconds;
    }

    /** A signed token for the operator, carrying the authority claims. */
    public String issue(String subject, String authorityLevel, String authorityLevel2, String branchCode) {
        Instant now = Instant.now();
        JwtClaimsSet claims = JwtClaimsSet.builder()
                .issuer(issuer)
                .audience(List.of(audience))
                .subject(subject == null ? "" : subject)
                .claim("authorityLevel", authorityLevel == null ? "" : authorityLevel)
                .claim("authorityLevel2", authorityLevel2 == null ? "" : authorityLevel2)
                .claim("branchCode", branchCode == null ? "" : branchCode)
                .issuedAt(now)
                .expiresAt(now.plus(ttlSeconds, ChronoUnit.SECONDS))
                .build();

        return jwtEncoder.encode(JwtEncoderParameters.from(
                JwsHeader.with(MacAlgorithm.HS256).build(), claims)).getTokenValue();
    }
}
