package com.banksystem.api.domain.model;

/**
 * Juristic profile page 2 — legacy frmJuristicAccountInfo ("Account
 * Details"): home-country address, the current/saving/other account
 * facility rows, signature nature and service flags. Enquiry subset only;
 * the legacy create/approve/reject maintenance path is out of scope.
 */
public record JuristicAccountInfo(
        String custNo,
        // Home country address
        String address1,
        String address2,
        String poBox,
        String zipCode,
        String city,
        String country,
        String offPhone,
        String resPhone,
        String fax,
        String mobile,
        String pager,
        String email,
        // Account facility rows
        String currentAcFlag,
        String currentAcCurrency,
        String currentAcStmtFreq,
        String currentAcChequeBook,
        String currentAcStatus,
        String savingAcFlag,
        String savingAcCurrency,
        String savingAcStmtFreq,
        String savingAcStatus,
        String otherAcLedger,
        String otherAcCurrency,
        String otherAcStmtFreq,
        String otherAcChequeBook,
        String otherAcStatus,
        // Signature + service flags
        String signatureNature,
        String internetFlag,
        String customerAdvice,
        String updateForSama,
        // Memos
        String relationshipManager,
        String generalMemo,
        String marketingMemo,
        String freezingGracePeriod) {
}
