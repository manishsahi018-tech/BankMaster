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

    /** Point read + latest ststchqlog entry (QUERY-SPECS.md §10). */
    Optional<StopChequeDetail> stopChequeDetail(String accNo, String chequeNo);

    /** 4-table join incl. pending check (QUERY-SPECS.md §11). */
    Optional<StandingOrderDetail> standingOrderDetail(String accNo, String sodNo);

    /** Lifecycle audit of one stchqtab record (QUERY-SPECS.md §12). */
    Optional<ChequeBookHistory> chequeBookHistory(String accNo, String reqDate);

    /** Five-source union, max 31 rows (QUERY-SPECS.md §16). */
    BlockedAmountBreakup blockedAmountBreakup(String accNo);
}
