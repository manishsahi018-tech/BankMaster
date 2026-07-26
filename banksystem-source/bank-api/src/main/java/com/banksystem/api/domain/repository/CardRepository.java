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

    List<CardUpdateHistoryEntry> updateHistory(String cardNo);

    /** Completed lifecycle records only (bmUpdateStatus '9'), max 50. */
    List<CardHistoryEntry> trackingHistory(String cardNo);
}
