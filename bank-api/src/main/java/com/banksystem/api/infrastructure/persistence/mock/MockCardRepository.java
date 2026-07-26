package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.CardDetail;
import com.banksystem.api.domain.model.CardHistoryEntry;
import com.banksystem.api.domain.model.CardSearchResult;
import com.banksystem.api.domain.model.CardSummary;
import com.banksystem.api.domain.model.CardUpdateHistoryEntry;
import com.banksystem.api.domain.repository.CardRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Profile("!denodo")
@Repository
public class MockCardRepository implements CardRepository {

    private static final List<CardSummary> CARDS = List.of(
            new CardSummary("4489370001234567890", "HUSSAIN S KADEM", "20060215", "20270228",
                    "1", "9", "9", "0100807839450001"),
            new CardSummary("4489370009876543210", "HUSSAIN S KADEM", "20230801", "20260831",
                    "0", "9", "1", "0100807839450101"));

    @Override
    public CardSearchResult search(String custNo, String accNo, String cardNo, int page) {
        List<CardSummary> rows = CARDS;
        if (cardNo != null && !cardNo.isBlank()) {
            rows = CARDS.stream().filter(c -> c.cardNo().equals(cardNo)).toList();
        }
        // Customer header fields come from DB #2 in the real implementation.
        return new CardSearchResult("0415741", "Kadem Hussain Saeed Abdulwahab",
                "المنطقة الشرقية", "724", "صفوى", "31921", "0127", "0", "0",
                rows, false);
    }

    @Override
    public Optional<CardDetail> detail(String cardNo) {
        return CARDS.stream()
                .filter(c -> c.cardNo().equals(cardNo))
                .findFirst()
                .map(c -> new CardDetail(c.cardNo(), "0415741", "Kadem Hussain Saeed Abdulwahab",
                        "P", c.requestStatus(), "0127", "1", c.nameOnTheCard(),
                        "0100807839450", c.coreAccNo(), "0000000042", "U"));
    }

    @Override
    public List<CardUpdateHistoryEntry> updateHistory(String cardNo) {
        return List.of(
                new CardUpdateHistoryEntry("0127", "54302", "20060215101530", "9-Update successful",
                        "52551", "20060215103012", "0"),
                new CardUpdateHistoryEntry("0127", "80233", "20230801143000", "9-Update successful",
                        "52453", "20230801150244", "1"));
    }

    @Override
    public List<CardHistoryEntry> trackingHistory(String cardNo) {
        return List.of(new CardHistoryEntry(
                "0", "54302", "20060215101530",
                "20060217", "020000", "CRDPRDCTR",
                "20060220", "093015", "80233",
                "20060222", "114500", "80233",
                "20060218", "020000", "CRDPRDCTR",
                "20060221", "101500", "80233",
                "20060222", "114630", "80233",
                "52551", "20060222114700", "20060217020100",
                "", "", "", ""));
    }
}
