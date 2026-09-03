package com.banksystem.api.application;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatCode;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.repository.AccountRepository;
import com.banksystem.api.domain.repository.StatementRepository;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

/**
 * Branch code on Historical Statement Printing, which no longer has a box for
 * it on either route.
 *
 * <p>On the normal route the client copies it from the grid row, so the
 * four-character rule still applies and still guards the staff-branch refusal.
 * On the DELETED-ACCOUNT route there is no row to copy from and no box to key,
 * so the value arrives blank — and nothing consults it there: BM does not
 * filter on branch (it chose which Btrieve file to open, and DB #3 has no such
 * partition), and the staff-branch rule is guarded by the legacy's
 * {@code tag <> "D"}. Requiring four characters of it would refuse the enquiry
 * over a field the operator cannot see.
 */
class HistoricalStatementBranchRuleTest {

    private final StatementRepository statements = mock(StatementRepository.class);
    private final AccountRepository accounts = mock(AccountRepository.class);
    private final StatementService service = new StatementService(statements, accounts);

    private final EnquiryUser caller = new EnquiryUser("OPER1", "~60~61~62~87~", "0127");

    @BeforeEach
    void noStatements() {
        when(statements.historicalStatements(anyString(), anyString(), anyString(), anyString(),
                anyString())).thenReturn(List.of());
    }

    private void deleted(String branch) {
        // The route's own precondition: the account must no longer exist.
        when(accounts.accountByNumber(anyString())).thenReturn(Optional.empty());
        service.historicalStatements("01008041574100", branch, "200901", "200906", "BM",
                true, caller);
    }

    @Test
    void deletedAccountRouteAcceptsABlankBranch() {
        assertThatCode(() -> deleted("")).doesNotThrowAnyException();

        ArgumentCaptor<String> branch = ArgumentCaptor.forClass(String.class);
        verify(statements).historicalStatements(
                anyString(), branch.capture(), anyString(), anyString(), anyString());
        // Blank, not a stand-in value: nothing downstream reads it, and a made-up
        // branch would show up in the SQL audit log as though it had been keyed.
        assertThat(branch.getValue()).isEmpty();
    }

    @Test
    void deletedAccountRouteAlsoAcceptsAShortBranchRatherThanNitpickingAnUnusedField() {
        assertThatCode(() -> deleted("12")).doesNotThrowAnyException();
    }

    @Test
    void deletedAccountRouteStillRefusesAnAccountThatStillExists() {
        // The rule that actually defines this route survives untouched.
        when(accounts.accountByNumber(anyString()))
                .thenReturn(Optional.of(mock(com.banksystem.api.domain.model.AccountSummary.class)));

        assertThatThrownBy(() -> service.historicalStatements("01008041574100", "", "200901",
                "200906", "BM", true, caller))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("exists in Bankmaster");
    }

    @Test
    void normalRouteStillRequiresFourCharacters() {
        // Here the branch DOES come from somewhere — the grid row — so a
        // malformed one is a real fault. Independent of
        // EnquiryRestrictions.ENABLED: this is input validation, not access.
        assertThatThrownBy(() -> service.historicalStatements("01008041574100", "12", "200901",
                "200906", "BM", false, caller))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("Branch Code should be 4 characters");
    }

    @Test
    void staffBranchRefusalIsUnchangedOnTheNormalRoute() {
        // Only while the switch is on; with it off the same call prints.
        org.junit.jupiter.api.Assumptions.assumeTrue(EnquiryRestrictions.ENABLED,
                "EnquiryRestrictions.ENABLED is off - the staff branch prints for everyone");
        assertThatThrownBy(() -> service.historicalStatements("01008041574100", "0175", "200901",
                "200906", "BM", false, caller))
                .isInstanceOf(BadRequestException.class)
                .hasMessageContaining("staff branch");
    }

    @Test
    void staffBranchRefusalNeverFiresOnTheDeletedAccountRoute() {
        // frmHistStmt.frm:782 guards it with `tag <> "D"`. Removing the box did
        // not quietly open a way past it — there was never a way to open.
        // Holds either way, so it runs with the switch off too.
        assertThatCode(() -> deleted("0175")).doesNotThrowAnyException();
    }
}
