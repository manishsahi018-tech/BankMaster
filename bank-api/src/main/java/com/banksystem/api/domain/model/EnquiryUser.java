package com.banksystem.api.domain.model;

/**
 * The operator behind an enquiry, for the checks the legacy drives off the
 * request's userId.
 *
 * <p>The C reads stuser by {@code receivedMsg.accSearch.userId} and flattens
 * {@code authorityLevel} (20 chars) + {@code authorityLevel2} (60) into one
 * {@code ~NN} string (cbbranch2.c:5765-5788); here both halves arrive in the
 * JWT and are already in {@code ~NN} form.
 */
public record EnquiryUser(String userId, String authority) {

    /** No operator resolved — nothing is authority-gated. */
    public static EnquiryUser anonymous() {
        return new EnquiryUser("", "");
    }

    /** True when the flattened authority string carries this {@code ~NN} code. */
    public boolean has(String code) {
        return authority != null && authority.contains(code);
    }
}
