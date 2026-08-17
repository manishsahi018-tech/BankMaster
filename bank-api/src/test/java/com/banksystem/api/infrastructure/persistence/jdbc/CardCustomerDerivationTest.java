package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

/**
 * The customer number embedded in a card's account number, and the pattern that
 * finds a customer's cards.
 *
 * <p>Written after both got it wrong against real data. Searching cards by
 * customer returned nothing while the same customer's account search worked,
 * and the grid's customer header came back as 1234560 for customer 0123456 —
 * one character to the right, which is what a 0-based SUBSTR start produces.
 * The offset is now applied in Java and the search matches on a LIKE pattern,
 * so both are plain string arithmetic this test can hold still.
 *
 * <p>Account layout: currency(2) + ledger(3) + custNo(7) + sub(2) = 14.
 */
class CardCustomerDerivationTest {

    /** The exact case from the field report. */
    private static final String ACCOUNT = "01000012345600";
    private static final String CUSTOMER = "0123456";

    @Test
    void customerIsTakenFromPositionsSixToTwelveOfTheAccount() {
        assertThat(JdbcCardRepository.rowCustomer("", ACCOUNT))
                .as("1234560 here is the off-by-one that blanked the grid header")
                .isEqualTo(CUSTOMER);
    }

    @Test
    void leadingZeroOfTheCustomerIsKept() {
        // The failure mode was losing this zero off the front and picking up the
        // sub-account's zero at the back, which reads as a plausible number and
        // so fails silently against stcusttab rather than erroring.
        assertThat(JdbcCardRepository.rowCustomer("", ACCOUNT)).startsWith("0");
        assertThat(JdbcCardRepository.rowCustomer("", ACCOUNT)).isNotEqualTo("1234560");
    }

    @Test
    void theAccountWinsOverThePopulatedCustNoColumn() {
        // stcardtab.custNo has been seen holding a shifted value, so it is the
        // fallback, not the preference.
        assertThat(JdbcCardRepository.rowCustomer("1234560", ACCOUNT)).isEqualTo(CUSTOMER);
    }

    @Test
    void custNoColumnIsUsedWhenThereIsNoUsableAccount() {
        assertThat(JdbcCardRepository.rowCustomer("0123456", "")).isEqualTo(CUSTOMER);
        assertThat(JdbcCardRepository.rowCustomer("0123456", null)).isEqualTo(CUSTOMER);
        assertThat(JdbcCardRepository.rowCustomer("0123456", "0100001")).isEqualTo(CUSTOMER);
    }

    @Test
    void bothAreBlankRatherThanThrowing() {
        assertThat(JdbcCardRepository.rowCustomer(null, null)).isEmpty();
    }

    @Test
    void thePatternMatchesTheCustomersAccountsAndNothingElse() {
        String pattern = JdbcCardRepository.accountPattern(CUSTOMER);
        assertThat(pattern).isEqualTo("_____0123456__");
        assertThat(pattern).hasSameSizeAs(ACCOUNT);
        // A LIKE pattern of the same length with _ as single-character wildcards
        // matches exactly the accounts whose positions 6..12 are the customer.
        assertThat(ACCOUNT).matches(pattern.replace("_", "."));
        assertThat("01000012345699").matches(pattern.replace("_", "."));   // other sub-account
        assertThat("02108012345600").matches(pattern.replace("_", "."));   // other currency/ledger
        assertThat("01000099999900").doesNotMatch(pattern.replace("_", ".")); // other customer
        assertThat("01000001234560").doesNotMatch(pattern.replace("_", ".")); // the shifted form
    }
}
