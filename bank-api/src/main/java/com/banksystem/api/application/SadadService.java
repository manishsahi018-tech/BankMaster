package com.banksystem.api.application;

import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.SadadTransaction;
import com.banksystem.api.domain.repository.SadadRepository;
import org.springframework.stereotype.Service;

/** SADAD transaction history use case — stsadadlog (QUERY-SPECS.md §19). */
@Service
public class SadadService {

    private final SadadRepository sadad;

    public SadadService(SadadRepository sadad) {
        this.sadad = sadad;
    }

    public PagedResult<SadadTransaction> transactions(
            String companyId, String transDate, String tellerId, String subscriptionNo, int page) {
        return PagedResult.page(
                sadad.transactions(companyId, transDate, tellerId, subscriptionNo), page);
    }
}
