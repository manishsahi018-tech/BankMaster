package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.BmForms;
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


    private static final String LIST_COLUMNS = """
            SELECT s.accNo, s.signatoryNo, s.idType, s.idNo, s.branchCode,
                   COALESCE(NULLIF(TRIM(s.aShortName), ''), s.eShortName) AS signatoryShortName
            FROM   stsigntab s
            WHERE  s.BankingDate = :bankingDate
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
                  AND  SUBSTR(s.accNo, 6, 7) = :custNo
                ORDER  BY s.accNo, s.signatoryNo
                """,
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", padded),
                (rs, i) -> new SignatorySummary(
                        rs.getString("accNo"), rs.getString("signatoryNo"),
                        rs.getString("idType"), rs.getString("idNo"),
                        rs.getString("branchCode"), rs.getString("signatoryShortName")));
    }

    @Override
    public List<SignatorySummary> byAccount(String accNo) {
        return jdbc.query(LIST_COLUMNS + """
                  AND  s.accNo = :accNo
                ORDER  BY s.accNo, s.signatoryNo
                """,
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
                       COALESCE(NULLIF(TRIM(s.aShortName), ''), s.eShortName) AS signatoryShortName,
                       s.aFirstName, s.aSecondName, s.aThirdName, s.aLastName, s.aShortName,
                       s.eFirstName, s.eSecondName, s.eThirdName, s.eLastName, s.eShortName,
                       s.activeStatus, s.reason, s.signatureActionDate, s.diplomaticPpNo
                FROM   stsigntab s
                -- INNER (not LEFT): legacy readSignTabInfo (cbsama.c:4021) treats
                -- the stidtab read as mandatory. readIdTabFile(ISEQUAL) below
                -- zero (record-not-found) returns FAILURE / NOT_FOUND with no
                -- detail row, rather than a signatory row with blank ID fields.
                JOIN stidtab i
                       ON  i.BankingDate = :bankingDate
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
                // Trimmed, like the customer profile's ID rows: this screen shows
                // the same stidtab issued-at, and idType/activeStatus are resolved
                // through code sets that a CHAR-padded value would not match.
                (rs, i) -> new SignatoryDetail(
                        trim(rs.getString("accNo")), trim(rs.getString("signatoryNo")),
                        trim(rs.getString("custBranchCode")), trim(rs.getString("idType")),
                        trim(rs.getString("idNo")), trim(rs.getString("idDateType")),
                        trim(rs.getString("idIssuedAt")),
                        BmForms.actualDate(rs.getString("idIssueDateH")), BmForms.actualDate(rs.getString("idIssueDateG")),
                        BmForms.actualDate(rs.getString("idExpiryDateH")), BmForms.actualDate(rs.getString("idExpiryDateG")),
                        trim(rs.getString("signatoryShortName")),
                        trim(rs.getString("aFirstName")), trim(rs.getString("aSecondName")),
                        trim(rs.getString("aThirdName")), trim(rs.getString("aLastName")),
                        trim(rs.getString("aShortName")),
                        trim(rs.getString("eFirstName")), trim(rs.getString("eSecondName")),
                        trim(rs.getString("eThirdName")), trim(rs.getString("eLastName")),
                        trim(rs.getString("eShortName")),
                        trim(rs.getString("activeStatus")), trim(rs.getString("reason")),
                        BmForms.actualDate(rs.getString("signatureActionDate")),
                        trim(rs.getString("diplomaticPpNo"))));
        return rows.stream().findFirst();
    }

    private static String trim(String s) {
        return s == null ? "" : s.trim();
    }
}
