package com.banksystem.api.application;

import static org.assertj.core.api.Assertions.assertThat;

import com.banksystem.api.domain.model.AccountSummary;
import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.repository.AccountRepository;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assumptions;

/**
 * The per-row balance-enquiry restriction, pinned against cbbranch2.c:5867-5888.
 *
 * <pre>
 *   balEnqRestricted = '0'                                       // :5867
 *   if (strncmp(&tAccNo[5], "0002000", 7) > 0) {                 // :5868
 *       getRestrictedFlag(gldRec.branchCode);   // failure IGNORED  :5870-5873
 *       if (ctlRec.balEnqRestrictedFlag == '1') {                // :5875
 *           if (strstr(tmpAuthLevel, "~86") != NULL)             // :5877
 *               balEnqRestricted = branch in allowed list ? '0' : '1';
 *           else
 *               balEnqRestricted = '1';                          // :5886
 *       }
 *   }
 * </pre>
 *
 * The inversion is the trap: ~86 GRANTS branch-scoped access. Without it the
 * operator is restricted outright on any branch whose flag is set.
 *
 * <p>The whole class is SKIPPED while {@link EnquiryRestrictions#ENABLED} is
 * off, because there is then no restriction to observe — every row comes back
 * unrestricted by design. The cases stay written so that turning the switch
 * back on re-pins the rule against the C in the same breath.
 */
class BalEnqRestrictionTest {

    @BeforeEach
    void onlyMeaningfulWhileRestrictionsAreOn() {
        Assumptions.assumeTrue(EnquiryRestrictions.ENABLED,
                "EnquiryRestrictions.ENABLED is off - no balance-enquiry restriction is applied");
    }

    /** accNo layout CCMMM NNNNNNN SS — the customer sits at [5..11]. */
    private static AccountSummary account(String custNo, String branch) {
        return new AccountSummary("01008" + custNo + "03", "1.00", "1.00", "0.00",
                "00-Open", "0", "0", branch, "0");
    }

    private static AccountService service(Map<String, String> branchFlags, List<String> allowed) {
        AccountRepository repo = new StubRepository(branchFlags, allowed);
        return new AccountService(repo);
    }

    private static String restrictionOf(AccountService svc, String custNo, String branch, EnquiryUser user) {
        return svc.accountsForCustomer(custNo, 0, user).rows().get(0).balEnqRestricted();
    }

    @Test
    @DisplayName("no ~86 + restricted branch -> restricted (:5886)")
    void noAuthorityIsRestricted() {
        AccountService svc = service(Map.of("0127", "1"), List.of());
        assertThat(restrictionOf(svc, "0783945", "0127", new EnquiryUser("OPER1", "~60~61"))).isEqualTo("1");
    }

    @Test
    @DisplayName("~86 + branch in the allowed list -> allowed (:5881)")
    void authorityWithAllowedBranch() {
        AccountService svc = service(Map.of("0127", "1"), List.of("0127", "0001"));
        assertThat(restrictionOf(svc, "0783945", "0127", new EnquiryUser("U1", "~86"))).isEqualTo("0");
    }

    @Test
    @DisplayName("~86 + branch NOT in the allowed list -> restricted (:5883)")
    void authorityWithoutThatBranch() {
        AccountService svc = service(Map.of("0127", "1"), List.of("0001"));
        assertThat(restrictionOf(svc, "0783945", "0127", new EnquiryUser("U1", "~86"))).isEqualTo("1");
    }

    @Test
    @DisplayName("branch flag not set -> never restricted, whatever the authority (:5875)")
    void branchNotFlagged() {
        AccountService svc = service(Map.of("0127", "0"), List.of());
        assertThat(restrictionOf(svc, "0783945", "0127", new EnquiryUser("OPER1", "~60"))).isEqualTo("0");
    }

    @Test
    @DisplayName("missing branch row -> not restricted; the C ignores the failure (:5872)")
    void missingBranchRow() {
        AccountService svc = service(Map.of(), List.of());
        assertThat(restrictionOf(svc, "0783945", "0127", new EnquiryUser("OPER1", "~60"))).isEqualTo("0");
    }

    @Test
    @DisplayName("customer <= 0002000 -> the rule never runs (:5868)")
    void lowCustomerNumbersExempt() {
        AccountService svc = service(Map.of("0127", "1"), List.of());
        // 0002000 itself is not > 0002000
        assertThat(restrictionOf(svc, "0002000", "0127", new EnquiryUser("OPER1", "~60"))).isEqualTo("0");
        assertThat(restrictionOf(svc, "0001999", "0127", new EnquiryUser("OPER1", "~60"))).isEqualTo("0");
        // one above the threshold and the rule bites
        assertThat(restrictionOf(svc, "0002001", "0127", new EnquiryUser("OPER1", "~60"))).isEqualTo("1");
    }

    @Test
    @DisplayName("stusrbrn is only read under ~86 (:5791)")
    void allowedBranchesNotReadWithoutAuthority() {
        StubRepository repo = new StubRepository(Map.of("0127", "1"), List.of("0127"));
        AccountService svc = new AccountService(repo);
        svc.accountsForCustomer("0783945", 0, new EnquiryUser("OPER1", "~60"));
        assertThat(repo.allowedBranchesReads).isZero();
        svc.accountsForCustomer("0783945", 0, new EnquiryUser("U1", "~86"));
        assertThat(repo.allowedBranchesReads).isEqualTo(1);
    }

    /** Minimal stub: only the three methods the rule touches. */
    private static final class StubRepository implements AccountRepository {
        private final Map<String, String> flags;
        private final List<String> allowed;
        int allowedBranchesReads;

        StubRepository(Map<String, String> flags, List<String> allowed) {
            this.flags = flags;
            this.allowed = allowed;
        }

        @Override
        public List<AccountSummary> accountsForCustomer(String custNo) {
            return List.of(account(custNo, "0127"));
        }

        @Override
        public String branchBalEnqRestrictedFlag(String branchCode) {
            return flags.getOrDefault(branchCode, "");
        }

        @Override
        public List<String> enquiryAllowedBranches(String userId) {
            allowedBranchesReads++;
            return allowed;
        }

        @Override
        public java.util.Optional<AccountSummary> accountByNumber(String accNo) {
            return java.util.Optional.empty();
        }

        // --- not exercised here ---
        @Override
        public List<com.banksystem.api.domain.model.AcctUpdateHistoryEntry> updateHistory(String a) {
            return List.of();
        }

        @Override
        public List<com.banksystem.api.domain.model.ChequeBookRequest> chequeBookRequests(String a) {
            return List.of();
        }

        @Override
        public List<com.banksystem.api.domain.model.StandingOrder> standingOrders(String a) {
            return List.of();
        }

        @Override
        public List<com.banksystem.api.domain.model.StopCheque> stopCheques(String a) {
            return List.of();
        }

        @Override
        public List<com.banksystem.api.domain.model.SamaStatusEntry> samaStatusHistory(String a) {
            return List.of();
        }

        @Override
        public List<com.banksystem.api.domain.model.SamaStatusEntry> statusHistory(String a) {
            return List.of();
        }

        @Override
        public Map<String, String> snapshot(String a, String d) {
            return Map.of();
        }

        @Override
        public Map<String, String> accountDetail(String a) {
            return Map.of();
        }

        @Override
        public java.util.Optional<com.banksystem.api.domain.model.StopChequeDetail> stopChequeDetail(
                String a, String c) {
            return java.util.Optional.empty();
        }

        @Override
        public java.util.Optional<com.banksystem.api.domain.model.StandingOrderDetail> standingOrderDetail(
                String a, String s) {
            return java.util.Optional.empty();
        }

        @Override
        public java.util.Optional<com.banksystem.api.domain.model.ChequeBookHistory> chequeBookHistory(
                String a, String r) {
            return java.util.Optional.empty();
        }

        @Override
        public com.banksystem.api.domain.model.BlockedAmountBreakup blockedAmountBreakup(String a) {
            return null;
        }
    }
}
