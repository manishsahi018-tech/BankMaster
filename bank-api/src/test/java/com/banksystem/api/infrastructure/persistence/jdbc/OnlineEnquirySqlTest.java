package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.banksystem.api.application.NotAvailableException;
import com.banksystem.api.domain.model.OnlineStatementPage;
import com.banksystem.api.infrastructure.language.RequestLanguage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;
import org.junit.jupiter.api.Test;
import org.springframework.dao.InvalidDataAccessResourceUsageException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

/**
 * On-demand Statement (07) and Transaction Inquiry (11) differ by a handful of
 * predicates, and every one of them is invisible in a passing screenshot: get
 * the statement filter wrong and the statement quietly shows rows it is meant
 * to hide, get the balance walk-back's date bounds wrong and the opening
 * balance is wrong on every range that does not end today. None of it can be
 * checked against a live Denodo from here, so this captures the SQL the
 * repository issues and asserts on that.
 *
 * <p>The hard-fail on a missing crd0data is pinned the same way — by proving no
 * thd0data query is ever issued, not merely that an exception came back.
 */
class OnlineEnquirySqlTest {

    private static final String ACC = "01008041574100";

    private final NamedParameterJdbcTemplate jdbc = mock(NamedParameterJdbcTemplate.class);
    /** Fixed by bank.archival-db.banking-date in a real run; stubbed here so the
     *  BankingDate predicate every query carries has a value to bind. */
    private final BankingDateProvider bankingDate = mock(BankingDateProvider.class);
    /** No locale is bound off a request, so this answers ENGLISH — which is
     *  the branch-name column the assertions below expect. */
    private final RequestLanguage requestLanguage = new RequestLanguage();
    private final JdbcOnlineEnquiryRepository repo =
            new JdbcOnlineEnquiryRepository(jdbc, bankingDate, requestLanguage);

    /** Every statement the repository issued, in order. */
    private final List<String> issued = new ArrayList<>();

    /** How many thd0data rows the paged query answers with. */
    private int transactionRows = 3;

    /** Set to make the crd0data lookup blow up the way an absent view would. */
    private boolean crdBroken = false;

    /** What stctltabXC answers for this account's currency. */
    private String decimalPlace = "3";

    /** The transAmt every stubbed thd0data row carries, as the VIEW holds it. */
    private String viewAmount = "";

    // ------------------------------------------------------------------
    // 07 vs 11 — the one predicate that separates them
    // ------------------------------------------------------------------

    @Test
    void statementHidesDoNotPrintRowsButKeepsBlankFlags() {
        stub();
        repo.onDemandStatement(ACC, "20090101", "20090131", "00000");

        assertThat(pagedQuery())
                .as("cbrt01.c:790-791 skips statmentFlag >= '1'")
                .contains("statmentFlag < '1'")
                .as("the ISAM field is BLANK on an ordinary posting and blank sorts below '1', "
                        + "so a bare < '1' would go unknown on a null and drop every normal row — "
                        + "leaving a statement made only of the rows it is supposed to hide")
                .contains("statmentFlag IS NULL OR");
    }

    @Test
    void transactionInquiryKeepsEveryRow() {
        stub();
        repo.transactionEnquiry(ACC, "20090101", "00000");

        // statmentFlag is still SELECTED — it is one of the four columns service 11
        // adds to each row. What must be absent is the PREDICATE.
        assertThat(pagedQuery())
                .as("cbrt01.c:1162 filters on recType alone, and the view has no recType column")
                .doesNotContain("statmentFlag <")
                .doesNotContain("statmentFlag IS NULL");
    }

    // ------------------------------------------------------------------
    // Paging — the legacy's 26-byte index 1, not an OFFSET window
    // ------------------------------------------------------------------

    @Test
    void pageResumesOnTheCounterAndProbesOnePastTheGatewayPage() {
        stub();
        repo.onDemandStatement(ACC, "20090101", "20090131", "00000");

        assertThat(pagedQuery())
                .contains("transCounter > :pointer")
                .contains("ORDER  BY transCounter")
                .as("51 asked for, 50 shown — the extra row IS the completionFlag")
                .contains("FETCH FIRST 51 ROWS ONLY");
    }

    @Test
    void aFullPageReportsMoreToCome() {
        transactionRows = 51;
        stub();
        OnlineStatementPage page = repo.onDemandStatement(ACC, "20090101", "20090131", "00000");

        assertThat(page.transactions()).hasSize(50);
        assertThat(page.completionFlag()).isEqualTo("0");
        assertThat(page.lastTransPtr())
                .as("the pointer the next request resumes from is the last SHOWN row, "
                        + "never the probe row")
                .isEqualTo("00049");
    }

    @Test
    void aShortPageEndsTheWalk() {
        transactionRows = 3;
        stub();
        OnlineStatementPage page = repo.onDemandStatement(ACC, "20090101", "20090131", "00000");

        assertThat(page.transactions()).hasSize(3);
        assertThat(page.completionFlag()).isEqualTo("1");
    }

    // ------------------------------------------------------------------
    // The balance walk-back
    // ------------------------------------------------------------------

    @Test
    void balanceWalkBackHasNoUpperDateBound() {
        stub();
        repo.onDemandStatement(ACC, "20090101", "20090131", "00000");

        assertThat(movementQuery())
                .as("bookBal is TODAY's balance, so reversing everything posted since fromDate "
                        + "is what yields the opening balance AT fromDate — a toDate bound here "
                        + "would corrupt the B/F on any range not ending today "
                        + "(cbrt01.c accumulates between its two date tests)")
                .contains("postDate >= :fromDate")
                .doesNotContain("postDate <= :toDate");
    }

    @Test
    void continuationPagesDoNotWalkTheBalanceAgain() {
        stub();
        repo.onDemandStatement(ACC, "20090101", "20090131", "00042");

        assertThat(issued)
                .as("the C returns zeros for B/F on every page after the first (cbrt01.c:867-884) "
                        + "precisely so each continuation page does not re-scan the account")
                .noneMatch(sql -> sql.contains("SELECT transAmt"));
    }

    @Test
    void theStatementFilterAppliesToTheWalkBackToo() {
        stub();
        repo.onDemandStatement(ACC, "20090101", "20090131", "00000");

        assertThat(movementQuery())
                .as("B/F is bookBal walked back over exactly the rows that survived the filter — "
                        + "which is why 07 and 11 legitimately disagree on the opening balance")
                .contains("statmentFlag IS NULL OR statmentFlag < '1'");
    }

    // ------------------------------------------------------------------
    // Blank fromDate — service 11 started from a transaction NUMBER
    // ------------------------------------------------------------------

    @Test
    void blankFromDateOmitsTheLowerBoundRatherThanBindingSpaces() {
        stub();
        repo.transactionEnquiry(ACC, "", "00041");

        assertThat(pagedQuery())
                .as("the C compares against eight spaces, which every date sorts above, so no row "
                        + "is skipped — an omitted predicate reproduces that, a bound one does not")
                .doesNotContain("postDate >= :fromDate")
                .as("toDate is still there: the server substitutes its own current date")
                .contains("postDate <= :toDate");
    }

    // ------------------------------------------------------------------
    // Major units in the view, minor units on the wire
    // ------------------------------------------------------------------

    /**
     * The C copied thd0data.transAmt across untouched because the ISAM field
     * WAS minor units. The archival view is not: its amount columns are
     * numeric(16,3) holding major units — a balance reads 1552.49, measured
     * against real data. Emitting that unscaled would have the screen divide by
     * the denomination a second time and render 1.552.
     */
    @Test
    void aMajorUnitAmountIsScaledUpToTheGatewaysMinorUnits() {
        decimalPlace = "2";
        viewAmount = "1552.49";
        stub();

        assertThat(repo.onDemandStatement(ACC, "20090101", "20090131", "00000")
                .transactions().get(0).transAmt())
                .as("1552.49 major at 2 decimals is 155249 minor; the screen divides by 100 "
                        + "and gets 1552.49 back")
                .isEqualTo("+00000000155249");
    }

    @Test
    void theScaleFollowsTheCurrencysOwnDecimalPlace() {
        decimalPlace = "3";
        viewAmount = "1552.49";
        stub();
        assertThat(repo.onDemandStatement(ACC, "20090101", "20090131", "00000")
                .transactions().get(0).transAmt())
                .isEqualTo("+00000001552490");
    }

    @Test
    void aWholeUnitCurrencyIsNotScaledAtAll() {
        decimalPlace = "0";
        viewAmount = "36404";
        stub();

        assertThat(repo.onDemandStatement(ACC, "20090101", "20090131", "00000")
                .transactions().get(0).transAmt())
                .as("coinDenomination is 1 for anything but 1/2/3, and real stctltabXC data "
                        + "carries 0 — scaling there would multiply by nothing and must not "
                        + "quietly become x10")
                .isEqualTo("+00000000036404");
    }

    @Test
    void theBroughtForwardBalanceIsScaledTheSameWay() {
        decimalPlace = "2";
        viewAmount = "0";
        stub();

        // bookBal 5000.00 stubbed below, movement 0 across four zero rows.
        assertThat(repo.onDemandStatement(ACC, "20090101", "20090131", "00000").bfBalance())
                .as("a balance that scaled differently from the rows would make the running "
                        + "total drift line by line, which reads as a data problem, not a bug")
                .isEqualTo("+00000000500000");
    }

    // ------------------------------------------------------------------
    // Hard-fail
    // ------------------------------------------------------------------

    @Test
    void aMissingCrd0dataRefusesBeforeAnyTransactionIsFetched() {
        crdBroken = true;
        stub();

        assertThatThrownBy(() -> repo.onDemandStatement(ACC, "20090101", "20090131", "00000"))
                .isInstanceOf(NotAvailableException.class)
                .hasMessageContaining("crd0data");

        assertThat(issued)
                .as("refusing AFTER reading the transactions would still be a refusal, but it "
                        + "would have fetched the rows it then declined to show")
                .noneMatch(sql -> sql.contains("thd0data"));
    }

    // ------------------------------------------------------------------
    // Stubbing
    // ------------------------------------------------------------------

    private String pagedQuery() {
        return issued.stream().filter(s -> s.contains("thd0data") && s.contains("FETCH FIRST"))
                .findFirst().orElseThrow(() -> new AssertionError("no paged query issued"));
    }

    private String movementQuery() {
        return issued.stream().filter(s -> s.contains("SELECT transAmt"))
                .findFirst().orElseThrow(() -> new AssertionError("no balance walk-back issued"));
    }

    @SuppressWarnings("unchecked")
    private void stub() {
        when(jdbc.query(anyString(), any(SqlParameterSource.class), any(RowMapper.class)))
                .thenAnswer(call -> {
                    String sql = call.getArgument(0);
                    issued.add(sql);
                    RowMapper<Object> mapper = call.getArgument(2);
                    if (sql.contains("crd0data")) {
                        if (crdBroken) {
                            throw new InvalidDataAccessResourceUsageException(
                                    "View 'crd0data' not found");
                        }
                        return List.of(mapper.mapRow(row(Map.of(
                                "shortName", "MR DEMO ACCOUNT HOLDER",
                                "address1", "PO BOX 56921",
                                "address2", "OLAYA STREET RIYADH",
                                "language", "0")), 0));
                    }
                    if (sql.contains("gld0data")) {
                        return List.of(mapper.mapRow(row(Map.of(
                                "bookBal", "5000.00",
                                "branchCode", "0127",
                                "branchName", "OLAYA MAIN BRANCH")), 0));
                    }
                    List<Object> rows = new ArrayList<>();
                    for (int i = 0; i < transactionRows; i++) {
                        rows.add(mapper.mapRow(row(Map.of(
                                "userId", "ABC",
                                "postDate", "2009-01-1" + (i % 10),
                                "valueDate", "2009-01-1" + (i % 10),
                                "transType", "01",
                                "transAmt", viewAmount.isEmpty()
                                        ? "0000000001000" + (i % 10) : viewAmount,
                                "narrative1", "NARRATIVE",
                                "transRef", "REF%07d".formatted(i),
                                "supervisorId", "SUP",
                                "transCounter", "%05d".formatted(i),
                                "statmentFlag", " ")), i));
                    }
                    return rows;
                });

        when(jdbc.queryForList(anyString(), any(SqlParameterSource.class), eq(String.class)))
                .thenAnswer(call -> {
                    String sql = call.getArgument(0);
                    issued.add(sql);
                    if (sql.contains("stctltabXC")) {
                        return List.of(decimalPlace);
                    }
                    // The balance walk-back's rows, in the view's major units.
                    return IntStream.range(0, 4)
                            .mapToObj(i -> viewAmount.isEmpty() ? "0000000001000" + i : "0")
                            .toList();
                });
    }

    /** A ResultSet that answers getString(name) from a map, blank for anything else. */
    private static ResultSet row(Map<String, String> values) throws SQLException {
        ResultSet rs = mock(ResultSet.class);
        when(rs.getString(anyString()))
                .thenAnswer(call -> values.getOrDefault(call.<String>getArgument(0), ""));
        return rs;
    }
}
