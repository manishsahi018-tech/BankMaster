package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.repository.UserProfileRepository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Stream;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Operator profile from Denodo view stuser plus the branch-details
 * control row (QUERY-SPECS.md §9, legacy cblogin.c processLoginRequest —
 * read-only parts only; password/lock handling is replaced by the
 * revamp's auth design).
 */
@Repository
@Profile("denodo")
public class JdbcUserProfileRepository implements UserProfileRepository {

    private final NamedParameterJdbcTemplate jdbc;
    private final BankingDateProvider bankingDate;

    public JdbcUserProfileRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc,
            BankingDateProvider bankingDate) {
        this.jdbc = jdbc;
        this.bankingDate = bankingDate;
    }

    @Override
    public Optional<UserProfile> findByUserId(String userId) {
        // Point read on stuser key (BankingDate, userId). stuser has no
        // single display-name column — the mock's userName is a full name,
        // so it is assembled from firstName..lastName (schema file wins
        // over any spec naming).
        List<UserProfile> rows = jdbc.query("""
                SELECT u.userId, u.firstName, u.secondName, u.thirdName, u.lastName,
                       u.branchCode, u.authorityLevel, u.authorityLevel2, u.langPreferred
                FROM   stuser u
                WHERE  u.BankingDate = :bankingDate AND u.userId = :userId
                """,
                Map.of("bankingDate", bankingDate.bankingDate(), "userId", userId),
                (rs, i) -> new UserProfile(
                        s(rs, "userId"),
                        userName(rs),
                        s(rs, "branchCode"),
                        formatAuthLevel(s(rs, "authorityLevel")),
                        formatAuthLevel(s(rs, "authorityLevel2")),
                        s(rs, "langPreferred"),
                        // filled in below from the branch-details row
                        ""));
        return rows.stream().findFirst()
                .map(p -> new UserProfile(
                        p.userId(), p.userName(), p.branchCode(),
                        p.authorityLevel(), p.authorityLevel2(), p.langPref(),
                        nameSearchAllowed(p.branchCode())));
    }

    /**
     * §9: nameSearchAllowed comes from the stctltab recType='BD' row of the
     * user's home branch. The archival workbook exposes per-recType views —
     * stctltabBD keyed on (BankingDate, branchCode) with NO recType column
     * (schema file wins over the spec's stctltab/recType shape).
     *
     * Legacy fails CLOSED (cblogin.c:233-241): a missing BD row sends '0',
     * and the client gate is an exact == '1', so a blank flag also denies.
     * Missing row, blank column and blank branchCode all yield "0" here;
     * a present non-blank value passes through raw.
     */
    private String nameSearchAllowed(String branchCode) {
        if (branchCode.isEmpty()) {
            return "0";
        }
        List<String> rows = jdbc.query("""
                SELECT b.nameSearchAllowed
                FROM   stctltabBD b
                WHERE  b.BankingDate = :bankingDate AND b.branchCode = :branchCode
                """,
                Map.of("bankingDate", bankingDate.bankingDate(), "branchCode", branchCode),
                (rs, i) -> s(rs, "nameSearchAllowed"));
        return rows.stream()
                .filter(v -> !v.isEmpty())
                .findFirst()
                .orElse("0");
    }

    /** Full display name from the four stuser name parts, blanks skipped. */
    private static String userName(ResultSet rs) throws SQLException {
        return Stream.of(s(rs, "firstName"), s(rs, "secondName"),
                        s(rs, "thirdName"), s(rs, "lastName"))
                .filter(part -> !part.isEmpty())
                .reduce((a, b) -> a + " " + b)
                .orElse("");
    }

    /**
     * Legacy formatAuthLevel (globalFunctions.bas): the raw stuser
     * authority string is consecutive 2-digit role codes; the app-facing
     * form wraps each as ~xx~, e.g. "004160" → "~00~41~60~" (the UI's
     * permission gates match on that form — see MockUserProfileRepository).
     * Already-formatted values pass through; blank stays blank.
     */
    private static String formatAuthLevel(String raw) {
        if (raw.isEmpty()) {
            return "";
        }
        if (raw.indexOf('~') >= 0) {
            return raw;
        }
        StringBuilder out = new StringBuilder("~");
        for (int i = 0; i < raw.length(); i += 2) {
            String code = raw.substring(i, Math.min(i + 2, raw.length())).trim();
            if (!code.isEmpty()) {
                out.append(code).append('~');
            }
        }
        return out.length() == 1 ? "" : out.toString();
    }

    /** Trimmed, never-null column read (Hive CHAR padding, NULLs → ""). */
    private static String s(ResultSet rs, String column) throws SQLException {
        String value = rs.getString(column);
        return value == null ? "" : value.trim();
    }
}
