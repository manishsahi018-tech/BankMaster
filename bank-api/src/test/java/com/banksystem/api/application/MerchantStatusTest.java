package com.banksystem.api.application;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import com.banksystem.api.domain.model.MerchantStatementPage;
import com.banksystem.api.domain.repository.MerchantRepository;
import java.util.List;
import org.junit.jupiter.api.Test;

/**
 * The merchant server owns its own error wording, which is the opposite of the
 * online gateway: there a numeric code arrives and the client maps it to a
 * message of ours, here the sentence itself comes down the wire in Arabic and
 * English and the caller only chooses between them
 * (frmMerchantStmt.frm:421-428).
 *
 * <p>That distinction is worth a test because the tempting shortcut — a tidy
 * message of our own keyed off the status code — reads like an improvement and
 * would throw away the only account anyone gets of why the acquiring system
 * refused.
 */
class MerchantStatusTest {

    private static final String MERCHANT = "123456789012";

    /** A merchant number the screen's own validation accepts, so only the status decides. */
    private static final String VALID_FROM = "20090201";
    private static final String VALID_TO = "20090331";

    private MerchantService serviceReturning(MerchantStatementPage page) {
        MerchantRepository repo = (merchantNo, stmtType, fromDate, toDate, lastTransPtr) -> page;
        return new MerchantService(repo);
    }

    private static MerchantStatementPage refused(String status, String arabic, String english) {
        return new MerchantStatementPage(status, arabic, english, MERCHANT,
                List.of(), "00000", "1");
    }

    @Test
    void aSuccessfulPagePassesThrough() {
        MerchantStatementPage page = new MerchantStatementPage(
                MerchantStatementPage.SUCCESS, "", "", MERCHANT,
                List.of("TERMINAL 004512   250.00"), "00001", "1");

        assertThat(serviceReturning(page).statement(MERCHANT, "0", VALID_FROM, VALID_TO, "00000"))
                .isSameAs(page);
    }

    @Test
    void aRefusalSurfacesTheServersOwnSentence() {
        assertThatThrownBy(() -> serviceReturning(
                refused("012", "غير مسجل", "Merchant is not registered in the acquiring system"))
                .statement(MERCHANT, "0", VALID_FROM, VALID_TO, "00000"))
                .isInstanceOf(BadRequestException.class)
                .as("not a message of ours keyed off '012' — the server said why")
                .hasMessage("Merchant is not registered in the acquiring system");
    }

    @Test
    void aRefusalWithNoEnglishFallsBackToTheArabic() {
        assertThatThrownBy(() -> serviceReturning(refused("012", "غير مسجل", "  "))
                .statement(MERCHANT, "0", VALID_FROM, VALID_TO, "00000"))
                .isInstanceOf(BadRequestException.class)
                .as("half a remark still beats none of it")
                .hasMessage("غير مسجل");
    }

    @Test
    void aRefusalWithNoRemarksAtAllNamesTheCode() {
        assertThatThrownBy(() -> serviceReturning(refused("012", "", ""))
                .statement(MERCHANT, "0", VALID_FROM, VALID_TO, "00000"))
                .isInstanceOf(BadRequestException.class)
                .as("naming the code is honest about knowing nothing; inventing a reason is not")
                .hasMessageContaining("012");
    }

    @Test
    void onlyTripleZeroCountsAsSuccess() {
        assertThat(new MerchantStatementPage("000", "", "", MERCHANT, List.of(), "0", "1")
                .isSuccess()).isTrue();
        assertThat(new MerchantStatementPage("0", "", "", MERCHANT, List.of(), "0", "1")
                .isSuccess())
                .as("the field is 3 characters wide on the wire; '0' is not the success value")
                .isFalse();
    }
}
