package com.banksystem.api.domain.model;

import java.util.EnumMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The language the operator is reading the screens in — the revamp's port of
 * the legacy {@code UserLang} global (globalVaribles.bas: {@code ARABIC = 0},
 * {@code ENGLISH = 1}, chosen by {@code STARTUPLANG} in statdata.ini and by
 * frmChangeScreenLang.frm at run time).
 *
 * <p>It matters on the server because the archival reference tables are
 * BILINGUAL: stctltab and its overlay views (stctltabBD branches, stctltabXC
 * currencies, stctltabMM ledgers, stctltabNA countries, stctltabSS sub
 * categories) each carry {@code arabicName} and {@code englishName}, and the
 * legacy client picked between them on UserLang. Which column a query reads is
 * therefore a presentation choice that has to travel from the browser, not a
 * property of the data.
 *
 * <p>{@link #nameExpr} exists so no query has to spell that choice out. Before
 * it, seven call sites hard-coded a preference and did not agree — the
 * reference-data sets took English first while JdbcAccountRepository's
 * currency and ledger sub-selects took Arabic first, so an English session
 * already read Arabic ledger names.
 */
public enum UiLanguage {

    ENGLISH("en"),
    ARABIC("ar");

    /** Placeholder a localisable query writes instead of a name column: {@code {name:b}}. */
    private static final Pattern NAME_TOKEN = Pattern.compile("\\{name:(\\w*)}");

    private final String code;

    UiLanguage(String code) {
        this.code = code;
    }

    public String code() {
        return code;
    }

    /**
     * The language for a locale, defaulting to English for anything else —
     * including null, which is what a background thread with no request bound
     * to it sees.
     */
    public static UiLanguage of(Locale locale) {
        return locale != null && "ar".equalsIgnoreCase(locale.getLanguage()) ? ARABIC : ENGLISH;
    }

    /** The language for a bare tag ("ar", "ar-SA", "en"); English for anything else. */
    public static UiLanguage of(String tag) {
        return tag != null && tag.toLowerCase(Locale.ROOT).startsWith("ar") ? ARABIC : ENGLISH;
    }

    /**
     * SQL selecting the display name in this language, falling back to the
     * other when the preferred column is blank.
     *
     * <p>The fallback is not optional: the archival tables are patchy in both
     * directions — plenty of stctltab rows carry only one of the two names —
     * and a blank combo entry tells the operator less than a name in the wrong
     * language does.
     *
     * @param alias the table alias the columns hang off, or "" for an
     *              unqualified query
     */
    public String nameExpr(String alias) {
        String q = alias == null || alias.isEmpty() ? "" : alias + ".";
        String preferred = q + (this == ARABIC ? "arabicName" : "englishName");
        String fallback = q + (this == ARABIC ? "englishName" : "arabicName");
        return "COALESCE(NULLIF(TRIM(" + preferred + "), ''), " + fallback + ")";
    }

    /**
     * A query template with every {@code {name:alias}} placeholder replaced by
     * {@link #nameExpr} for this language.
     */
    public String resolve(String template) {
        return NAME_TOKEN.matcher(template)
                .replaceAll(match -> Matcher.quoteReplacement(nameExpr(match.group(1))));
    }

    /**
     * {@link #resolve} run once per language.
     *
     * <p>Callers hold the result in a static field, so the substitution happens
     * at class-init and the queries stay the constants they were rather than
     * strings rebuilt on every call. Queries written inline at their call site
     * use {@link #resolve} directly instead.
     */
    public static Map<UiLanguage, String> localise(String template) {
        EnumMap<UiLanguage, String> byLanguage = new EnumMap<>(UiLanguage.class);
        for (UiLanguage language : values()) {
            byLanguage.put(language, language.resolve(template));
        }
        return Map.copyOf(byLanguage);
    }
}
