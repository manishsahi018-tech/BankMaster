package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.SignatoryService;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.SignatoryDetail;
import com.banksystem.api.domain.model.SignatorySummary;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/** Signatory enquiries — QUERY-SPECS.md §20 (frmJuristicSignatory). */
@RestController
@RequestMapping("/api")
public class SignatoryController {

    private final SignatoryService signatories;

    public SignatoryController(SignatoryService signatories) {
        this.signatories = signatories;
    }

    @GetMapping("/customers/{custNo}/signatories")
    public PagedResult<SignatorySummary> byCustomer(
            @PathVariable String custNo,
            @RequestParam(defaultValue = "0") int page) {
        return signatories.byCustomer(custNo, page);
    }

    @GetMapping("/accounts/{accNo}/signatories")
    public PagedResult<SignatorySummary> byAccount(
            @PathVariable String accNo,
            @RequestParam(defaultValue = "0") int page) {
        return signatories.byAccount(accNo, page);
    }

    @GetMapping("/accounts/{accNo}/signatories/{signatoryNo}")
    public SignatoryDetail detail(
            @PathVariable String accNo, @PathVariable String signatoryNo) {
        return signatories.detail(accNo, signatoryNo);
    }
}
