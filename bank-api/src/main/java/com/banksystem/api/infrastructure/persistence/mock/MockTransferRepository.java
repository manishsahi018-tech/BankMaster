package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.TransactionDetail;
import com.banksystem.api.domain.model.TransactionSummary;
import com.banksystem.api.domain.model.TransferDetail;
import com.banksystem.api.domain.model.TransferSummary;
import com.banksystem.api.domain.repository.TransferRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Profile("!denodo")
@Repository
public class MockTransferRepository implements TransferRepository {

    private static final List<TransferSummary> TRANSFERS = List.of(
            new TransferSummary("SR09011234", "20090215", "20090216", "01008078394501",
                    "608", "12500.000", "608", "12500.000", "P"),
            new TransferSummary("SR09015678", "20090610", "20090610", "01008078394503",
                    "608", "3200.000", "840", "853.330", "C"));

    private static final List<TransactionSummary> TRANSACTIONS = List.of(
            new TransactionSummary("TR00087651", "20090601", "20090601", "543", "1500.000", "00012", "01"),
            new TransactionSummary("TR00087652", "20090605", "20090605", "802", "250.500", "00013", "02"),
            new TransactionSummary("TR00087653", "20090612", "20090612", "543", "43447.590", "00014", "01"));

    @Override
    public List<TransferSummary> sarieTransfers(String accNo, String fromDate, String toDate,
                                                String refNo, String status) {
        return TRANSFERS.stream()
                .filter(t -> refNo == null || refNo.isBlank() || t.transRef().equals(refNo))
                .filter(t -> status == null || status.isBlank() || "A".equals(status)
                        || t.statusFlag().equals(status))
                .toList();
    }

    @Override
    public Optional<TransferDetail> transferDetail(String refNo, String transDate) {
        return TRANSFERS.stream()
                .filter(t -> t.transRef().equals(refNo))
                .findFirst()
                .map(t -> new TransferDetail(t.transRef(), t.issueDate(), t.valueDate(),
                        "01008212345601", t.drAccNo(), t.transCurrCode(), t.payCurrCode(),
                        t.netAmt(), t.payAmt(), "HUSSAIN SAEED KADEM", "AL NOOR TRADING EST",
                        "PO BOX 61128", "RIYADH 11565", "ARAB NATIONAL BANK", "1", "0",
                        "0127", "Kadem Hussain Saeed Abdulwahab", "TRADE", "1.0000000", ""));
    }

    @Override
    public List<TransactionSummary> bmTransactions(String accNo, String fromDate, String toDate,
                                                   String transType) {
        return TRANSACTIONS.stream()
                .filter(t -> transType == null || transType.isBlank() || "RR".equals(transType)
                        || t.transType().equals(transType))
                .toList();
    }

    @Override
    public Optional<TransactionDetail> bmTransactionDetail(String accNo, String refNo) {
        return TRANSACTIONS.stream()
                .filter(t -> t.transRef().equals(refNo))
                .findFirst()
                .map(t -> new TransactionDetail(accNo, t.transRef(),
                        "Kadem Hussain Saeed Abdulwahab", t.postDate(), t.valueDate(),
                        t.transAmt(), t.transType(), t.userId(), "52551", "1",
                        "SALARY CREDIT", "REF 2009/06 PAYROLL", ""));
    }
}
