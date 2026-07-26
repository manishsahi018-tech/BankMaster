package com.banksystem.api.domain.model;

/**
 * One identification document from stidtab (idCategory 'C' = customer's own).
 * The legacy frmIndividualSaudi shows five such rows — ID Number, Passport,
 * Hafiza, Sama Auth and Family Regn — each with the same
 * number / issued-at / date-type / issue / expiry shape.
 *
 * <p>idType maps to a screen row. On the Saudi form (cbsaudi.c:2864):
 * {@code I} = ID Number, {@code P} = Passport, {@code H} = Hafiza,
 * {@code F} = Family Regn, and {@code S} or {@code E} (succession deed) both
 * collapse into the Sama Auth row. On the Others form (cbothers.c:2992-3060):
 * {@code Q} = Iqama, {@code P} = Passport, {@code V} = Visa. On the juristic
 * form (cbjuristic.c:3098-3170): {@code C} = commercial registration,
 * {@code L} = licence, {@code S} = Sama auth, {@code A} = approval reference,
 * {@code T} = contract, {@code D} = diplomatic card.
 *
 * <p>Both date forms always travel; {@code idDateType} selects which one the
 * screen shows ("0" or blank = Hijri, anything else = Gregorian).
 *
 * <p>{@code iqamaType} is meaningful only on the {@code Q} row —
 * "0" = Book, "1" = Plastic (cbserver.h:522). {@code idRefName} carries the
 * Approver Name on the juristic {@code A} row.
 */
public record IdDocument(
        String idType,
        String idNo,
        String idIssuedAt,
        String idDateType,
        String iqamaType,
        String idIssueDateH,
        String idIssueDateG,
        String idExpiryDateH,
        String idExpiryDateG,
        String idRefName) {
}
