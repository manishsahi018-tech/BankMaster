package com.banksystem.api.infrastructure.persistence;

import com.banksystem.api.application.NotAvailableException;
import com.banksystem.api.domain.model.MerchantStatementPage;
import com.banksystem.api.domain.repository.MerchantRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

/**
 * The {@code denodo}-profile MerchantRepository: there isn't one.
 *
 * <p>Merchant statements are the one enquiry with no source on this side. The
 * legacy screen never spoke to cbcmssrv — it opened its own socket to the
 * acquiring/POS system named in mrchdata.ini — and there is no merchant Denodo
 * view and no merchant table in the archival dictionary (QUERY-SPECS §21).
 * MockMerchantRepository stands in for that external system under the mock
 * profile; under {@code denodo} there is nothing to stand in for.
 *
 * <p>This bean exists so the CONTEXT STILL STARTS. MerchantService is an
 * unconditional {@code @Service} and constructor-injects MerchantRepository, so
 * with the mock excluded by {@code @Profile("!denodo")} and nothing in its
 * place, Spring failed the whole application at startup — "Parameter 0 of
 * constructor in MerchantService required a bean of type MerchantRepository
 * that could not be found" — taking every other screen down with it. A missing
 * acquiring feed must degrade to one unavailable screen, not a dead API.
 *
 * <p>Delete this the day a real acquirer client lands, not before.
 */
@Profile("denodo")
@Repository
public class UnavailableMerchantRepository implements MerchantRepository {

    @Override
    public MerchantStatementPage statement(String merchantNo, String stmtType,
                                           String fromDate, String toDate, String lastTransPtr) {
        throw new NotAvailableException(
                "Merchant statements are not available in this environment: no acquiring/POS "
                        + "data source is configured. The legacy screen read this from a separate "
                        + "merchant server (mrchdata.ini), which has no equivalent here yet.");
    }
}
