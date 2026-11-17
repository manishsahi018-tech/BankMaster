package com.banksystem.api.application;

import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.domain.model.AcctUpdateHistoryEntry;
import com.banksystem.api.domain.model.BlockedAmountBreakup;
import com.banksystem.api.domain.model.ChequeBookHistory;
import com.banksystem.api.domain.model.ChequeBookRequest;
import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.SamaStatusEntry;
import com.banksystem.api.domain.model.StandingOrder;
import com.banksystem.api.domain.model.StandingOrderDetail;
import com.banksystem.api.domain.model.StopCheque;
import com.banksystem.api.domain.model.StopChequeDetail;
import com.banksystem.api.domain.repository.AccountRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
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

    public PagedResult<AccountSummary> accountsForCustomer(String custNo, int page, EnquiryUser user) {
        return PagedResult.page(applyBalEnqRestriction(accounts.accountsForCustomer(custNo), user), page);
    }

    /**
     * Per-row balance-enquiry restriction — cbbranch2.c:5867-5888, applied to
     * both service-21 branches:
     *
     * <pre>
     *   balEnqRestricted = '0'                                       // :5867
     *   if (strncmp(&tAccNo[5], "0002000", 7) > 0) {                 // :5868
     *       getRestrictedFlag(gldRec.branchCode);   // failure IGNORED  :5870-5873
     *       if (ctlRec.balEnqRestrictedFlag == '1') {                // :5875
     *           if (strstr(tmpAuthLevel, "~86") != NULL) {           // :5877
     *               balEnqRestricted = branch in allowed list ? '0' : '1';
     *           } else
     *               balEnqRestricted = '1';                          // :5886
     *       }
     *   }
     * </pre>
     *
     * Note the inversion: ~86 GRANTS branch-scoped access. Without it the
     * operator is restricted outright on any branch whose flag is set.
     *
     * <p>Currently a NO-OP: {@link EnquiryRestrictions#ENABLED} is off, so every
     * row keeps its real balances and none is marked restricted. The rule below
     * is the transcription of the C and stays here for when the switch goes back
     * on.
     */
    private List<AccountSummary> applyBalEnqRestriction(List<AccountSummary> rows, EnquiryUser user) {
        if (rows.isEmpty()) {
            return rows;
        }
        if (!EnquiryRestrictions.ENABLED) {
            // Both repositories already build every row with balEnqRestricted
            // "0" (the C's own initial value, cbbranch2.c:5867), so the rows go
            // out exactly as the source produced them — nothing to unset.
            return rows;
        }
        boolean has86 = user.has("~86");
        // stusrbrn is read only under ~86 (cbbranch2.c:5791)
        List<String> allowed = has86 ? accounts.enquiryAllowedBranches(user.userId()) : List.of();
        Map<String, String> flagByBranch = new HashMap<>();

        List<AccountSummary> out = new ArrayList<>(rows.size());
        for (AccountSummary r : rows) {
            boolean restricted = restrictedFor(r, has86, allowed, flagByBranch);
            // The client zeroes all four money columns on a restricted row
            // (frmAccount.frm:1725-1731). Do it here instead: the balance must
            // not cross the wire to an operator who may not see it.
            out.add(new AccountSummary(
                    r.accountNumber(),
                    restricted ? "0" : r.bookBalance(),
                    restricted ? "0" : r.clearedBalance(),
                    restricted ? "0" : r.blockedBalance(),
                    r.accountStatus(),
                    restricted ? "0" : r.creditLimit(),
                    r.dormantFlag(), r.branchCode(),
                    restricted ? "1" : "0"));
        }
        return out;
    }

    private boolean restrictedFor(AccountSummary row, boolean has86, List<String> allowed,
            Map<String, String> flagByBranch) {
        // :5868 — the customer embedded at accNo[5..11] must exceed "0002000".
        String cust = row.accountNumber() == null ? "" : row.accountNumber();
        cust = cust.length() >= 12 ? cust.substring(5, 12) : "";
        if (cust.compareTo("0002000") <= 0) {
            return false;
        }
        String branch = row.branchCode() == null ? "" : row.branchCode().trim();
        String flag = flagByBranch.computeIfAbsent(branch, accounts::branchBalEnqRestrictedFlag);
        if (!"1".equals(flag == null ? "" : flag.trim())) {
            return false;   // flag unset, or the branch row is missing (:5872)
        }
        return !has86 || !allowed.contains(branch);
    }

    /**
     * The account-number branch of legacy service 21: an exact read returning
     * that one account, or an empty grid. The C sends DONE with noOfRecs = 0
     * when the account is not found (cbbranch2.c:5823-5837), so "not found" is
     * an empty page, never a 404.
     */
    public PagedResult<AccountSummary> accountByNumber(String accNo, EnquiryUser user) {
        List<AccountSummary> rows = accounts.accountByNumber(accNo).map(List::of).orElseGet(List::of);
        return PagedResult.page(applyBalEnqRestriction(rows, user), 0);
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

    public Map<String, String> accountDetail(String accNo) {
        return accounts.accountDetail(accNo);
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
