package com.banksystem.api.application;

import com.banksystem.api.domain.model.CardDetail;
import com.banksystem.api.domain.model.CardHistoryEntry;
import com.banksystem.api.domain.model.CardSearchResult;
import com.banksystem.api.domain.model.CardUpdateHistoryEntry;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.repository.CardRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/** ATM card enquiry use cases — QUERY-SPECS.md §13–15 (frmCardGrid family). */
@Service
public class CardService {

    private final CardRepository cards;

    public CardService(CardRepository cards) {
        this.cards = cards;
    }

    public CardSearchResult search(String custNo, String accNo, String cardNo, int page) {
        if (isBlank(custNo) && isBlank(accNo) && isBlank(cardNo)) {
            throw new BadRequestException("custNo, accNo or cardNo is required");
        }
        return cards.search(custNo, accNo, cardNo, page);
    }

    public CardDetail detail(String cardNo) {
        return cards.detail(cardNo).orElseThrow(() ->
                new NotFoundException("No record found for this card"));
    }

    /** Card Update History's View Detail — the stcardlog row as a card detail. */
    public CardDetail snapshot(String cardNo, String branchCode, String userId, String dateTime) {
        return cards.snapshot(cardNo, branchCode, userId, dateTime).orElseThrow(() ->
                new NotFoundException("No card record was written by that update."));
    }

    public PagedResult<CardUpdateHistoryEntry> updateHistory(String cardNo, int page) {
        return PagedResult.page(cards.updateHistory(cardNo), page);
    }

    /** Card/PIN lifecycle tracking — completed records only, max 50. */
    public List<CardHistoryEntry> trackingHistory(String cardNo) {
        return cards.trackingHistory(cardNo);
    }

    private static boolean isBlank(String s) {
        return s == null || s.isBlank();
    }
}
