package com.banksystem.api.application;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatCode;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.model.OnlineStatementPage;
import com.banksystem.api.domain.repository.AccountRepository;
import com.banksystem.api.domain.repository.OnlineEnquiryRepository;
import com.banksystem.api.domain.repository.StatementRepository;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/**
 * The state the application is actually in: {@link EnquiryRestrictions#ENABLED}
 * off, so no enquiry is refused and no balance blanked because of who is asking.
 *
 * <p>Written as the mirror of {@link BalEnqRestrictionTest} and the two
 * staff-branch cases: whichever way the switch is set, exactly one of the two
 * sets runs, and each pins the behaviour that setting is supposed to produce.
 * Every case here uses the input that WOULD have been refused — a
 * balance-enquiry-restricted branch reached without ~86, and branch 0175
 * reached from 0127.
 */
class EnquiryRestrictionsOffTest {

    private static final EnquiryUser OUTSIDER = new EnquiryUser("OPER1", "~60~61~87~", "0127");

    @BeforeEach
    void onlyMeaningfulWhileRestrictionsAreOff() {
        Assumptions.assumeFalse(EnquiryRestrictions.ENABLED,
                "EnquiryRestrictions.ENABLED is on - the restriction tests cover that case");
    }

    @Test
    @DisplayName("a restricted branch's balances survive, and the row is not marked")
    void balancesAreNotBlanked() {
        AccountRepository accounts = mock(AccountRepository.class);
        // Customer above the 0002000 threshold, on a branch whose
        // balEnqRestrictedFlag is set, for an operator without ~86 — the
        // combination cbbranch2.c:5886 restricted outright.
        when(accounts.accountsForCustomer("0783945")).thenReturn(List.of(
                new AccountSummary("01008078394503", "1250.75", "1250.75", "0.00",
                        "00", "5000", "0", "0127", "0")));
        when(accounts.branchBalEnqRestrictedFlag("0127")).thenReturn("1");

        AccountSummary row = new AccountService(accounts)
                .accountsForCustomer("0783945", 0, OUTSIDER).rows().get(0);

        assertThat(row.bookBalance()).isEqualTo("1250.75");
        assertThat(row.clearedBalance()).isEqualTo("1250.75");
        assertThat(row.creditLimit()).isEqualTo("5000");
        assertThat(row.balEnqRestricted()).isEqualTo("0");
    }

    @Test
    @DisplayName("a staff-branch archived statement prints for an outside branch")
    void staffBranchHistoricalStatementPrints() {
        StatementRepository statements = mock(StatementRepository.class);
        AccountRepository accounts = mock(AccountRepository.class);
        when(statements.historicalStatements(anyString(), anyString(), anyString(), anyString(),
                anyString())).thenReturn(List.of());
        when(statements.pdpStatements(anyString(), anyString(), anyString(), anyString(),
                anyString())).thenReturn(List.of());
        when(accounts.accountByNumber(anyString())).thenReturn(Optional.empty());
        StatementService service = new StatementService(statements, accounts);

        assertThatCode(() -> service.historicalStatements("01008041574100", "0175", "200901",
                "200906", "BM", false, OUTSIDER)).doesNotThrowAnyException();
        assertThatCode(() -> service.pdpStatements("0175", "0001234", "", "200901", "200906",
                OUTSIDER)).doesNotThrowAnyException();
    }

    @Test
    @DisplayName("a staff-branch online statement and transaction enquiry both come back")
    void staffBranchOnlineEnquiriesAreReturned() {
        OnlineEnquiryRepository gateway = mock(OnlineEnquiryRepository.class);
        OnlineStatementPage staffReply = page("0175");
        when(gateway.onDemandStatement(anyString(), anyString(), anyString(), anyString()))
                .thenReturn(staffReply);
        when(gateway.transactionEnquiry(anyString(), anyString(), anyString()))
                .thenReturn(staffReply);
        OnlineEnquiryService service = new OnlineEnquiryService(gateway);

        assertThat(service.onDemandStatement("01008041574100", "20090101", "20090630", "",
                OUTSIDER)).isSameAs(staffReply);
        assertThat(service.transactionEnquiry("01008041574100", "20090101", "", "",
                OUTSIDER)).isSameAs(staffReply);
    }

    /** A successful gateway reply from the given branch; only branch matters here. */
    private static OnlineStatementPage page(String branchCode) {
        return new OnlineStatementPage("00", "01008041574100", "CUST", "ADDR", branchCode,
                "BRANCH", "E", "2", "0", "20090101", "20090630", List.of(), "00000", "1");
    }
}
