package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.SignatoryDetail;
import com.banksystem.api.domain.model.SignatorySummary;

import java.util.List;
import java.util.Optional;

/** Signatories — stsigntab ⋈ stidtab (QUERY-SPECS.md §20, cbsama.c). */
public interface SignatoryRepository {

    List<SignatorySummary> byCustomer(String custNo);

    List<SignatorySummary> byAccount(String accNo);

    Optional<SignatoryDetail> detail(String accNo, String signatoryNo);
}
