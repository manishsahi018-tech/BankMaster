package com.banksystem.api.infrastructure.persistence.jdbc;

import com.banksystem.api.domain.model.BmForms;
import com.banksystem.api.domain.model.CustUpdateHistoryEntry;
import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import com.banksystem.api.domain.model.HeirEntry;
import com.banksystem.api.domain.model.JointHolderEntry;
import com.banksystem.api.domain.model.JuristicAccountInfo;
import com.banksystem.api.domain.model.OwnerEntry;
import com.banksystem.api.domain.model.ReferenceEntry;
import com.banksystem.api.domain.repository.CustomerRepository;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Customer enquiries from the Denodo views of the archival schema
 * (QUERY-SPECS.md §1 customer search, §2 update history, §22 related
 * parties; legacy cbbranch.c processSearchRequest, cbbranch2.c
 * processCustomerHistory, cbsama.c heir/joint/reference/owner scans).
 *
 * Denodo VQL over Hive is SQL-92-ish: no LIMIT (FETCH FIRST n ROWS ONLY),
 * SUBSTR is 1-based, CONCAT instead of ||. Anything beyond plain SQL-92
 * (language picking, conditional blanking, status labels) happens in the
 * row mappers.
 */
@Repository
@Profile("denodo")
public class JdbcCustomerRepository implements CustomerRepository {

    /** Repositories return complete result lists (services page in memory);
     *  this cap only guards against runaway scans on the Hive views. */
    static final int MAX_ROWS = 1000;

    private static final Logger log = LoggerFactory.getLogger(JdbcCustomerRepository.class);

    private static final String SEARCH_COLUMNS = """
            SELECT custNo, idType, idNo, telHomeNo, telHomeExt,
                   aFirstName, a2ndName, aLastName, eFirstName, e2ndName, eLastName,
                   aShortName, eShortName, aOrgShortName, eOrgShortName,
                   custType, preferredLang, branchCode, samaMainCategory, samaSubCategory
            FROM   stcusttab
            """;

    /** stcusttab point read — column list matches CustomerProfile. */
    private static final String PROFILE_SQL = """
            SELECT custNo, custType, samaMainCategory, samaSubCategory, branchCode,
                   nationality, preferredLang, idType, idNo, idIssuedAt,
                   idIssueDateH, idIssueDateG, idExpiryDateH, idExpiryDateG,
                   aFirstName, a2ndName, a3rdName, aLastName, aShortName,
                   eFirstName, e2ndName, e3rdName, eLastName, eShortName,
                   aOrgName1, aOrgShortName, eOrgName1, eOrgShortName,
                   crNo, crIssuedAt, crIssueDateH, crIssueDateG,
                   dobDateH, dobDateG, sexCode, marritalStatus, businessType,
                   address1, address2, poBox, cityName, zipCode, country,
                   telHomeNo, telOffNo, mobileNo, eMail, custOpenDate, relationshipManager
            FROM   stcusttab
            WHERE  BankingDate = :bankingDate AND custNo = :custNo
            """;

    /**
     * Same shape from the stcustlog snapshot (legacy service 11
     * requestType 01). Column-name discrepancies vs stcusttab, per the
     * generated schema files (schema wins over the spec):
     * stcustlog spells "maritalStatus" (one 'r') where stcusttab has
     * "marritalStatus"; the customer's own branch lives in custBranchCode
     * (stcustlog.branchCode is the transaction branch of the update).
     */
    private static final String PROFILE_ASOF_SQL = """
            SELECT custNo, custType, samaMainCategory, samaSubCategory,
                   custBranchCode AS branchCode,
                   nationality, preferredLang, idType, idNo, idIssuedAt,
                   idIssueDateH, idIssueDateG, idExpiryDateH, idExpiryDateG,
                   aFirstName, a2ndName, a3rdName, aLastName, aShortName,
                   eFirstName, e2ndName, e3rdName, eLastName, eShortName,
                   aOrgName1, aOrgShortName, eOrgName1, eOrgShortName,
                   crNo, crIssuedAt, crIssueDateH, crIssueDateG,
                   dobDateH, dobDateG, sexCode, maritalStatus AS marritalStatus, businessType,
                   address1, address2, poBox, cityName, zipCode, country,
                   telHomeNo, telOffNo, mobileNo, eMail, custOpenDate, relationshipManager
            FROM   stcustlog
            WHERE  BankingDate = :bankingDate AND custNo = :custNo AND dateTime = :dateTime
            """;

    /** Column labels shared by PROFILE_SQL / PROFILE_ASOF_SQL. */
    private static final String[] PROFILE_COLUMNS = {
            "custNo", "custType", "samaMainCategory", "samaSubCategory", "branchCode",
            "nationality", "preferredLang", "idType", "idNo", "idIssuedAt",
            "idIssueDateH", "idIssueDateG", "idExpiryDateH", "idExpiryDateG",
            "aFirstName", "a2ndName", "a3rdName", "aLastName", "aShortName",
            "eFirstName", "e2ndName", "e3rdName", "eLastName", "eShortName",
            "aOrgName1", "aOrgShortName", "eOrgName1", "eOrgShortName",
            "crNo", "crIssuedAt", "crIssueDateH", "crIssueDateG",
            "dobDateH", "dobDateG", "sexCode", "marritalStatus", "businessType",
            "address1", "address2", "poBox", "cityName", "zipCode", "country",
            "telHomeNo", "telOffNo", "mobileNo", "eMail", "custOpenDate",
            "relationshipManager"};

    /** Raw column values keyed by label — the as-of path overlays
     *  stidlog/staddrlog values into this map before the record is built. */
    private static final RowMapper<Map<String, String>> PROFILE_COLUMN_MAPPER = (rs, i) -> {
        Map<String, String> m = new HashMap<>();
        for (String col : PROFILE_COLUMNS) {
            m.put(col, rs.getString(col));
        }
        return m;
    };

    private static final RowMapper<CustomerProfile> PROFILE_MAPPER =
            (rs, i) -> toProfile(PROFILE_COLUMN_MAPPER.mapRow(rs, i));

    private static CustomerProfile toProfile(Map<String, String> m) {
        return new CustomerProfile(
                m.get("custNo"), m.get("custType"),
                m.get("samaMainCategory"), m.get("samaSubCategory"),
                m.get("branchCode"), m.get("nationality"),
                m.get("preferredLang"), m.get("idType"),
                m.get("idNo"), m.get("idIssuedAt"),
                BmForms.actualDate(m.get("idIssueDateH")),
                BmForms.actualDate(m.get("idIssueDateG")),
                BmForms.actualDate(m.get("idExpiryDateH")),
                BmForms.actualDate(m.get("idExpiryDateG")),
                m.get("aFirstName"), m.get("a2ndName"),
                m.get("a3rdName"), m.get("aLastName"), m.get("aShortName"),
                m.get("eFirstName"), m.get("e2ndName"),
                m.get("e3rdName"), m.get("eLastName"), m.get("eShortName"),
                m.get("aOrgName1"), m.get("aOrgShortName"),
                m.get("eOrgName1"), m.get("eOrgShortName"),
                m.get("crNo"), m.get("crIssuedAt"),
                BmForms.actualDate(m.get("crIssueDateH")),
                BmForms.actualDate(m.get("crIssueDateG")),
                BmForms.actualDate(m.get("dobDateH")),
                BmForms.actualDate(m.get("dobDateG")),
                m.get("sexCode"), m.get("marritalStatus"), m.get("businessType"),
                m.get("address1"), m.get("address2"), m.get("poBox"),
                m.get("cityName"), m.get("zipCode"), m.get("country"),
                m.get("telHomeNo"), m.get("telOffNo"),
                m.get("mobileNo"), m.get("eMail"),
                BmForms.actualDate(m.get("custOpenDate")),
                m.get("relationshipManager"));
    }

    private final NamedParameterJdbcTemplate jdbc;
    private final BankingDateProvider bankingDate;

    public JdbcCustomerRepository(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate jdbc,
            BankingDateProvider bankingDate) {
        this.jdbc = jdbc;
        this.bankingDate = bankingDate;
    }

    // ------------------------------------------------------------------
    // §1 — customer search (service 16): first non-blank criterion wins.
    // ------------------------------------------------------------------

    @Override
    public List<CustomerSummary> search(CustomerSearchCriteria c) {
        if (hasText(c.custNo())) {
            return searchEquals("custNo", padCust(c.custNo()), false);
        }
        if (hasText(c.cardNo())) {
            // Card branch: resolve the customer via stcardtab first, then
            // run the plain custNo branch. NOTE: the legacy answered an
            // unknown card with an INTERNALERR "Invalid card number
            // entered" response (cbbranch.c:1574-1586, errors 110/111);
            // returning an empty result instead is this REST port's
            // deliberate behaviour, not the C's.
            return resolveCardCustomer(c.cardNo().trim())
                    .map(cust -> searchEquals("custNo", padCust(cust), false))
                    .orElse(List.of());
        }
        String idOrCr = hasText(c.idNo()) ? c.idNo() : c.crNo();
        if (hasText(idOrCr)) {
            // Legacy key 3 seeds idType too but never re-checks it (§1),
            // so only idNo is filtered; crNo searches the same key.
            return searchEquals("idNo", idOrCr.trim(), false);
        }
        if (hasText(c.telNo())) {
            return searchByTel(c);
        }
        if (hasText(c.firstName())) {
            return searchByFirstName(c);
        }
        if (hasText(c.secondName())) {
            return searchBySecondName(c);
        }
        if (hasText(c.lastName())) {
            return searchByLastName(c);
        }
        if (hasText(c.mainCategoryCode()) || hasText(c.subCategoryCode())) {
            // Legacy branch entry tests 4 bytes spanning BOTH category
            // fields (cbbranch.c:1705), so a sub-only input still runs the
            // category search.
            return searchByCategory(c);
        }
        if (hasText(c.branchCode())) {
            return searchEquals("branchCode", c.branchCode().trim(), false);
        }
        if (hasText(c.mobileNo())) {
            return searchEquals("mobileNo", c.mobileNo().trim(), false);
        }
        return List.of();
    }

    private List<CustomerSummary> searchEquals(String column, String value, boolean arabicSearch) {
        String order = "custNo".equals(column) ? "custNo" : column + ", custNo";
        return jdbc.query(SEARCH_COLUMNS + """
                WHERE  BankingDate = :bankingDate AND %s = :value
                ORDER  BY %s
                FETCH FIRST %d ROWS ONLY
                """.formatted(column, order, MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "value", value),
                summaryMapper(arabicSearch));
    }

    /**
     * Legacy card resolution: the schema file's stcardtab carries a direct
     * custNo column (size 7); §1's SUBSTR(bmAccNo, 6, 7) stays as fallback —
     * stcardtab.bmAccNo is 14 chars (actual form despite its name), so the
     * embedded customer is at positions 6..12, 1-based.
     */
    private Optional<String> resolveCardCustomer(String cardNo) {
        return jdbc.query("""
                SELECT COALESCE(NULLIF(TRIM(custNo), ''), SUBSTR(bmAccNo, 6, 7)) AS custNo
                FROM   stcardtab
                WHERE  BankingDate = :bankingDate AND cardNo = :cardNo
                """,
                Map.of("bankingDate", bankingDate.bankingDate(), "cardNo", cardNo),
                (rs, i) -> rs.getString("custNo"))
                .stream().filter(JdbcCustomerRepository::hasText).findFirst();
    }

    /**
     * Legacy key 4 seeds telHomeNo+telHomeExt into the ISGTEQ start
     * (cbbranch.c:1614-1616, isstart length 14) but the loop breaks on
     * telHomeNo only (cbbranch.c:1768-1771): when an extension is
     * supplied, rows whose extension sorts below it are skipped by the
     * key start — i.e. telHomeExt >= :telExt, not equality.
     */
    private List<CustomerSummary> searchByTel(CustomerSearchCriteria c) {
        StringBuilder sql = new StringBuilder(SEARCH_COLUMNS)
                .append("WHERE  BankingDate = :bankingDate\n")
                .append("  AND  telHomeNo = :telNo\n");
        Map<String, Object> params = new HashMap<>();
        params.put("bankingDate", bankingDate.bankingDate());
        params.put("telNo", c.telNo().trim());
        if (hasText(c.telExt())) {
            sql.append("  AND  telHomeExt >= :telExt\n");
            params.put("telExt", c.telExt().trim());
        }
        sql.append("ORDER  BY telHomeNo, telHomeExt, custNo\n")
                .append("FETCH FIRST ").append(MAX_ROWS).append(" ROWS ONLY");
        return jdbc.query(sql.toString(), params, summaryMapper(false));
    }

    private List<CustomerSummary> searchByFirstName(CustomerSearchCriteria c) {
        String first = trimName(c.firstName());
        boolean arabic = isArabic(first);
        String fCol = arabic ? "aFirstName" : "eFirstName";
        StringBuilder sql = new StringBuilder(SEARCH_COLUMNS)
                .append("WHERE  BankingDate = :bankingDate\n")
                .append("  AND  ").append(fCol).append(" LIKE CONCAT(:firstName, '%')\n");
        Map<String, Object> params = new HashMap<>();
        params.put("bankingDate", bankingDate.bankingDate());
        params.put("firstName", first);
        // Legacy continue-filters: second/last name prefixes, same language
        // columns as the index branch.
        if (hasText(c.secondName())) {
            sql.append("  AND  ").append(arabic ? "a2ndName" : "e2ndName")
                    .append(" LIKE CONCAT(:secondName, '%')\n");
            params.put("secondName", trimName(c.secondName()));
        }
        if (hasText(c.lastName())) {
            sql.append("  AND  ").append(arabic ? "aLastName" : "eLastName")
                    .append(" LIKE CONCAT(:lastName, '%')\n");
            params.put("lastName", trimName(c.lastName()));
        }
        sql.append("ORDER  BY ").append(fCol).append(", custNo\n")
                .append("FETCH FIRST ").append(MAX_ROWS).append(" ROWS ONLY");
        return jdbc.query(sql.toString(), params, summaryMapper(arabic));
    }

    private List<CustomerSummary> searchBySecondName(CustomerSearchCriteria c) {
        String second = trimName(c.secondName());
        boolean arabic = isArabic(second);
        String sCol = arabic ? "a2ndName" : "e2ndName";
        StringBuilder sql = new StringBuilder(SEARCH_COLUMNS)
                .append("WHERE  BankingDate = :bankingDate\n")
                .append("  AND  ").append(sCol).append(" LIKE CONCAT(:secondName, '%')\n");
        Map<String, Object> params = new HashMap<>();
        params.put("bankingDate", bankingDate.bankingDate());
        params.put("secondName", second);
        if (hasText(c.lastName())) {
            sql.append("  AND  ").append(arabic ? "aLastName" : "eLastName")
                    .append(" LIKE CONCAT(:lastName, '%')\n");
            params.put("lastName", trimName(c.lastName()));
        }
        sql.append("ORDER  BY ").append(sCol).append(", custNo\n")
                .append("FETCH FIRST ").append(MAX_ROWS).append(" ROWS ONLY");
        return jdbc.query(sql.toString(), params, summaryMapper(arabic));
    }

    private List<CustomerSummary> searchByLastName(CustomerSearchCriteria c) {
        String last = trimName(c.lastName());
        boolean arabic = isArabic(last);
        String lCol = arabic ? "aLastName" : "eLastName";
        return jdbc.query(SEARCH_COLUMNS + """
                WHERE  BankingDate = :bankingDate
                  AND  %s LIKE CONCAT(:lastName, '%%')
                ORDER  BY %s, custNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(lCol, lCol, MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "lastName", last),
                summaryMapper(arabic));
    }

    private List<CustomerSummary> searchByCategory(CustomerSearchCriteria c) {
        // Legacy key 10 seeds samaMainCategory+samaSubCategory as 4
        // contiguous bytes AND the loop break re-compares all 4 bytes
        // (cbbranch.c:1709-1711 seed, 1846-1850 break; the request and
        // record fields are contiguous per cbserver.h reqMsgSearch and
        // stlayout.h customerInfo). BOTH parts therefore always filter:
        // a blank input part only matches rows whose stored part is
        // blank too.
        return jdbc.query(SEARCH_COLUMNS + """
                WHERE  BankingDate = :bankingDate
                  AND  COALESCE(TRIM(samaMainCategory), '') = :mainCategory
                  AND  COALESCE(TRIM(samaSubCategory), '') = :subCategory
                ORDER  BY samaMainCategory, samaSubCategory, custNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(),
                        "mainCategory", trim(c.mainCategoryCode()),
                        "subCategory", trim(c.subCategoryCode())),
                summaryMapper(false));
    }

    /**
     * §1 response mapping: first/second/last name from the Arabic columns
     * when the search was Arabic or preferredLang is Arabic, else English
     * (cbbranch.c:1865-1884). shortName is chosen by preferredLang ONLY —
     * the C's shortName block (cbbranch.c:1886-1919) tests
     * custTabRec.preferredLang regardless of the search language — from
     * a/eShortName for consumers vs a/eOrgShortName for commercial and
     * corporate customers, with other-language fallback when blank.
     */
    private RowMapper<CustomerSummary> summaryMapper(boolean arabicSearch) {
        return (rs, i) -> {
            boolean arabicNames = arabicSearch || prefersArabic(rs.getString("preferredLang"));
            boolean arabicShort = prefersArabic(rs.getString("preferredLang"));
            boolean corporate = isCorporate(rs.getString("custType"));
            String aShort = rs.getString(corporate ? "aOrgShortName" : "aShortName");
            String eShort = rs.getString(corporate ? "eOrgShortName" : "eShortName");
            String shortName = arabicShort ? firstNonBlank(aShort, eShort) : firstNonBlank(eShort, aShort);
            return new CustomerSummary(
                    rs.getString("custNo"), rs.getString("idType"), rs.getString("idNo"),
                    rs.getString("telHomeNo"), rs.getString("telHomeExt"),
                    rs.getString(arabicNames ? "aFirstName" : "eFirstName"),
                    rs.getString(arabicNames ? "a2ndName" : "e2ndName"),
                    rs.getString(arabicNames ? "aLastName" : "eLastName"),
                    shortName, rs.getString("branchCode"),
                    rs.getString("samaMainCategory"), rs.getString("samaSubCategory"));
        };
    }

    // ------------------------------------------------------------------
    // §2 — customer update history (service 67).
    // ------------------------------------------------------------------

    @Override
    public List<CustUpdateHistoryEntry> updateHistory(String custNo) {
        // Per-year archive files collapse to the single stcustlog view.
        // No msgType/status filter — only the custNo boundary (§2).
        // Ordering: stcustlog key 3 is custNo+lastUpdateDateTime (the C
        // blanks lastUpdateDateTime when seeding the key,
        // cbbranch2.c:1014-1019), so pending rows with a blank
        // lastUpdateDateTime sort first — hence the COALESCE.
        return jdbc.query("""
                SELECT branchCode, userId, dateTime, bmUpdateStatus,
                       supervisorId, lastUpdateDateTime, samaMainCategory, samaSubCategory
                FROM   stcustlog
                WHERE  BankingDate = :bankingDate AND custNo = :custNo
                ORDER  BY COALESCE(lastUpdateDateTime, '')
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", padCust(custNo)),
                (rs, i) -> {
                    String status = trim(rs.getString("bmUpdateStatus"));
                    // Field rule: supervisorId / lastUpdateDateTime blanked
                    // while the update is still pending ('1' or '2').
                    boolean pending = "1".equals(status) || "2".equals(status);
                    return new CustUpdateHistoryEntry(
                            rs.getString("branchCode"), rs.getString("userId"),
                            rs.getString("dateTime"), statusLabel(status),
                            pending ? "" : rs.getString("supervisorId"),
                            pending ? "" : rs.getString("lastUpdateDateTime"),
                            rs.getString("samaMainCategory"), rs.getString("samaSubCategory"));
                });
    }

    // ------------------------------------------------------------------
    // Profile point reads (stcusttab / stcustlog snapshot).
    // ------------------------------------------------------------------

    @Override
    public Optional<CustomerProfile> profile(String custNo) {
        return jdbc.query(PROFILE_SQL,
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", padCust(custNo)),
                PROFILE_MAPPER).stream().findFirst();
    }

    @Override
    public Optional<CustomerProfile> profileAsOf(String custNo, String dateTime) {
        // The UI's "View Details" passes the history row's stcustlog
        // dateTime (event timestamp), not lastUpdateDateTime.
        Map<String, Object> params = Map.of("bankingDate", bankingDate.bankingDate(),
                "custNo", padCust(custNo), "dateTime", trim(dateTime));
        Map<String, String> snapshot = jdbc.query(PROFILE_ASOF_SQL, params, PROFILE_COLUMN_MAPPER)
                .stream().findFirst().orElse(null);
        if (snapshot == null) {
            return Optional.empty();
        }
        // Legacy processIndividual*PendingDetail overlays the stcustlog
        // snapshot with its stidlog / staddrlog companion rows, which are
        // keyed by the log row's OWN branchCode (transaction branch) +
        // userId + dateTime (cbsaudi.c:3020-3026, 3186-3195). The profile
        // SQL exposes custBranchCode, so fetch that key separately.
        Map<String, Object> logKey = jdbc.query("""
                SELECT branchCode, userId, dateTime
                FROM   stcustlog
                WHERE  BankingDate = :bankingDate AND custNo = :custNo AND dateTime = :dateTime
                """,
                params,
                (rs, i) -> {
                    Map<String, Object> k = new HashMap<>();
                    k.put("bankingDate", bankingDate.bankingDate());
                    k.put("branchCode", rs.getString("branchCode"));
                    k.put("userId", rs.getString("userId"));
                    k.put("dateTime", rs.getString("dateTime"));
                    return k;
                })
                .stream().findFirst().orElse(null);
        if (logKey != null) {
            overlayIdLog(snapshot, logKey);
            overlayAddrLog(snapshot, logKey);
        }
        return Optional.of(toProfile(snapshot));
    }

    /**
     * cbsaudi.c:3029-3095: the as-of detail scans stidlog for the custlog
     * row's key, keeps idCategory 'C' (customer's own IDs) rows only and
     * overlays the per-idType ID buckets; the stcustlog snapshot fields
     * are used only when no idlog row exists (cbsaudi.c:3096-3158) — here
     * that fallback is simply "leave the snapshot untouched". Ported as
     * practical for this profile shape: the row matching the snapshot's
     * idType feeds the generic ID block, and an idType 'C' row feeds the
     * CR block (mirroring the juristic mapping, cbjuristic.c:3097-3106).
     */
    private void overlayIdLog(Map<String, String> snapshot, Map<String, Object> logKey) {
        try {
            List<Map<String, String>> rows = jdbc.query("""
                    SELECT idType, idNo, idIssuedAt, idIssueDateH, idIssueDateG,
                           idExpiryDateH, idExpiryDateG
                    FROM   stidlog
                    WHERE  BankingDate = :bankingDate AND branchCode = :branchCode
                      AND  userId = :userId AND dateTime = :dateTime
                      AND  idCategory = 'C'
                    """,
                    logKey,
                    (rs, i) -> {
                        Map<String, String> r = new HashMap<>();
                        for (String col : new String[] {"idType", "idNo", "idIssuedAt",
                                "idIssueDateH", "idIssueDateG", "idExpiryDateH", "idExpiryDateG"}) {
                            r.put(col, rs.getString(col));
                        }
                        return r;
                    });
            for (Map<String, String> r : rows) {
                String idType = trim(r.get("idType"));
                if (!idType.isEmpty() && idType.equals(trim(snapshot.get("idType")))) {
                    snapshot.put("idNo", r.get("idNo"));
                    snapshot.put("idIssuedAt", r.get("idIssuedAt"));
                    snapshot.put("idIssueDateH", r.get("idIssueDateH"));
                    snapshot.put("idIssueDateG", r.get("idIssueDateG"));
                    snapshot.put("idExpiryDateH", r.get("idExpiryDateH"));
                    snapshot.put("idExpiryDateG", r.get("idExpiryDateG"));
                }
                if ("C".equals(idType)) {
                    snapshot.put("crNo", r.get("idNo"));
                    snapshot.put("crIssuedAt", r.get("idIssuedAt"));
                    snapshot.put("crIssueDateH", r.get("idIssueDateH"));
                    snapshot.put("crIssueDateG", r.get("idIssueDateG"));
                }
            }
        } catch (DataAccessException e) {
            log.warn("stidlog overlay unavailable for as-of profile; keeping stcustlog values", e);
        }
    }

    /**
     * cbsaudi.c:3186-3245: the local address/phone block comes from the
     * staddrlog row (addressType '00', addressNo '0000') keyed like the
     * custlog row; the stcustlog snapshot address is only the fallback
     * (the C logs "taking the address info from stcustlog" on a read
     * miss). The whole block is replaced wholesale when the row exists,
     * exactly as the C strncpy block does.
     */
    private void overlayAddrLog(Map<String, String> snapshot, Map<String, Object> logKey) {
        try {
            jdbc.query("""
                    SELECT address1, address2, poBox, cityName, zipCode, country,
                           telHomeNo, telOffNo, mobileNo, eMail
                    FROM   staddrlog
                    WHERE  BankingDate = :bankingDate AND branchCode = :branchCode
                      AND  userId = :userId AND dateTime = :dateTime
                      AND  addressType = '00' AND addressNo = '0000'
                    """,
                    logKey,
                    (rs, i) -> {
                        Map<String, String> r = new HashMap<>();
                        for (String col : new String[] {"address1", "address2", "poBox",
                                "cityName", "zipCode", "country", "telHomeNo", "telOffNo",
                                "mobileNo", "eMail"}) {
                            r.put(col, rs.getString(col));
                        }
                        return r;
                    })
                    .stream().findFirst().ifPresent(snapshot::putAll);
        } catch (DataAccessException e) {
            log.warn("staddrlog overlay unavailable for as-of profile; keeping stcustlog values", e);
        }
    }

    // ------------------------------------------------------------------
    // Juristic page 2 (frmJuristicAccountInfo).
    // ------------------------------------------------------------------

    @Override
    public Optional<JuristicAccountInfo> juristicAccountInfo(String custNo) {
        // No data-side category gate: legacy processJuristicDetail
        // (cbjuristic.c:2968-3320) serves whatever customer it is asked
        // for — screen routing by custType/category is the client's job.
        Map<String, Object> params = Map.of(
                "bankingDate", bankingDate.bankingDate(), "custNo", padCust(custNo));
        return jdbc.query("""
                SELECT custNo, branchCode, createdUserId, createdDateTime,
                       signatureNature, internetBankAcc, custAdviceFlag, updatedForSama,
                       relationshipManager, generalMemo, marketingMemo, accFreezingGracePeriod
                FROM   stcusttab
                WHERE  BankingDate = :bankingDate AND custNo = :custNo
                """,
                params,
                (rs, i) -> new String[] {
                        rs.getString("custNo"), rs.getString("branchCode"),
                        rs.getString("createdUserId"), rs.getString("createdDateTime"),
                        rs.getString("signatureNature"), rs.getString("internetBankAcc"),
                        rs.getString("custAdviceFlag"), rs.getString("updatedForSama"),
                        rs.getString("relationshipManager"), rs.getString("generalMemo"),
                        rs.getString("marketingMemo"), rs.getString("accFreezingGracePeriod")})
                .stream().findFirst()
                .map(c -> {
                    String[] home = homeAddress(params);
                    String[] acct = acctFacilityRows(c[1], c[2], c[3]);
                    return new JuristicAccountInfo(c[0],
                            home[0], home[1], home[2], home[3], home[4], home[5],
                            home[6], home[7], home[8], home[9], home[10], home[11],
                            acct[0], acct[1], acct[2], acct[3], acct[4],
                            acct[5], acct[6], acct[7], acct[8],
                            acct[9], acct[10], acct[11], acct[12], acct[13],
                            c[4], c[5], c[6], c[7],
                            c[8], c[9], c[10], c[11]);
                });
    }

    /**
     * frmJuristicAccountInfo home-country address: the legacy fills
     * homeAddress1..homeEmail exclusively from the staddrtab
     * addressType "01" (abroad) record with addressNo "0000"
     * (cbjuristic.c:3263-3282; the addressNo filter is the continue at
     * :3236); the block stays blank when no such row exists. The
     * stcusttab address columns are the LOCAL address
     * (cbjuristic.c:3058-3078, overlaid from type "00" at :3239-3261)
     * and must not be shown here.
     */
    private String[] homeAddress(Map<String, Object> params) {
        String[] blank = new String[12];
        Arrays.fill(blank, "");
        return jdbc.query("""
                SELECT address1, address2, poBox, zipCode, cityName, country,
                       telOffNo, telHomeNo, faxNo, mobileNo, pagerNo, eMail
                FROM   staddrtab
                WHERE  BankingDate = :bankingDate AND custNo = :custNo
                  AND  addressType = '01' AND addressNo = '0000'
                """,
                params,
                (rs, i) -> new String[] {
                        rs.getString("address1"), rs.getString("address2"),
                        rs.getString("poBox"), rs.getString("zipCode"),
                        rs.getString("cityName"), rs.getString("country"),
                        rs.getString("telOffNo"), rs.getString("telHomeNo"),
                        rs.getString("faxNo"), rs.getString("mobileNo"),
                        rs.getString("pagerNo"), rs.getString("eMail")})
                .stream().findFirst().orElse(blank);
    }

    /**
     * getAcctInfo port (cbothers.c:7183-7306; the juristic caller seeds
     * the key with the customer's branchCode + createdUserId +
     * createdDateTime, cbjuristic.c:3304-3313). The per-year acclog
     * files collapse to the stacclog view. The 14-char account number is
     * currency(2)+ledger(3)+…: ledger "008" fills the current row, "009"
     * the saving row, anything else the other row; later rows overwrite
     * earlier ones like the legacy strncpy. The C's 11-char info string
     * is currency(2)+ledger(3)+accStatus(2)+statementFreq(2)+
     * checkBook(1)+droppedAcc(1); droppedAcc has no slot in the enquiry
     * model, and the flag slots carry "1" for row-found (the screen's
     * facility check-box). Returns the 14 facility slots in
     * JuristicAccountInfo order; blanks on any failure — the C ignores
     * acclog open errors too.
     */
    private String[] acctFacilityRows(String branchCode, String createdUserId, String createdDateTime) {
        String[] slots = new String[14];
        Arrays.fill(slots, "");
        try {
            List<String[]> rows = jdbc.query("""
                    SELECT accNo, accStatus, statementFreq, checkBook, droppedAcc
                    FROM   stacclog
                    WHERE  BankingDate = :bankingDate AND branchCode = :branchCode
                      AND  userId = :userId AND dateTime = :dateTime
                    """,
                    Map.of("bankingDate", bankingDate.bankingDate(),
                            "branchCode", branchCode == null ? "" : branchCode,
                            "userId", createdUserId == null ? "" : createdUserId,
                            "dateTime", createdDateTime == null ? "" : createdDateTime),
                    (rs, i) -> new String[] {
                            rs.getString("accNo"), rs.getString("accStatus"),
                            rs.getString("statementFreq"), rs.getString("checkBook"),
                            rs.getString("droppedAcc")});
            for (String[] r : rows) {
                String accNo = r[0] == null ? "" : r[0];
                String currency = accNo.length() >= 2 ? accNo.substring(0, 2) : "";
                String ledger = accNo.length() >= 5 ? accNo.substring(2, 5) : "";
                String status = trim(r[1]);
                String stmtFreq = trim(r[2]);
                String chequeBook = trim(r[3]);
                if ("008".equals(ledger)) {         // current account (cbothers.c:7244/7287)
                    slots[0] = "1";
                    slots[1] = currency;
                    slots[2] = stmtFreq;
                    slots[3] = chequeBook;
                    slots[4] = status;
                } else if ("009".equals(ledger)) {  // savings account (cbothers.c:7250/7292)
                    slots[5] = "1";
                    slots[6] = currency;
                    slots[7] = stmtFreq;
                    slots[8] = status;
                } else {                            // other account (cbothers.c:7256/7297)
                    slots[9] = ledger;
                    slots[10] = currency;
                    slots[11] = stmtFreq;
                    slots[12] = chequeBook;
                    slots[13] = status;
                }
            }
        } catch (DataAccessException e) {
            log.warn("stacclog unavailable; juristic account-facility rows left blank", e);
            Arrays.fill(slots, "");
        }
        return slots;
    }

    // ------------------------------------------------------------------
    // §22 — related parties. The archival tables carry every entry-record
    // field directly (proxy / joint / share-holding columns included), so
    // no stidtab/staddrtab detail joins are needed for these list rows.
    // Note: unlike the stcusttab a2ndName/a3rdName spelling, these tables
    // use aSecondName/aThirdName (schema files win over the spec).
    // ------------------------------------------------------------------

    @Override
    public List<HeirEntry> heirs(String custNo) {
        return jdbc.query("""
                SELECT heirNo, heirType, idType, idNo, proxyNo,
                       proxyIssueDateH, proxyIssueDateG, activeStatus, branchCode,
                       COALESCE(NULLIF(TRIM(aShortName), ''), eShortName) AS shortName
                FROM   stheirtab
                WHERE  BankingDate = :bankingDate AND custNo = :custNo
                ORDER  BY heirNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", padCust(custNo)),
                (rs, i) -> new HeirEntry(
                        rs.getString("heirNo"), rs.getString("heirType"),
                        rs.getString("shortName"), rs.getString("idType"), rs.getString("idNo"),
                        rs.getString("proxyNo"),
                        BmForms.actualDate(rs.getString("proxyIssueDateH")),
                        BmForms.actualDate(rs.getString("proxyIssueDateG")),
                        rs.getString("activeStatus"), rs.getString("branchCode")));
    }

    @Override
    public List<JointHolderEntry> jointHolders(String custNo) {
        // §22: joint holders pick the short name by the joint customer's
        // preferredLang (not the Arabic-first COALESCE) — done in Java.
        return jdbc.query("""
                SELECT jointCustNo, aShortName, eShortName, preferredLang,
                       idType, idNo, nationality, mobileNo, jointOpenDate,
                       activeStatus, branchCode
                FROM   stjointtab
                WHERE  BankingDate = :bankingDate AND custNo = :custNo
                ORDER  BY jointCustNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", padCust(custNo)),
                (rs, i) -> {
                    String shortName = prefersArabic(rs.getString("preferredLang"))
                            ? firstNonBlank(rs.getString("aShortName"), rs.getString("eShortName"))
                            : firstNonBlank(rs.getString("eShortName"), rs.getString("aShortName"));
                    return new JointHolderEntry(
                            rs.getString("jointCustNo"), shortName,
                            rs.getString("idType"), rs.getString("idNo"),
                            rs.getString("nationality"), rs.getString("mobileNo"),
                            BmForms.actualDate(rs.getString("jointOpenDate")),
                            rs.getString("activeStatus"), rs.getString("branchCode"));
                });
    }

    @Override
    public List<ReferenceEntry> references(String custNo) {
        return jdbc.query("""
                SELECT referenceNo, referenceType, referenceReqdFor,
                       idType, idNo, activeStatus, branchCode,
                       COALESCE(NULLIF(TRIM(aShortName), ''), eShortName) AS shortName
                FROM   stcreftab
                WHERE  BankingDate = :bankingDate AND custNo = :custNo
                ORDER  BY referenceNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", padCust(custNo)),
                (rs, i) -> new ReferenceEntry(
                        rs.getString("referenceNo"), rs.getString("referenceType"),
                        rs.getString("referenceReqdFor"), rs.getString("shortName"),
                        rs.getString("idType"), rs.getString("idNo"),
                        rs.getString("activeStatus"), rs.getString("branchCode")));
    }

    @Override
    public List<OwnerEntry> owners(String custNo) {
        return jdbc.query("""
                SELECT ownerNo, ownerType, idType, idNo, parentCompanyName,
                       shareHoldingPerc, ownerEnabled, branchCode,
                       COALESCE(NULLIF(TRIM(aShortName), ''), eShortName) AS shortName
                FROM   stowntab
                WHERE  BankingDate = :bankingDate AND custNo = :custNo
                ORDER  BY ownerNo
                FETCH FIRST %d ROWS ONLY
                """.formatted(MAX_ROWS),
                Map.of("bankingDate", bankingDate.bankingDate(), "custNo", padCust(custNo)),
                (rs, i) -> new OwnerEntry(
                        rs.getString("ownerNo"), rs.getString("ownerType"),
                        rs.getString("shortName"), rs.getString("idType"), rs.getString("idNo"),
                        rs.getString("parentCompanyName"), rs.getString("shareHoldingPerc"),
                        rs.getString("ownerEnabled"), rs.getString("branchCode")));
    }

    // ------------------------------------------------------------------
    // Helpers (legacy conventions kept out of the SQL).
    // ------------------------------------------------------------------

    private static boolean hasText(String s) {
        return s != null && !s.isBlank();
    }

    private static String trim(String s) {
        return s == null ? "" : s.trim();
    }

    /** Name searches are prefix scans on the trailing-space-trimmed input (§1). */
    private static String trimName(String s) {
        return s == null ? "" : s.stripTrailing();
    }

    /** Legacy Arabic-vs-English index choice: first character code > 127. */
    private static boolean isArabic(String s) {
        return !s.isEmpty() && s.codePointAt(0) > 127;
    }

    /** Customer numbers are 7-char zero-padded keys. */
    private static String padCust(String custNo) {
        String c = trim(custNo);
        return c.length() >= 7 ? c : "0".repeat(7 - c.length()) + c;
    }

    /** preferredLang: '0' = Arabic, '1' = English in the archival data
     *  (fixture convention; 'A' accepted defensively). */
    private static boolean prefersArabic(String lang) {
        String l = trim(lang);
        return "0".equals(l) || "A".equalsIgnoreCase(l);
    }

    /** Legacy custType: '0' = consumer, '1' = commercial, '2' = corporate
     *  (stlayout.h customerInfo custType comment). The C treats BOTH '1'
     *  and '2' as org-name customers — cbbranch.c:1888 tests
     *  custType != '1' && custType != '2' for the consumer branch.
     *  'C' accepted harmlessly for the fixtures (which use 'P'/'C'). */
    private static boolean isCorporate(String custType) {
        String t = trim(custType);
        return "1".equals(t) || "2".equals(t) || "C".equalsIgnoreCase(t);
    }

    private static String firstNonBlank(String preferred, String fallback) {
        String p = trim(preferred);
        return p.isEmpty() ? trim(fallback) : p;
    }

    /** stcustlog.bmUpdateStatus code → the legacy display label shown in
     *  the Pending Status grid column (mock/StatusBadge convention). */
    private static String statusLabel(String code) {
        return switch (code) {
            case "0" -> "0-Entered";
            case "1" -> "1-Pending with supervisor";
            case "2" -> "2-Pending with teller";
            case "3" -> "3-Rejected by the branch";
            case "9" -> "9-Update successful";
            default -> code;
        };
    }
}
