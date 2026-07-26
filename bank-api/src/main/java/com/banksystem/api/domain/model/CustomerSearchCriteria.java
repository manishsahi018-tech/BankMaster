package com.banksystem.api.domain.model;

/**
 * Customer search criteria — mirrors the legacy reqMsgSearch (service 16)
 * fields; the legacy client sends exactly one identifier at a time.
 */
public record CustomerSearchCriteria(
        String custNo,
        String idNo,
        String cardNo,
        String telNo,
        String telExt,
        String mobileNo,
        String firstName,
        String secondName,
        String lastName,
        String crNo,
        String mainCategoryCode,
        String subCategoryCode,
        String branchCode) {

    public boolean isEmpty() {
        return isBlank(custNo) && isBlank(idNo) && isBlank(cardNo) && isBlank(telNo)
                && isBlank(mobileNo) && isBlank(firstName) && isBlank(secondName)
                && isBlank(lastName) && isBlank(crNo) && isBlank(mainCategoryCode)
                && isBlank(subCategoryCode) && isBlank(branchCode);
    }

    private static boolean isBlank(String s) {
        return s == null || s.isBlank();
    }
}
