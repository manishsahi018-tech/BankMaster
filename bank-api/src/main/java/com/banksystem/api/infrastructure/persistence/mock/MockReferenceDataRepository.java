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
                    new CodeEntry("9", "Completed"))),
            // Currencies — codes and names transcribed from stctltabXC.ts's own
            // currCode description, which enumerates the whole domain. A subset:
            // the real set is served from stctltabXC under denodo.
            Map.entry("currency", List.of(
                    new CodeEntry("01", "Saudi Riyal"),
                    new CodeEntry("43", "Japanese Yen"),
                    new CodeEntry("45", "Kuwaiti Dinar"),
                    new CodeEntry("53", "Qatari Riyal"),
                    new CodeEntry("54", "Arab Emirates Dirham"),
                    new CodeEntry("67", "U.S. Dollar"),
                    new CodeEntry("70", "Bahraini Dinar"),
                    new CodeEntry("84", "British Pound"),
                    new CodeEntry("85", "Indian Rupees"))),
            // Ledgers — the three the account fixtures use, plus the common
            // deposit ledgers. Served from stctltabMM under denodo.
            Map.entry("ledger", List.of(
                    new CodeEntry("008", "Current Account"),
                    new CodeEntry("009", "Saving Account"),
                    new CodeEntry("100", "Time Deposit"),
                    new CodeEntry("108", "Call Deposit"))),
            // Account status — stctltab recType 'AS' under denodo. These four
            // match the values the account screens already had hard-coded.
            Map.entry("accStatus", List.of(
                    new CodeEntry("00", "Open"),
                    new CodeEntry("03", "Account Stopped"),
                    new CodeEntry("04", "No Debits"),
                    new CodeEntry("08", "Enquiry Restricted"))),
            // Statement frequency — stctltab recType 'SF' under denodo. The
            // codes come from stacclog.ts's statementFreq description, which
            // enumerates them: 01 is NON-AUTOMATIC, not "Monthly". (The
            // juristic fixture labels 01 "Monthly", which is wrong; it predates
            // this set existing and never went through codeLabel.)
            Map.entry("stmtFreq", List.of(
                    new CodeEntry("01", "Non-automatic"),
                    new CodeEntry("02", "Daily"),
                    new CodeEntry("03", "Weekly"),
                    new CodeEntry("04", "Monthly"),
                    new CodeEntry("05", "Quarterly"),
                    new CodeEntry("06", "Half yearly"),
                    new CodeEntry("07", "Yearly"))));

    @Override
    public Map<String, List<CodeEntry>> codes() {
        return CODES;
    }
}
