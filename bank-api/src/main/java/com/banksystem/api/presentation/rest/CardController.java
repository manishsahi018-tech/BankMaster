package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.CardService;
import com.banksystem.api.domain.model.CardDetail;
import com.banksystem.api.domain.model.CardHistoryEntry;
import com.banksystem.api.domain.model.CardSearchResult;
import com.banksystem.api.domain.model.CardUpdateHistoryEntry;
import com.banksystem.api.domain.model.PagedResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/** ATM card enquiries — QUERY-SPECS.md §13–15 (frmCardGrid family). */
@RestController
@RequestMapping("/api/cards")
public class CardController {

    private final CardService cards;

    public CardController(CardService cards) {
        this.cards = cards;
    }

    @GetMapping
    public CardSearchResult search(
            @RequestParam(required = false) String custNo,
            @RequestParam(required = false) String accNo,
            @RequestParam(required = false) String cardNo,
            @RequestParam(defaultValue = "0") int page) {
        return cards.search(custNo, accNo, cardNo, page);
    }

    @GetMapping("/{cardNo}")
    public CardDetail detail(@PathVariable String cardNo) {
        return cards.detail(cardNo);
    }

    /**
     * View Detail on Card Update History — the card as one stcardlog row wrote
     * it. The three key parts are the grid's own first columns, so they travel
     * as query parameters beside the row's timestamp in the path, mirroring
     * /accounts/{accNo}/snapshot/{dateTime}.
     */
    @GetMapping("/{cardNo}/snapshot/{dateTime}")
    public CardDetail snapshot(
            @PathVariable String cardNo,
            @PathVariable String dateTime,
            @RequestParam(defaultValue = "") String branchCode,
            @RequestParam(defaultValue = "") String userId) {
        return cards.snapshot(cardNo, branchCode, userId, dateTime);
    }

    @GetMapping("/{cardNo}/update-history")
    public PagedResult<CardUpdateHistoryEntry> updateHistory(
            @PathVariable String cardNo,
            @RequestParam(defaultValue = "0") int page) {
        return cards.updateHistory(cardNo, page);
    }

    /** Card/PIN lifecycle tracking — completed records only, max 50. */
    @GetMapping("/{cardNo}/history")
    public List<CardHistoryEntry> trackingHistory(@PathVariable String cardNo) {
        return cards.trackingHistory(cardNo);
    }
}
