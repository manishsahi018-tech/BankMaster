package com.banksystem.api.infrastructure.persistence.mock;

import static org.assertj.core.api.Assertions.assertThat;

import com.banksystem.api.domain.model.OnlineStatementPage;
import com.banksystem.api.domain.model.OnlineTransaction;
import org.junit.jupiter.api.Test;

/**
 * The mock's job is to reproduce the gateway's CONTRACT, and the part of that
 * contract most easily skipped is the scaling: amounts arrive in MINOR units and
 * are meaningless until divided by 10^decimalPlace. A mock that answered a
 * single decimalPlace for every account would let the screens pass while never
 * once exercising the whole-unit currency — the case where dividing by the
 * wrong power of ten looks least wrong on screen.
 *
 * <p>Real stctltabXC carries a mix (0, 2 and 3 all occur), and decimalPlace is a
 * property of the CURRENCY, which is the account's first two characters.
 */
class MockOnlineEnquiryScaleTest {

    private static final String SAR_ACCOUNT = "01008041574100";
    private static final String WHOLE_UNIT_ACCOUNT = "03008041574100";

    private final MockOnlineEnquiryRepository repo = new MockOnlineEnquiryRepository();

    @Test
    void decimalPlaceComesFromTheCurrency() {
        assertThat(page(SAR_ACCOUNT).decimalPlace())
                .as("currency 01 — every DemoData account, since ACC_PREFIX is 01008")
                .isEqualTo("3");
        assertThat(page(WHOLE_UNIT_ACCOUNT).decimalPlace())
                .as("a whole-unit currency, the branch a fixed constant never reached")
                .isEqualTo("0");
    }

    @Test
    void twoAccountsInTheSameCurrencyAgreeOnScale() {
        assertThat(page("01008999999900").decimalPlace())
                .as("decimalPlace is a property of the currency, not of the account — a mock "
                        + "that varied it per account would teach the wrong model")
                .isEqualTo(page(SAR_ACCOUNT).decimalPlace());
    }

    @Test
    void amountsLandInTheSameDisplayRangeWhateverTheScale() {
        assertDisplayRange(SAR_ACCOUNT, 1000);
        assertDisplayRange(WHOLE_UNIT_ACCOUNT, 1);
    }

    /**
     * Generating a fixed 3-decimal magnitude regardless of currency would have
     * shown a whole-unit account amounts a thousand times too large — figures
     * that still look like money, which is exactly why it would have gone
     * unnoticed.
     */
    private void assertDisplayRange(String accNo, long denomination) {
        OnlineStatementPage page = page(accNo);
        assertThat(page.transactions()).isNotEmpty();
        for (OnlineTransaction txn : page.transactions()) {
            long minor = Long.parseLong(txn.transAmt().replaceAll("^[+-]", ""));
            assertThat(minor / denomination)
                    .as("%s minor units at 1/%d", txn.transAmt(), denomination)
                    .isBetween(25L, 9025L);
        }
    }

    private OnlineStatementPage page(String accNo) {
        return repo.onDemandStatement(accNo, "20250101", "20250331", "00000");
    }
}
