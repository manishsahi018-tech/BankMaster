package com.banksystem.api.application;

import com.banksystem.api.domain.model.MerchantStatementPage;
import com.banksystem.api.domain.repository.MerchantRepository;
import org.springframework.stereotype.Service;

/**
 * Merchant statement use case — legacy frmMerchantStmt, authority ~81
 * (QUERY-SPECS.md §21).
 */
@Service
public class MerchantService {

    private final MerchantRepository merchants;

    public MerchantService(MerchantRepository merchants) {
        this.merchants = merchants;
    }

    /**
     * Validates as the legacy screen does before it will send anything, then
     * returns one page. The length rules are deliberately asymmetric and are
     * reproduced from cmdGenerate_Click (frmMerchantStmt.frm:322):
     * itemwise takes 12 or 16 digits, or "S1" plus six; chain and outlet take
     * 16; groupwise is unchecked.
     */
    public MerchantStatementPage statement(String merchantNo, String stmtType,
                                           String fromDate, String toDate, String lastTransPtr) {
        String merchant = merchantNo == null ? "" : merchantNo.trim();
        if (merchant.isEmpty()) {
            throw new BadRequestException("Account Number cannot be empty..Please enter");
        }
        if (!isValidDate(fromDate) || !isValidDate(toDate)) {
            throw new BadRequestException("From Date is blank or Incomplete From Date");
        }
        String type = stmtType == null || stmtType.isBlank() ? "0" : stmtType.trim();
        if (!isValidMerchantNo(merchant, type)) {
            throw new BadRequestException("Invalid Merchant no.. Please check and correct....");
        }
        return merchants.statement(merchant, type, fromDate.trim(), toDate.trim(),
                lastTransPtr == null || lastTransPtr.isBlank() ? "00000" : lastTransPtr.trim());
    }

    private static boolean isValidMerchantNo(String merchantNo, String stmtType) {
        return switch (stmtType) {
            case "0" -> {
                if (Character.isDigit(merchantNo.charAt(0))) {
                    yield merchantNo.length() == 12 || merchantNo.length() == 16;
                }
                if (merchantNo.length() >= 2
                        && "S1".equalsIgnoreCase(merchantNo.substring(0, 2))) {
                    yield merchantNo.length() == 8;
                }
                // Any other non-numeric prefix is unchecked in the legacy.
                yield true;
            }
            case "2", "3" -> merchantNo.length() == 16;
            // Groupwise has no length check at all.
            default -> true;
        };
    }

    private static boolean isValidDate(String yyyymmdd) {
        if (yyyymmdd == null || yyyymmdd.trim().length() != 8) {
            return false;
        }
        try {
            java.time.LocalDate.parse(yyyymmdd.trim(),
                    java.time.format.DateTimeFormatter.BASIC_ISO_DATE);
            return true;
        } catch (RuntimeException e) {
            return false;
        }
    }
}
