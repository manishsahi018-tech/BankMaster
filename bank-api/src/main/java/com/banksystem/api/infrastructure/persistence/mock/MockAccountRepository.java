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
                new AccountSummary("01008078394500", "0.00", "0.00", "0.00", "08-Enquiry restricted", "0", "0", "0127", "0"),
                new AccountSummary("01008078394501", "40.75", "40.75", "0.00", "00-Open", "0", "0", "0127", "0"),
                new AccountSummary("01008078394502", "53.70", "53.70", "0.00", "04-No debits", "0", "1", "0001", "0"),
                new AccountSummary("01008078394503", "43447.59", "43447.59", "0.00", "00-Open", "0", "0", "0127", "0"));
    }

    /** Mock: branch 0127 restricts balance enquiry, everything else is open. */
    @Override
    public String branchBalEnqRestrictedFlag(String branchCode) {
        return "0127".equals(branchCode == null ? "" : branchCode.trim()) ? "1" : "0";
    }

    /** Mock: DEVUSER may enquire on 0127; other users have no stusrbrn row. */
    @Override
    public List<String> enquiryAllowedBranches(String userId) {
        return "DEVUSER".equals(userId == null ? "" : userId.trim())
                ? List.of("0127") : List.of();
    }

    @Override
    public java.util.Optional<AccountSummary> accountByNumber(String accNo) {
        // Legacy ISEQUAL exact read: that account or nothing.
        String wanted = accNo == null ? "" : accNo.trim();
        return accountsForCustomer("").stream()
                .filter(a -> a.accountNumber().equals(wanted))
                .findFirst();
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
        return Map.ofEntries(
                Map.entry("customerNo", "0783945"),
                Map.entry("customerName", "ALTAMEEMI MOHD ZAIDAAN"),
                Map.entry("currencyCode", "01"),
                Map.entry("currencyName", "Saudi Riyal"),
                Map.entry("ledgerCode", "008"),
                Map.entry("ledgerName", "تحت الطلب - قطاع خاص مقيــم"),
                Map.entry("accountStatus", "02 - Dormant"),
                Map.entry("dormant", "Yes"),
                Map.entry("stmtFrequency", "03 - Quarterly"),
                Map.entry("creditLimit", "5000"),
                Map.entry("subAccount", "03"),
                Map.entry("memoNote1", "Pre-migration record"));
    }

    @Override
    public Map<String, String> accountDetail(String accNo) {
        // Mock current account master (gld0data stand-in): the live values the
        // AccountMaintenance screen shows outside history mode.
        return Map.ofEntries(
                Map.entry("customerNo", "0783945"),
                Map.entry("customerName", "ALTAMEEMI MOHD ZAIDAAN"),
                Map.entry("accountStatus", "00 - Open"),
                Map.entry("samaStatus", "00 - Open"),
                Map.entry("dormant", "No"),
                Map.entry("stmtFrequency", "01 - None"),
                Map.entry("statementDay", "Br.Stmt.Day"),
                Map.entry("intApplication", "0-Capitalise"),
                Map.entry("crInterestRate", "0"),
                Map.entry("drInterestRate", "21"),
                Map.entry("creditLimit", "0"),
                Map.entry("branchCode", "0128"),
                Map.entry("ledgerCode", "008"),
                Map.entry("ledgerName", "تحت الطلب - قطاع خاص مقيــم"),
                Map.entry("currencyCode", "01"),
                Map.entry("currencyName", "Saudi Riyal"),
                Map.entry("subAccount", "03"),
                Map.entry("memoNote1", "30931"),
                Map.entry("acOpenDate", "20080426"),
                Map.entry("lastTransDate", "20090705"),
                Map.entry("lastAmendDate", "20080503"),
                Map.entry("lastAmendUser", "83415"),
                Map.entry("supervisorId", "1_RET_MAIL"),
                Map.entry("lastUpdateCsd", "20090530"),
                Map.entry("supervisorApproved", "20090530"));
    }

    @Override
    public List<SamaStatusEntry> statusHistory(String accNo) {
        return List.of(
                new SamaStatusEntry("20050912143005", "52302", "54567", "20050912143210", "1", "2", "Dormant — no movement 24 months"),
                new SamaStatusEntry("20071104100815", "54302", "54567", "20071104101002", "2", "1", "Customer request at branch"),
                new SamaStatusEntry("20090530115908", "83415", "1_RET_MAIL", "20090530115908", "1", "4", "Account closure request"));
    }
}
