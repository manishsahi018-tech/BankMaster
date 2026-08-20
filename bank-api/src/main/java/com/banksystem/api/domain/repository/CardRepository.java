package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.CardDetail;
import com.banksystem.api.domain.model.CardHistoryEntry;
import com.banksystem.api.domain.model.CardSearchResult;
import com.banksystem.api.domain.model.CardUpdateHistoryEntry;

import java.util.List;
import java.util.Optional;

/**
 * ATM card enquiries. Legacy: processCardSearchRequest /
 * processCardDetailRequest / getCardHistoryDetails in cbbranch2.c.
 * Card rows read stcardtab/stcardlog (DB #1); the customer header needs
 * the online source (DB #2). See QUERY-SPECS.md §13–15.
 */
public interface CardRepository {

    /** Exactly one of custNo / accNo / cardNo is used (legacy priority order). */
    CardSearchResult search(String custNo, String accNo, String cardNo, int page);

    Optional<CardDetail> detail(String cardNo);

    /**
     * The card as one stcardlog row recorded it — the legacy's View Detail on
     * Card Update History (service 25 requestType '01', cbbranch2.c).
     *
     * <p>Keyed exactly as the C keys it: the log's own branch, user and
     * timestamp identify the ROW, and the card number identifies the card
     * (frmCardUpdateHistory.frm:346). The same trio is what the grid shows in
     * its first three columns, so the operator selects a row and the key comes
     * straight off it.
     */
    Optional<CardDetail> snapshot(String cardNo, String branchCode, String userId, String dateTime);

    List<CardUpdateHistoryEntry> updateHistory(String cardNo);

    /** Completed lifecycle records only (bmUpdateStatus '9'), max 50. */
    List<CardHistoryEntry> trackingHistory(String cardNo);
}
