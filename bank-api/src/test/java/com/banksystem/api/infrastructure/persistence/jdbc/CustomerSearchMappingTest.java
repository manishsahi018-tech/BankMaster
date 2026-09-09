package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyMap;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import com.banksystem.api.domain.model.IdDocument;
import com.banksystem.api.domain.model.OpenUpdateInfo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

/**
 * What the search row mapper does with the archival extract's quote wrapper.
 *
 * <p>An empty character column comes back from the views as the two-character
 * string {@code ""} — quotes that the load kept as content. The search grid
 * renders idType through codeLabel, which hands an unmatched code straight
 * back, so the column showed a pair of quote marks where the legacy showed
 * nothing. Nothing about this is visible in a screenshot of mock data, and it
 * cannot be reached from a live Denodo here, so the mapper is driven directly.
 */
class CustomerSearchMappingTest {

    private final NamedParameterJdbcTemplate jdbc = mock(NamedParameterJdbcTemplate.class);
    private final BankingDateProvider bankingDate = mock(BankingDateProvider.class);
    private final JdbcCustomerRepository repo = new JdbcCustomerRepository(jdbc, bankingDate, 30);

    @Test
    void anEmptyColumnQuotedByTheExtractReachesTheGridBlank() {
        CustomerSummary row = searchRow(Map.of(
                "custNo", "1234567",
                "idType", "\"\"",
                "idNo", "\"\"",
                "telHomeExt", "\"\""));

        assertThat(row.idType())
                .as("stcusttab.idType is one character wide — a two-quote value is the "
                        + "extract's empty field, not a legacy code")
                .isEmpty();
        assertThat(row.idNo()).isEmpty();
        assertThat(row.telExt()).isEmpty();
    }

    @Test
    void aQuotedValueKeepsItsContent() {
        CustomerSummary row = searchRow(Map.of(
                "custNo", "\"1234567\"",
                "idType", "\"I\"",
                "eFirstName", "\"AHMED\""));

        assertThat(row.custNo()).isEqualTo("1234567");
        assertThat(row.idType()).isEqualTo("I");
        assertThat(row.firstName()).isEqualTo("AHMED");
    }

    @Test
    void aQuoteInsideANameIsLeftAlone() {
        CustomerSummary row = searchRow(Map.of("eFirstName", "AL \"AMIN\" TRADING"));

        assertThat(row.firstName()).isEqualTo("AL \"AMIN\" TRADING");
    }

    @Test
    void aQuotedNameIsNotMistakenForTheOtherLanguageBeingPresent() {
        // shortName picks the preferred language's column and falls back to
        // the other when it is blank. A quoted-empty eShortName is non-blank
        // as stored, so without the unwrap the fallback never fires and the
        // grid shows quotes instead of the Arabic name that IS there.
        CustomerSummary row = searchRow(Map.of(
                "preferredLang", "E",
                "eShortName", "\"\"",
                "aShortName", "احمد"));

        assertThat(row.shortName()).isEqualTo("احمد");
    }

    // ------------------------------------------------------------------
    // The profile read — the same columns, one screen further in
    // ------------------------------------------------------------------

    @Test
    void theProfileUnwrapsTheSameWayTheSearchGridDoes() {
        profileRow = Map.of(
                "custNo", "1234567",
                "idType", "\"\"",
                "idIssuedAt", "\"\"",
                "eFirstName", "\"AHMED\"");
        CustomerProfile p = profile();

        assertThat(p.idType()).isEmpty();
        assertThat(p.idIssuedAt()).isEmpty();
        assertThat(p.eFirstName()).isEqualTo("AHMED");
    }

    @Test
    void theProfilesIdRowsAreUnwrappedToo() {
        profileRow = Map.of("custNo", "1234567");
        idRow = Map.of("idType", "\"Q\"", "idNo", "\"\"", "idRefName", "\"\"");

        IdDocument doc = profile().idDocuments().get(0);
        assertThat(doc.idType()).isEqualTo("Q");
        assertThat(doc.idNo()).isEmpty();
        assertThat(doc.idRefName()).isEmpty();
    }

    @Test
    void theOpenUpdateFramesAreUnwrappedToo() {
        profileRow = Map.of("custNo", "1234567");
        logRow = Map.of("branchCode", "\"\"", "userId", "\"OP01\"", "lastUpdateUser", "\"\"");

        OpenUpdateInfo frames = profile().openUpdate();
        assertThat(frames.openBranch()).isEmpty();
        assertThat(frames.openMakerId()).isEqualTo("OP01");
        assertThat(frames.openSupervisorId()).isEmpty();
    }

    // ------------------------------------------------------------------
    // Driving the repository
    // ------------------------------------------------------------------

    /** Runs one stubbed stcusttab row through the repository's search mapper. */
    private CustomerSummary searchRow(Map<String, String> values) {
        stub(values);
        List<CustomerSummary> rows = repo.search(new CustomerSearchCriteria(
                "1234567", null, null, null, null, null,
                null, null, null, null, null, null, null)).rows();
        assertThat(rows).hasSize(1);
        return rows.get(0);
    }

    @SuppressWarnings("unchecked")
    private void stub(Map<String, String> values) {
        when(jdbc.query(anyString(), any(SqlParameterSource.class), any(ResultSetExtractor.class)))
                .thenAnswer(call -> call.<ResultSetExtractor<List<CustomerSummary>>>getArgument(2)
                        .extractData(oneRow(values)));
    }

    /** A one-row ResultSet answering getString(name) from the map, blank otherwise. */
    private static ResultSet oneRow(Map<String, String> values) throws SQLException {
        ResultSet rs = mock(ResultSet.class);
        boolean[] consumed = {false};
        when(rs.next()).thenAnswer(call -> {
            if (consumed[0]) {
                return false;
            }
            consumed[0] = true;
            return true;
        });
        when(rs.getString(anyString()))
                .thenAnswer(call -> values.getOrDefault(call.<String>getArgument(0), ""));
        return rs;
    }

    /** The stcusttab row the profile read answers with. */
    private Map<String, String> profileRow = Map.of();
    /** The stidtab ID rows, if any. */
    private Map<String, String> idRow = null;
    /** The stcustlog open/update row, if any. */
    private Map<String, String> logRow = null;

    /**
     * Runs the profile point read against stubbed stcusttab / stidtab /
     * stcustlog rows. All three go through the same query overload, so the
     * stub dispatches on the table the statement names.
     */
    @SuppressWarnings("unchecked")
    private CustomerProfile profile() {
        // the profile read binds it into an immutable Map, so it cannot be null
        when(bankingDate.bankingDate()).thenReturn("20090711");
        when(jdbc.query(anyString(), anyMap(), any(RowMapper.class)))
                .thenAnswer(call -> {
                    String sql = call.getArgument(0);
                    RowMapper<Object> mapper = call.getArgument(2);
                    Map<String, String> row =
                            sql.contains("stidtab") ? idRow
                                    : sql.contains("stcustlog") ? logRow
                                    : profileRow;
                    return row == null ? List.of() : List.of(mapper.mapRow(oneRow(row), 0));
                });
        return repo.profile("1234567").orElseThrow();
    }
}
