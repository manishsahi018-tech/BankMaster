package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

/**
 * The archival names are stored as the branch typed them ("Hussain", not
 * "HUSSAIN"), and the view's LIKE compares byte for byte, so a name search has
 * to fold case on BOTH sides or the operator has to guess the stored spelling.
 * The mock profile matched case-insensitively all along, which is exactly why
 * running against the demo data could never surface this — so the fold is
 * pinned here on the SQL the repository actually issues.
 */
class CustomerSearchNameCaseTest {

    private final NamedParameterJdbcTemplate jdbc = mock(NamedParameterJdbcTemplate.class);
    private final BankingDateProvider bankingDate = mock(BankingDateProvider.class);
    private final JdbcCustomerRepository repo = new JdbcCustomerRepository(jdbc, bankingDate, 30);

    private CustomerSearchCriteria names(String first, String second, String last) {
        return new CustomerSearchCriteria(null, null, null, null, null, null,
                first, second, last, null, null, null, null);
    }

    /** Runs a search and returns the SQL and bind values handed to the template. */
    @SuppressWarnings("unchecked")
    private Issued issue(CustomerSearchCriteria c) {
        when(jdbc.query(any(String.class), any(SqlParameterSource.class),
                any(ResultSetExtractor.class))).thenReturn(List.<CustomerSummary>of());
        repo.search(c);
        ArgumentCaptor<String> sql = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<SqlParameterSource> params = ArgumentCaptor.forClass(SqlParameterSource.class);
        verify(jdbc, atLeastOnce()).query(sql.capture(), params.capture(), any(ResultSetExtractor.class));
        return new Issued(sql.getValue(), params.getValue());
    }

    private record Issued(String sql, SqlParameterSource params) {}

    @Test
    void firstNameSearchFoldsCaseOnBothSides() {
        Issued issued = issue(names("hussain", null, null));

        assertThat(issued.sql()).contains("UPPER(eFirstName) LIKE CONCAT(:firstName, '%')");
        assertThat(issued.params().getValue("firstName")).isEqualTo("HUSSAIN");
    }

    @Test
    void continueFiltersFoldCaseToo() {
        Issued issued = issue(names("hussain", "saeed", "kadem"));

        assertThat(issued.sql())
                .contains("UPPER(e2ndName) LIKE CONCAT(:secondName, '%')")
                .contains("UPPER(eLastName) LIKE CONCAT(:lastName, '%')");
        assertThat(issued.params().getValue("secondName")).isEqualTo("SAEED");
        assertThat(issued.params().getValue("lastName")).isEqualTo("KADEM");
    }

    @Test
    void secondAndLastNameEntryPointsFoldCase() {
        assertThat(issue(names(null, "saeed", null)).sql())
                .contains("UPPER(e2ndName) LIKE CONCAT(:secondName, '%')");
        assertThat(issue(names(null, null, "kadem")).sql())
                .contains("UPPER(eLastName) LIKE CONCAT(:lastName, '%')");
    }

    /** The fold must not disturb the ordering the grid relies on, which stays
     *  on the raw column, nor the Arabic/English index choice. */
    @Test
    void arabicSearchKeepsItsColumnsAndOrder() {
        Issued issued = issue(names("محمد", null, null));

        assertThat(issued.sql())
                .contains("UPPER(aFirstName) LIKE CONCAT(:firstName, '%')")
                .contains("ORDER  BY aFirstName, custNo");
        assertThat(issued.params().getValue("firstName")).isEqualTo("محمد");
    }
}
