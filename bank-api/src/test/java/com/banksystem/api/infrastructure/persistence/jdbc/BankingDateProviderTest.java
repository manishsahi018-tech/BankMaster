package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyMap;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.banksystem.api.infrastructure.runtimeconfig.RuntimeSettings;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

/**
 * The card views may be read at their own BankingDate, and the whole point of
 * how that is wired is that it costs nothing until someone configures it: a
 * blank {@code card-banking-date} must behave exactly like the single date the
 * application had before the setting existed.
 *
 * <p>That fallback is the one piece no other test can reach — the SQL scan in
 * {@link BankingDateFilterTest} checks which bind each statement NAMES, not
 * which value ends up in it.
 */
class BankingDateProviderTest {

    private final NamedParameterJdbcTemplate jdbc = mock(NamedParameterJdbcTemplate.class);

    private BankingDateProvider provider(String bankingDate, String cardBankingDate) {
        return new BankingDateProvider(
                jdbc, RuntimeSettings.fixed("OPER1", bankingDate, cardBankingDate));
    }

    @Test
    void aBlankCardDateLeavesTheCardViewsOnTheGlobalDate() {
        BankingDateProvider provider = provider("2009-07-11", "");

        assertThat(provider.cardBankingDate()).isEqualTo("2009-07-11");
        assertThat(provider.cardBankingDate()).isEqualTo(provider.bankingDate());
    }

    @Test
    void aConfiguredCardDatePinsTheCardViewsWithoutMovingEverythingElse() {
        // stcardtab runs to 08/12/2012, the rest of the CSD views sit at
        // 11/07/2009 — the split exists precisely so both can be read.
        BankingDateProvider provider = provider("2009-07-11", "2012-12-08");

        assertThat(provider.cardBankingDate()).isEqualTo("2012-12-08");
        assertThat(provider.bankingDate()).isEqualTo("2009-07-11");
    }

    @Test
    void withBothBlankTheCardViewsFollowTheResolvedFallbackAndResolveItOnlyOnce() {
        when(jdbc.queryForObject(anyString(), anyMap(), eq(String.class)))
                .thenReturn("2009-07-11");
        BankingDateProvider provider = provider("", "");

        // The card date must ride the same cached resolution rather than firing
        // a second MAX(BankingDate) of its own.
        assertThat(provider.cardBankingDate()).isEqualTo("2009-07-11");
        assertThat(provider.bankingDate()).isEqualTo("2009-07-11");

        verify(jdbc, times(1)).queryForObject(anyString(), anyMap(), eq(String.class));
    }

    @Test
    void aCardDateStandsOnItsOwnWhenTheGlobalDateIsLeftToTheDatabase() {
        BankingDateProvider provider = provider("", "2012-12-08");

        // No MAX(BankingDate) round trip is needed to answer this one.
        assertThat(provider.cardBankingDate()).isEqualTo("2012-12-08");
        verify(jdbc, times(0)).queryForObject(anyString(), anyMap(), eq(String.class));
    }
}
