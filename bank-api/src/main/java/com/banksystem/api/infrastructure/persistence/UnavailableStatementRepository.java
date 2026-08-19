package com.banksystem.api.infrastructure.persistence;

import com.banksystem.api.application.NotAvailableException;
import com.banksystem.api.domain.model.HistoricalStatement;
import com.banksystem.api.domain.repository.StatementRepository;
import java.util.List;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

/**
 * The {@code denodo}-profile StatementRepository when DB #3 is switched off.
 *
 * <p>DB #3 is a separate database from DB #1 and DB #2, so a site can perfectly
 * reasonably be running the rest of the application without it. When it is off,
 * the datasource and its template are not created at all
 * ({@code DataSourceConfig.statementDataSource}), rather than pointing a pool
 * at a connection nobody has configured.
 *
 * <p>This bean exists so the CONTEXT STILL STARTS in that case, the same reason
 * {@link UnavailableMerchantRepository} does: StatementService is an
 * unconditional {@code @Service} and constructor-injects StatementRepository,
 * so with no implementation Spring would fail startup and take every other
 * screen down with it. One unavailable facility must never become a dead API.
 *
 * <p>Delete this the day DB #3 is on everywhere, not before.
 */
@Profile("denodo")
@ConditionalOnProperty(name = "bank.statement-db.enabled", havingValue = "false",
        matchIfMissing = true)
@Repository
public class UnavailableStatementRepository implements StatementRepository {

    @Override
    public List<HistoricalStatement> historicalStatements(
            String acctNum, String branchCode, String fromYearMonth, String toYearMonth,
            String system) {
        throw new NotAvailableException(
                "Historical statements are not available in this environment: the statement "
                        + "archive is not configured. It is a separate database from the archival "
                        + "and online sources — set bank.statement-db.* and "
                        + "STATEMENT_DB_ENABLED=true to switch it on.");
    }
}
