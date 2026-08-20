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
            // stctltab record types TT / ED / PR / PO / MI / SG / DT — the
            // combos the legacy read from its local Access database. Codes here
            // follow the profile fixtures (education 0003, profession 0006,
            // position 0005, income 0003, segmentation 1).
            Map.entry("title", List.of(
                    new CodeEntry("01", "Mr."),
                    new CodeEntry("02", "Mrs."),
                    new CodeEntry("03", "Miss"),
                    new CodeEntry("04", "Dr."),
                    new CodeEntry("05", "Sheikh"),
                    new CodeEntry("06", "Eng."),
                    new CodeEntry("07", "Prof."),
                    new CodeEntry("08", "M/S"))),
            Map.entry("education", List.of(
                    new CodeEntry("0001", "Primary"),
                    new CodeEntry("0002", "Secondary"),
                    new CodeEntry("0003", "Diploma"),
                    new CodeEntry("0004", "Bachelors"),
                    new CodeEntry("0005", "Post Graduate"))),
            Map.entry("profession", List.of(
                    new CodeEntry("0001", "Government"),
                    new CodeEntry("0002", "Private sector"),
                    new CodeEntry("0006", "ANB Staff"),
                    new CodeEntry("0007", "Business Owner"))),
            Map.entry("position", List.of(
                    new CodeEntry("0001", "Manager"),
                    new CodeEntry("0002", "Supervisor"),
                    new CodeEntry("0005", "Others"))),
            Map.entry("monthlyIncome", List.of(
                    new CodeEntry("0001", "Below 3000"),
                    new CodeEntry("0002", "3001-5000"),
                    new CodeEntry("0003", "5001-10000"),
                    new CodeEntry("0004", "Above 10000"))),
            Map.entry("segmentation", List.of(
                    new CodeEntry("0", "NONE"),
                    new CodeEntry("1", "High Networth"),
                    new CodeEntry("2", "Affluent"),
                    new CodeEntry("3", "Mass"))),
            // Names transcribed from the legacy screenshots — the same seven
            // EssentialDocuments carried locally, so mock and denodo agree.
            Map.entry("documentType", List.of(
                    new CodeEntry("001", "Signature of a/c holder"),
                    new CodeEntry("002", "Thump Imprint/Personal Stamp"),
                    new CodeEntry("008", "Personal Id card of a/c holder"),
                    new CodeEntry("009", "Family regn book of a/c holder"),
                    new CodeEntry("025", "Valid passport copy"),
                    new CodeEntry("051", "A/C opening agreement"),
                    new CodeEntry("074", "Family Record"))),
            Map.entry("language", List.of(
                    new CodeEntry("0", "Arabic"),
                    new CodeEntry("1", "English"))),
            Map.entry("country", List.of(
                    new CodeEntry("001", "Saudi Arabia"),
                    new CodeEntry("002", "Bahrain"),
                    new CodeEntry("003", "Kuwait"),
                    new CodeEntry("004", "UAE"),
                    new CodeEntry("005", "Qatar"),
                    // The demo "other individual" is an Egyptian expatriate, so
                    // his home-country address resolves to a name rather than a
                    // bare code on the Others page 2.
                    new CodeEntry("019", "Egypt"))),
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
                    new CodeEntry("07", "Yearly"))),
            // Interest application — stctltab recType 'IA' under denodo. The
            // four values come from gld0data.ts's intApplication description.
            // The screen previously offered two hard-coded options, and called
            // 1 "Transfer" rather than what the schema says it is.
            Map.entry("intApplication", List.of(
                    new CodeEntry("0", "Capitalise"),
                    new CodeEntry("1", "Pay to another account"),
                    new CodeEntry("2", "Pay by cheque"),
                    new CodeEntry("3", "Memorandum interest only"))));

    @Override
    public Map<String, List<CodeEntry>> codes() {
        return CODES;
    }
}
