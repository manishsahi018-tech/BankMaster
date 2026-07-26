package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.TransferService;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.TransactionDetail;
import com.banksystem.api.domain.model.TransactionSummary;
import com.banksystem.api.domain.model.TransferDetail;
import com.banksystem.api.domain.model.TransferSummary;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/** SARIE transfers + BM transactions — QUERY-SPECS.md §17–18. */
@RestController
@RequestMapping("/api")
public class TransferController {

    private final TransferService transfers;

    public TransferController(TransferService transfers) {
        this.transfers = transfers;
    }

    @GetMapping("/accounts/{accNo}/transfers")
    public PagedResult<TransferSummary> sarieTransfers(
            @PathVariable String accNo,
            @RequestParam String fromDate,
            @RequestParam String toDate,
            @RequestParam(required = false) String refNo,
            @RequestParam(defaultValue = "A") String status,
            @RequestParam(defaultValue = "0") int page) {
        return transfers.sarieTransfers(accNo, fromDate, toDate, refNo, status, page);
    }

    @GetMapping("/transfers/{refNo}")
    public TransferDetail transferDetail(
            @PathVariable String refNo,
            @RequestParam(required = false) String transDate) {
        return transfers.transferDetail(refNo, transDate);
    }

    @GetMapping("/accounts/{accNo}/transactions")
    public PagedResult<TransactionSummary> bmTransactions(
            @PathVariable String accNo,
            @RequestParam String fromDate,
            @RequestParam String toDate,
            @RequestParam(required = false) String transType,
            @RequestParam(defaultValue = "0") int page) {
        return transfers.bmTransactions(accNo, fromDate, toDate, transType, page);
    }

    @GetMapping("/accounts/{accNo}/transactions/{refNo}")
    public TransactionDetail bmTransactionDetail(
            @PathVariable String accNo, @PathVariable String refNo) {
        return transfers.bmTransactionDetail(accNo, refNo);
    }
}
