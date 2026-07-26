package com.banksystem.api.domain.repository;

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

    List<TransferSummary> sarieTransfers(
            String accNo, String fromDate, String toDate, String refNo, String status);

    Optional<TransferDetail> transferDetail(String refNo, String transDate);

    /** transType: blank = all, "RR" = reversals only, else exact match. */
    List<TransactionSummary> bmTransactions(
            String accNo, String fromDate, String toDate, String transType);

    Optional<TransactionDetail> bmTransactionDetail(String accNo, String refNo);
}
