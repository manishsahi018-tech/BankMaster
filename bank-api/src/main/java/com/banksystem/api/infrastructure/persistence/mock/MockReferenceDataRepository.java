package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.CodeEntry;
import com.banksystem.api.domain.model.UiLanguage;
import com.banksystem.api.domain.repository.ReferenceDataRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
            // combos the legacy read from its local Access database.
            //
            // ED / PR / PO / MI carry the FOUR-character ctlCode the archival
            // table holds, which is wider than the two characters stcusttab
            // stores against it: the profile fixture's "03" resolves to
            // "0003-Diploma" on the tail match codes.ts does (the legacy's own
            // Mid(list, 3, 2), globalFunctions.bas:2439). TT is two characters
            // and matches outright.
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
            // stcusttab.packageAcc's documented domain — see the same set in
            // JdbcReferenceDataRepository for why it is not a stctltab read.
            Map.entry("packageAcc", List.of(
                    new CodeEntry("0", "None"),
                    new CodeEntry("1", "Munafa"),
                    new CodeEntry("2", "Wahat"),
                    new CodeEntry("3", "Al Safwa"),
                    new CodeEntry("4", "Mubarak"),
                    new CodeEntry("5", "Private Banking"))),
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
            // stchqtab column descriptions: chequeType 1 personal / 2
            // corporate; requestStatus 1 Requested … 9 Rejected by branch.
            Map.entry("chequeType", List.of(
                    new CodeEntry("1", "Personal"),
                    new CodeEntry("2", "Corporate"))),
            Map.entry("chequeBookStatus", List.of(
                    new CodeEntry("1", "Requested"),
                    new CodeEntry("2", "Produced"),
                    new CodeEntry("3", "Received by Branch"),
                    new CodeEntry("4", "Issued to customer"),
                    new CodeEntry("9", "Rejected by branch"))),
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
            // stctltabXC read through isoCurrCode instead of currCode — the key
            // the transfer forms use. Same currencies as `currency` above, so a
            // transfer and an account agree on the name.
            //
            // The codes are the ISO ALPHA codes, not the numerics this set used
            // to carry. stctltabXC.isoCurrCode holds the three-character alpha
            // code: six legacy call sites select it and fall back to the
            // literal "SAR" when the row is missing (frmCustomer2.frm:2465-2471,
            // frmAccct.frm:1549, frmAccDormant.frm:450,
            // frmIndividualSaudiAcctInfo.frm:3944, frmJuristicAccountInfo.frm:1818,
            // frmQuickCustOpen.frm:3085), and three of them blank it to three
            // SPACES — neither of which a numeric column would do. The workbook
            // agrees ("e.g., USD for US Dollar, SAR for Saudi Riyal"); the
            // numerics came from isd0data, a different table, where numeric and
            // alpha genuinely sit in two columns (isoCurrCode /
            // alphaIsoCurrCode).
            Map.entry("isoCurrency", List.of(
                    new CodeEntry("AED", "Arab Emirates Dirham"),
                    new CodeEntry("BHD", "Bahraini Dinar"),
                    new CodeEntry("EUR", "Euro"),
                    new CodeEntry("GBP", "British Pound"),
                    new CodeEntry("INR", "Indian Rupees"),
                    new CodeEntry("JPY", "Japanese Yen"),
                    new CodeEntry("KWD", "Kuwaiti Dinar"),
                    new CodeEntry("QAR", "Qatari Riyal"),
                    new CodeEntry("SAR", "Saudi Riyal"),
                    new CodeEntry("USD", "U.S. Dollar"))),
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
                    // 02 is what the dormant demo account carries
                    // (MockAccountRepository.STATUSES); without an entry here
                    // it rendered as a bare "02".
                    new CodeEntry("02", "Dormant"),
                    new CodeEntry("03", "Account Stopped"),
                    new CodeEntry("04", "No Debits"),
                    new CodeEntry("08", "Enquiry Restricted"))),
            // See JdbcReferenceDataRepository for why these three are fixed
            // domains rather than stctltab reads.
            Map.entry("cardType", List.of(
                    new CodeEntry("R", "Regular"), new CodeEntry("I", "International"),
                    new CodeEntry("V", "VIP"), new CodeEntry("A", "Administrative"),
                    new CodeEntry("D", "Deposit only"), new CodeEntry("C", "CPS"),
                    new CodeEntry("S", "International chip card"),
                    new CodeEntry("L", "Local chip card"))),
            Map.entry("transferStatus", List.of(
                    new CodeEntry("S", "Create Skeleton"), new CodeEntry("I", "Issued"),
                    new CodeEntry("V", "Verified"), new CodeEntry("C", "Confirmed"),
                    new CodeEntry("D", "Cancelled"), new CodeEntry("P", "Stopped"),
                    new CodeEntry("O", "Dormant"), new CodeEntry("R", "Repurchased"),
                    new CodeEntry("T", "Settled/Cleared"))),
            // rid0data.paymentStatus, arriving on the transfer detail as
            // "transType" — the legacy's transfertypeinfo lookup.
            Map.entry("transferType", List.of(
                    new CodeEntry("0", "Initialised"), new CodeEntry("1", "Direct Transfer"),
                    new CodeEntry("2", "SWIFT/Telex"), new CodeEntry("3", "Postal/Fax"),
                    new CodeEntry("4", "Telephone"))),
            // The four standing-order lists — stctltab recTypes ST / PT / PM /
            // PF under denodo. Codes are the ONE character sod0data stores;
            // the wording is that column's own documented domain.
            Map.entry("orderType", List.of(
                    new CodeEntry("0", "Specific standing order"),
                    new CodeEntry("1", "Automatic funds transfer FROM standing order account"),
                    new CodeEntry("2", "Automatic funds transfer TO standing order account"))),
            Map.entry("paymentType", List.of(
                    new CodeEntry("0", "Pay until further notice"),
                    new CodeEntry("1", "Pay until specified total has been paid"),
                    new CodeEntry("2", "Pay until specified date has been reached"),
                    new CodeEntry("3", "Pay until specified number of payments have been made"),
                    new CodeEntry("4", "Payment stopped"),
                    new CodeEntry("5", "Final payment made"))),
            Map.entry("paymentMode", List.of(
                    new CodeEntry("0", "Customer is beneficiary — pay from/to account at our bank"),
                    new CodeEntry("1", "Customer is not beneficiary — pay from/to account at our bank"),
                    new CodeEntry("2", "Credit transfer — pay to account at another bank"),
                    new CodeEntry("3", "Pay by cheque"),
                    new CodeEntry("4", "Credit transfer — pay account in the payee's account number"),
                    new CodeEntry("5", "Pay by cheque — pay account in the payee's account number"))),
            Map.entry("paymentFrequency", List.of(
                    new CodeEntry("D", "Daily"),
                    new CodeEntry("W", "Weekly"),
                    new CodeEntry("M", "Monthly"),
                    new CodeEntry("Q", "Quarterly"),
                    new CodeEntry("H", "Half yearly"),
                    new CodeEntry("Y", "Yearly"))),
            // Account status change reason — stctltab recType 'RC' under
            // denodo. 4-char ctlCodes, which is what makes the legacy's
            // "starts with 0" test tell a code apart from free text.
            Map.entry("statusChangeReason", List.of(
                    new CodeEntry("0001", "Customer request"),
                    new CodeEntry("0002", "Court order"),
                    new CodeEntry("0003", "SAMA instruction"),
                    new CodeEntry("0004", "Public prosecution request"),
                    new CodeEntry("0005", "Compliance review"),
                    new CodeEntry("0006", "Dormancy rules"),
                    new CodeEntry("0007", "ID expired"))),
            // SAMA account status — see JdbcReferenceDataRepository for why
            // this is a fixed domain rather than an stctltab read.
            Map.entry("samaStatus", List.of(
                    new CodeEntry("00", "Open"),
                    new CodeEntry("01", "Inactive"),
                    new CodeEntry("02", "Dormant"),
                    new CodeEntry("03", "Unclaimed"))),
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

    /**
     * Arabic for the demo sets, keyed {@code set/code}.
     *
     * <p>Kept as an OVERLAY rather than a second copy of the map above: the
     * codes and the set membership are the fixture, and duplicating them would
     * let the two drift. Anything with no entry here falls back to its English
     * name, which is also what happens under denodo when an archival row
     * carries only one of its two names.
     *
     * <p>This exists so the mock profile can actually exercise the Arabic UI.
     * Without it every combo and every code→description label on an Arabic
     * screen would read English in local verification, which is precisely the
     * part of the translation a mock run is there to check.
     */
    private static final Map<String, String> ARABIC = Map.ofEntries(
            Map.entry("idType/I", "هوية وطنية"),
            Map.entry("idType/Q", "إقامة"),
            Map.entry("idType/C", "سجل تجاري"),
            Map.entry("idType/P", "جواز سفر"),
            Map.entry("idType/D", "بطاقة دبلوماسية"),
            Map.entry("idType/G", "هوية خليجية"),
            Map.entry("sex/M", "ذكر"),
            Map.entry("sex/F", "أنثى"),
            Map.entry("maritalStatus/M", "متزوج"),
            Map.entry("maritalStatus/S", "أعزب"),
            Map.entry("maritalStatus/W", "أرمل"),
            Map.entry("maritalStatus/D", "مطلق"),
            Map.entry("title/01", "السيد"),
            Map.entry("title/02", "السيدة"),
            Map.entry("title/03", "الآنسة"),
            Map.entry("title/04", "الدكتور"),
            Map.entry("title/05", "الشيخ"),
            Map.entry("title/06", "المهندس"),
            Map.entry("title/07", "الأستاذ الدكتور"),
            Map.entry("title/08", "السادة"),
            Map.entry("education/0001", "ابتدائي"),
            Map.entry("education/0002", "ثانوي"),
            Map.entry("education/0003", "دبلوم"),
            Map.entry("education/0004", "بكالوريوس"),
            Map.entry("education/0005", "دراسات عليا"),
            Map.entry("profession/0001", "حكومي"),
            Map.entry("profession/0002", "القطاع الخاص"),
            Map.entry("profession/0006", "موظف البنك العربي الوطني"),
            Map.entry("profession/0007", "صاحب عمل"),
            Map.entry("position/0001", "مدير"),
            Map.entry("position/0002", "مشرف"),
            Map.entry("position/0005", "أخرى"),
            // 0002/0003 are numeric ranges and read the same either way.
            Map.entry("monthlyIncome/0001", "أقل من 3000"),
            Map.entry("monthlyIncome/0004", "أكثر من 10000"),
            Map.entry("segmentation/0", "لا يوجد"),
            Map.entry("segmentation/1", "ثروات عالية"),
            Map.entry("segmentation/2", "ميسور"),
            Map.entry("segmentation/3", "عام"),
            Map.entry("documentType/001", "توقيع صاحب الحساب"),
            Map.entry("documentType/002", "بصمة الإبهام / الختم الشخصي"),
            Map.entry("documentType/008", "بطاقة هوية صاحب الحساب"),
            Map.entry("documentType/009", "دفتر العائلة لصاحب الحساب"),
            Map.entry("documentType/025", "صورة جواز سفر ساري"),
            Map.entry("documentType/051", "اتفاقية فتح حساب"),
            Map.entry("documentType/074", "سجل الأسرة"),
            Map.entry("language/0", "عربي"),
            Map.entry("language/1", "انجليزي"),
            // ANB product names — the Arabic is the product's own name.
            Map.entry("packageAcc/0", "لا يوجد"),
            Map.entry("packageAcc/1", "منافع"),
            Map.entry("packageAcc/2", "واحات"),
            Map.entry("packageAcc/3", "الصفوة"),
            Map.entry("packageAcc/4", "مبارك"),
            Map.entry("packageAcc/5", "الخدمات المصرفية الخاصة"),
            Map.entry("country/001", "المملكة العربية السعودية"),
            Map.entry("country/002", "البحرين"),
            Map.entry("country/003", "الكويت"),
            Map.entry("country/004", "الإمارات العربية المتحدة"),
            Map.entry("country/005", "قطر"),
            Map.entry("country/019", "مصر"),
            Map.entry("businessType/001", "حكومي"),
            Map.entry("businessType/002", "القطاع الخاص"),
            Map.entry("businessType/003", "عمل حر"),
            Map.entry("businessType/004", "متقاعد"),
            Map.entry("businessType/049", "تجارة"),
            Map.entry("businessType/266", "موظف البنك العربي الوطني"),
            Map.entry("samaMainCategory/01", "أفراد"),
            Map.entry("samaMainCategory/02", "شركات"),
            Map.entry("samaMainCategory/03", "منشآت صغيرة ومتوسطة"),
            Map.entry("samaMainCategory/04", "حكومي"),
            Map.entry("samaMainCategory/05", "جمعيات وأوقاف"),
            Map.entry("samaSubCategory/01", "توفير"),
            Map.entry("samaSubCategory/02", "جاري"),
            Map.entry("samaSubCategory/03", "رواتب"),
            Map.entry("samaSubCategory/04", "مميز"),
            Map.entry("samaSubCategory/05", "موظفين"),
            Map.entry("branch/0001", "المركز الرئيسي"),
            Map.entry("branch/0002", "وسط المدينة"),
            Map.entry("branch/0127", "السويدي"),
            Map.entry("branch/0128", "المتنبي"),
            Map.entry("branch/0191", "العليا"),
            Map.entry("chequeType/1", "شخصي"),
            Map.entry("chequeType/2", "تجاري"),
            Map.entry("chequeBookStatus/1", "مطلوب"),
            Map.entry("chequeBookStatus/2", "تم الإصدار"),
            Map.entry("chequeBookStatus/3", "مستلمة من الفرع"),
            Map.entry("chequeBookStatus/4", "صادرة للعميل"),
            Map.entry("chequeBookStatus/9", "مرفوضة من الفرع"),
            Map.entry("cardStatus/0", "غير مفعلة"),
            Map.entry("cardStatus/1", "مفعلة"),
            Map.entry("cardStatus/9", "ملغاة"),
            Map.entry("cardRequestStatus/1", "مطلوبة"),
            Map.entry("cardRequestStatus/3", "مرفوضة"),
            Map.entry("cardRequestStatus/9", "مكتملة"),
            Map.entry("currency/01", "ريال سعودي"),
            Map.entry("currency/43", "ين ياباني"),
            Map.entry("currency/45", "دينار كويتي"),
            Map.entry("currency/53", "ريال قطري"),
            Map.entry("currency/54", "درهم إماراتي"),
            Map.entry("currency/67", "دولار أمريكي"),
            Map.entry("currency/70", "دينار بحريني"),
            Map.entry("currency/84", "جنيه إسترليني"),
            Map.entry("currency/85", "روبية هندية"),
            Map.entry("isoCurrency/BHD", "دينار بحريني"),
            Map.entry("isoCurrency/INR", "روبية هندية"),
            Map.entry("isoCurrency/JPY", "ين ياباني"),
            Map.entry("isoCurrency/KWD", "دينار كويتي"),
            Map.entry("isoCurrency/SAR", "ريال سعودي"),
            Map.entry("isoCurrency/QAR", "ريال قطري"),
            Map.entry("isoCurrency/AED", "درهم إماراتي"),
            Map.entry("isoCurrency/GBP", "جنيه إسترليني"),
            Map.entry("isoCurrency/USD", "دولار أمريكي"),
            Map.entry("isoCurrency/EUR", "يورو"),
            Map.entry("ledger/008", "حساب جاري"),
            Map.entry("ledger/009", "حساب توفير"),
            Map.entry("ledger/100", "وديعة لأجل"),
            Map.entry("ledger/108", "وديعة تحت الطلب"),
            Map.entry("accStatus/00", "مفتوح"),
            Map.entry("cardType/R", "عادية"), Map.entry("cardType/I", "دولية"),
            Map.entry("cardType/V", "كبار العملاء"), Map.entry("cardType/A", "إدارية"),
            Map.entry("cardType/D", "إيداع فقط"),
            Map.entry("cardType/S", "بطاقة دولية بشريحة"),
            Map.entry("cardType/L", "بطاقة محلية بشريحة"),
            Map.entry("transferStatus/S", "إنشاء مبدئي"), Map.entry("transferStatus/I", "صادرة"),
            Map.entry("transferStatus/V", "تم التحقق"), Map.entry("transferStatus/C", "مؤكدة"),
            Map.entry("transferStatus/D", "ملغاة"), Map.entry("transferStatus/P", "موقوفة"),
            Map.entry("transferStatus/O", "غير متحركة"), Map.entry("transferStatus/R", "معاد شراؤها"),
            Map.entry("transferStatus/T", "تمت التسوية"),
            Map.entry("transferType/0", "مبدئية"), Map.entry("transferType/1", "حوالة مباشرة"),
            Map.entry("transferType/2", "سويفت/تلكس"), Map.entry("transferType/3", "بريد/فاكس"),
            Map.entry("transferType/4", "هاتف"),
            Map.entry("orderType/0", "أمر ثابت محدد"),
            Map.entry("orderType/1", "تحويل آلي من حساب الأمر الثابت"),
            Map.entry("orderType/2", "تحويل آلي إلى حساب الأمر الثابت"),
            Map.entry("paymentType/0", "الدفع حتى إشعار آخر"),
            Map.entry("paymentType/1", "الدفع حتى سداد المبلغ المحدد"),
            Map.entry("paymentType/2", "الدفع حتى التاريخ المحدد"),
            Map.entry("paymentType/3", "الدفع حتى اكتمال عدد الدفعات المحدد"),
            Map.entry("paymentType/4", "الدفع متوقف"),
            Map.entry("paymentType/5", "تم سداد الدفعة الأخيرة"),
            Map.entry("paymentMode/0", "العميل هو المستفيد — الدفع من/إلى حساب لدى بنكنا"),
            Map.entry("paymentMode/1", "العميل ليس المستفيد — الدفع من/إلى حساب لدى بنكنا"),
            Map.entry("paymentMode/2", "حوالة دائنة — الدفع إلى حساب في بنك آخر"),
            Map.entry("paymentMode/3", "الدفع بشيك"),
            Map.entry("paymentMode/4", "حوالة دائنة — الدفع للحساب المحدد في رقم حساب المستفيد"),
            Map.entry("paymentMode/5", "الدفع بشيك — للحساب المحدد في رقم حساب المستفيد"),
            Map.entry("paymentFrequency/D", "يومي"),
            Map.entry("paymentFrequency/W", "أسبوعي"),
            Map.entry("paymentFrequency/M", "شهري"),
            Map.entry("paymentFrequency/Q", "ربع سنوي"),
            Map.entry("paymentFrequency/H", "نصف سنوي"),
            Map.entry("paymentFrequency/Y", "سنوي"),
            Map.entry("statusChangeReason/0001", "طلب العميل"),
            Map.entry("statusChangeReason/0002", "أمر قضائي"),
            Map.entry("statusChangeReason/0003", "تعليمات ساما"),
            Map.entry("statusChangeReason/0004", "طلب النيابة العامة"),
            Map.entry("statusChangeReason/0005", "مراجعة الالتزام"),
            Map.entry("statusChangeReason/0006", "قواعد الركود"),
            Map.entry("statusChangeReason/0007", "انتهاء الهوية"),
            Map.entry("samaStatus/00", "مفتوح"),
            Map.entry("samaStatus/01", "غير نشط"),
            Map.entry("samaStatus/02", "غير متحرك"),
            Map.entry("samaStatus/03", "غير مطالب به"),
            Map.entry("accStatus/02", "غير متحرك"),
            Map.entry("accStatus/03", "حساب موقوف"),
            Map.entry("accStatus/04", "ممنوع السحب"),
            // As frmAcctStatusHistory renders it in the Arabic capture:
            // "08-استفسارات ممنوعة", not a literal "enquiry restricted".
            Map.entry("accStatus/08", "استفسارات ممنوعة"),
            Map.entry("stmtFreq/01", "غير آلي"),
            Map.entry("stmtFreq/02", "يومي"),
            Map.entry("stmtFreq/03", "أسبوعي"),
            Map.entry("stmtFreq/04", "شهري"),
            Map.entry("stmtFreq/05", "ربع سنوي"),
            Map.entry("stmtFreq/06", "نصف سنوي"),
            Map.entry("stmtFreq/07", "سنوي"),
            Map.entry("intApplication/0", "إضافة للرصيد"),
            Map.entry("intApplication/1", "تحويل لحساب آخر"),
            Map.entry("intApplication/2", "صرف بشيك"),
            Map.entry("intApplication/3", "فائدة تذكيرية فقط"));

    /** The English map with every description swapped for its Arabic, once. */
    private static final Map<String, List<CodeEntry>> CODES_AR = CODES.entrySet().stream()
            .collect(Collectors.toUnmodifiableMap(Map.Entry::getKey, set -> set.getValue().stream()
                    .map(entry -> new CodeEntry(entry.code(),
                            ARABIC.getOrDefault(set.getKey() + "/" + entry.code(),
                                    entry.description())))
                    .toList()));

    @Override
    public Map<String, List<CodeEntry>> codes(UiLanguage language) {
        return language == UiLanguage.ARABIC ? CODES_AR : CODES;
    }
}
