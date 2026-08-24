package com.banksystem.api.application;

import com.banksystem.api.domain.model.CodeEntry;
import com.banksystem.api.domain.model.UiLanguage;
import com.banksystem.api.domain.repository.ReferenceDataRepository;
import com.banksystem.api.infrastructure.language.RequestLanguage;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/** Reference-data code sets for combos and code→description display. */
@Service
public class ReferenceDataService {

    private final ReferenceDataRepository referenceData;
    private final RequestLanguage requestLanguage;

    public ReferenceDataService(ReferenceDataRepository referenceData,
                                RequestLanguage requestLanguage) {
        this.referenceData = referenceData;
        this.requestLanguage = requestLanguage;
    }

    /** The sets in the language the caller asked for via Accept-Language. */
    public Map<String, List<CodeEntry>> codes() {
        return codes(requestLanguage.current());
    }

    public Map<String, List<CodeEntry>> codes(UiLanguage language) {
        return referenceData.codes(language);
    }
}
