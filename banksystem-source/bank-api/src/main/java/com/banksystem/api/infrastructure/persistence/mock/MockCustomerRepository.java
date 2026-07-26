package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.CustUpdateHistoryEntry;
import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.HeirEntry;
import com.banksystem.api.domain.model.JointHolderEntry;
import com.banksystem.api.domain.model.JuristicAccountInfo;
import com.banksystem.api.domain.model.OwnerEntry;
import com.banksystem.api.domain.model.ReferenceEntry;
import com.banksystem.api.domain.model.CustomerSearchCriteria;
import com.banksystem.api.domain.model.CustomerSummary;
import com.banksystem.api.domain.repository.CustomerRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Mock data matching bank-ui's current fixtures (sample values from the
 * legacy screenshots). Replaced by a JDBC implementation against the
 * archival-schema DB once its engine is known.
 */
@Profile("!denodo")
@Repository
public class MockCustomerRepository implements CustomerRepository {

    private static final List<CustomerSummary> RESULTS = List.of(
            new CustomerSummary("0415741", "I", "1009326404", "6642791", "",
                    "حسين", "سعيد", "كاظم", "سعيد عبدالوهاب ,", "0127", "01", "01"),
            new CustomerSummary("0415742", "Q", "1004458821", "6641150", "24",
                    "Ahmed", "Khalid", "Al-Otaibi", "Ahmed K. Al-Otaibi", "0001", "01", "02"),
            new CustomerSummary("0417003", "C", "4030099812", "6607744", "",
                    "", "", "", "Al Noor Trading Est.", "0127", "02", "01"));

    private static List<CustUpdateHistoryEntry> buildHistory() {
        var rows = new java.util.ArrayList<>(BASE_HISTORY);
        for (int i = 0; i < 17; i++) {
            rows.add(new CustUpdateHistoryEntry("0191", String.format("%05d", 55000 + i),
                    String.format("201001%02d1015%02d", (i % 27) + 1, i % 60),
                    "9-Update successful", "54124",
                    String.format("201001%02d1130%02d", (i % 27) + 1, i % 60), "01", "01"));
        }
        return List.copyOf(rows);
    }

    private static final List<CustUpdateHistoryEntry> BASE_HISTORY = List.of(
            new CustUpdateHistoryEntry("0128", "BMBRCHG", "20020528220419", "9-Update successful", "BMBRCHG", "20020528193053", "", ""),
            new CustUpdateHistoryEntry("0711", "99607", "20030930101638", "9-Update successful", "51969", "20030930124818", "", ""),
            new CustUpdateHistoryEntry("0173", "80233", "20060502155957", "9-Update successful", "52453", "20060502164400", "01", "01"),
            new CustUpdateHistoryEntry("0716", "81407", "20070717130114", "9-Update successful", "55001", "20070718135440", "01", "01"),
            new CustUpdateHistoryEntry("0125", "54124", "20080623133852", "9-Update successful", "53680", "20080623143043", "01", "01"),
            new CustUpdateHistoryEntry("0191", "55629", "20081013122815", "9-Update successful", "54124", "20081013123237", "01", "01"),
            new CustUpdateHistoryEntry("0191", "54139", "20081018144844", "9-Update successful", "54124", "20081018145554", "01", "01"),
            new CustUpdateHistoryEntry("0191", "57127", "20090120105712", "3-Rejected by the branch", "54124", "20090120105753", "01", "01"));

    // 25 rows so the UI's "More" pagination (20/page) has a second page.
    // Declared after BASE_HISTORY: static initializers run in source order.
    private static final List<CustUpdateHistoryEntry> HISTORY = buildHistory();

    @Override
    public List<CustomerSummary> search(CustomerSearchCriteria c) {
        // Legacy doSearch: customer-no lookups resolve to a single customer.
        if (c.custNo() != null && !c.custNo().isBlank()) {
            String padded = ("0000000" + c.custNo().trim()).substring(c.custNo().trim().length());
            // Known fixture customers keep their own category/idType so the
            // UI's loadCorrespondingForm routing stays exercisable.
            CustomerSummary base = RESULTS.stream()
                    .filter(r -> r.custNo().equals(padded))
                    .findFirst()
                    .orElse(RESULTS.get(0));
            return List.of(new CustomerSummary(padded, base.idType(), base.idNo(), base.telNo(),
                    base.telExt(), base.firstName(), base.secondName(), base.lastName(),
                    base.shortName(), base.branchCode(), base.mainCategoryCode(), base.subCategoryCode()));
        }
        return RESULTS;
    }

    @Override
    public List<CustUpdateHistoryEntry> updateHistory(String custNo) {
        return HISTORY;
    }

    private static final Map<String, CustomerProfile> PROFILES = Map.of(
            "0415741", new CustomerProfile("0415741", "P", "01", "01", "0127", "001", "0",
                    "I", "1009326404", "القطيف", "14140128", "19930717", "14340402", "20130212",
                    "حسين", "سعيد", "عبدالوهاب", "كاظم", "كاظم حسين سعيد عبدالوهاب",
                    "Hussain", "Saeed", "Abdulwahab", "Kadem", "Kadem Hussain Saeed Abdulwahab",
                    "", "", "", "", "", "", "", "",
                    "13980117", "19771228", "M", "M", "266",
                    "المنطقة الشرقية", "البنك العربي الوطني-السويدي", "724", "صفوى", "31921", "001",
                    "6642791", "4261200", "0555877547", "hkadem@anb.com.sa", "19980704", ""),
            "0415742", new CustomerProfile("0415742", "P", "01", "02", "0001", "002", "1",
                    "Q", "1004458821", "الرياض", "14250310", "20040429", "14480515", "20261125",
                    "احمد", "خالد", "", "العتيبي", "احمد خالد العتيبي",
                    "Ahmed", "Khalid", "", "Al-Otaibi", "Ahmed K. Al-Otaibi",
                    "", "", "", "", "", "", "", "",
                    "13990505", "19790401", "M", "S", "002",
                    "OLAYA DISTRICT", "KING FAHD ROAD", "9034", "RIYADH", "11413", "002",
                    "6641150", "4614500", "0501234567", "ahmed.k@example.com", "20040502", ""),
            "0417003", new CustomerProfile("0417003", "C", "02", "01", "0127", "001", "1",
                    "C", "4030099812", "جدة", "", "", "", "",
                    "", "", "", "", "",
                    "", "", "", "", "",
                    "مؤسسة النور التجارية", "النور", "Al Noor Trading Establishment", "Al Noor Trading Est.",
                    "4030099812", "جدة", "14150601", "19941104",
                    "", "", "", "", "049",
                    "INDUSTRIAL AREA PHASE 2", "GATE 14", "3456", "جدة", "21471", "001",
                    "", "6607744", "0567788990", "info@alnoor-trading.com", "19941120", "RM-042"));

    @Override
    public Optional<CustomerProfile> profile(String custNo) {
        return Optional.ofNullable(PROFILES.get(custNo));
    }

    @Override
    public Optional<CustomerProfile> profileAsOf(String custNo, String dateTime) {
        // Mock: the stcustlog snapshot differs from the live record only in
        // the mobile number and email, so the history view is visibly older.
        return Optional.ofNullable(PROFILES.get(custNo)).map(p -> new CustomerProfile(
                p.custNo(), p.custType(), p.samaMainCategory(), p.samaSubCategory(),
                p.branchCode(), p.nationality(), p.preferredLang(),
                p.idType(), p.idNo(), p.idIssuedAt(),
                p.idIssueDateH(), p.idIssueDateG(), p.idExpiryDateH(), p.idExpiryDateG(),
                p.aFirstName(), p.a2ndName(), p.a3rdName(), p.aLastName(), p.aShortName(),
                p.eFirstName(), p.e2ndName(), p.e3rdName(), p.eLastName(), p.eShortName(),
                p.aOrgName1(), p.aOrgShortName(), p.eOrgName1(), p.eOrgShortName(),
                p.crNo(), p.crIssuedAt(), p.crIssueDateH(), p.crIssueDateG(),
                p.dobDateH(), p.dobDateG(), p.sexCode(), p.marritalStatus(), p.businessType(),
                p.address1(), p.address2(), p.poBox(), p.cityName(), p.zipCode(), p.country(),
                p.telHomeNo(), p.telOffNo(), "0509990000", "old-address@example.com",
                p.custOpenDate(), p.relationshipManager()));
    }

    @Override
    public Optional<JuristicAccountInfo> juristicAccountInfo(String custNo) {
        CustomerProfile p = PROFILES.get(custNo);
        if (p == null || "01".equals(p.samaMainCategory())) {
            return Optional.empty(); // juristic customers only
        }
        return Optional.of(new JuristicAccountInfo(custNo,
                p.address1(), p.address2(), p.poBox(), p.zipCode(), p.cityName(), p.country(),
                p.telOffNo(), p.telHomeNo(), "6607745", p.mobileNo(), "", p.eMail(),
                "1", "SAR", "01 - Monthly", "1", "00 - Open",
                "0", "", "", "",
                "108 - Call Deposit", "SAR", "03 - Quarterly", "0", "00 - Open",
                "J", "1", "1", "0",
                p.relationshipManager(), "Trade licence renewed 1994", "", "0"));
    }

    @Override
    public List<HeirEntry> heirs(String custNo) {
        return List.of(
                new HeirEntry("001", "H", "فاطمة حسين سعيد كاظم", "I", "1022334455",
                        "", "", "", "1", "0127"),
                new HeirEntry("002", "P", "سالم عبدالله المري", "I", "1033445566",
                        "PRX-2214", "14290305", "20080312", "1", "0127"));
    }

    @Override
    public List<JointHolderEntry> jointHolders(String custNo) {
        return List.of(
                new JointHolderEntry("0415799", "نورة سعيد الكاظم", "I", "1044556677",
                        "001", "0509876543", "20050614", "1", "0127"));
    }

    @Override
    public List<ReferenceEntry> references(String custNo) {
        return List.of(
                new ReferenceEntry("001", "L", "N", "خالد محمد الدوسري", "I", "1055667788",
                        "1", "0127"),
                new ReferenceEntry("002", "R", "M", "Ibrahim A. Hakeem", "Q", "2233445566",
                        "1", "0001"));
    }

    @Override
    public List<OwnerEntry> owners(String custNo) {
        return List.of(
                new OwnerEntry("001", "O", "عبدالرحمن النور", "I", "1066778899",
                        "", "060.00", "1", "0127"),
                new OwnerEntry("002", "M", "Faisal S. Al-Harbi", "I", "1077889900",
                        "Al Noor Holding", "040.00", "1", "0127"));
    }
}
