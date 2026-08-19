package com.banksystem.api.infrastructure.persistence.jdbc;

import java.util.LinkedHashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Connectivity smoke test for the target PC: GET /api/health/db proves the
 * Denodo connection works before any screen is exercised.
 * Deliberately lives with the JDBC adapters — it is a diagnostic of this
 * infrastructure, not a business endpoint.
 *
 * <p>One connection, so one probe. The old response carried a second "online"
 * block for DB #2; it opened a separate pool to the same Denodo server and
 * reported on the connection the archival block had already tested, so a
 * genuine outage lit both and a green "online" never meant the Finacle
 * gateway was reachable. Its one distinct value — that a differently-shaped
 * view also resolves — is kept below as {@code controlTable}.
 */
@RestController
@Profile("denodo")
public class DbHealthController {

    private final NamedParameterJdbcTemplate archivalJdbc;
    private final BankingDateProvider bankingDate;

    public DbHealthController(
            @Qualifier("archivalJdbc") NamedParameterJdbcTemplate archivalJdbc,
            BankingDateProvider bankingDate) {
        this.archivalJdbc = archivalJdbc;
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
                    "SELECT COUNT(*) FROM stcusttab WHERE BankingDate = :bankingDate",
                    Map.of("bankingDate", bankingDate.bankingDate()), Long.class));
            // A second view of a different shape: the control table is split
            // per record type, so the server-config row is the standalone
            // stctltabSC view (no RecordType column — the type is in the view
            // name, like stctltabBD). Proves the prefix resolves for more than
            // the one table above.
            ok.put("controlTable", archivalJdbc.queryForObject(
                    "SELECT COUNT(*) FROM stctltabSC WHERE BankingDate = :bankingDate",
                    Map.of("bankingDate", bankingDate.bankingDate()), Long.class) != null);
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
