package com.banksystem.api.application;

import com.banksystem.api.domain.model.CustUpdateHistoryEntry;
import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import com.banksystem.api.domain.model.HeirEntry;
import com.banksystem.api.domain.model.JointHolderEntry;
import com.banksystem.api.domain.model.JuristicAccountInfo;
import com.banksystem.api.domain.model.OwnerEntry;
import com.banksystem.api.domain.model.PagedResult;
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
        return PagedResult.page(customers.search(criteria), page);
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

    public PagedResult<CustUpdateHistoryEntry> updateHistory(String custNo, int page) {
        return PagedResult.page(customers.updateHistory(custNo), page);
    }
}
