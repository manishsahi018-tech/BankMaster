package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.StatementService;
import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.model.HistoricalStatement;
import jakarta.servlet.http.HttpServletRequest;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

/**
 * Historical statements — legacy frmHistStmt (the frmAccount cmdHistStmt
 * button), served from DB #3.
 *
 * <p>Unlike every other enquiry here the legacy read this from a mapped drive
 * rather than from cbcmssrv: a Btrieve index per branch per month naming zipped,
 * pre-rendered page files. There is consequently no service code to map to —
 * see {@code StatementRepository}.
 */
@RestController
@RequestMapping("/api")
public class StatementController {

    private final StatementService statements;
    private final CallerResolver caller;

    public StatementController(StatementService statements, CallerResolver caller) {
        this.statements = statements;
        this.caller = caller;
    }

    /**
     * Every archived statement for the account in the period, oldest first.
     *
     * <p>The period is month-granular because the legacy form is: From Year +
     * From Month and To Year + To Month, no day. Both bounds are inclusive.
     *
     * <p>{@code system} selects which of DB #3's two archives to read — BM or
     * PDP. It has no legacy counterpart: the Btrieve arrangement the screen
     * replaced held one index tree and there was nothing to choose between.
     * Exactly one archive is read, so the answer is never a merge of both.
     */
    @GetMapping("/accounts/{accNo}/historical-statement")
    public List<HistoricalStatement> historicalStatement(
            @PathVariable String accNo,
            @RequestParam String branchCode,
            @RequestParam String fromYearMonth,
            @RequestParam String toYearMonth,
            @RequestParam(defaultValue = "BM") String system,
            @RequestParam(defaultValue = "false") boolean deletedAccount,
            HttpServletRequest request) {

        EnquiryUser user = caller.resolve(request);
        // frmAccount.frm:1822-1865 — cmdHistStmt is enabled for ~60 (view-only),
        // ~61 (full) and ~62 (teller ops) alike, the same three that gate the
        // rest of the account facility buttons.
        if (!user.has("~60") && !user.has("~61") && !user.has("~62")) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN,
                    "Historical statements require account enquiry authority (~60, ~61 or ~62)");
        }
        // The deleted-account route carries its own authority. The legacy gates
        // it by ENABLING the account-number box only for ~87
        // (frmCustomerSearch.frm:1180) — without it the operator cannot type an
        // account, so the route is unusable. A disabled input is not a control,
        // so the rule is enforced here as well as reflected on the screen.
        if (deletedAccount && !user.has("~87")) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN,
                    "Historical statements for deleted accounts require authority ~87");
        }
        return statements.historicalStatements(
                accNo, branchCode, fromYearMonth, toYearMonth, system, deletedAccount, user);
    }
}
