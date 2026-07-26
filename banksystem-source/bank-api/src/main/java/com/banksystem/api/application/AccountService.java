package com.banksystem.api.application;

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
import com.banksystem.api.domain.repository.AccountRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Account enquiry use cases: legacy service 21 (account search) plus the
 * archival grids (stacclog / stchqtab / sod0data / pyd0data / stsamaacc).
 * Owns pagination and not-found semantics; data access stays behind
 * AccountRepository.
 */
@Service
public class AccountService {

    private final AccountRepository accounts;

    public AccountService(AccountRepository accounts) {
        this.accounts = accounts;
    }

    public PagedResult<AccountSummary> accountsForCustomer(String custNo, int page) {
        return PagedResult.page(accounts.accountsForCustomer(custNo), page);
    }

    public PagedResult<AcctUpdateHistoryEntry> updateHistory(String accNo, int page) {
        return PagedResult.page(accounts.updateHistory(accNo), page);
    }

    public List<ChequeBookRequest> chequeBookRequests(String accNo) {
        return accounts.chequeBookRequests(accNo);
    }

    public List<StandingOrder> standingOrders(String accNo) {
        return accounts.standingOrders(accNo);
    }

    public List<StopCheque> stopCheques(String accNo) {
        return accounts.stopCheques(accNo);
    }

    public List<SamaStatusEntry> samaStatusHistory(String accNo) {
        return accounts.samaStatusHistory(accNo);
    }

    public List<SamaStatusEntry> statusHistory(String accNo) {
        return accounts.statusHistory(accNo);
    }

    public Map<String, String> snapshot(String accNo, String dateTime) {
        return accounts.snapshot(accNo, dateTime);
    }

    public StopChequeDetail stopChequeDetail(String accNo, String chequeNo) {
        return accounts.stopChequeDetail(accNo, chequeNo).orElseThrow(() ->
                new NotFoundException("Stop cheque not found"));
    }

    public StandingOrderDetail standingOrderDetail(String accNo, String sodNo) {
        return accounts.standingOrderDetail(accNo, sodNo).orElseThrow(() ->
                new NotFoundException("Standing order not found"));
    }

    public ChequeBookHistory chequeBookHistory(String accNo, String reqDate) {
        return accounts.chequeBookHistory(accNo, reqDate).orElseThrow(() ->
                new NotFoundException("Cheque book request not found"));
    }

    public BlockedAmountBreakup blockedAmountBreakup(String accNo) {
        return accounts.blockedAmountBreakup(accNo);
    }
}
