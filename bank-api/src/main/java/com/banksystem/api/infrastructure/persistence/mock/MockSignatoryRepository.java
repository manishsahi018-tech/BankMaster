package com.banksystem.api.infrastructure.persistence.mock;

import com.banksystem.api.domain.model.SignatoryDetail;
import com.banksystem.api.domain.model.SignatorySummary;
import com.banksystem.api.domain.repository.SignatoryRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Account signatories, derived per account. Company accounts carry several
 * (the authorised signatory panel); personal accounts carry the holder and
 * sometimes one more.
 */
@Profile("!denodo")
@Repository
public class MockSignatoryRepository implements SignatoryRepository {

    private static final List<String> ARABIC_NAMES = List.of(
            "كاظم حسين سعيد عبدالوهاب", "عبدالرحمن ناصر النور", "هند فهد القحطاني",
            "ماجد سلطان الحربي", "بدر خالد العنزي", "منى راشد الغامدي",
            "طارق يوسف البقمي", "لطيفة عبدالعزيز الزهراني");

    private static final List<String> ENGLISH_NAMES = List.of(
            "Ahmed K. Al-Otaibi", "Faisal S. Al-Harbi", "Yousef M. Bin Salem",
            "Omar T. Baeshen", "Nabil W. Kassem", "Reem A. Al-Faisal",
            "Hassan D. Al-Yami", "Layla H. Al-Amoudi");

    private static List<SignatorySummary> forAccount(String accNo) {
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        int count = c.juristic()
                ? 2 + DemoData.pick(accNo, 90, 4)   // 2-5 on a company panel
                : 1 + DemoData.pick(accNo, 90, 2);  // 1-2 on a personal account
        List<SignatorySummary> rows = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            String key = accNo + "sig" + i;
            boolean arabic = DemoData.pick(key, 1, 3) != 0;
            // The first signatory on a personal account is the holder.
            boolean holder = !c.juristic() && i == 0;
            String name = holder
                    ? c.shortName()
                    : DemoData.pick(key, 2, arabic ? ARABIC_NAMES : ENGLISH_NAMES);
            String idType = holder ? c.idType() : (arabic ? "I" : "Q");
            String idNo = holder
                    ? c.idNo()
                    : String.valueOf(1000000000L + DemoData.seed(key, 3) % 899999999L);
            rows.add(new SignatorySummary(accNo, String.format("%04d", i + 1),
                    idType, idNo, c.branchCode(), name));
        }
        return List.copyOf(rows);
    }

    @Override
    public List<SignatorySummary> byCustomer(String custNo) {
        DemoData.Customer c = DemoData.customer(custNo);
        List<SignatorySummary> rows = new ArrayList<>();
        for (String accNo : c.accountNumbers()) {
            rows.addAll(forAccount(accNo));
        }
        return List.copyOf(rows);
    }

    @Override
    public List<SignatorySummary> byAccount(String accNo) {
        return forAccount(accNo);
    }

    @Override
    public Optional<SignatoryDetail> detail(String accNo, String signatoryNo) {
        DemoData.Customer c = DemoData.customerForAccount(accNo);
        return forAccount(accNo).stream()
                .filter(s -> s.signatoryNo().equals(signatoryNo))
                .findFirst()
                .map(s -> {
                    String key = accNo + signatoryNo;
                    // ID issued 5-25 years ago, valid for ten years from issue.
                    int issuedDaysAgo = 1800 + DemoData.pick(key, 1, 7300);
                    int expiryDaysAgo = issuedDaysAgo - 3650;
                    return new SignatoryDetail(s.accNo(), s.signatoryNo(), s.branchCode(),
                            s.idType(), s.idNo(), "0", c.city(),
                            hijri(issuedDaysAgo), DemoData.dateBack(issuedDaysAgo),
                            hijri(expiryDaysAgo), DemoData.dateBack(expiryDaysAgo),
                            s.signatoryShortName(),
                            // The panel's name grid and signature state.
                            "فهد", "عبدالعزيز", "", "الدوسري", s.signatoryShortName(),
                            "Fahad", "Abdulaziz", "", "Al-Dosari", s.signatoryShortName(),
                            DemoData.pick(key, 2, 5) == 0 ? "0" : "1",
                            DemoData.pick(key, 2, 5) == 0 ? "Signature card not renewed" : "",
                            DemoData.dateBack(expiryDaysAgo), "");
                });
    }

    /**
     * Approximate Hijri form of a Gregorian date N days ago. The archival
     * records carry both; for a demo an arithmetic conversion (354.367-day year
     * from the 622-07-16 epoch) looks right on screen, and it is never used for
     * anything but display. A real implementation reads the stored Hijri field.
     */
    private static String hijri(int daysAgo) {
        java.time.LocalDate g = java.time.LocalDate.now().minusDays(Math.max(0, daysAgo));
        long since = java.time.temporal.ChronoUnit.DAYS
                .between(java.time.LocalDate.of(622, 7, 16), g);
        double years = since / 354.367;
        double frac = years - (int) years;
        int hy = (int) years + 1;
        int hm = Math.min(12, (int) (frac * 12) + 1);
        int hd = Math.min(29, (int) (((frac * 12) % 1) * 29) + 1);
        return String.format("%04d%02d%02d", hy, hm, hd);
    }
}
