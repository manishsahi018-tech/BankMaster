package com.banksystem.api.application;

import com.banksystem.api.domain.model.CodeEntry;
import com.banksystem.api.domain.repository.ReferenceDataRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/** Reference-data code sets for combos and code→description display. */
@Service
public class ReferenceDataService {

    private final ReferenceDataRepository referenceData;

    public ReferenceDataService(ReferenceDataRepository referenceData) {
        this.referenceData = referenceData;
    }

    public Map<String, List<CodeEntry>> codes() {
        return referenceData.codes();
    }
}
