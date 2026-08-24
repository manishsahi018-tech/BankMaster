package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;

import java.lang.reflect.Field;
import org.junit.jupiter.api.Test;

/**
 * The Open/Update frame is two reads of stcustlog that differ only by sort
 * direction — earliest row = how the customer was opened, latest = how it was
 * last updated — and each takes exactly ONE row off the top. So the sort is the
 * whole contract, and it cannot be checked against a live Denodo from a test.
 *
 * <p>What makes it delicate is that {@code lastUpdateDateTime} is legitimately
 * BLANK on pending rows: the C seeds the earliest read with spaces
 * (cbothers.c:3301-3397), so those rows are that read's intended target rather
 * than noise. A blank can reach the view as NULL, NULL ordering is
 * engine-defined and Denodo delegates it, and on an engine that sorts NULLS
 * FIRST on DESC the LATEST read would take a pending row and report its branch
 * and maker as the Update Branch and Update Maker.
 *
 * <p>{@code updateHistory} already coalesces its read of this same column, with
 * a comment explaining exactly this. This pins that the Open/Update pair does
 * too, so the two cannot drift apart again.
 */
class OpenUpdateOrderingTest {

    private static String sql(String field) throws Exception {
        Field f = JdbcCustomerRepository.class.getDeclaredField(field);
        f.setAccessible(true);
        return (String) f.get(null);
    }

    @Test
    void bothDirectionsSortOnACoalescedStamp() throws Exception {
        String template = sql("OPEN_UPDATE_SQL");

        assertThat(template)
                .as("a blank stamp arriving as NULL must sort lowest in BOTH directions — "
                        + "first for the earliest read, which wants it, and last for the "
                        + "latest read, which must not take a pending row")
                .contains("COALESCE(lastUpdateDateTime, '')")
                .doesNotContain("ORDER  BY lastUpdateDateTime");

        assertThat(template.formatted("ASC"))
                .contains("ORDER  BY COALESCE(lastUpdateDateTime, '') ASC")
                .as("one row per read is the whole point; a missing limit returns the "
                        + "entire log and firstLog would silently take an arbitrary row")
                .contains("FETCH  FIRST 1 ROWS ONLY");
        assertThat(template.formatted("DESC"))
                .contains("ORDER  BY COALESCE(lastUpdateDateTime, '') DESC");
    }

    @Test
    void itStillCarriesTheBankingDateAndCustomerPredicates() throws Exception {
        assertThat(sql("OPEN_UPDATE_SQL"))
                .as("every archival read is pinned to one restore snapshot; without it "
                        + "this view can hold the same row once per snapshot")
                .contains("BankingDate = :bankingDate")
                .contains("custNo = :custNo");
    }
}
