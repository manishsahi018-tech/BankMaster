package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.TransactionDetail;
import com.banksystem.api.domain.model.TransactionSummary;
import com.banksystem.api.domain.model.TransferDetail;
import com.banksystem.api.domain.model.TransferSummary;

import java.util.List;
import java.util.Optional;

/**
 * SARIE transfers (rid0data) and BankMaster transactions (thd0data) —
 * fully local in legacy (cbswift.c). See QUERY-SPECS.md §17–18.
 */
public interface TransferRepository {

    /**
     * One page of SARIE transfers. Paged in the QUERY, not in Java: the JDBC
     * implementation windows the scan with OFFSET/FETCH FIRST so a page costs
     * one bounded read of rid0data instead of a full-range read that is then
     * sliced. {@code page} is zero-based and sized by
     * {@link PagedResult#PAGE_SIZE}.
     */
    PagedResult<TransferSummary> sarieTransfers(
            String accNo, String fromDate, String toDate, String refNo, String status, int page);

    Optional<TransferDetail> transferDetail(String refNo, String transDate);

    /** transType: blank = all, "RR" = reversals only, else exact match. */
    List<TransactionSummary> bmTransactions(
            String accNo, String fromDate, String toDate, String transType);

    Optional<TransactionDetail> bmTransactionDetail(String accNo, String refNo);
}
