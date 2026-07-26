package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.SadadService;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.SadadTransaction;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * SADAD transaction history — QUERY-SPECS.md §19. Live bill enquiry
 * (UTBLENQ/SADBILLENQ gateway) is intentionally NOT scaffolded — pending
 * a decision on the SADAD integration in the revamp.
 */
@RestController
@RequestMapping("/api/sadad")
public class SadadController {

    private final SadadService sadad;

    public SadadController(SadadService sadad) {
        this.sadad = sadad;
    }

    @GetMapping("/transactions")
    public PagedResult<SadadTransaction> transactions(
            @RequestParam(required = false) String companyId,
            @RequestParam(required = false) String transDate,
            @RequestParam(required = false) String tellerId,
            @RequestParam(required = false) String subscriptionNo,
            @RequestParam(defaultValue = "0") int page) {
        return sadad.transactions(companyId, transDate, tellerId, subscriptionNo, page);
    }
}
