package com.banksystem.api.infrastructure.persistence.jdbc;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Prepends a configurable prefix to every table name in a SQL statement, so the
 * repositories can keep using the legacy BM names (stcusttab, gld0data, …) while
 * Denodo exposes them under an environment-specific prefix
 * (e.g. {@code bv_impala_stg_bankmaster_stcusttab}). The prefix differs per
 * environment (note the "stg" in staging), which is why it is configuration, not
 * code — set {@code bank.archival-db.table-prefix} / {@code bank.online-db.table-prefix}.
 *
 * <p>Rewrite rule: the identifier immediately after FROM/JOIN gets the prefix.
 * This is safe for this codebase because every SQL statement puts a table name
 * directly after FROM/JOIN — there are no CTEs, no LATERAL, no {@code FROM
 * (subquery)}, and no comma-style joins (all verified). LATERAL and
 * already-prefixed names are skipped defensively. An empty/blank prefix is a
 * no-op, so the "mock" profile and un-prefixed environments are unaffected.
 */
final class SqlTablePrefixer {

    private final String prefix;
    private final Pattern pattern;

    SqlTablePrefixer(String prefix) {
        this.prefix = prefix == null ? "" : prefix.trim();
        this.pattern = this.prefix.isEmpty() ? null : Pattern.compile(
                "(?i)\\b(from|join)(\\s+)"          // FROM/JOIN + whitespace
                        + "(?!lateral\\b)"           // not the LATERAL keyword
                        + "(?!" + Pattern.quote(this.prefix) + ")" // not already prefixed
                        + "([a-zA-Z_][a-zA-Z0-9_]*)");// the table identifier
    }

    /** Returns {@code sql} with the prefix applied to each table name, or {@code sql} unchanged when no prefix is configured. */
    String rewrite(String sql) {
        if (pattern == null || sql == null) {
            return sql;
        }
        Matcher m = pattern.matcher(sql);
        StringBuilder out = new StringBuilder(sql.length() + 32);
        while (m.find()) {
            m.appendReplacement(out,
                    Matcher.quoteReplacement(m.group(1) + m.group(2) + prefix + m.group(3)));
        }
        m.appendTail(out);
        return out.toString();
    }
}
