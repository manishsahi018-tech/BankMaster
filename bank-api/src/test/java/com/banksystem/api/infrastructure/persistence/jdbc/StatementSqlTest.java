package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

import com.banksystem.api.application.NotAvailableException;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

/**
 * The statement queries are ASSEMBLED from fragments — which account predicate,
 * which extra header filters, which identity columns — and the PDP path builds
 * a correlated subquery out of the same fragments it uses for the header. None
 * of that can be checked against a live DB #3 from a test, and a fragment
 * joined wrongly fails as SQL grammar at the far end of a deployment rather
 * than here. So capture the SQL the repository hands the template and assert
 * the shape.
 *
 * <p>What each test pins is a decision that would be silently wrong otherwise:
 * an unfiltered detail query returns another customer's lines, a missing
 * CUST_NUM predicate returns the whole branch, and a BM query that suddenly
 * carried a branch filter would drop rows the legacy always showed.
 */
class StatementSqlTest {

    private final NamedParameterJdbcTemplate jdbc = mock(NamedParameterJdbcTemplate.class);
    private final JdbcStatementRepository repo = new JdbcStatementRepository(
            jdbc, "BM_STMT_HDR", "BM_STMT_TXN", "PDP_STMT_HDR", "PDP_STMT_TXN");

    /**
     * Both queries the call issued, in the order the repository runs them:
     * detail first, then header.
     */
    private List<String> sqlOf(Runnable call) {
        Mockito.clearInvocations(jdbc);
        call.run();
        ArgumentCaptor<String> sql = ArgumentCaptor.forClass(String.class);
        verify(jdbc, Mockito.times(2))
                .query(sql.capture(), any(SqlParameterSource.class), any(RowCallbackHandler.class));
        return sql.getAllValues();
    }

    /** The parameters the call bound, from the first query it issued. */
    private SqlParameterSource paramsOf(Runnable call) {
        Mockito.clearInvocations(jdbc);
        call.run();
        ArgumentCaptor<SqlParameterSource> params =
                ArgumentCaptor.forClass(SqlParameterSource.class);
        verify(jdbc, Mockito.atLeastOnce())
                .query(anyString(), params.capture(), any(RowCallbackHandler.class));
        return params.getAllValues().get(0);
    }

    private List<String> pdp(String custNo, String accNo) {
        return sqlOf(() -> repo.pdpStatements("0127", custNo, accNo, "200501", "200912"));
    }

    // ------------------------------------------------------------------
    // PDP
    // ------------------------------------------------------------------

    @Test
    void customerEnquiryFiltersTheDetailThroughTheHeaderSubquery() {
        List<String> sql = pdp("0001234", "");
        String detail = sql.get(0);

        // PDP_STMT_TXN has no CUST_NUM, so without the subquery a customer
        // enquiry would pull EVERY account's lines in the period and rely on
        // the header join to hide them — which it would, but only after
        // dragging the whole table across the wire.
        assertThat(detail)
                .as("detail rows must be confined to the accounts the header selected")
                .contains("ACCT_NUM IN (SELECT ACCT_NUM")
                .contains("FROM   PDP_STMT_HDR")
                .contains("CUST_NUM = :custNum")
                .contains("BRANCH_CODE = :branchCode");
        assertThat(detail).as("the subquery must close").satisfies(s ->
                assertThat(s.chars().filter(c -> c == '(').count())
                        .isEqualTo(s.chars().filter(c -> c == ')').count()));
    }

    @Test
    void customerEnquiryHeaderIsKeyedOnCustomerAndBranchNotOnAnAccount() {
        String header = pdp("0001234", "").get(1);

        assertThat(header)
                .contains("FROM   PDP_STMT_HDR")
                .contains("BRANCH_CODE = :branchCode")
                .contains("CUST_NUM = :custNum")
                // The PDP header's identity columns, not the BM ones.
                .contains("CUST_NUM, TITLE, FIRST_NAME, SECOND_NAME, PAGE_NUM, BRANCH_DATA");
        assertThat(header)
                .as("no account was given, so nothing may narrow to one")
                .doesNotContain("ACCT_NUM = :acctNum");
    }

    /**
     * StatementService refuses both identifiers at once, so this combination
     * cannot arrive through the API. It is pinned anyway: the repository must
     * NARROW on an argument it was given rather than drop it, because a
     * silently ignored account number would answer for the whole customer while
     * looking like it had answered for one account.
     */
    @Test
    void bothIdentifiersNarrowRatherThanOneBeingIgnored() {
        List<String> sql = pdp("0001234", "01008041574100");

        assertThat(sql.get(1))
                .contains("CUST_NUM = :custNum")
                .contains("ACCT_NUM = :acctNum");
        // The detail still goes through the subquery rather than filtering on
        // the account directly: a customer/account pair that does not belong
        // together must return nothing, not a pile of headerless lines.
        assertThat(sql.get(0)).contains("ACCT_NUM IN (SELECT ACCT_NUM");
    }

    @Test
    void accountOnlyEnquiryDoesNotFilterOnCustomer() {
        List<String> sql = pdp("", "01008041574100");

        assertThat(sql.get(1)).contains("ACCT_NUM = :acctNum");
        assertThat(sql.get(0)).doesNotContain("CUST_NUM = :custNum");
        assertThat(sql.get(1)).doesNotContain("CUST_NUM = :custNum");
    }

    @Test
    void accountRouteWithNoBranchDropsTheBranchFilterEntirely() {
        // The account route sends no branch — the screen greys the box out —
        // and an empty bind would filter on '' and match nothing. The fragment
        // has to leave the SQL, in the header query and in the subquery the
        // detail query wraps around it.
        List<String> sql = sqlOf(() ->
                repo.pdpStatements("", "", "01008041574100", "200501", "200912"));

        assertThat(sql.get(0)).doesNotContain("BRANCH_CODE = :branchCode");
        assertThat(sql.get(1)).doesNotContain("BRANCH_CODE = :branchCode");
        // The account number is still doing the narrowing, so the enquiry never
        // degrades to the whole archive.
        assertThat(sql.get(1)).contains("ACCT_NUM = :acctNum");
        assertThat(sql.get(0)).contains("ACCT_NUM IN (SELECT ACCT_NUM");
    }

    @Test
    void pdpOrdersByAccountFirstBecauseTheAnswerCanSpanSeveral() {
        List<String> sql = pdp("0001234", "");

        assertThat(sql.get(0)).contains("ORDER  BY ACCT_NUM, STMT_DATE");
        assertThat(sql.get(1)).contains("ORDER  BY ACCT_NUM, STMT_DATE, PAGE_NUM");
    }

    @Test
    void pdpNeverSelectsStmtNumBecauseThePdpPairHasNone() {
        List<String> sql = pdp("0001234", "");

        assertThat(sql.get(0)).doesNotContain("STMT_NUM");
        assertThat(sql.get(1)).doesNotContain("STMT_NUM");
    }

    /**
     * The screen keys the branch zero-padded to four, as every other branch box
     * in the app does, but PDP's BRANCH_CODE holds the significant digits alone.
     * Bind the padded form and the filter matches nothing — an empty report that
     * reads as "this customer has no statements" rather than as a mismatch.
     */
    @Test
    void theBranchIsBoundWithoutItsLeadingZeros() {
        assertThat(paramsOf(() -> repo.pdpStatements("0127", "0001234", "", "200501", "200912"))
                .getValue("branchCode"))
                .isEqualTo("127");
    }

    /** A branch that is all zeros keeps one digit rather than emptying out. */
    @Test
    void anAllZeroBranchDoesNotStripToNothing() {
        assertThat(paramsOf(() -> repo.pdpStatements("0000", "0001234", "", "200501", "200912"))
                .getValue("branchCode"))
                .isEqualTo("0");
    }

    @Test
    void unconfiguredPdpTablesSayWhichPropertiesAreBlank() {
        JdbcStatementRepository bmOnly = new JdbcStatementRepository(
                jdbc, "BM_STMT_HDR", "BM_STMT_TXN", "", "");

        // The one outcome nobody would think to check the config over: an empty
        // list reaches the operator as "No report found", a DATA answer to a
        // DEPLOYMENT mistake.
        assertThatThrownBy(() -> bmOnly.pdpStatements("0127", "0001234", "", "200501", "200912"))
                .isInstanceOf(NotAvailableException.class)
                .hasMessageContaining("pdp-hdr-table");
    }

    // ------------------------------------------------------------------
    // BM — unchanged by the PDP screen
    // ------------------------------------------------------------------

    @Test
    void bmStillQueriesOneAccountAndNeverFiltersOnBranch() {
        List<String> sql = sqlOf(() ->
                repo.historicalStatements("01008041574100", "0127", "200501", "200912", "BM"));

        assertThat(sql.get(0))
                .contains("FROM   BM_STMT_TXN")
                .contains("WHERE  ACCT_NUM = :acctNum")
                .contains("STMT_NUM");
        assertThat(sql.get(1))
                .contains("FROM   BM_STMT_HDR")
                .contains("STMT_NUM, CUST_NAME, IBAN, REF_NUM");
        // The legacy used branch to choose which Btrieve FILE to open, never to
        // select rows. Filtering here would drop statements it always showed.
        assertThat(sql.get(0)).doesNotContain("BRANCH_CODE = :branchCode");
        assertThat(sql.get(1)).doesNotContain("BRANCH_CODE = :branchCode");
    }

    @Test
    void bmDetailCarriesTheAccountSoTheStatementKeyCanIncludeIt() {
        // The key gained ACCT_NUM for the PDP path's sake; the BM detail query
        // has to select it or every BM statement keys on an empty account.
        assertThat(sqlOf(() ->
                repo.historicalStatements("01008041574100", "0127", "200501", "200912", "BM"))
                .get(0))
                .contains("SELECT ACCT_NUM, STMT_DATE");
    }

    @Test
    void anUnknownSystemIsAConfigurationErrorNotAnEmptyResult() {
        assertThatThrownBy(() ->
                repo.historicalStatements("01008041574100", "0127", "200501", "200912", "NOPE"))
                .isInstanceOf(NotAvailableException.class);
        verify(jdbc, Mockito.never())
                .query(anyString(), any(SqlParameterSource.class), any(RowCallbackHandler.class));
    }
}
