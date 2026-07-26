package com.banksystem.api.presentation.config;

import com.nimbusds.jose.jwk.source.ImmutableSecret;
import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.crypto.spec.SecretKeySpec;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

/**
 * Security for the enquiry API — a JWT resource server. Every {@code /api/**}
 * call except {@code /api/login} must carry a valid {@code Authorization: Bearer}
 * token (issued by the login flow, verified by the {@link #jwtDecoder} below);
 * anything else gets a 401. The packaged bank-ui static assets and the login /
 * swagger / health endpoints stay public.
 *
 * <p>Adapted from the LoanOriginationSystem {@code SecurityConfig}: same HS256
 * Nimbus encoder/decoder pair keyed off one secret, same stateless + CSRF-off
 * posture. This replaces the previous hand-rolled {@code JwtService}/
 * {@code JwtAuthFilter} and the {@code CorsConfig} WebMvcConfigurer (CORS now
 * lives here so it applies inside the security filter chain).
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    // Dev fallback (>= 32 bytes, required by HS256). Override with a strong
    // BANK_JWT_SECRET in any real deployment.
    private static final String DEV_SECRET =
            "dev-only-change-me-bank-static-data-jwt-hs256-secret-key";

    private final byte[] jwtKey;
    private final List<String> allowedOrigins;

    public SecurityConfig(
            @Value("${bank.jwt.secret:}") String secret,
            @Value("${bank.cors.allowed-origins:http://localhost:5173,http://localhost:5199}")
                    List<String> allowedOrigins) {
        String key = secret == null || secret.isBlank() ? DEV_SECRET : secret;
        this.jwtKey = key.getBytes(StandardCharsets.UTF_8);
        this.allowedOrigins = allowedOrigins;
    }

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .csrf(csrf -> csrf.disable())
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                        // CORS preflight carries no Authorization header by design.
                        .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()
                        // Mints the token, so it cannot require one.
                        .requestMatchers("/api/login").permitAll()
                        // Let handler errors surface instead of re-reporting as 401 on /error.
                        .requestMatchers("/error").permitAll()
                        // Swagger UI + the spec it renders (off in prod via springdoc.*).
                        .requestMatchers("/swagger-ui/**", "/swagger-ui.html",
                                "/v3/api-docs", "/v3/api-docs/**", "/v3/api-docs.yaml").permitAll()
                        // Every other API call needs a bearer token.
                        .requestMatchers("/api/**").authenticated()
                        // The packaged bank-ui (index.html, /assets/**, icons, …) is public.
                        .anyRequest().permitAll())
                .oauth2ResourceServer(oauth2 -> oauth2.jwt(jwt -> jwt.decoder(jwtDecoder())))
                .build();
    }

    @Bean
    JwtDecoder jwtDecoder() {
        SecretKeySpec secretKey = new SecretKeySpec(jwtKey, "HmacSHA256");
        return NimbusJwtDecoder.withSecretKey(secretKey)
                .macAlgorithm(MacAlgorithm.HS256)
                .build();
    }

    @Bean
    JwtEncoder jwtEncoder() {
        return new NimbusJwtEncoder(new ImmutableSecret<>(jwtKey));
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowedOrigins(allowedOrigins);
        config.setAllowedMethods(List.of("GET", "POST", "OPTIONS"));
        config.setAllowedHeaders(List.of("Authorization", "Content-Type"));
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/api/**", config);
        return source;
    }
}
