package com.banksystem.api.infrastructure.persistence.jdbc;

import java.util.LinkedHashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Connectivity smoke test for the target PC: GET /api/health/db proves
 * both Denodo connections work before any screen is exercised.
 * Deliberately lives with the JDBC adapters — it is a diagnostic of this
 * infrastructure, not a business endpoint.
 */
@RestController
@Profile("denodo")
public class DbHealthController {

    private final NamedParameterJdbcTemplate archivalJdbc;
    private final NamedParameterJdbcTemplate onlineJdbc;
    private final BankingDateProvider bankingDate;

    public DbHealthController(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate archivalJdbc,
            @Qualifier("onlineJdbc") NamedParameterJdbcTemplate onlineJdbc,
            BankingDateProvider bankingDate) {
        this.archivalJdbc = archivalJdbc;
        this.onlineJdbc = onlineJdbc;
        this.bankingDate = bankingDate;
    }

    @GetMapping("/api/health/db")
    public Map<String, Object> check() {
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("archival", probe(() -> {
            Map<String, Object> ok = new LinkedHashMap<>();
            ok.put("ok", true);
            ok.put("bankingDate", bankingDate.bankingDate());
            ok.put("customers", archivalJdbc.queryForObject(
                    "SELECT COUNT(*) FROM stcusttab WHERE BankingDate = :bd",
                    Map.of("bd", bankingDate.bankingDate()), Long.class));
            return ok;
        }));
        result.put("online", probe(() -> {
            Map<String, Object> ok = new LinkedHashMap<>();
            ok.put("ok", true);
            // Same probe table until DB #2 gets its own schema.
            ok.put("reachable", onlineJdbc.queryForObject(
                    "SELECT COUNT(*) FROM stctltab WHERE recType = 'SC'",
                    Map.of(), Long.class) != null);
            return ok;
        }));
        return result;
    }

    private Map<String, Object> probe(ProbeCall call) {
        try {
            return call.run();
        } catch (Exception e) {
            Map<String, Object> failed = new LinkedHashMap<>();
            failed.put("ok", false);
            failed.put("error", e.getMessage());
            return failed;
        }
    }

    private interface ProbeCall {
        Map<String, Object> run() throws Exception;
    }
}
