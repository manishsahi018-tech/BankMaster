package com.banksystem.api.domain.repository;

import com.banksystem.api.domain.model.CustUpdateHistoryEntry;
import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.HeirEntry;
import com.banksystem.api.domain.model.JuristicAccountInfo;
import com.banksystem.api.domain.model.JointHolderEntry;
import com.banksystem.api.domain.model.OwnerDetail;
import com.banksystem.api.domain.model.OwnerEntry;
import com.banksystem.api.domain.model.ReferenceEntry;
import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import com.banksystem.api.domain.model.SearchScan;

import java.util.List;
import java.util.Optional;

/**
 * Customer enquiries. Legacy: service 16 (customer search) and 67 (update
 * history) in cbcmssrv, reading stcusttab / stcustlog. The real
 * implementation will query the archival-schema database (DB #1) once its
 * engine is known; queries to port live in docs/CSD C Code (cbbranch2.c).
 */
public interface CustomerRepository {

    /**
     * Customer search (service 16). Returns the rows read plus whether the scan
     * ran out of time — the legacy caps searches by clock, not row count
     * (cbbranch.c:1728-1755); see {@link SearchScan}.
     */
    SearchScan<CustomerSummary> search(CustomerSearchCriteria criteria);

    List<CustUpdateHistoryEntry> updateHistory(String custNo);

    /** stcusttab record for the customer detail screens. */
    Optional<CustomerProfile> profile(String custNo);

    /**
     * Profile snapshot as of an update-history row — legacy service 11
     * requestType 01 reading stcustlog / custlogYYYY.
     */
    Optional<CustomerProfile> profileAsOf(String custNo, String dateTime);

    /** Juristic page 2 (frmJuristicAccountInfo) enquiry data. */
    Optional<JuristicAccountInfo> juristicAccountInfo(String custNo);

    /** stheirtab rows (legacy processHeirTabSearch, cbsama.c). */
    List<HeirEntry> heirs(String custNo);

    /** stjointtab rows (legacy processJointTabSearch, cbsama.c). */
    List<JointHolderEntry> jointHolders(String custNo);

    /** stcreftab rows (legacy processReferenceTabSearch, cbsama.c). */
    List<ReferenceEntry> references(String custNo);

    /** stowntab rows (legacy processOwnerTabSearch, cbsama.c). */
    List<OwnerEntry> owners(String custNo);

    /**
     * One owner in full — the record frmJuristicOwner opens on a grid
     * double-click (service 77, cbsama.c readOwnerTabInfo). Assembled from
     * stowntab, the owner's stidtab row and its staddrtab '03'/'04' addresses.
     */
    Optional<OwnerDetail> ownerDetail(String custNo, String ownerNo);

    /** Individual page 2 (frmIndividualSaudiAcctInfo) — the customer's
     *  employment/income/segmentation/employer/memo attributes from stcusttab.
     *  Keys match the screen fields; empty map when not found. */
    java.util.Map<String, String> acctInfo(String custNo);

    /** Essential documents required for the customer's SAMA sub-category
     *  (frmDocuments) — the document codes from stctltabDC, resolved to names. */
    List<String> requiredDocuments(String custNo);
}
