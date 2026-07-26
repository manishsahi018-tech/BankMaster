package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.SadadTransaction;

import java.util.List;

/**
 * SADAD transaction history — stsadadlog (QUERY-SPECS.md §19).
 * NOTE: live bill enquiry is NOT here — legacy calls the SADAD network
 * (Tuxedo UTBLENQ/SADBILLENQ); that integration is a separate decision.
 */
public interface SadadRepository {

    List<SadadTransaction> transactions(
            String companyId, String transDate, String tellerId, String subscriptionNo);
}
