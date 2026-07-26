package com.banksystem.api.domain.model;

/**
 * Operator session/login response — subset of the legacy resMsgLogin
 * (cbserver.h, service 00) that the UI consumes.
 */
public record SessionInfo(
        String userId,
        String userName,
        String branchCode,
        String authorityLevel,
        String authorityLevel2,
        String langPref,
        String bankingDate,
        String currentDateH,
        String currentDateG,
        String nameSearchAllowed,
        String idleTimeOutPeriod) {
}
