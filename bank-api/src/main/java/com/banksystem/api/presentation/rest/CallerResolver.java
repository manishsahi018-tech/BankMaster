package com.banksystem.api.presentation.rest;

import com.banksystem.api.domain.model.EnquiryUser;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

/**
 * The operator behind the current request, read from the validated JWT bearer
 * principal that Spring Security's resource-server filter placed in the
 * {@link SecurityContextHolder}.
 *
 * <p>Stands in for the legacy's {@code receivedMsg.<service>.userId} plus its
 * stuser read (cbbranch2.c:5765-5788): login already resolved the profile, so
 * the authority string rides in the token rather than being re-read per call.
 */
@Component
public class CallerResolver {

    /** The {@code request} arg is retained for call-site compatibility; the identity
     *  now comes from the security context, not a request attribute. */
    public EnquiryUser resolve(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !(auth.getPrincipal() instanceof Jwt jwt)) {
            return EnquiryUser.anonymous();
        }
        // The C concatenates authorityLevel + authorityLevel2 into one ~NN
        // string before every strstr("~NN") check.
        String authority = str(jwt.getClaim("authorityLevel")) + str(jwt.getClaim("authorityLevel2"));
        return new EnquiryUser(str(jwt.getSubject()), authority);
    }

    private static String str(Object value) {
        return value == null ? "" : String.valueOf(value);
    }
}
