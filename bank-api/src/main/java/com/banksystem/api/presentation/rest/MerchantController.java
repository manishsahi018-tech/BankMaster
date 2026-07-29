package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.MerchantService;
import com.banksystem.api.domain.model.MerchantStatementPage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

/**
 * Merchant statements — legacy frmMerchantStmt (QUERY-SPECS.md §21).
 *
 * <p>In the legacy this screen does not go through cbcmssrv at all; it opens
 * its own socket to the acquiring/POS system named in mrchdata.ini. Routing it
 * through the API instead keeps one client contract, but the data still comes
 * from that external system rather than the archival schema — see
 * {@code MerchantRepository}.
 */
@RestController
@RequestMapping("/api/merchant")
public class MerchantController {

    private final MerchantService merchants;
    private final CallerResolver caller;

    public MerchantController(MerchantService merchants, CallerResolver caller) {
        this.merchants = merchants;
        this.caller = caller;
    }

    /**
     * One page of a statement. The client pages by sending back the previous
     * reply's {@code lastRecCount} until {@code completionFlag} is "1", exactly
     * as generateMerchStmt does.
     */
    @GetMapping("/statement")
    public MerchantStatementPage statement(
            @RequestParam String merchantNo,
            @RequestParam(defaultValue = "0") String stmtType,
            @RequestParam String fromDate,
            @RequestParam String toDate,
            @RequestParam(defaultValue = "00000") String lastTransPtr,
            HttpServletRequest request) {
        // Authority ~81 ("Merchant statement") is the legacy's only gate on
        // this screen — search.bas re-enables cmdMerchant on nothing else.
        if (!caller.resolve(request).has("~81")) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN,
                    "Merchant statement facilities require authority ~81");
        }
        return merchants.statement(merchantNo, stmtType, fromDate, toDate, lastTransPtr);
    }
}
