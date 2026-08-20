package com.banksystem.api.application;

import com.banksystem.api.domain.model.CustUpdateHistoryEntry;
import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import com.banksystem.api.domain.model.HeirEntry;
import com.banksystem.api.domain.model.JointHolderDetail;
import com.banksystem.api.domain.model.JointHolderEntry;
import com.banksystem.api.domain.model.JuristicAccountInfo;
import com.banksystem.api.domain.model.OwnerDetail;
import com.banksystem.api.domain.model.OwnerEntry;
import com.banksystem.api.domain.model.PartyDetail;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.SearchScan;
import java.util.List;
import com.banksystem.api.domain.model.ReferenceEntry;
import com.banksystem.api.domain.repository.CustomerRepository;
import org.springframework.stereotype.Service;

/**
 * Customer enquiry use cases — legacy services 16 (customer search),
 * 67 (update history) and 11 (profile as-of), plus the SAMA sub-grids
 * (heirs / joint holders / references / owners, cbsama.c).
 */
@Service
public class CustomerService {

    private final CustomerRepository customers;

    public CustomerService(CustomerRepository customers) {
        this.customers = customers;
    }

    public PagedResult<CustomerSummary> search(CustomerSearchCriteria criteria, int page) {
        if (criteria.isEmpty()) {
            throw new BadRequestException("At least one search criterion is required");
        }
        // No row cap: the scan is bounded by the legacy's search clock and
        // reports for itself whether it finished (cbbranch.c:1742-1755).
        SearchScan<CustomerSummary> scan = customers.search(criteria);
        return PagedResult.page(scan.rows(), page, scan.incomplete());
    }

    public CustomerProfile profile(String custNo) {
        return customers.profile(custNo).orElseThrow(() ->
                new NotFoundException("Customer not found"));
    }

    public CustomerProfile profileAsOf(String custNo, String dateTime) {
        return customers.profileAsOf(custNo, dateTime).orElseThrow(() ->
                new NotFoundException("History record not found"));
    }

    public JuristicAccountInfo juristicAccountInfo(String custNo) {
        return customers.juristicAccountInfo(custNo).orElseThrow(() ->
                new NotFoundException("Not a juristic customer"));
    }

    public PagedResult<HeirEntry> heirs(String custNo, int page) {
        return PagedResult.page(customers.heirs(custNo), page);
    }

    public PagedResult<JointHolderEntry> jointHolders(String custNo, int page) {
        return PagedResult.page(customers.jointHolders(custNo), page);
    }

    public PagedResult<ReferenceEntry> references(String custNo, int page) {
        return PagedResult.page(customers.references(custNo), page);
    }

    public PagedResult<OwnerEntry> owners(String custNo, int page) {
        return PagedResult.page(customers.owners(custNo), page);
    }

    /** One owner in full — the legacy's grid double-click (service 77). */
    public OwnerDetail ownerDetail(String custNo, String ownerNo) {
        return customers.ownerDetail(custNo, ownerNo).orElseThrow(() ->
                new NotFoundException("No details found for this owner."));
    }

    /** One reference / legal representative in full. */
    public PartyDetail referenceDetail(String custNo, String referenceNo) {
        return customers.referenceDetail(custNo, referenceNo).orElseThrow(() ->
                new NotFoundException("No details found for this reference."));
    }

    /** One heir / proxy in full. */
    public PartyDetail heirDetail(String custNo, String heirNo) {
        return customers.heirDetail(custNo, heirNo).orElseThrow(() ->
                new NotFoundException("No details found for this heir."));
    }

    /** One joint holder in full. */
    public JointHolderDetail jointHolderDetail(String custNo, String jointCustNo) {
        return customers.jointHolderDetail(custNo, jointCustNo).orElseThrow(() ->
                new NotFoundException("No details found for this joint holder."));
    }

    public java.util.Map<String, String> acctInfo(String custNo) {
        return customers.acctInfo(custNo);
    }

    public java.util.List<String> requiredDocuments(String custNo) {
        return customers.requiredDocuments(custNo);
    }

    public PagedResult<CustUpdateHistoryEntry> updateHistory(String custNo, int page) {
        return PagedResult.page(customers.updateHistory(custNo), page);
    }
}
