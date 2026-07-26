package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.AccountService;
import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.domain.model.AcctUpdateHistoryEntry;
import com.banksystem.api.domain.model.BlockedAmountBreakup;
import com.banksystem.api.domain.model.ChequeBookHistory;
import com.banksystem.api.domain.model.ChequeBookRequest;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.SamaStatusEntry;
import com.banksystem.api.domain.model.StandingOrder;
import com.banksystem.api.domain.model.StandingOrderDetail;
import com.banksystem.api.domain.model.StopCheque;
import com.banksystem.api.domain.model.StopChequeDetail;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * Account enquiries: legacy service 21 (account search, online source) and
 * the archival grids (stacclog / stchqtab / sod0data / pyd0data / stsamaacc).
 */
@RestController
@RequestMapping("/api")
public class AccountController {

    private final AccountService accounts;

    public AccountController(AccountService accounts) {
        this.accounts = accounts;
    }

    @GetMapping("/customers/{custNo}/accounts")
    public PagedResult<AccountSummary> accountsForCustomer(
            @PathVariable String custNo,
            @RequestParam(defaultValue = "0") int page) {
        return accounts.accountsForCustomer(custNo, page);
    }

    @GetMapping("/accounts/{accNo}/update-history")
    public PagedResult<AcctUpdateHistoryEntry> updateHistory(
            @PathVariable String accNo,
            @RequestParam(defaultValue = "0") int page) {
        return accounts.updateHistory(accNo, page);
    }

    @GetMapping("/accounts/{accNo}/chequebook-requests")
    public List<ChequeBookRequest> chequeBookRequests(@PathVariable String accNo) {
        return accounts.chequeBookRequests(accNo);
    }

    @GetMapping("/accounts/{accNo}/standing-orders")
    public List<StandingOrder> standingOrders(@PathVariable String accNo) {
        return accounts.standingOrders(accNo);
    }

    @GetMapping("/accounts/{accNo}/stop-cheques")
    public List<StopCheque> stopCheques(@PathVariable String accNo) {
        return accounts.stopCheques(accNo);
    }

    @GetMapping("/accounts/{accNo}/sama-status-history")
    public List<SamaStatusEntry> samaStatusHistory(@PathVariable String accNo) {
        return accounts.samaStatusHistory(accNo);
    }

    @GetMapping("/accounts/{accNo}/status-history")
    public List<SamaStatusEntry> statusHistory(@PathVariable String accNo) {
        return accounts.statusHistory(accNo);
    }

    @GetMapping("/accounts/{accNo}/snapshot/{dateTime}")
    public Map<String, String> snapshot(
            @PathVariable String accNo, @PathVariable String dateTime) {
        return accounts.snapshot(accNo, dateTime);
    }

    @GetMapping("/accounts/{accNo}/stop-cheques/{chequeNo}")
    public StopChequeDetail stopChequeDetail(
            @PathVariable String accNo, @PathVariable String chequeNo) {
        return accounts.stopChequeDetail(accNo, chequeNo);
    }

    @GetMapping("/accounts/{accNo}/standing-orders/{sodNo}")
    public StandingOrderDetail standingOrderDetail(
            @PathVariable String accNo, @PathVariable String sodNo) {
        return accounts.standingOrderDetail(accNo, sodNo);
    }

    @GetMapping("/accounts/{accNo}/chequebook-requests/{reqDate}/history")
    public ChequeBookHistory chequeBookHistory(
            @PathVariable String accNo, @PathVariable String reqDate) {
        return accounts.chequeBookHistory(accNo, reqDate);
    }

    @GetMapping("/accounts/{accNo}/blocked-amount-breakup")
    public BlockedAmountBreakup blockedAmountBreakup(@PathVariable String accNo) {
        return accounts.blockedAmountBreakup(accNo);
    }
}
