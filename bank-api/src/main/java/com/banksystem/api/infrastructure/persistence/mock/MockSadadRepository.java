package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.SadadTransaction;
import com.banksystem.api.domain.repository.SadadRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;

@Profile("!denodo")
@Repository
public class MockSadadRepository implements SadadRepository {

    private static final List<SadadTransaction> LOG = List.of(
            new SadadTransaction("20090610093015", "0127", "543", "0010", "1234567890123456789",
                    "01008078394501", "0000000000000450.00", "SD00443322", "20090610",
                    "01", "0001", "1", "9", "A", "52551"),
            new SadadTransaction("20090612141210", "0127", "802", "0020", "9876543210987654321",
                    "01008078394503", "0000000000001275.50", "SD00443398", "20090612",
                    "01", "0001", "0", "9", "C", "52551"));

    @Override
    public List<SadadTransaction> transactions(String companyId, String transDate,
                                               String tellerId, String subscriptionNo) {
        return LOG.stream()
                .filter(t -> isBlank(companyId) || t.companyId().equals(companyId))
                .filter(t -> isBlank(transDate) || t.transDateTime().startsWith(transDate))
                .filter(t -> isBlank(tellerId) || t.tellerId().equals(tellerId))
                .filter(t -> isBlank(subscriptionNo) || t.subscriptionNo().equals(subscriptionNo))
                .toList();
    }

    private static boolean isBlank(String s) {
        return s == null || s.isBlank();
    }
}
