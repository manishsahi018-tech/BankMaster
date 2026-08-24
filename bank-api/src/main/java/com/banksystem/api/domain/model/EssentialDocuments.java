package com.banksystem.api.domain.model;

import java.util.List;

/**
 * The frmDocuments payload: what the customer's SAMA sub-category REQUIRES and
 * what the customer actually SUBMITTED.
 *
 * <p>{@code required} comes from stctltabDC (documnetNo1..20 for the
 * main+sub category), matching the legacy's {@code categorydocinfo.documents}
 * read (frmDocuments.frm:322-324).
 *
 * <p>{@code supplied} and {@code other} come from the customer record itself —
 * stcusttab.documentsSupplied (60 chars of 3-char codes) and
 * stcusttab.documentOther (50 chars). Those are the two globals the legacy form
 * renders into lstSelectedDoc and txtDocOthers (frmDocuments.frm:376-392); they
 * reach it as {@code recvSaudiIndividualMsg.documents} /
 * {@code .documentOther} (globalFunctions.bas:5256-5259), which the C server
 * fills straight from the customer table
 * ({@code strncpy(...documents, custTabRec.documentsSupplied, 60)}, cbothers.c:3168).
 *
 * <p>Codes only, because there is nothing here to resolve them against: the
 * legacy looked names up in a documentinfo table in the branch PC's LOCAL
 * Access database (frmDocuments.frm:337), which has no archival counterpart.
 * The UI resolves them against the stctltab 'DT' code set instead.
 */
public record EssentialDocuments(List<String> required, List<String> supplied, String other) {

    public static final EssentialDocuments EMPTY = new EssentialDocuments(List.of(), List.of(), "");

    /**
     * Splits a documentsSupplied string into its 3-char codes.
     *
     * <p>Stops at the first blank triplet, as the legacy's category loop does
     * ({@code If Len(Trim(tCode)) = 0 Then Exit For}, frmDocuments.frm:331) —
     * the field is space-padded to 60, so everything after the last code is
     * filler, not data.
     */
    public static List<String> splitCodes(String packed) {
        String s = packed == null ? "" : packed;
        List<String> codes = new java.util.ArrayList<>();
        for (int i = 0; i + 3 <= s.length(); i += 3) {
            String code = s.substring(i, i + 3).trim();
            if (code.isEmpty()) {
                break;
            }
            codes.add(code);
        }
        return List.copyOf(codes);
    }
}
