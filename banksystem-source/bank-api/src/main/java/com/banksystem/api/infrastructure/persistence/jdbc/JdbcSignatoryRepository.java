package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.SignatoryDetail;
import com.banksystem.api.domain.model.SignatorySummary;
import com.banksystem.api.domain.repository.SignatoryRepository;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Signatories from Denodo views stsigntab ⋈ stidtab (QUERY-SPECS.md §20,
 * legacy cbsama.c processSignatoryTabSearch / readSignTabInfo).
 */
@Repository
@Profile("denodo")
public class JdbcSignatoryRepository implements SignatoryRepository {

    /** Repositories return complete result lists (services page in memory);
     *  this cap only guards against runaway scans on the Hive views. */
    static final int MAX_ROWS = 1000;

    private static final String LIST_COLUMNS = """
            SELECT s.accNo, s.signatoryNo, s.idType, s.idNo, s.branchCode,
                   COALESCE(NULLIF(TRIM(s.aShortName), ''), s.eShortName) AS signatoryShortName
            FROM   stsigntab s
            """;

    private final NamedParameterJdbcTemplate jdbc;
    private final BankingDateProvider bankingDate;

    public JdbcSignatoryRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc,
            BankingDateProvider bankingDate) {
        this.jdbc = jdbc;
        this.bankingDate = bankingDate;
    }

    @Override
    public List<SignatorySummary> byCustomer(String custNo) {
        // Legacy key 2: customer embedded in the 14-char account at [5..11].
        // The C compares a fixed 7-char field (cbsama.c:3845), so short
        // input must be zero-padded to 7 or it matches nothing.
        String padded = custNo == null ? "" : custNo.trim();
        if (padded.length() < 7) {
            padded = "0".repeat(7 - padded.length()) + padded;
        }
        return jdbc.query(LIST_COLUMNS + """
                WHERE  s.BankingDate = :bankingDate AND SUBSTR(s.accNo, 6, 7) = :custNo
                ORDER  BY s.accNo, s.signatoryNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", padded),
                (rs, i) -> new SignatorySummary(
                        rs.getString("accNo"), rs.getString("signatoryNo"),
                        rs.getString("idType"), rs.getString("idNo"),
                        rs.getString("branchCode"), rs.getString("signatoryShortName")));
    }

    @Override
    public List<SignatorySummary> byAccount(String accNo) {
        return jdbc.query(LIST_COLUMNS + """
                WHERE  s.BankingDate = :bankingDate AND s.accNo = :accNo
                ORDER  BY s.accNo, s.signatoryNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "accNo", accNo),
                (rs, i) -> new SignatorySummary(
                        rs.getString("accNo"), rs.getString("signatoryNo"),
                        rs.getString("idType"), rs.getString("idNo"),
                        rs.getString("branchCode"), rs.getString("signatoryShortName")));
    }

    @Override
    public Optional<SignatoryDetail> detail(String accNo, String signatoryNo) {
        // Point read stsigntab key 1 joined to stidtab (custNo = accNo[5..11],
        // idCategory 'S') for the ID issue/expiry details.
        List<SignatoryDetail> rows = jdbc.query("""
                SELECT s.accNo, s.signatoryNo, s.branchCode AS custBranchCode,
                       s.idType, s.idNo,
                       i.idDateType, i.idIssuedAt,
                       i.idIssueDateH, i.idIssueDateG,
                       i.idExpiryDateH, i.idExpiryDateG,
                       COALESCE(NULLIF(TRIM(s.aShortName), ''), s.eShortName) AS signatoryShortName
                FROM   stsigntab s
                LEFT JOIN stidtab i
                       ON  i.BankingDate = s.BankingDate
                       AND i.custNo = SUBSTR(s.accNo, 6, 7)
                       AND i.idType = s.idType
                       AND i.idNo = s.idNo
                       AND i.idCategory = 'S'
                WHERE  s.BankingDate = :bankingDate
                  AND  s.accNo = :accNo
                  AND  s.signatoryNo = :signatoryNo
                """,
                Map.of("bankingDate", bankingDate.bankingDate(),
                        "accNo", accNo, "signatoryNo", signatoryNo),
                (rs, i) -> new SignatoryDetail(
                        rs.getString("accNo"), rs.getString("signatoryNo"),
                        rs.getString("custBranchCode"), rs.getString("idType"),
                        rs.getString("idNo"), rs.getString("idDateType"),
                        rs.getString("idIssuedAt"),
                        rs.getString("idIssueDateH"), rs.getString("idIssueDateG"),
                        rs.getString("idExpiryDateH"), rs.getString("idExpiryDateG"),
                        rs.getString("signatoryShortName")));
        return rows.stream().findFirst();
    }
}
