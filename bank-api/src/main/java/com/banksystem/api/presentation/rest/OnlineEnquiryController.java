package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.OnlineEnquiryService;
import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.model.OnlineStatementPage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

/**
 * The two online-gateway enquiries — legacy frmInputform (service 07) and
 * frmTransaction (service 11), the frmAccount cmdStatement and cmdTransaction
 * buttons.
 *
 * <p>The legacy reached these over a separate gateway socket, but the server on
 * the far end (cbrt01) read the same local thd0data every other transaction
 * screen reads — so they belong in the archival schema like the rest, and the
 * repository is simply unwritten. See {@code OnlineEnquiryRepository}. Both
 * page by sending back the previous reply's {@code lastTransPtr} until
 * {@code completionFlag} is "1".
 */
@RestController
@RequestMapping("/api/accounts/{accNo}")
public class OnlineEnquiryController {

    private final OnlineEnquiryService gateway;
    private final CallerResolver caller;

    public OnlineEnquiryController(OnlineEnquiryService gateway, CallerResolver caller) {
        this.gateway = gateway;
        this.caller = caller;
    }

    @GetMapping("/ondemand-statement")
    public OnlineStatementPage onDemandStatement(
            @PathVariable String accNo,
            @RequestParam String fromDate,
            @RequestParam String toDate,
            @RequestParam(defaultValue = "00000") String lastTransPtr,
            HttpServletRequest request) {
        return gateway.onDemandStatement(
                accNo, fromDate, toDate, lastTransPtr, requireAccountEnquiry(request));
    }

    /**
     * No {@code toDate} parameter, on purpose — the legacy sends spaces and lets
     * the gateway supply its own current date, because the branch PC's clock
     * could not be trusted (frmTransaction.frm:860-864).
     */
    @GetMapping("/online-transactions")
    public OnlineStatementPage transactionEnquiry(
            @PathVariable String accNo,
            @RequestParam(defaultValue = "") String fromDate,
            @RequestParam(defaultValue = "") String startTrans,
            @RequestParam(defaultValue = "00000") String lastTransPtr,
            HttpServletRequest request) {
        return gateway.transactionEnquiry(
                accNo, fromDate, startTrans, lastTransPtr, requireAccountEnquiry(request));
    }

    /**
     * frmAccount.frm:1822-1865 — cmdStatement and cmdTransaction sit in the same
     * authority branch as the rest of the account facility buttons: ~60
     * view-only, ~61 full and ~62 teller ops all get them.
     */
    private EnquiryUser requireAccountEnquiry(HttpServletRequest request) {
        EnquiryUser user = caller.resolve(request);
        if (!user.has("~60") && !user.has("~61") && !user.has("~62")) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN,
                    "This enquiry requires account enquiry authority (~60, ~61 or ~62)");
        }
        return user;
    }
}
