package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.CodeEntry;
import com.banksystem.api.domain.model.UiLanguage;

import java.util.List;
import java.util.Map;

/**
 * Code/description reference data. Legacy sources: stctltab recType rows
 * (branch details 'BD', categories 'CC', narratives 'NA'…) plus the Access
 * DB combo tables the VB6 client read directly (samamaincategoryinfo,
 * samasubcategoryinfo, branchinfo). In the revamp all of these live in
 * DB #1; the real implementation is one query per recType.
 */
public interface ReferenceDataRepository {

    /**
     * All code sets, keyed by set name (idType, country, branch, ...), with
     * descriptions in the given language.
     *
     * <p>The archival tables carry both an {@code arabicName} and an
     * {@code englishName} for every code, and the legacy client chose between
     * them on its UserLang global — so the language belongs in this contract
     * rather than being fixed by the query.
     */
    Map<String, List<CodeEntry>> codes(UiLanguage language);
}
