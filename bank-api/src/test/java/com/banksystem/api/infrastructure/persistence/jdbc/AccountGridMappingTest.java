package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyMap;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.infrastructure.language.RequestLanguage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

/**
 * What the account mappers do with the archival extract's quote wrapper.
 *
 * <p>An empty character column comes back from the views as the two-character
 * string {@code ""} — quotes the load kept as content rather than reading as
 * delimiters. The account grid prints gld0data.anbDormantFlag raw, as the VB6
 * does (frmAccount.frm:1796), so the Dormant Flag column showed a pair of
 * quote marks; the detail map's Yes/No toggle read the same non-blank value as
 * "not 1" and reported "No" for an account whose flag is simply unset. Mock
 * data carries neither wrapper, so the mappers are driven directly — the
 * companion to {@link CustomerSearchMappingTest}.
 */
class AccountGridMappingTest {

    private final NamedParameterJdbcTemplate jdbc = mock(NamedParameterJdbcTemplate.class);
    private final BankingDateProvider bankingDate = mock(BankingDateProvider.class);
    private final JdbcAccountRepository repo =
            new JdbcAccountRepository(jdbc, bankingDate, new RequestLanguage());

    AccountGridMappingTest() {
        // every read binds it into an immutable Map, so it cannot be null
        when(bankingDate.bankingDate()).thenReturn("20090711");
    }

    @Test
    void aQuotedEmptyDormantFlagReachesTheGridBlank() {
        AccountSummary row = gridRow(Map.of(
                "accNo", "01001123456700",
                "anbDormantFlag", "\"\"",
                "accStatusCode", "00",
                "branchCode", "\"\""));

        assertThat(row.dormantFlag())
                .as("gld0data.anbDormantFlag is one character wide (layout.h:581) — a "
                        + "two-quote value is the extract's wrapper, not legacy data")
                .isEmpty();
        assertThat(row.branchCode()).isEmpty();
    }

    @Test
    void aRealDormantFlagIsLeftAlone() {
        AccountSummary row = gridRow(Map.of(
                "accNo", "01001123456700",
                "anbDormantFlag", "\"1\"",
                "accStatusCode", "00",
                "branchCode", "\"045\""));

        assertThat(row.dormantFlag()).isEqualTo("1");
        assertThat(row.branchCode()).isEqualTo("045");
    }

    @Test
    void aQuotedEmptyFlagNoLongerReportsTheAccountAsNotDormant() {
        // put() omits a blank value so the screen keeps its own, and the
        // Dormant toggle is left alone rather than being driven to "No".
        assertThat(detail(Map.of(
                "accStatus", "2",
                "inactiveAccFlag", "\"\"",
                "accDesc", "\"\"")))
                .doesNotContainKey("dormant")
                .doesNotContainKey("acctDesc");

        assertThat(detail(Map.of(
                "accStatus", "2",
                "inactiveAccFlag", "1")))
                .containsEntry("dormant", "Yes");
    }

    // ------------------------------------------------------------------
    // Driving the repository
    // ------------------------------------------------------------------

    /** Runs one stubbed gld0data row through the account-grid mapper. */
    @SuppressWarnings("unchecked")
    private AccountSummary gridRow(Map<String, String> values) {
        when(jdbc.query(anyString(), anyMap(), any(RowMapper.class)))
                .thenAnswer(call -> List.of(
                        call.<RowMapper<Object>>getArgument(2).mapRow(oneRow(values), 0)));
        List<AccountSummary> rows = repo.accountsForCustomer("1234567");
        assertThat(rows).hasSize(1);
        return rows.get(0);
    }

    /** Runs one stubbed gld0data row through the current-master detail read. */
    private Map<String, String> detail(Map<String, String> row) {
        when(jdbc.queryForList(anyString(), anyMap())).thenReturn(List.of(Map.copyOf(row)));
        return repo.accountDetail("01001123456700");
    }

    /** A one-row ResultSet answering getString(name) from the map, blank otherwise. */
    private static ResultSet oneRow(Map<String, String> values) throws SQLException {
        ResultSet rs = mock(ResultSet.class);
        when(rs.getString(anyString()))
                .thenAnswer(call -> values.getOrDefault(call.<String>getArgument(0), ""));
        return rs;
    }
}
