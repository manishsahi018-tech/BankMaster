package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.CodeEntry;
import com.banksystem.api.domain.repository.ReferenceDataRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Profile("!denodo")
@Repository
public class MockReferenceDataRepository implements ReferenceDataRepository {

    private static final Map<String, List<CodeEntry>> CODES = Map.ofEntries(
            Map.entry("idType", List.of(
                    new CodeEntry("I", "National ID"),
                    new CodeEntry("Q", "Iqama"),
                    new CodeEntry("C", "Commercial Regn"),
                    new CodeEntry("P", "Passport"),
                    new CodeEntry("D", "Diplomatic Card"),
                    new CodeEntry("G", "GCC Id"))),
            Map.entry("sex", List.of(
                    new CodeEntry("M", "Male"),
                    new CodeEntry("F", "Female"))),
            Map.entry("maritalStatus", List.of(
                    new CodeEntry("M", "Married"),
                    new CodeEntry("S", "Single"),
                    new CodeEntry("W", "Widowed"),
                    new CodeEntry("D", "Divorced"))),
            Map.entry("language", List.of(
                    new CodeEntry("0", "Arabic"),
                    new CodeEntry("1", "English"))),
            Map.entry("country", List.of(
                    new CodeEntry("001", "Saudi Arabia"),
                    new CodeEntry("002", "Bahrain"),
                    new CodeEntry("003", "Kuwait"),
                    new CodeEntry("004", "UAE"),
                    new CodeEntry("005", "Qatar"))),
            Map.entry("businessType", List.of(
                    new CodeEntry("001", "Government"),
                    new CodeEntry("002", "Private Sector"),
                    new CodeEntry("003", "Self Employed"),
                    new CodeEntry("004", "Retired"),
                    new CodeEntry("049", "Trading"),
                    new CodeEntry("266", "ANB Staff"))),
            Map.entry("samaMainCategory", List.of(
                    new CodeEntry("01", "Individual"),
                    new CodeEntry("02", "Corporate"),
                    new CodeEntry("03", "SME"),
                    new CodeEntry("04", "Government"),
                    new CodeEntry("05", "NGO / Trust"))),
            Map.entry("samaSubCategory", List.of(
                    new CodeEntry("01", "Savings"),
                    new CodeEntry("02", "Current"),
                    new CodeEntry("03", "Salary"),
                    new CodeEntry("04", "Premium"),
                    new CodeEntry("05", "Staff"))),
            Map.entry("branch", List.of(
                    new CodeEntry("0001", "Head Office"),
                    new CodeEntry("0002", "City Centre"),
                    new CodeEntry("0127", "SWAIDI"),
                    new CodeEntry("0128", "MUTANABI"),
                    new CodeEntry("0191", "OLAYA"))),
            Map.entry("cardStatus", List.of(
                    new CodeEntry("0", "Inactive"),
                    new CodeEntry("1", "Active"),
                    new CodeEntry("9", "Cancelled"))),
            Map.entry("cardRequestStatus", List.of(
                    new CodeEntry("1", "Requested"),
                    new CodeEntry("3", "Rejected"),
                    new CodeEntry("9", "Completed"))));

    @Override
    public Map<String, List<CodeEntry>> codes() {
        return CODES;
    }
}
