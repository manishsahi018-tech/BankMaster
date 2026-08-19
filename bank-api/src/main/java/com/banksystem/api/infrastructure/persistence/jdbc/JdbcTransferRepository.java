package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.BmForms;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.TransactionDetail;
import com.banksystem.api.domain.model.TransactionSummary;
import com.banksystem.api.domain.model.TransferDetail;
import com.banksystem.api.domain.model.TransferSummary;
import com.banksystem.api.domain.repository.TransferRepository;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * SARIE transfers (rid0data) and BM transactions (thd0data) from
 * the Denodo views — QUERY-SPECS.md §17–18, legacy cbswift.c
 * processTransferEnq/processTransferDetail and
 * processBmTransEnq/processBmTransDetail.
 *
 * <p>Schema notes (rid0data.ts / thd0data.ts win over the spec):
 * <ul>
 *   <li>rid0data.crAccNo/drAccNo and thd0data.accNo are 14 chars in the
 *       archival schema (the spec's "index on BM accNo (13)" refers to the
 *       live ISAM key; the views carry the actual form). A 13-char BM-form
 *       argument is converted with {@link BmForms#actualAcc} defensively.</li>
 *   <li>The spec's recycled-name warning ("applicantName is stored in
 *       totAmt") is superseded by the workbook: totAmt became numeric and a
 *       dedicated {@code applicantName} column was added 14/08/2025. The
 *       beneficiary block however still lives in recycled pension fields:
 *       benefName in {@code penProxyName}, benefAddr1 in
 *       {@code pensionerName} (per §17), benefAddr2 in
 *       {@code benefAddress2}, bank in {@code benefBank1}.</li>
 *   <li>thd0data has no {@code recType} column — the workbook folded the
 *       legacy recType '1' continuation narratives (narrative2/3) into the
 *       thd0data view itself, so the header row carries all three
 *       narratives. thd0data1 is the recType 2/3 rate-change record family
 *       (its narrative2 is a rate stamp) and is NOT read here.</li>
 * </ul>
 */
@Repository
@Profile("denodo")
public class JdbcTransferRepository implements TransferRepository {

    private static final Logger log = LoggerFactory.getLogger(JdbcTransferRepository.class);


    /** Correlated scalar subquery (Denodo has no LATERAL) for the customer short
     *  name, faithful to getCustName + caller (cbothers.c:8234-8239, cbswift.c:
     *  1464/2001): getCustName overwrites the short name with the ORG short name
     *  when custType != '0' (juristic), THEN the caller picks Arabic-else-English.
     *  Net: individuals use the consumer short names, juristic use the org short
     *  names — custType decides, they are NOT a flat fallback chain. */
    private static final String STCUSTTAB_NAME = """
            (SELECT CASE WHEN c.custType = '0'
                         THEN COALESCE(NULLIF(TRIM(c.aShortName), ''), c.eShortName)
                         ELSE COALESCE(NULLIF(TRIM(c.aOrgShortName), ''), c.eOrgShortName)
                    END
             FROM stcusttab c
             WHERE c.custNo = SUBSTR(%1$s.%2$s, 6, 7))""";

    /**
     * The second half of getCustName (cbothers.c:8210-8231): a customer NOT in
     * stcusttab is read from crd0data instead, whose single {@code shortName} is
     * moved into both the Arabic and English slots — so there is nothing to pick
     * between and no custType branch, just the one column.
     *
     * <p>This one CANNOT ride along as a correlated subquery beside
     * {@link #STCUSTTAB_NAME}, because crd0data is keyed the way the legacy keys
     * it: the 6-char PACKED BM customer that {@code actualToBmCust} produces
     * ({@link BmForms#bmCust}). Below 1,000,000 that is just the last six digits,
     * but from there to 6,199,999 the leading two digits collapse into a single
     * letter — arithmetic no SUBSTR expresses, and the kind of number-form
     * conversion this port deliberately keeps in Java rather than in SQL text.
     * So it runs as its own point read, after the main query, only when the
     * stcusttab name came back empty.
     *
     * <p>Which is also CLOSER to the C than the subquery form was: getCustName
     * falls back on the stcusttab ROW being absent, and an empty name is very
     * nearly that test — where it differs (a row present with blank names)
     * crd0data holds the same name anyway.
     */
    private static final String CRD0DATA_NAME = """
            SELECT shortName
            FROM   crd0data
            WHERE  accNo = :bmCustNo
            """;

    /** stcusttab alone; {@link #crdShortName} supplies getCustName's other half. */
    private static final String CUST_NAME_SUBQUERY = STCUSTTAB_NAME;

    private final NamedParameterJdbcTemplate jdbc;

    public JdbcTransferRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    // ------------------------------------------------------------------
    // §17 SARIE transfer enquiry — rid0data, legacy index 4 on issueDate
    // ------------------------------------------------------------------

    /**
     * One page of the transfer enquiry, windowed IN THE QUERY.
     *
     * <p>The enquiry used to read every row in the date range and let
     * {@code PagedResult.page} slice ten out of it in Java, so every page cost a
     * full-range scan of rid0data and threw the rest away. The window is now
     * {@code OFFSET n ROWS FETCH FIRST m ROWS ONLY} on the same
     * {@code ORDER BY issueDate, transRef} the legacy index-4 walk implies, so a
     * page reads (at most) eleven rows.
     *
     * <p>Eleven, not ten: {@link PagedResult} reports {@code hasMore} as a flag
     * rather than a count, and one extra row answers it exactly without a second
     * COUNT(*) round trip. The probe row is dropped before the page is returned.
     *
     * <p>Two dialect notes. {@code FETCH FIRST n ROWS ONLY} is already used
     * against these views (see the point reads below and JdbcCardRepository), so
     * only {@code OFFSET} is new here — and it is emitted ONLY for page &gt; 0,
     * which keeps the first page, the overwhelmingly common one, on syntax this
     * codebase has already exercised. Both counts are interpolated as int
     * literals rather than bound: JDBC drivers commonly reject bind parameters in
     * the fetch clause, and the codebase already interpolates there.
     *
     * <p>KNOWN GAP, pending the BankingDate work: the window assumes
     * {@code (issueDate, transRef)} identifies one row, and today it does not.
     * rid0data is one of the BM views holding the SAME record once per restore
     * snapshot (it spans 1992..11/07/2009), so a transfer present in several
     * snapshots is several rows sharing a transRef. That already shows as
     * duplicate rows in the grid — the sod0data equivalent was fixed by
     * partitioning on the legacy key, {@code standingOrders()} in
     * JdbcAccountRepository — and it additionally makes the paging unstable:
     * duplicates are TIES under the ORDER BY, Hive breaks ties arbitrarily, and
     * each page is now its own query, so a tie group straddling a page boundary
     * can repeat a row across pages or drop one. The Java-side slicing this
     * replaced was immune (one query, one ordering).
     *
     * <p>The fix belongs with the snapshot dedupe rather than here — a
     * correlated {@code AND r.BankingDate = (SELECT MAX(x.BankingDate) FROM
     * rid0data x WHERE x.transRef = r.transRef)}, per key and never a table-wide
     * MAX. Once each transRef yields one row the sort is total and the window is
     * stable, so no third sort key is added in the meantime.
     */
    @Override
    public PagedResult<TransferSummary> sarieTransfers(
            String accNo, String fromDate, String toDate, String refNo, String status, int page) {
        StringBuilder sql = new StringBuilder("""
                SELECT transRef, issueDate, valueDate, drAccNo, transCurrCode,
                       netAmt, payCurrCode, payAmt, statusFlag
                FROM   rid0data
                WHERE  crAccNo = :accNo
                  AND  issueDate BETWEEN :fromDate AND :toDate
                """);
        MapSqlParameterSource params = new MapSqlParameterSource()
                .addValue("accNo", actualAccForm(accNo))
                // issueDate is a Date column in the view; the UI sends the BM
                // YYYYMMDD the legacy compares against (cbswift.c:492-494 does
                // bmDateToActual then strncmp), so bind it as a date literal.
                .addValue("fromDate", BmForms.bmToIso(fromDate))
                .addValue("toDate", BmForms.bmToIso(toDate));
        // Legacy (cbswift.c:455-467): the refNo and status filters are
        // MUTUALLY EXCLUSIVE — when a refNo is supplied the C matches on
        // transRef only and ignores recordStatus entirely; the statusFlag
        // filter applies only on the else branch (and is skipped for 'A').
        if (!isBlank(refNo)) {
            sql.append("  AND  transRef = :refNo\n");
            params.addValue("refNo", refNo.trim());
        } else if (!isBlank(status) && !"A".equals(status.trim())) {
            sql.append("  AND  statusFlag = :status\n");
            params.addValue("status", status.trim());
        }
        sql.append("""
                ORDER  BY issueDate, transRef
                """);
        appendWindow(sql, page);
        List<TransferSummary> rows = jdbc.query(sql.toString(), params, (rs, i) -> new TransferSummary(
                scrub(rs.getString("transRef")),
                BmForms.isoToBmDate(scrub(rs.getString("issueDate"))),
                BmForms.isoToBmDate(scrub(rs.getString("valueDate"))),
                scrub(rs.getString("drAccNo")),
                scrub(rs.getString("transCurrCode")),
                scrub(rs.getString("netAmt")),
                scrub(rs.getString("payCurrCode")),
                scrub(rs.getString("payAmt")),
                scrub(rs.getString("statusFlag"))));
        return pageOf(rows);
    }

    // ------------------------------------------------------------------
    // §17 SARIE transfer detail — rid0data point read by transRef
    // ------------------------------------------------------------------

    @Override
    public Optional<TransferDetail> transferDetail(String refNo, String transDate) {
        StringBuilder sql = new StringBuilder("""
                SELECT r.transRef, r.issueDate, r.valueDate, r.crAccNo, r.drAccNo,
                       r.transCurrCode, r.payCurrCode, r.netAmt, r.payAmt,
                       r.applicantName,
                       r.penProxyName, r.pensionerName, r.benefAddress2, r.benefBank1,
                       r.paymentStatus, r.statusFlag, r.branchCode,
                       r.transferPurpose, r.exchangeRate, r.message1,
                       """
                + CUST_NAME_SUBQUERY.formatted("r", "crAccNo") + " AS custName\n"
                + """
                FROM   rid0data r
                WHERE  r.transRef = :refNo
                """);
        MapSqlParameterSource params = new MapSqlParameterSource()
                .addValue("refNo", refNo);
        if (!isBlank(transDate)) {
            sql.append("  AND  r.issueDate = :transDate\n");
            params.addValue("transDate", BmForms.bmToIso(transDate.trim()));
        }
        // Legacy reads rid0data on index 1 with ISNEXT and returns the FIRST row
        // in key order whose transRef matches (cbswift.c:1359-1384). Order by the
        // index-1 key so the transDate-omitted, non-unique-transRef case is
        // deterministic instead of Hive-arbitrary.
        sql.append("ORDER  BY r.transRef, r.issueDate\n");
        sql.append("FETCH FIRST 1 ROWS ONLY\n");
        List<TransferDetail> rows = jdbc.query(sql.toString(), params, (rs, i) -> new TransferDetail(
                scrub(rs.getString("transRef")),
                BmForms.isoToBmDate(scrub(rs.getString("issueDate"))),
                BmForms.isoToBmDate(scrub(rs.getString("valueDate"))),
                scrub(rs.getString("crAccNo")),
                scrub(rs.getString("drAccNo")),
                scrub(rs.getString("transCurrCode")),
                scrub(rs.getString("payCurrCode")),
                scrub(rs.getString("netAmt")),
                scrub(rs.getString("payAmt")),
                // Dedicated column since the 14/08/2025 workbook (was: totAmt).
                scrub(rs.getString("applicantName")),
                // Recycled legacy pension fields — mapped by MEANING (§17):
                scrub(rs.getString("penProxyName")),     // benefName
                scrub(rs.getString("pensionerName")),    // benefAddr1
                scrub(rs.getString("benefAddress2")),    // benefAddr2
                scrub(rs.getString("benefBank1")),       // benefBank
                // Legacy field recycling (cbswift.c:1453-1454):
                //   transType   = ridRec.paymentStatus (1-Direct, 2-SWIFT/
                //                 Telex, 3-Postal/Fax, 4-Telephone)
                //   paymentType = ridRec.statusFlag (S/I/V/C/D/P/O/R/T) —
                //                 NOT rid0data.payMethod, which is a distinct
                //                 column the C never sends.
                scrub(rs.getString("paymentStatus")),    // transType
                scrub(rs.getString("statusFlag")),       // paymentType
                scrub(rs.getString("branchCode")),
                scrub(rs.getString("custName")),
                scrub(rs.getString("transferPurpose")),
                scrub(rs.getString("exchangeRate")),
                scrub(rs.getString("message1"))));
        if (rows.isEmpty()) {
            return Optional.empty();
        }
        // Legacy: requestType '01' checks stswiftlog and blocks the enquiry
        // while a SWIFT update is still pending. checkSwiftPendingStatus
        // (cbswift.c:2355-2382) keys on transRefNo + the FOUND row's
        // issueDate and treats only bmUpdateStatus '1'/'2' as pending.
        TransferDetail detail = rows.get(0);
        if (detail.custName().isEmpty()) {
            detail = detail.withCustName(crdShortName(detail.crAccNo()));
        }
        if (hasPendingSwiftUpdate(refNo, detail.issueDate())) {
            log.warn("Transfer {} has a pending stswiftlog update — blocking detail enquiry", refNo);
            return Optional.empty();
        }
        return Optional.of(detail);
    }

    // ------------------------------------------------------------------
    // §18 BM transaction enquiry — thd0data
    // ------------------------------------------------------------------

    /**
     * One page of the BM transaction enquiry, windowed in the query exactly as
     * {@link #sarieTransfers} — same OFFSET/FETCH FIRST shape, same n+1 probe
     * for hasMore, OFFSET emitted only past the first page.
     *
     * <p>The caller does NOT stop at one page: the legacy cmdGo_Click loops
     * until the server clears completionFlag (frmTransEnq.frm), loads every
     * batch, and only then sums the amounts and enables Print — so the screen
     * walks the pages to the end and the window is a bound on each READ, not on
     * what the operator sees. That is the point: the walk used to cost one
     * full-range scan of thd0data per page and discard all but ten rows.
     *
     * <p>Unlike rid0data, the ordering here is a genuine key — but NOT the one
     * an earlier note here claimed. thd0data's index 1 is 26 bytes,
     * {@code accNo[13] + filler1[7] + transCounter[5] + recType}
     * (cbslib/layout.h:1575-1578); postDate sits at offset 27 and is not in the
     * key at all. The C seeks that index with keylen 13 and walks ISNEXT
     * (cbswift.c:1871-1872), so it returns rows in POSTING-SEQUENCE order, and
     * {@code ORDER BY transCounter} is what reproduces it.
     *
     * <p>Ordering by postDate first, as this did, was a total order too —
     * transCounter is unique within an account, so the window still could not
     * repeat or skip — but it is a DIFFERENT order, and the two disagree exactly
     * where a transaction was back-valued or posted late. The row set and the
     * screen's total are unaffected either way, since the caller drains every
     * page before summing; what changes is the sequence the operator reads.
     */
    @Override
    public PagedResult<TransactionSummary> bmTransactions(
            String accNo, String fromDate, String toDate, String transType, int page) {
        StringBuilder sql = new StringBuilder("""
                SELECT transRef, postDate, valueDate, userId, transAmt,
                       transCounter, transType
                FROM   thd0data
                WHERE  accNo = :accNo
                  AND  postDate BETWEEN :fromDate AND :toDate
                """);
        MapSqlParameterSource params = new MapSqlParameterSource()
                .addValue("accNo", actualAccForm(accNo))
                // postDate is a Date column in the view; the legacy compares the
                // ACTUAL YYYYMMDD (bmDateToActual(thdRec.postDate) vs from/to,
                // cbswift.c:1887-1890), so bind the same value as a date literal.
                .addValue("fromDate", BmForms.bmToIso(fromDate))
                .addValue("toDate", BmForms.bmToIso(toDate));
        // Three-way legacy branch: blank = all, 'RR' = reversals only
        // (statmentFlag > '1'), anything else = exact match.
        if (!isBlank(transType)) {
            if ("RR".equals(transType.trim())) {
                sql.append("  AND  statmentFlag > '1'\n");
            } else {
                sql.append("  AND  transType = :transType\n");
                params.addValue("transType", transType.trim());
            }
        }
        sql.append("""
                ORDER  BY transCounter
                """);
        appendWindow(sql, page);
        List<TransactionSummary> rows = jdbc.query(sql.toString(), params, (rs, i) -> new TransactionSummary(
                scrub(rs.getString("transRef")),
                BmForms.isoToBmDate(scrub(rs.getString("postDate"))),
                BmForms.isoToBmDate(scrub(rs.getString("valueDate"))),
                scrub(rs.getString("userId")),
                scrub(rs.getString("transAmt")),
                scrub(rs.getString("transCounter")),
                scrub(rs.getString("transType"))));
        return pageOf(rows);
    }

    // ------------------------------------------------------------------
    // §18 BM transaction detail — thd0data header (carries all narratives)
    // ------------------------------------------------------------------

    @Override
    public Optional<TransactionDetail> bmTransactionDetail(String accNo, String refNo) {
        String actualAcc = actualAccForm(accNo);
        MapSqlParameterSource params = new MapSqlParameterSource()
                .addValue("accNo", actualAcc)
                .addValue("refNo", refNo);
        // Legacy index 2 (accNo + transRef), recType '0' header. The C reads
        // narratives 2/3 from a separate recType '1' continuation record
        // (thd1data layout, keyed accNo + transCounter — cbswift.c:2019-2037),
        // but the archival workbook folded those narrative columns into the
        // thd0data view itself (thd0data.ts narrative2/narrative3 carry the
        // posting-narrative semantics), so the header row is the sole source.
        // thd0data1 is the recType 2/3 rate-change record family — NOT the
        // narrative continuation — and must not be consulted here.
        List<TransactionDetail> rows = jdbc.query("""
                SELECT t.accNo, t.transRef, t.postDate, t.valueDate, t.transAmt,
                       t.transType, t.userId, t.supervisorId, t.statmentFlag,
                       t.narrative1, t.narrative2, t.narrative3,
                       """
                + CUST_NAME_SUBQUERY.formatted("t", "accNo") + " AS custName\n"
                + """
                FROM   thd0data t
                WHERE  t.accNo = :accNo
                  AND  t.transRef = :refNo
                ORDER  BY t.postDate, t.transCounter
                FETCH FIRST 1 ROWS ONLY
                """, params, (rs, i) -> new TransactionDetail(
                scrub(rs.getString("accNo")),
                scrub(rs.getString("transRef")),
                scrub(rs.getString("custName")),
                BmForms.isoToBmDate(scrub(rs.getString("postDate"))),
                BmForms.isoToBmDate(scrub(rs.getString("valueDate"))),
                scrub(rs.getString("transAmt")),
                scrub(rs.getString("transType")),
                scrub(rs.getString("userId")),
                scrub(rs.getString("supervisorId")),
                scrub(rs.getString("statmentFlag")),
                scrub(rs.getString("narrative1")),
                scrub(rs.getString("narrative2")),
                scrub(rs.getString("narrative3"))));
        if (rows.isEmpty()) {
            return Optional.empty();
        }
        TransactionDetail detail = rows.get(0);
        return Optional.of(detail.custName().isEmpty()
                ? detail.withCustName(crdShortName(actualAcc))
                : detail);
    }

    /**
     * getCustName's crd0data branch — the 6-char PACKED BM customer, exactly as
     * {@code actualToBmCust(&accNo[5])} builds it. See {@link #CRD0DATA_NAME}
     * for why this is a separate read rather than part of the main query.
     *
     * @param actualAcc 14-char actual account; its customer is chars 5..11
     * @return the crd0data short name, or "" when there is no row either
     */
    private String crdShortName(String actualAcc) {
        String bmCustNo = BmForms.bmCust(BmForms.custFromActualAcc(actualAcc));
        if (bmCustNo.isBlank()) {
            // bmCust returns six blanks for a customer it cannot pack — the same
            // give-up the C's actualToBmCust does. No key, no lookup.
            return "";
        }
        List<String> names = jdbc.queryForList(
                CRD0DATA_NAME, new MapSqlParameterSource("bmCustNo", bmCustNo), String.class);
        return names.isEmpty() ? "" : scrub(names.get(0));
    }

    // ------------------------------------------------------------------
    // Helpers
    // ------------------------------------------------------------------

    /**
     * Pending-update check against stswiftlog (legacy processTransferDetail,
     * requestType '01' → checkSwiftPendingStatus, cbswift.c:2355-2382): key 3
     * is transRefNo + issueDate, and a row counts as pending ONLY when
     * bmUpdateStatus is '1' (pending with supervisor) or '2' (pending with
     * CSO) — '3' Rejected / '9' Completed rows must NOT block the enquiry.
     *
     * <p>The stswiftlog view is NOT in the archival workbook (no bank-ui
     * schema file exists for it); the column names below follow the C record
     * layout (stlayout.h struct stswiftlog: transRefNo, issueDate,
     * bmUpdateStatus) but are unverified against the Denodo view, so any
     * failure — including the view being absent or a column-name mismatch —
     * is treated as not-pending with a warn log, per the port notes.
     */
    private boolean hasPendingSwiftUpdate(String refNo, String issueDate) {
        try {
            Integer count = jdbc.queryForObject("""
                    SELECT COUNT(*)
                    FROM   stswiftlog
                    WHERE  transRefNo = :refNo
                      AND  issueDate = :issueDate
                      AND  bmUpdateStatus IN ('1', '2')
                    """,
                    new MapSqlParameterSource()
                            .addValue("refNo", refNo)
                            .addValue("issueDate", BmForms.bmToIso(issueDate)),
                    Integer.class);
            return count != null && count > 0;
        } catch (DataAccessException e) {
            log.warn("stswiftlog pending-update check unavailable ({}); treating transfer {} as not pending",
                    e.getMostSpecificCause().getMessage(), refNo);
            return false;
        }
    }

    /**
     * Appends the paging window to a statement whose ORDER BY is already in
     * place. One row past the page is requested so its presence answers
     * hasMore without a second COUNT round trip, and OFFSET is left out
     * entirely on the first page, where it would be a no-op.
     */
    private static void appendWindow(StringBuilder sql, int page) {
        int offset = Math.max(0, page) * PagedResult.PAGE_SIZE;
        if (offset > 0) {
            sql.append("OFFSET %d ROWS\n".formatted(offset));
        }
        sql.append("FETCH FIRST %d ROWS ONLY\n".formatted(PagedResult.PAGE_SIZE + 1));
    }

    /** Trims the probe row {@link #appendWindow} asked for and reports it as hasMore. */
    private static <T> PagedResult<T> pageOf(List<T> rows) {
        boolean hasMore = rows.size() > PagedResult.PAGE_SIZE;
        return new PagedResult<>(
                hasMore ? List.copyOf(rows.subList(0, PagedResult.PAGE_SIZE)) : List.copyOf(rows),
                hasMore,
                false);
    }

    /**
     * The archival views store the 14-char actual account form (rid0data.ts /
     * thd0data.ts size 14 — overrides the spec's 13-char BM index note).
     * Convert defensively if a caller hands us the 13-char BM form.
     */
    private static String actualAccForm(String accNo) {
        String a = accNo == null ? "" : accNo.trim();
        return a.length() == 13 ? BmForms.actualAcc(a) : a;
    }

    /** Legacy NUL/non-printable scrubbing, done per-row in Java. */
    private static String scrub(String value) {
        if (value == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder(value.length());
        for (int i = 0; i < value.length(); i++) {
            char ch = value.charAt(i);
            sb.append(ch < 0x20 ? ' ' : ch);
        }
        return sb.toString().trim();
    }

    private static boolean isBlank(String s) {
        return s == null || s.isBlank();
    }
}
