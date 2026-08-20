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
// Kept for when operator profiles come from Denodo's stuser, but NOT active by
// default: login must keep using MockUserProfileRepository until LDAP is wired.
// Requires BOTH denodo (for archivalJdbc) AND an explicit "db-userprofile"
// opt-in, so the plain denodo profile still logs in via the mock directory.
@Repository
@Profile("denodo & db-userprofile")
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
    public Optional<UserProfile> findByUserId(String userId, String homeBranch) {
        // Point read on stuser key (BankingDate, userId). stuser has no
        // single display-name column — the mock's userName is a full name,
        // so it is assembled from firstName..lastName (schema file wins
        // over any spec naming).
        // NOTE (login): the archival stuser view carries NO password and NO
        // lastChangeDate column (verified against BM archival Version 9) — the
        // extract excludes credentials/password-lifecycle. So this DB path can
        // supply the profile + liveStatus, but NOT authenticate: the password
        // check and 30-day expiry must come from the live directory (LDAP). We
        // therefore leave password/lastChangeDate blank; only liveStatus is read.
        List<UserProfile> rows = jdbc.query("""
                SELECT u.userId, u.firstName, u.secondName, u.thirdName, u.lastName,
                       u.branchCode, u.authorityLevel, u.authorityLevel2, u.langPreferred,
                       u.liveStatus
                FROM   stuser u
                WHERE  u.BankingDate = :bankingDate
                  AND  UPPER(u.userId) = UPPER(:userId)
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
                        "",
                        "",                    // password: not in archival stuser
                        s(rs, "liveStatus"),
                        ""));                  // lastChangeDate: not in archival stuser
        return rows.stream().findFirst()
                .map(p -> new UserProfile(
                        p.userId(), p.userName(), p.branchCode(),
                        p.authorityLevel(), p.authorityLevel2(), p.langPref(),
                        nameSearchAllowed(homeBranch),
                        p.password(), p.liveStatus(), p.lastChangeDate()));
    }

    /**
     * §9: nameSearchAllowed comes from the stctltabBD row of the LOGIN REQUEST's
     * homeBranch (cblogin.c:233 keys readBranchFile("BD", homeBranch)), which is
     * distinct from the user's own stuser.branchCode. The archival workbook
     * exposes per-recType views — stctltabBD keyed on (BankingDate, branchCode)
     * with NO recType column (schema file wins over the spec's stctltab shape).
     *
     * Legacy fails CLOSED (cblogin.c:233-241): a missing BD row sends '0', and
     * the client gate is an exact == '1', so a blank flag also denies. A blank
     * homeBranch (e.g. SECU/MANT special logins, or the UI not sending one),
     * a missing row, and a blank column all yield "0"; a present non-blank
     * value passes through raw.
     */
    private String nameSearchAllowed(String homeBranch) {
        if (homeBranch == null || homeBranch.isEmpty()) {
            return "0";
        }
        List<String> rows = jdbc.query("""
                SELECT b.nameSearchAllowed
                FROM   stctltabBD b
                WHERE  b.BankingDate = :bankingDate
                  AND  b.branchCode = :branchCode
                """,
                Map.of("bankingDate", bankingDate.bankingDate(), "branchCode", homeBranch),
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
