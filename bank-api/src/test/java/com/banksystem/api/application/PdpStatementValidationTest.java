package com.banksystem.api.application;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatCode;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.repository.AccountRepository;
import com.banksystem.api.domain.repository.StatementRepository;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

/**
 * The Historical Statement — PDP screen's validation.
 *
 * <p>Its two identifiers are EXCLUSIVE — a customer number answers for every
 * account that customer holds, an account number for one account, and there is
 * no combined form. The screen disables one box as soon as the other is keyed,
 * but a disabled input is not a control: anything reaching the API directly must
 * meet the same rule, which is what this pins.
 */
class PdpStatementValidationTest {

    private final StatementRepository statements = mock(StatementRepository.class);
    private final AccountRepository accounts = mock(AccountRepository.class);
    private final StatementService service = new StatementService(statements, accounts);

    /** Branch 0127, so the staff-branch rule (0175) is not what is under test. */
    private final EnquiryUser caller = new EnquiryUser("OPER1", "~60~61~62~", "0127");

    private void generate(String custNo, String accNo) {
        service.pdpStatements("0127", custNo, accNo, "200901", "200906", caller);
    }

    @Test
    void neitherIdentifierIsRefused() {
        assertThatThrownBy(() -> generate("", ""))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("Please enter one of them");
        verify(statements, never())
                .pdpStatements(anyString(), anyString(), anyString(), anyString(), anyString());
    }

    @Test
    void bothIdentifiersAreRefused() {
        // Not merely redundant input: the two mean different enquiries, so a
        // combined request has no single right answer to give.
        assertThatThrownBy(() -> generate("0001234", "0127000123400000001"))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("not both");
        verify(statements, never())
                .pdpStatements(anyString(), anyString(), anyString(), anyString(), anyString());
    }

    @Test
    void eitherIdentifierAloneIsAccepted() {
        when(statements.pdpStatements(anyString(), anyString(), anyString(), anyString(),
                anyString())).thenReturn(List.of());

        assertThatCode(() -> generate("0001234", "")).doesNotThrowAnyException();
        assertThatCode(() -> generate("", "0127000123400000001")).doesNotThrowAnyException();

        ArgumentCaptor<String> cust = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<String> acct = ArgumentCaptor.forClass(String.class);
        verify(statements, org.mockito.Mockito.times(2)).pdpStatements(
                anyString(), cust.capture(), acct.capture(), anyString(), anyString());
        // Whichever was not keyed reaches the repository blank, never as null —
        // the repository builds its filter list from emptiness.
        assertThat(cust.getAllValues()).containsExactly("0001234", "");
        assertThat(acct.getAllValues()).containsExactly("", "0127000123400000001");
    }

    @Test
    void branchCodeIsCheckedBeforeTheIdentifiers() {
        // cmdGenerate_Click's order. An operator who has keyed nothing at all
        // must be told about the branch first, on both statement screens.
        assertThatThrownBy(() -> service.pdpStatements("12", "", "", "200901", "200906", caller))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("Branch Code should be 4 characters");
    }

    @Test
    void staffBranchIsRefusedToOutsiders() {
        // frmHistStmt.frm:782. The branch is TYPED on this screen rather than
        // carried from a grid row, so the rule matters more here, not less.
        assertThatThrownBy(() ->
                service.pdpStatements("0175", "0001234", "", "200901", "200906", caller))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("staff branch");
    }

    @Test
    void backwardsRangeIsRefusedRatherThanReturningNothing() {
        assertThatThrownBy(() ->
                service.pdpStatements("0127", "0001234", "", "200906", "200901", caller))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("cannot be later than");
    }

    @Test
    void deletedAccountCheckIsNotRunForPdp() {
        // That check belongs to the legacy's tag = "D" route on the OTHER
        // screen. Running it here would refuse every live account.
        when(statements.pdpStatements(anyString(), anyString(), anyString(), anyString(),
                anyString())).thenReturn(List.of());

        generate("", "0127000123400000001");

        verify(accounts, never()).accountByNumber(any());
    }
}
