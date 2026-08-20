package com.banksystem.api.infrastructure.sqllog;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * Opens and closes one SQL-audit entry per API call, so the queries recorded by
 * {@link SqlLoggingDataSource} are attributable to the request that caused them.
 *
 * <p>Registered as a {@code @Component} — Boot puts it at the END of the servlet
 * chain, AFTER Spring Security, which is what makes {@code user=} resolvable
 * here: the bearer token has already been validated by the time this runs. The
 * cost is that a request rejected with 401 never reaches this filter and so is
 * not logged; it also never reaches a repository, so nothing is lost.
 *
 * <p>Only {@code /api/**} is followed. Static assets and the actuator do not
 * issue SQL, and logging them would bury the calls that do.
 */
@Component
public class SqlLogFilter extends OncePerRequestFilter {

    private final SqlLogWriter writer;

    public SqlLogFilter(SqlLogWriter writer) {
        this.writer = writer;
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        return !writer.isEnabled() || !request.getRequestURI().startsWith("/api");
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
            FilterChain chain) throws ServletException, IOException {
        StringBuilder summary = new StringBuilder()
                .append(request.getMethod()).append(' ').append(request.getRequestURI());
        if (request.getQueryString() != null) {
            summary.append('?').append(request.getQueryString());
        }
        summary.append(" user=").append(user());

        writer.requestStarted(writer.nextRequestId(), summary.toString());
        try {
            chain.doFilter(request, response);
        } finally {
            writer.requestFinished(response.getStatus());
        }
    }

    private static String user() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || auth.getName() == null
                || "anonymousUser".equals(auth.getName())) {
            return "-";
        }
        return auth.getName();
    }
}
