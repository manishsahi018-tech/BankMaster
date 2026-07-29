package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.SadadTransaction;
import com.banksystem.api.domain.repository.SadadRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * SADAD bill payments (stsadadlog), generated across a rolling year so the
 * screen's company / date / teller / subscription filters each narrow a real
 * set rather than picking from two fixed rows.
 */
@Profile("!denodo")
@Repository
public class MockSadadRepository implements SadadRepository {

    /** SADAD biller id and the name it bills under. */
    private static final List<String[]> BILLERS = List.of(
            new String[] {"0010", "SAUDI ELECTRICITY CO"},
            new String[] {"0020", "NATIONAL WATER CO"},
            new String[] {"0030", "STC"},
            new String[] {"0040", "MOBILY"},
            new String[] {"0050", "ZAIN KSA"},
            new String[] {"0060", "MOI TRAFFIC VIOLATIONS"},
            new String[] {"0070", "ABSHER GOVERNMENT SERVICES"},
            new String[] {"0080", "GOSI CONTRIBUTIONS"});

    private static final int WINDOW_DAYS = 365;

    private static final List<SadadTransaction> LOG = build();

    private static List<SadadTransaction> build() {
        List<SadadTransaction> rows = new ArrayList<>();
        for (DemoData.Customer c : DemoData.CUSTOMERS) {
            for (String accNo : c.accountNumbers()) {
                for (int daysAgo = WINDOW_DAYS; daysAgo >= 0; daysAgo--) {
                    if (DemoData.pick(accNo + daysAgo, 40, 30) != 0) {
                        continue; // a couple of bills a month per account
                    }
                    String key = accNo + "sadad" + daysAgo;
                    String[] biller = DemoData.pick(key, 1, BILLERS);
                    long halalas = 5_000 + DemoData.seed(key, 2) % 1_495_000;
                    rows.add(new SadadTransaction(
                            DemoData.dateTimeBack(daysAgo, 8 + DemoData.pick(key, 3, 10),
                                    DemoData.pick(key, 4, 60), DemoData.pick(key, 5, 60)),
                            c.branchCode(),
                            String.valueOf(500 + DemoData.pick(key, 6, 400)),
                            biller[0],
                            // 19-digit SADAD subscription number
                            String.format("%019d", 1_000_000_000_000_000L + DemoData.seed(key, 7)),
                            accNo,
                            // Zero-padded 18-char amount, as the log stores it
                            String.format("%016d.%02d", halalas / 100, halalas % 100),
                            "SD" + String.format("%08d", 100000 + DemoData.seed(key, 8) % 899999),
                            DemoData.dateBack(daysAgo),
                            "01",
                            "0001",
                            DemoData.pick(key, 9, 3) == 0 ? "0" : "1", // pre/postpaid
                            "9",
                            DemoData.pick(key, 10, 4) == 0 ? "C" : "A", // cash or account
                            String.valueOf(52000 + DemoData.pick(key, 11, 900))));
                }
            }
        }
        rows.sort((a, b) -> b.transDateTime().compareTo(a.transDateTime()));
        return List.copyOf(rows);
    }

    @Override
    public List<SadadTransaction> transactions(String companyId, String transDate,
                                               String tellerId, String subscriptionNo) {
        return LOG.stream()
                .filter(t -> isBlank(companyId) || t.companyId().equals(companyId.trim()))
                .filter(t -> isBlank(transDate) || t.transDateTime().startsWith(transDate.trim()))
                .filter(t -> isBlank(tellerId) || t.tellerId().equals(tellerId.trim()))
                .filter(t -> isBlank(subscriptionNo)
                        || t.subscriptionNo().equals(subscriptionNo.trim()))
                .toList();
    }

    private static boolean isBlank(String s) {
        return s == null || s.isBlank();
    }
}
