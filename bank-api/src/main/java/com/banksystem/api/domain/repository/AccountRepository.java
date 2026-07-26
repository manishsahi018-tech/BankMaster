package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.domain.model.BlockedAmountBreakup;
import com.banksystem.api.domain.model.ChequeBookHistory;
import com.banksystem.api.domain.model.StandingOrderDetail;
import com.banksystem.api.domain.model.StopChequeDetail;
import com.banksystem.api.domain.model.AcctUpdateHistoryEntry;
import com.banksystem.api.domain.model.ChequeBookRequest;
import com.banksystem.api.domain.model.SamaStatusEntry;
import com.banksystem.api.domain.model.StandingOrder;
import com.banksystem.api.domain.model.StopCheque;

import java.util.List;
import java.util.Optional;

/**
 * Account enquiries. Legacy: account search (service 21 — fully local,
 * balances from gld0data, no gateway call) plus the archival grids read
 * from stchqtab, sod0data, pyd0data and stacclog (service 57 serves the
 * update/status/SAMA histories with a requestType switch). Exact key
 * reads, filters and draft SQL: see QUERY-SPECS.md.
 */
public interface AccountRepository {

    List<AccountSummary> accountsForCustomer(String custNo);

    /**
     * The branch's balance-enquiry restriction flag — getRestrictedFlag
     * (cbothers.c:7877-7902) reads stctltab recType 'BD' for the branch and
     * takes {@code balEnqRestrictedFlag}.
     *
     * <p>Empty when the branch row is missing: the C ignores that failure
     * explicitly ("Error is IGNORED since it can cause total account enquiry
     * failure", cbbranch2.c:5872), leaving the flag unset — i.e. NOT restricted.
     */
    String branchBalEnqRestrictedFlag(String branchCode);

    /**
     * The operator's enquiry-allowed branches — stusrbrn (cbbranch2.c:5791-5809),
     * read only when the operator holds {@code ~86}.
     *
     * <p>FIDELITY GAP: the legacy record is {@code char allowedBranch[500][4]}
     * (cbslib/stlayout.h:2615); the archival view materialises only
     * Branchcode1..Branchcode5. A user with more than five permitted branches
     * cannot be represented — see the noOfBranchesDefined warning in the JDBC
     * implementation.
     */
    List<String> enquiryAllowedBranches(String userId);

    /**
     * The account-number branch of legacy service 21
     * (processAccSearchRequest, cbbranch2.c:5650-5723 / :5821-5838).
     *
     * <p>Unlike the customer branch — an index-3 range scan returning every
     * account of that customer — the account branch seeds index 1 with the
     * 13-char BM account and does a single {@code isRead(..., ISEQUAL)}: it
     * returns THAT account or nothing. Empty is a normal, successful result
     * (the C sends DONE with noOfRecs = 0), not an error.
     */
    java.util.Optional<AccountSummary> accountByNumber(String accNo);

    List<AcctUpdateHistoryEntry> updateHistory(String accNo);

    List<ChequeBookRequest> chequeBookRequests(String accNo);

    List<StandingOrder> standingOrders(String accNo);

    List<StopCheque> stopCheques(String accNo);

    List<SamaStatusEntry> samaStatusHistory(String accNo);

    /** Service 57 requestType '0' — account status changes incl. reason (QUERY-SPECS.md §7-8). */
    List<SamaStatusEntry> statusHistory(String accNo);

    /**
     * Account snapshot as of an update-history row — legacy service 33
     * requestType 01 reading stacclog / acclogYYYY. Returned map holds the
     * maintenance-screen field overrides for that point in time.
     */
    java.util.Map<String, String> snapshot(String accNo, String dateTime);

    /**
     * Current account master detail (gld0data) for the AccountMaintenance
     * screen — the live counterpart of {@link #snapshot}. Keys match the
     * screen's field names; empty map when the account is not found.
     */
    java.util.Map<String, String> accountDetail(String accNo);

    /** Point read + latest ststchqlog entry (QUERY-SPECS.md §10). */
    Optional<StopChequeDetail> stopChequeDetail(String accNo, String chequeNo);

    /** 4-table join incl. pending check (QUERY-SPECS.md §11). */
    Optional<StandingOrderDetail> standingOrderDetail(String accNo, String sodNo);

    /** Lifecycle audit of one stchqtab record (QUERY-SPECS.md §12). */
    Optional<ChequeBookHistory> chequeBookHistory(String accNo, String reqDate);

    /** Five-source union, max 31 rows (QUERY-SPECS.md §16). */
    BlockedAmountBreakup blockedAmountBreakup(String accNo);
}
