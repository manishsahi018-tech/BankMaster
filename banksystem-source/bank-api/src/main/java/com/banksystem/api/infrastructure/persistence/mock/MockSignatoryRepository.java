package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.SignatoryDetail;
import com.banksystem.api.domain.model.SignatorySummary;
import com.banksystem.api.domain.repository.SignatoryRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Profile("!denodo")
@Repository
public class MockSignatoryRepository implements SignatoryRepository {

    private static final List<SignatorySummary> SIGNATORIES = List.of(
            new SignatorySummary("01008078394503", "0001", "I", "1009326404", "0127",
                    "كاظم حسين سعيد عبدالوهاب"),
            new SignatorySummary("01008078394503", "0002", "I", "1004458821", "0127",
                    "Ahmed K. Al-Otaibi"));

    @Override
    public List<SignatorySummary> byCustomer(String custNo) {
        return SIGNATORIES;
    }

    @Override
    public List<SignatorySummary> byAccount(String accNo) {
        return SIGNATORIES.stream().filter(s -> s.accNo().equals(accNo)).toList();
    }

    @Override
    public Optional<SignatoryDetail> detail(String accNo, String signatoryNo) {
        return SIGNATORIES.stream()
                .filter(s -> s.accNo().equals(accNo) && s.signatoryNo().equals(signatoryNo))
                .findFirst()
                .map(s -> new SignatoryDetail(s.accNo(), s.signatoryNo(), s.branchCode(),
                        s.idType(), s.idNo(), "H", "القطيف",
                        "14140128", "19930717", "14340402", "20130212",
                        s.signatoryShortName()));
    }
}
