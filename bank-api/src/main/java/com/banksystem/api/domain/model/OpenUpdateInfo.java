package com.banksystem.api.domain.model;

/**
 * The "Open Update Details" / "Update Details" frames at the foot of the
 * legacy customer screens — always read-only, in every action mode.
 *
 * <p>Legacy source is getCustomerOpenUpdateInfo (cbothers.c:3218-3394): the
 * OPEN* fields come from the customer's <em>earliest</em> stcustlog row and
 * the UPDATE* fields from the <em>latest</em>. Within a row, {@code userId} is
 * the Maker and {@code lastUpdateUser} the Supervisor.
 */
public record OpenUpdateInfo(
        String openDate,
        String openBranch,
        String openMakerId,
        String openSupervisorId,
        String lastUpdateDate,
        String updateBranch,
        String updateMakerId,
        String updateSupervisorId) {

    /** Nothing known — every field blank, so the frame renders empty boxes. */
    public static OpenUpdateInfo empty() {
        return new OpenUpdateInfo("", "", "", "", "", "", "", "");
    }
}
