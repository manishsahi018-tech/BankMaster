package com.banksystem.api.domain.model;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

/**
 * stcusttab.documentsSupplied is a 60-char field holding 3-char document codes
 * back to back, space-padded — the same packing the legacy writes on OK
 * ({@code documentsSelected & Space(60 - Len(documentsSelected))},
 * frmDocuments.frm:266-268) and walks on load (:380-382).
 */
class EssentialDocumentsTest {

    @Test
    void splitsThreeCharCodesAndStopsAtThePadding() {
        assertThat(EssentialDocuments.splitCodes("001002008025" + " ".repeat(48)))
                .containsExactly("001", "002", "008", "025");
    }

    @Test
    void stopsAtTheFirstBlankTripletRatherThanSkippingIt() {
        // The legacy's loop exits on a blank code, so anything past a gap is
        // padding that happens to be followed by bytes, not another document.
        assertThat(EssentialDocuments.splitCodes("001   008"))
                .containsExactly("001");
    }

    @Test
    void emptyAndNullYieldNoCodes() {
        assertThat(EssentialDocuments.splitCodes(null)).isEmpty();
        assertThat(EssentialDocuments.splitCodes(" ".repeat(60))).isEmpty();
    }

    @Test
    void ignoresATrailingPartialTriplet() {
        // A short/ragged value must not produce a truncated code.
        assertThat(EssentialDocuments.splitCodes("00100")).containsExactly("001");
    }
}
