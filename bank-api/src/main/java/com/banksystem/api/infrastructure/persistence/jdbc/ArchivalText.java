package com.banksystem.api.infrastructure.persistence.jdbc;

/**
 * Character-column cleanup shared by the archival repositories.
 *
 * <p>The ETL that loaded the Denodo views wrote CSV, and an empty character
 * field came back through it as the TWO-char string {@code ""} — a
 * quoted-but-empty field whose quotes were loaded as content rather than read
 * as delimiters. Nothing downstream recognises that as empty, so it reaches
 * the operator as a literal pair of quote marks: it showed up first in the
 * customer search grid's idType column, and again as the account grid's
 * Dormant Flag (gld0data.anbDormantFlag, ONE character in the legacy record —
 * layout.h:581 — so a two-quote value cannot be legacy data).
 *
 * <p>This strips the wrapper the extract added; it does not touch what the
 * legacy stored.
 *
 * <p>Every repository on the archival datasource (DB #1) reads its character
 * columns through this, at the one accessor each of them already had — so a
 * quoted-empty column cannot reach a screen from any of them, whatever the
 * accessor is called locally (s / str / trim / trimmed / scrub).
 * {@link JdbcStatementRepository} is deliberately NOT among them: DB #3 is a
 * separate Oracle instance and not this CSV load, and an empty VARCHAR2 there
 * is NULL, which its own reads already handle.
 */
final class ArchivalText {

    private ArchivalText() {
    }

    /** Null-safe trim — the archival columns are space-padded fixed width. */
    static String trim(String s) {
        return s == null ? "" : s.trim();
    }

    /**
     * A column value with the ETL's quote wrapper removed.
     *
     * <p>Unwraps only a value quoted END TO END, and only one level: a quote
     * inside a name is left where it is. A number, a date and an overpunch
     * amount can never match, so this is safe to apply at an accessor that
     * every column of a row passes through.
     */
    static String unquote(String s) {
        String v = trim(s);
        return v.length() >= 2 && v.charAt(0) == '"' && v.charAt(v.length() - 1) == '"'
                ? v.substring(1, v.length() - 1).trim()
                : v;
    }

    /**
     * The same unwrap for a column that is cut by POSITION rather than read as
     * a value — stcusttab.jointAccNameOnCheck is two 30-char cheque lines in
     * one 60-char field, and {@link #unquote}'s trim would slide line 2 up into
     * line 1 for a value whose first line is blank. Spacing inside the wrapper
     * is left exactly as it was; only the wrapper itself comes off, so a
     * quoted-empty column still arrives empty.
     */
    static String unquoteKeepingWidth(String s) {
        if (s == null) {
            return "";
        }
        String v = s.trim();
        return v.length() >= 2 && v.charAt(0) == '"' && v.charAt(v.length() - 1) == '"'
                ? v.substring(1, v.length() - 1)
                : s;
    }
}
