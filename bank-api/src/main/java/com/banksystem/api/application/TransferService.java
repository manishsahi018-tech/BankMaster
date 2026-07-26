package com.banksystem.api.application;

import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.TransactionDetail;
import com.banksystem.api.domain.model.TransactionSummary;
import com.banksystem.api.domain.model.TransferDetail;
import com.banksystem.api.domain.model.TransferSummary;
import com.banksystem.api.domain.repository.TransferRepository;
import org.springframework.stereotype.Service;

/** SARIE transfer + BM transaction use cases — QUERY-SPECS.md §17–18. */
@Service
public class TransferService {

    private final TransferRepository transfers;

    public TransferService(TransferRepository transfers) {
        this.transfers = transfers;
    }

    public PagedResult<TransferSummary> sarieTransfers(
            String accNo, String fromDate, String toDate, String refNo, String status, int page) {
        return PagedResult.page(
                transfers.sarieTransfers(accNo, fromDate, toDate, refNo, status), page);
    }

    public TransferDetail transferDetail(String refNo, String transDate) {
        return transfers.transferDetail(refNo, transDate).orElseThrow(() ->
                new NotFoundException("Transfer not found"));
    }

    public PagedResult<TransactionSummary> bmTransactions(
            String accNo, String fromDate, String toDate, String transType, int page) {
        return PagedResult.page(
                transfers.bmTransactions(accNo, fromDate, toDate, transType), page);
    }

    public TransactionDetail bmTransactionDetail(String accNo, String refNo) {
        return transfers.bmTransactionDetail(accNo, refNo).orElseThrow(() ->
                new NotFoundException("Transaction details not found"));
    }
}
