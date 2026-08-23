package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.CustomerService;
import com.banksystem.api.domain.model.CustUpdateHistoryEntry;
import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import com.banksystem.api.domain.model.EssentialDocuments;
import com.banksystem.api.domain.model.HeirEntry;
import com.banksystem.api.domain.model.JointHolderDetail;
import com.banksystem.api.domain.model.JointHolderEntry;
import com.banksystem.api.domain.model.JuristicAccountInfo;
import com.banksystem.api.domain.model.OwnerDetail;
import com.banksystem.api.domain.model.OwnerEntry;
import com.banksystem.api.domain.model.PartyDetail;
import com.banksystem.api.domain.model.PagedResult;
import com.banksystem.api.domain.model.ReferenceEntry;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/** Legacy services 16 (customer search) and 67 (customer update history). */
@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    private final CustomerService customers;

    public CustomerController(CustomerService customers) {
        this.customers = customers;
    }

    @GetMapping
    public PagedResult<CustomerSummary> search(
            @RequestParam(required = false) String custNo,
            @RequestParam(required = false) String idNo,
            @RequestParam(required = false) String cardNo,
            @RequestParam(required = false) String telNo,
            @RequestParam(required = false) String telExt,
            @RequestParam(required = false) String mobileNo,
            @RequestParam(required = false) String firstName,
            @RequestParam(required = false) String secondName,
            @RequestParam(required = false) String lastName,
            @RequestParam(required = false) String crNo,
            @RequestParam(required = false) String mainCategoryCode,
            @RequestParam(required = false) String subCategoryCode,
            @RequestParam(required = false) String branchCode,
            @RequestParam(defaultValue = "0") int page) {
        CustomerSearchCriteria criteria = new CustomerSearchCriteria(
                custNo, idNo, cardNo, telNo, telExt, mobileNo,
                firstName, secondName, lastName, crNo,
                mainCategoryCode, subCategoryCode, branchCode);
        return customers.search(criteria, page);
    }

    @GetMapping("/{custNo}/profile")
    public CustomerProfile profile(@PathVariable String custNo) {
        return customers.profile(custNo);
    }

    @GetMapping("/{custNo}/profile-asof/{dateTime}")
    public CustomerProfile profileAsOf(
            @PathVariable String custNo, @PathVariable String dateTime) {
        return customers.profileAsOf(custNo, dateTime);
    }

    @GetMapping("/{custNo}/juristic-account-info")
    public JuristicAccountInfo juristicAccountInfo(@PathVariable String custNo) {
        return customers.juristicAccountInfo(custNo);
    }

    @GetMapping("/{custNo}/heirs")
    public PagedResult<HeirEntry> heirs(
            @PathVariable String custNo, @RequestParam(defaultValue = "0") int page) {
        return customers.heirs(custNo, page);
    }

    @GetMapping("/{custNo}/joint-holders")
    public PagedResult<JointHolderEntry> jointHolders(
            @PathVariable String custNo, @RequestParam(defaultValue = "0") int page) {
        return customers.jointHolders(custNo, page);
    }

    @GetMapping("/{custNo}/references")
    public PagedResult<ReferenceEntry> references(
            @PathVariable String custNo, @RequestParam(defaultValue = "0") int page) {
        return customers.references(custNo, page);
    }

    @GetMapping("/{custNo}/owners")
    public PagedResult<OwnerEntry> owners(
            @PathVariable String custNo, @RequestParam(defaultValue = "0") int page) {
        return customers.owners(custNo, page);
    }

    /** The owner form's detail panel — frmJuristicOwner's grid double-click. */
    @GetMapping("/{custNo}/owners/{ownerNo}")
    public OwnerDetail ownerDetail(@PathVariable String custNo, @PathVariable String ownerNo) {
        return customers.ownerDetail(custNo, ownerNo);
    }

    /** frmIndividualSaudi2's grid double-click. */
    @GetMapping("/{custNo}/references/{referenceNo}")
    public PartyDetail referenceDetail(
            @PathVariable String custNo, @PathVariable String referenceNo) {
        return customers.referenceDetail(custNo, referenceNo);
    }

    /** frmIndividualHeirs' grid double-click. */
    @GetMapping("/{custNo}/heirs/{heirNo}")
    public PartyDetail heirDetail(@PathVariable String custNo, @PathVariable String heirNo) {
        return customers.heirDetail(custNo, heirNo);
    }

    /** frmIndividualJoint's grid double-click. */
    @GetMapping("/{custNo}/joint-holders/{jointCustNo}")
    public JointHolderDetail jointHolderDetail(
            @PathVariable String custNo, @PathVariable String jointCustNo) {
        return customers.jointHolderDetail(custNo, jointCustNo);
    }

    @GetMapping("/{custNo}/acct-info")
    public java.util.Map<String, String> acctInfo(@PathVariable String custNo) {
        return customers.acctInfo(custNo);
    }

    /** frmDocuments for the live customer record. */
    @GetMapping("/{custNo}/documents")
    public EssentialDocuments documents(@PathVariable String custNo) {
        return customers.documents(custNo, null);
    }

    /** frmDocuments as it stood at one stcustlog event (legacy history mode). */
    @GetMapping("/{custNo}/documents-asof/{dateTime}")
    public EssentialDocuments documentsAsOf(
            @PathVariable String custNo, @PathVariable String dateTime) {
        return customers.documents(custNo, dateTime);
    }

    @GetMapping("/{custNo}/update-history")
    public PagedResult<CustUpdateHistoryEntry> updateHistory(
            @PathVariable String custNo,
            @RequestParam(defaultValue = "0") int page) {
        return customers.updateHistory(custNo, page);
    }
}
