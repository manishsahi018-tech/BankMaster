package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.CardDetail;
import com.banksystem.api.domain.model.CardHistoryEntry;
import com.banksystem.api.domain.model.CardSearchResult;
import com.banksystem.api.domain.model.CardSummary;
import com.banksystem.api.domain.model.CardUpdateHistoryEntry;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.repository.CardRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * ATM cards, derived per customer from {@link DemoData} so each customer holds
 * their own cards rather than the same two.
 *
 * <p>Card numbers use the 4489 37 ANB-looking BIN but are synthetic and fail a
 * Luhn check by construction, so they cannot be mistaken for live PANs. The UI
 * masks them anyway.
 */
@Profile("!denodo")
@Repository
public class MockCardRepository implements CardRepository {

    /** 1-3 cards per customer, each tied to one of that customer's accounts. */
    private static List<CardSummary> cardsFor(DemoData.Customer c) {
        int count = 1 + DemoData.pick(c.custNo(), 80, 3);
        List<CardSummary> rows = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            String key = c.custNo() + "card" + i;
            String pan = "448937" + String.format("%013d", DemoData.seed(key, 1) % 9_999_999_999_999L);
            int issuedDaysAgo = 200 + DemoData.pick(key, 2, 2500);
            // Cards run for four years from issue.
            String expiry = plusYears(DemoData.dateBack(issuedDaysAgo), 4);
            rows.add(new CardSummary(pan,
                    nameOnCard(c),
                    DemoData.dateBack(issuedDaysAgo),
                    expiry,
                    // 1 = active, 0 = inactive, 2 = captured/blocked
                    List.of("1", "1", "1", "0", "2").get(DemoData.pick(key, 3, 5)),
                    "9", DemoData.pick(key, 4, 4) == 0 ? "1" : "9",
                    c.accNo(DemoData.pick(key, 5, Math.max(1, c.accountCount()))) + "01"));
        }
        return List.copyOf(rows);
    }

    /** Embossed line: uppercase Latin, since the card rails are Latin-only. */
    private static String nameOnCard(DemoData.Customer c) {
        String latin = (c.eFirstName() + " " + c.eSecondName() + " " + c.eLastName())
                .replaceAll("\\s+", " ").trim();
        if (latin.isBlank()) {
            latin = c.shortName(); // juristic: the org name is already Latin
        }
        return latin.toUpperCase(java.util.Locale.ROOT);
    }

    private static String plusYears(String yyyymmdd, int years) {
        return java.time.LocalDate
                .parse(yyyymmdd, java.time.format.DateTimeFormatter.BASIC_ISO_DATE)
                .plusYears(years)
                .format(java.time.format.DateTimeFormatter.BASIC_ISO_DATE);
    }

    /** Every generated card, so a card number resolves to its owner. */
    private static Optional<DemoData.Customer> ownerOf(String cardNo) {
        return DemoData.CUSTOMERS.stream()
                .filter(c -> cardsFor(c).stream().anyMatch(k -> k.cardNo().equals(cardNo)))
                .findFirst();
    }

    /** stcardtab.cardType — the letter domain the column documents. */
    private static final List<String> CARD_TYPES =
            List.of("R", "I", "V", "A", "D", "C", "S", "L");

    @Override
    public CardSearchResult search(String custNo, String accNo, String cardNo, int page) {
        DemoData.Customer c;
        if (cardNo != null && !cardNo.isBlank()) {
            // Card-number search: resolve the owner, or fall back to the first
            // customer stamped with that card so a typed number still opens.
            c = ownerOf(cardNo).orElse(DemoData.CUSTOMERS.get(0));
        } else if (accNo != null && !accNo.isBlank()) {
            c = DemoData.customerForAccount(accNo);
        } else {
            c = DemoData.customer(custNo);
        }

        List<CardSummary> rows = cardsFor(c);
        if (cardNo != null && !cardNo.isBlank()) {
            List<CardSummary> exact = rows.stream().filter(k -> k.cardNo().equals(cardNo)).toList();
            // An unknown number shows as that customer's first card rather than
            // an empty grid, keeping the demo navigable.
            rows = exact.isEmpty()
                    ? List.of(new CardSummary(cardNo, nameOnCard(c), DemoData.dateBack(900),
                            plusYears(DemoData.dateBack(900), 4), "1", "9", "9", c.accNo(0) + "01"))
                    : exact;
        }
        // Page the rows, exactly as JdbcCardRepository does. It used to return
        // the whole list with hasMore hardcoded false, ignoring the page
        // argument entirely: page 5 of a 3-card customer answered with the same
        // 3 cards rather than nothing. Harmless with the 1-3 cards generated
        // here, but it meant the card grid's More button could never be
        // exercised against the mocks -- the same blind spot that hid the
        // transfer enquiry's missing pager.
        PagedResult<CardSummary> paged = PagedResult.page(rows, page);
        // Customer header fields come from DB #2 in the real implementation.
        return new CardSearchResult(c.custNo(), c.shortName(),
                c.city(), c.poBox(), c.city(), c.zipCode(), c.branchCode(),
                c.juristic() ? "C" : "0", "0",
                paged.rows(), paged.hasMore());
    }

    @Override
    public Optional<CardDetail> detail(String cardNo) {
        DemoData.Customer c = ownerOf(cardNo).orElse(DemoData.CUSTOMERS.get(0));
        return cardsFor(c).stream()
                .filter(k -> k.cardNo().equals(cardNo))
                .findFirst()
                .or(() -> Optional.of(new CardSummary(cardNo, nameOnCard(c), DemoData.dateBack(900),
                        plusYears(DemoData.dateBack(900), 4), "1", "9", "9", c.accNo(0) + "01")))
                .map(k -> new CardDetail(k.cardNo(), c.custNo(), c.shortName(),
                        // cardType is stcardtab's LETTER domain (R/I/V/A/D/C/S/L),
                        // not a number. It was hardcoded "1", which is not a
                        // member — so the screen had nothing to resolve and
                        // showed the fixture value raw.
                        c.juristic() ? "C" : "P", k.requestStatus(), c.branchCode(),
                        DemoData.pick(k.cardNo(), 12, CARD_TYPES),
                        k.nameOnTheCard(),
                        k.coreAccNo().substring(0, Math.min(13, k.coreAccNo().length())),
                        k.coreAccNo(),
                        String.format("%010d", DemoData.pick(cardNo, 10, 900) + 1),
                        DemoData.pick(cardNo, 11, 2) == 0 ? "U" : "N"));
    }

    @Override
    public Optional<CardDetail> snapshot(String cardNo, String branchCode, String userId, String dateTime) {
        // The card as that log row left it. Seeded off the row key so the same
        // row always yields the same snapshot, and deliberately made to DIFFER
        // from the live detail — a history view that echoes the current record
        // would hide the very bug it exists to catch.
        String key = cardNo + branchCode + userId + dateTime;
        return detail(cardNo).map(d -> new CardDetail(
                d.cardNo(), d.custNo(), d.custName(), d.custCategory(),
                String.valueOf(DemoData.pick(key, 20, 9) + 1),
                branchCode.isBlank() ? d.deliveryBranchCode() : branchCode,
                d.cardType(), d.nameOnTheCard(), d.bmAccNo(), d.coreAccNo(),
                "", DemoData.pick(key, 21, 2) == 0 ? "U" : "N"));
    }

    @Override
    public List<CardUpdateHistoryEntry> updateHistory(String cardNo) {
        DemoData.Customer c = ownerOf(cardNo).orElse(DemoData.CUSTOMERS.get(0));
        int count = 2 + DemoData.pick(cardNo, 20, 5); // 2-6
        List<CardUpdateHistoryEntry> rows = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            int daysAgo = 40 + i * (90 + DemoData.pick(cardNo, 100 + i, 200));
            rows.add(new CardUpdateHistoryEntry(c.branchCode(),
                    String.valueOf(54000 + DemoData.pick(cardNo, 200 + i, 900)),
                    DemoData.dateTimeBack(daysAgo, 9 + i % 8, 15 + i % 40, i % 60),
                    DemoData.pick(cardNo, 300 + i, 7) == 0
                            ? "3-Rejected by the branch" : "9-Update successful",
                    String.valueOf(52000 + DemoData.pick(cardNo, 400 + i, 900)),
                    DemoData.dateTimeBack(daysAgo, 11 + i % 6, 30 + i % 25, i % 60),
                    // 0 = new card, 1 = reissue, 2 = PIN reissue
                    String.valueOf(DemoData.pick(cardNo, 500 + i, 3))));
        }
        return rows.stream()
                .sorted((a, b) -> b.dateTime().compareTo(a.dateTime()))
                .toList();
    }

    @Override
    public List<CardHistoryEntry> trackingHistory(String cardNo) {
        DemoData.Customer c = ownerOf(cardNo).orElse(DemoData.CUSTOMERS.get(0));
        int count = 1 + DemoData.pick(cardNo, 30, 3); // 1-3 lifecycles
        List<CardHistoryEntry> rows = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            String key = cardNo + "track" + i;
            int requested = 120 + i * (400 + DemoData.pick(key, 1, 300));
            boolean rejected = DemoData.pick(key, 2, 8) == 0;
            String branchUser = String.valueOf(80000 + DemoData.pick(key, 3, 900));
            String producer = "CRDPRDCTR";
            rows.add(new CardHistoryEntry(
                    String.valueOf(DemoData.pick(key, 4, 3)),
                    String.valueOf(54000 + DemoData.pick(key, 5, 900)),
                    DemoData.dateTimeBack(requested, 10, 15, 30),
                    // Card leg: produced -> received at branch -> issued
                    rejected ? "" : DemoData.dateBack(requested - 2), rejected ? "" : "020000",
                    rejected ? "" : producer,
                    rejected ? "" : DemoData.dateBack(requested - 5), rejected ? "" : "093015",
                    rejected ? "" : branchUser,
                    rejected ? "" : DemoData.dateBack(requested - 7), rejected ? "" : "114500",
                    rejected ? "" : branchUser,
                    // PIN leg, a day behind the card
                    rejected ? "" : DemoData.dateBack(requested - 3), rejected ? "" : "020000",
                    rejected ? "" : producer,
                    rejected ? "" : DemoData.dateBack(requested - 6), rejected ? "" : "101500",
                    rejected ? "" : branchUser,
                    rejected ? "" : DemoData.dateBack(requested - 7), rejected ? "" : "114630",
                    rejected ? "" : branchUser,
                    String.valueOf(52000 + DemoData.pick(key, 6, 900)),
                    DemoData.dateTimeBack(requested - 7, 11, 47, 0),
                    DemoData.dateTimeBack(requested - 2, 2, 1, 0),
                    rejected ? branchUser : "",
                    rejected ? DemoData.dateBack(requested - 1) : "",
                    rejected ? "141500" : "",
                    rejected ? "Address could not be verified" : ""));
        }
        // Newest first; c is referenced so the record stays customer-scoped.
        return rows.stream()
                .filter(r -> !c.custNo().isBlank())
                .sorted((a, b) -> b.requestDateTime().compareTo(a.requestDateTime()))
                .toList();
    }
}
