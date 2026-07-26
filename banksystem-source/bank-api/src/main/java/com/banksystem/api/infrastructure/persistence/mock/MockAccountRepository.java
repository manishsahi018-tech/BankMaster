package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.domain.model.BlockedAmountBreakup;
import com.banksystem.api.domain.model.BlockedAmountItem;
import com.banksystem.api.domain.model.ChequeBookHistory;
import com.banksystem.api.domain.model.StandingOrderDetail;
import com.banksystem.api.domain.model.StopChequeDetail;
import com.banksystem.api.domain.model.AcctUpdateHistoryEntry;
import com.banksystem.api.domain.model.ChequeBookRequest;
import com.banksystem.api.domain.model.SamaStatusEntry;
import com.banksystem.api.domain.model.StandingOrder;
import com.banksystem.api.domain.model.StopCheque;
import com.banksystem.api.domain.repository.AccountRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Mock data shaped like the archival records (raw YYYYMMDD /
 * YYYYMMDDHH24MISS values; the UI formats them). Replaced by JDBC
 * implementations once the two database engines are known.
 */
@Profile("!denodo")
@Repository
public class MockAccountRepository implements AccountRepository {

    @Override
    public List<AccountSummary> accountsForCustomer(String custNo) {
        return List.of(
                new AccountSummary("01008078394500", "0.00", "0.00", "0.00", "08-Enquiry restricted", "0", "0"),
                new AccountSummary("01008078394501", "40.75", "40.75", "0.00", "00-Open", "0", "0"),
                new AccountSummary("01008078394502", "53.70", "53.70", "0.00", "04-No debits", "0", "1"),
                new AccountSummary("01008078394503", "43447.59", "43447.59", "0.00", "00-Open", "0", "0"));
    }

    @Override
    public List<AcctUpdateHistoryEntry> updateHistory(String accNo) {
        return List.of(
                new AcctUpdateHistoryEntry("0128", "52302", "20080426111305", "9-Update successful", "54567", "20080426111551"),
                new AcctUpdateHistoryEntry("0480", "81250", "20080429152233", "9-Update successful", "81248", "20080503155637"),
                new AcctUpdateHistoryEntry("0716", "83415", "20090530115908", "9-Update successful", "1_RET_MAIL", "20090530115908"));
    }

    @Override
    public List<ChequeBookRequest> chequeBookRequests(String accNo) {
        return List.of(
                new ChequeBookRequest("0127", "54302", "1", "01", "20080315", "3", "00012501", "00012550"),
                new ChequeBookRequest("0127", "80233", "1", "02", "20090610", "1", "00012551", "00012650"));
    }

    @Override
    public List<StandingOrder> standingOrders(String accNo) {
        return List.of(
                new StandingOrder("000001", "0", "1500.000", "01008212345601", "1", "M"),
                new StandingOrder("000002", "2", "350.000", "02009944556602", "0", "M"));
    }

    @Override
    public List<StopCheque> stopCheques(String accNo) {
        return List.of(
                new StopCheque("00012507", "2750.000", "20090214", "AL RAJHI TRADING", ""),
                new StopCheque("00012533", "0.000", "20091102", "", "00012530"));
    }

    @Override
    public Optional<StopChequeDetail> stopChequeDetail(String accNo, String chequeNo) {
        return stopCheques(accNo).stream()
                .filter(s -> s.chequeNo().equals(chequeNo))
                .findFirst()
                .map(s -> new StopChequeDetail(accNo, s.chequeNo(), s.amount(), s.dateStop(),
                        s.payeeName(), s.chequeFrom(), "54302"));
    }

    @Override
    public Optional<StandingOrderDetail> standingOrderDetail(String accNo, String sodNo) {
        return standingOrders(accNo).stream()
                .filter(s -> s.sodNo().equals(sodNo))
                .findFirst()
                .map(s -> new StandingOrderDetail(accNo, s.sodNo(), s.orderType(),
                        s.paymentType(), "0", s.paymentFrequency(),
                        "20080101", "20090801", "20120101", "20090701",
                        "048", "018", "0", "0", "0",
                        "0000000000", s.paymentAmt(), "27000.000", "72000.000",
                        s.payAccNo(), "Kadem Hussain Saeed Abdulwahab",
                        "STANDING ORDER DR", "", "STANDING ORDER CR", "",
                        "0", "0127", "MONTHLY RENT", "0128",
                        "54302", "20080623", false));
    }

    @Override
    public Optional<ChequeBookHistory> chequeBookHistory(String accNo, String reqDate) {
        return chequeBookRequests(accNo).stream()
                .filter(c -> c.reqDate().equals(reqDate))
                .findFirst()
                .map(c -> new ChequeBookHistory(accNo, c.reqDate() + "103000", c.requestUserId(),
                        "20080317", "020000", "CHQPRDCTR",
                        "20080320", "094500", "54302",
                        "20080322", "113000", "54302",
                        "", "", "", ""));
    }

    @Override
    public BlockedAmountBreakup blockedAmountBreakup(String accNo) {
        return new BlockedAmountBreakup(accNo, "3500.000", List.of(
                new BlockedAmountItem("B", "01008078394502", "2000.000", ""),
                new BlockedAmountItem("O", "RF00998877", "1000.000", "543"),
                new BlockedAmountItem("A", accNo, "500.000", "54302")));
    }

    @Override
    public List<SamaStatusEntry> samaStatusHistory(String accNo) {
        return List.of(
                new SamaStatusEntry("20080426111305", "52302", "54567", "20080426111551", "00", "03", "Court order"),
                new SamaStatusEntry("20090530115908", "83415", "1_RET_MAIL", "20090530115908", "03", "00", "Order released"));
    }

    @Override
    public Map<String, String> snapshot(String accNo, String dateTime) {
        // Mock stacclog snapshot: the account looked different back then —
        // dormant with a lower credit limit and the old statement frequency.
        return Map.of(
                "accountStatus", "02 - Dormant",
                "dormant", "Yes",
                "stmtFrequency", "03 - Quarterly",
                "creditLimit", "5000",
                "memoNote1", "Pre-migration record");
    }

    @Override
    public List<SamaStatusEntry> statusHistory(String accNo) {
        return List.of(
                new SamaStatusEntry("20050912143005", "52302", "54567", "20050912143210", "1", "2", "Dormant — no movement 24 months"),
                new SamaStatusEntry("20071104100815", "54302", "54567", "20071104101002", "2", "1", "Customer request at branch"),
                new SamaStatusEntry("20090530115908", "83415", "1_RET_MAIL", "20090530115908", "1", "4", "Account closure request"));
    }
}
