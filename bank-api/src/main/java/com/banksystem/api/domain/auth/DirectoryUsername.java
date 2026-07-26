package com.banksystem.api.domain.auth;

/**
 * Normalises the three shapes a user may type at the login form down to the bare
 * account name — {@code ANB\alice} / {@code alice@anb.com.sa} / {@code alice} all
 * become {@code alice}. The bare name is BankMaster's operator identity (the JWT
 * subject and the {@code userId} every authority gate keys on), so both the AD
 * bind and the local lookup must agree on it.
 *
 * <p>Copied from the LoanOriginationSystem auth slice.
 */
public final class DirectoryUsername {

    private DirectoryUsername() {
    }

    /**
     * {@code ANB\alice} &rarr; {@code alice} · {@code alice@anb.com.sa} &rarr;
     * {@code alice} · {@code alice} &rarr; {@code alice}. Null or blank input
     * yields {@code ""}.
     */
    public static String bare(String username) {
        if (username == null) {
            return "";
        }
        String name = username.trim();
        int backslash = name.lastIndexOf('\\');
        if (backslash >= 0) {
            name = name.substring(backslash + 1);
        }
        int at = name.indexOf('@');
        if (at > 0) {
            name = name.substring(0, at);
        }
        return name.trim();
    }
}
