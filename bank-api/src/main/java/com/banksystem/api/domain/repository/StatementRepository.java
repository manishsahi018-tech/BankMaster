package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.HistoricalStatement;
import java.util.List;

/**
 * Archived statements — legacy frmHistStmt ("Historical Statement Printing",
 * the frmAccount cmdHistStmt button).
 *
 * <p>The only repository backed by DB #3. The legacy had no database here at
 * all: generateReport walked a mapped drive month by month opening one Btrieve
 * index per branch per month
 * ({@code <STMTPATH><brn3>\s<brn3><bmYY><MM>.idx}), read it with
 * BGETGREATEROREQUAL/BGETNEXT on a packed 13-char account key, and unzipped the
 * rendered page files it pointed at. That whole arrangement collapses to one
 * indexed range scan here, so the month loop and the two BM key encodings
 * ({@code convertAcc2Bm}, {@code convertYear2Bm}) have no counterpart — they
 * existed purely to build Btrieve keys, and DB #3 stores a plain account string
 * and a real DATE.
 */
public interface StatementRepository {

    /**
     * Every archived statement for an account whose STMT_DATE falls in the
     * period, oldest first.
     *
     * <p>The period is month-granular because the legacy screen is: it offers
     * From Year + From Month and To Year + To Month and nothing finer. Both
     * bounds are INCLUSIVE months, so 202401–202403 covers 01 Jan to 31 Mar.
     *
     * @param acctNum       account number as keyed on the screen
     * @param fromYearMonth YYYYMM, inclusive
     * @param toYearMonth   YYYYMM, inclusive
     */
    List<HistoricalStatement> historicalStatements(
            String acctNum, String fromYearMonth, String toYearMonth);
}
