package com.banksystem.api.application;

import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.SignatoryDetail;
import com.banksystem.api.domain.model.SignatorySummary;
import com.banksystem.api.domain.repository.SignatoryRepository;
import org.springframework.stereotype.Service;

/** Signatory enquiry use cases — QUERY-SPECS.md §20 (frmJuristicSignatory). */
@Service
public class SignatoryService {

    private final SignatoryRepository signatories;

    public SignatoryService(SignatoryRepository signatories) {
        this.signatories = signatories;
    }

    public PagedResult<SignatorySummary> byCustomer(String custNo, int page) {
        return PagedResult.page(signatories.byCustomer(custNo), page);
    }

    public PagedResult<SignatorySummary> byAccount(String accNo, int page) {
        return PagedResult.page(signatories.byAccount(accNo), page);
    }

    public SignatoryDetail detail(String accNo, String signatoryNo) {
        return signatories.detail(accNo, signatoryNo).orElseThrow(() ->
                new NotFoundException("Signatory not found"));
    }
}
