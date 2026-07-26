package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.SadadTransaction;
import com.banksystem.api.domain.repository.SadadRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * SADAD transaction history from the Denodo stsadadlog view —
 * QUERY-SPECS.md §19, legacy cbsadad.c processSadadTransEnq.
 *
 * <p>The legacy handler picked ISAM key 8/9/10 depending on which of
 * companyId / date / tellerId were filled; in SQL that collapses into one
 * query with optional predicates. Two legacy semantics are preserved:
 * subscriptionNo only filters when companyId is supplied (the C's key-8
 * branch is the only one that checks it, cbsadad.c:1654-1658), and an
 * all-blank request returns nothing (the C's blank key-8 scan breaks on the
 * first non-blank companyId). The transDate filter matches the date half of
 * the stsadadlog.ts {@code transDateTime} timestamp (YYYYMMDDHH24MISS) via
 * SUBSTR.
 *
 * <p>NOTE: live bill enquiry (frmBillEnquiry) is NOT here — legacy calls the
 * SADAD network via Tuxedo (UTBLENQ/SADBILLENQ); no archival view serves it.
 */
@Repository
@Profile("denodo")
public class JdbcSadadRepository implements SadadRepository {

    /** Repositories return complete result lists (services page in memory);
     *  this cap only guards against runaway scans on the Hive views. */
    static final int MAX_ROWS = 1000;

    private final NamedParameterJdbcTemplate jdbc;
    private final BankingDateProvider bankingDate;

    public JdbcSadadRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc,
            BankingDateProvider bankingDate) {
        this.jdbc = jdbc;
        this.bankingDate = bankingDate;
    }

    @Override
    public List<SadadTransaction> transactions(
            String companyId, String transDate, String tellerId, String subscriptionNo) {
        // Legacy (cbsadad.c:1605-1622): with companyId, date AND teller all
        // blank the C stays on key 8 with a blank key and breaks on the first
        // record whose companyId is not blank — i.e. it returns nothing.
        if (isBlank(companyId) && isBlank(transDate) && isBlank(tellerId)) {
            return List.of();
        }
        StringBuilder sql = new StringBuilder("""
                SELECT transDateTime, branchCode, tellerId, companyId, subscriptionNo,
                       drAccNo, billAmt, transRefNo, valueDate, transType,
                       paymentType, preOrPostpaid, postingStatus, cashOrAcc,
                       supervisorId
                FROM   stsadadlog
                WHERE  BankingDate = :bankingDate
                """);
        MapSqlParameterSource params = new MapSqlParameterSource()
                .addValue("bankingDate", bankingDate.bankingDate());
        if (!isBlank(companyId)) {
            sql.append("  AND  companyId = :companyId\n");
            params.addValue("companyId", companyId.trim());
        }
        if (!isBlank(transDate)) {
            // SUBSTR is 1-based in Denodo VQL; first 8 chars = YYYYMMDD.
            sql.append("  AND  SUBSTR(transDateTime, 1, 8) = :transDate\n");
            params.addValue("transDate", transDate.trim());
        }
        if (!isBlank(tellerId)) {
            sql.append("  AND  tellerId = :tellerId\n");
            params.addValue("tellerId", tellerId.trim());
        }
        // Legacy (cbsadad.c:1654-1658): the subscriptionNo filter exists ONLY
        // in the keyUsed==8 branch, i.e. when companyId is supplied; the
        // key 9 (date) and key 10 (teller) branches ignore it entirely.
        if (!isBlank(companyId) && !isBlank(subscriptionNo)) {
            sql.append("  AND  subscriptionNo = :subscriptionNo\n");
            params.addValue("subscriptionNo", subscriptionNo.trim());
        }
        sql.append("""
                ORDER  BY transDateTime, transRefNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS));
        return jdbc.query(sql.toString(), params, (rs, i) -> new SadadTransaction(
                trimmed(rs.getString("transDateTime")),
                trimmed(rs.getString("branchCode")),
                trimmed(rs.getString("tellerId")),
                trimmed(rs.getString("companyId")),
                trimmed(rs.getString("subscriptionNo")),
                trimmed(rs.getString("drAccNo")),
                trimmed(rs.getString("billAmt")),
                trimmed(rs.getString("transRefNo")),
                trimmed(rs.getString("valueDate")),
                trimmed(rs.getString("transType")),
                trimmed(rs.getString("paymentType")),
                trimmed(rs.getString("preOrPostpaid")),
                trimmed(rs.getString("postingStatus")),
                trimmed(rs.getString("cashOrAcc")),
                trimmed(rs.getString("supervisorId"))));
    }

    private static String trimmed(String value) {
        return value == null ? "" : value.trim();
    }

    private static boolean isBlank(String s) {
        return s == null || s.isBlank();
    }
}
