package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.MerchantStatementPage;

/**
 * Merchant statements — QUERY-SPECS.md §21.
 *
 * <p>This is the one enquiry with NO source in the archival schema. The legacy
 * screen does not talk to cbcmssrv: frmMerchantStmt's Form_Load reads its own
 * mrchdata.ini for a host and port and opens a second socket to the acquiring
 * /POS system, which owns the data end to end. There is no merchant Denodo
 * view and no merchant table in the BM archival dictionary.
 *
 * <p>The mock implementation therefore stands in for that external system
 * rather than for a database, and a real implementation will be a client of it
 * — not a JDBC query like every other repository here.
 */
public interface MerchantRepository {

    /**
     * One page of a merchant's statement.
     *
     * @param merchantNo   8, 12 or 16 characters, per the statement type
     * @param stmtType     "0" itemwise, "1" groupwise, "2" chain, "3" outlet
     * @param fromDate     YYYYMMDD, already month-shifted by the caller
     * @param toDate       YYYYMMDD, already month-shifted by the caller
     * @param lastTransPtr "00000" for the first page, else the previous page's
     *                     lastRecCount
     */
    MerchantStatementPage statement(String merchantNo, String stmtType,
                                    String fromDate, String toDate, String lastTransPtr);
}
