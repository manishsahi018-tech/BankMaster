package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.ReferenceDataService;
import com.banksystem.api.domain.model.CodeEntry;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/** Reference-data code sets for combos and code→description display. */
@RestController
@RequestMapping("/api/codes")
public class ReferenceDataController {

    private final ReferenceDataService referenceData;

    public ReferenceDataController(ReferenceDataService referenceData) {
        this.referenceData = referenceData;
    }

    @GetMapping
    public Map<String, List<CodeEntry>> codes() {
        return referenceData.codes();
    }
}
