package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.TransactionSummary;
import com.banksystem.api.domain.model.TransferSummary;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

/**
 * Both enquiries on this repository — SARIE transfers and BM transactions —
 * page IN THE QUERY, so what the window clause looks like and where it sits are
 * the whole contract, and neither can be checked against a live Denodo from a
 * test. This captures the SQL the repository hands the template and asserts the
 * shape instead.
 *
 * <p>Also pins the n+1 probe: the repository asks for PAGE_SIZE + 1 rows and
 * reports the extra one as {@code hasMore} rather than running a COUNT, so the
 * trimming has to be exact or the grid either loses a row per page or offers a
 * Next that returns nothing.
 */
class TransferPagingSqlTest {

    private final NamedParameterJdbcTemplate jdbc = mock(NamedParameterJdbcTemplate.class);
    private final JdbcTransferRepository repo = new JdbcTransferRepository(jdbc);

    /** Runs a query returning {@code rowCount} rows and returns the SQL that was issued. */
    private String sqlFor(int page, int rowCount) {
        stubRows(rowCount);
        repo.sarieTransfers("01008041574100", "20240101", "20260819", null, "A", page);
        ArgumentCaptor<String> sql = ArgumentCaptor.forClass(String.class);
        org.mockito.Mockito.verify(jdbc, org.mockito.Mockito.atLeastOnce())
                .query(sql.capture(), any(SqlParameterSource.class), any(RowMapper.class));
        return sql.getValue();
    }

    @SuppressWarnings("unchecked")
    private void stubRows(int rowCount) {
        List<TransferSummary> rows = new ArrayList<>(IntStream.range(0, rowCount)
                .mapToObj(i -> new TransferSummary("SR%08d".formatted(i), "20250101", "20250102",
                        "01008041574100", "608", "100.000", "608", "100.000", "C"))
                .toList());
        when(jdbc.query(anyString(), any(SqlParameterSource.class), any(RowMapper.class)))
                .thenReturn(rows);
    }

    @Test
    void firstPageAsksForOnePastThePageAndEmitsNoOffset() {
        String sql = sqlFor(0, 5);

        assertThat(sql)
                .as("page 0 starts at row 0, so OFFSET would be a no-op — and leaving it out "
                        + "keeps the common page on syntax already proven against these views")
                .doesNotContain("OFFSET")
                .contains("FETCH FIRST %d ROWS ONLY".formatted(PagedResult.PAGE_SIZE + 1));
    }

    @Test
    void laterPagesOffsetByWholePages() {
        assertThat(sqlFor(1, 5)).contains("OFFSET 10 ROWS");
        assertThat(sqlFor(3, 5)).contains("OFFSET 30 ROWS");
    }

    @Test
    void negativePageIsTreatedAsTheFirstPage() {
        assertThat(sqlFor(-2, 5)).doesNotContain("OFFSET");
    }

    @Test
    void windowFollowsTheOrderByAndTheOrderByFollowsTheFilters() {
        String sql = sqlFor(2, 5);

        int where = sql.indexOf("WHERE");
        int orderBy = sql.indexOf("ORDER  BY");
        int offset = sql.indexOf("OFFSET");
        int fetch = sql.indexOf("FETCH FIRST");

        assertThat(List.of(where, orderBy, offset, fetch))
                .as("ANSI clause order — an OFFSET before ORDER BY is a syntax error, and an "
                        + "OFFSET on an unordered scan windows an arbitrary set of rows")
                .doesNotContain(-1)
                .isSorted();
    }

    @Test
    void theRefNoFilterStaysInsideTheWhereClause() {
        stubRows(0);
        repo.sarieTransfers("01008041574100", "20240101", "20260819", "SR06137450", "A", 1);
        ArgumentCaptor<String> sql = ArgumentCaptor.forClass(String.class);
        org.mockito.Mockito.verify(jdbc)
                .query(sql.capture(), any(SqlParameterSource.class), any(RowMapper.class));

        assertThat(sql.getValue().indexOf("transRef = :refNo"))
                .as("a filter appended after ORDER BY or the window clause would not parse")
                .isGreaterThan(0)
                .isLessThan(sql.getValue().indexOf("ORDER  BY"));
    }

    @Test
    void theProbeRowIsReportedAsHasMoreAndNotReturned() {
        stubRows(PagedResult.PAGE_SIZE + 1);
        PagedResult<TransferSummary> full =
                repo.sarieTransfers("01008041574100", "20240101", "20260819", null, "A", 0);

        assertThat(full.rows()).hasSize(PagedResult.PAGE_SIZE);
        assertThat(full.hasMore()).isTrue();
        assertThat(full.rows().getLast().transRef())
                .as("the trim must drop the probe row, not the last real one")
                .isEqualTo("SR%08d".formatted(PagedResult.PAGE_SIZE - 1));
    }

    @Test
    void anExactlyFullPageIsTheLastPage() {
        stubRows(PagedResult.PAGE_SIZE);
        PagedResult<TransferSummary> exact =
                repo.sarieTransfers("01008041574100", "20240101", "20260819", null, "A", 0);

        assertThat(exact.rows()).hasSize(PagedResult.PAGE_SIZE);
        assertThat(exact.hasMore())
                .as("ten rows means the eleventh was asked for and did not exist")
                .isFalse();
    }

    @Test
    void anEmptyResultIsAnEmptyPageWithNothingBeyondIt() {
        stubRows(0);
        PagedResult<TransferSummary> none =
                repo.sarieTransfers("01008041574100", "20240101", "20260819", null, "A", 0);

        assertThat(none.rows()).isEmpty();
        assertThat(none.hasMore()).isFalse();
        assertThat(none.incomplete()).isFalse();
    }

    // ------------------------------------------------------------------
    // BM transactions (thd0data) — same window, walked to the end by the
    // screen because its Total and printed report cover the whole result.
    // ------------------------------------------------------------------

    @SuppressWarnings("unchecked")
    private String transactionSqlFor(int page, int rowCount) {
        List<TransactionSummary> rows = new ArrayList<>(IntStream.range(0, rowCount)
                .mapToObj(i -> new TransactionSummary("TR%08d".formatted(i), "20250101", "20250102",
                        "OPER1", "50.000", String.valueOf(i), "01"))
                .toList());
        when(jdbc.query(anyString(), any(SqlParameterSource.class), any(RowMapper.class)))
                .thenReturn(rows);
        repo.bmTransactions("01008041574100", "20240101", "20260819", "", page);
        ArgumentCaptor<String> sql = ArgumentCaptor.forClass(String.class);
        org.mockito.Mockito.verify(jdbc, org.mockito.Mockito.atLeastOnce())
                .query(sql.capture(), any(SqlParameterSource.class), any(RowMapper.class));
        return sql.getValue();
    }

    @Test
    void transactionsWindowTheSameWayTransfersDo() {
        assertThat(transactionSqlFor(0, 3))
                .doesNotContain("OFFSET")
                .contains("FETCH FIRST %d ROWS ONLY".formatted(PagedResult.PAGE_SIZE + 1));
        assertThat(transactionSqlFor(4, 3)).contains("OFFSET 40 ROWS");
    }

    @Test
    void theTransactionWindowFollowsTheKeyOrdering() {
        String sql = transactionSqlFor(1, 3);

        assertThat(sql.indexOf("ORDER  BY postDate, transCounter"))
                .as("thd0data's key carries postDate + transCounter, so within one accNo this "
                        + "is a total order and the window cannot repeat or skip a row")
                .isGreaterThan(0)
                .isLessThan(sql.indexOf("OFFSET"));
        assertThat(sql.indexOf("OFFSET")).isLessThan(sql.indexOf("FETCH FIRST"));
    }

    @Test
    void theReversalFilterStaysInsideTheTransactionWhereClause() {
        when(jdbc.query(anyString(), any(SqlParameterSource.class), any(RowMapper.class)))
                .thenReturn(List.of());
        repo.bmTransactions("01008041574100", "20240101", "20260819", "RR", 2);
        ArgumentCaptor<String> sql = ArgumentCaptor.forClass(String.class);
        org.mockito.Mockito.verify(jdbc)
                .query(sql.capture(), any(SqlParameterSource.class), any(RowMapper.class));

        assertThat(sql.getValue().indexOf("statmentFlag > '1'"))
                .isGreaterThan(0)
                .isLessThan(sql.getValue().indexOf("ORDER  BY"));
    }

    @Test
    void theTransactionProbeRowIsReportedAsHasMoreAndNotReturned() {
        transactionSqlFor(0, PagedResult.PAGE_SIZE + 1); // stubs the rows
        PagedResult<TransactionSummary> full =
                repo.bmTransactions("01008041574100", "20240101", "20260819", "", 0);

        assertThat(full.rows()).hasSize(PagedResult.PAGE_SIZE);
        assertThat(full.hasMore()).isTrue();
        assertThat(full.rows().getLast().transRef())
                .isEqualTo("TR%08d".formatted(PagedResult.PAGE_SIZE - 1));
    }

    @Test
    void anExactlyFullTransactionPageIsTheLastPage() {
        transactionSqlFor(0, PagedResult.PAGE_SIZE);
        PagedResult<TransactionSummary> exact =
                repo.bmTransactions("01008041574100", "20240101", "20260819", "", 0);

        assertThat(exact.rows()).hasSize(PagedResult.PAGE_SIZE);
        assertThat(exact.hasMore())
                .as("the screen walks pages until this is false, so a wrong answer here either "
                        + "truncates the Total or spins an extra empty request")
                .isFalse();
    }

    @Test
    void theTablePrefixRewriteLeavesTheWindowClauseAlone() {
        String prefixed = new SqlTablePrefixer("bv_impala_stg_bankmaster_").rewrite(sqlFor(2, 5));

        assertThat(prefixed)
                .contains("FROM   bv_impala_stg_bankmaster_rid0data")
                .contains("OFFSET 20 ROWS")
                .contains("FETCH FIRST 11 ROWS ONLY");
    }
}
