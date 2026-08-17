package com.banksystem.api.application;

import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.model.OnlineStatementPage;
import com.banksystem.api.domain.repository.OnlineEnquiryRepository;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import org.springframework.stereotype.Service;

/**
 * The two online-gateway enquiries — On-demand Statement (legacy frmInputform /
 * OnlineStmt.frm, service 07) and Transaction Inquiry (frmTransaction.frm,
 * service 11).
 *
 * <p>Both validate identically to their legacy forms before anything goes on
 * the wire, and both apply the gateway's own reply checks afterwards. The
 * restricted-branch rules are deliberately applied HERE rather than on the
 * client: they key on the branch in the REPLY, not on the account grid row, so
 * they can only be enforced once the answer is back — and enforcing them in the
 * browser would mean shipping the restricted statement to it first.
 */
@Service
public class OnlineEnquiryService {

    /** Staff branch — statements and transactions are visible only from itself. */
    private static final String STAFF_BRANCH = "0175";
    /** A second restricted branch the statement screen alone checks. */
    private static final String RESTRICTED_STMT_BRANCH = "0176";

    // Legacy message text, from the inline comments beside each MsgBox.
    private static final String ERR_EMPTY_ACC = "Account Number cannot be empty..Please enter";
    private static final String ERR_FROM_DATE = "From Date is blank or Incomplete From Date";
    private static final String ERR_TO_DATE = "To_Date is blank or Incomplete To Date";
    private static final String ERR_STAFF_ACC_STMT =
            "You are not authorised to view STAFF ACCOUNT'S Statement";
    private static final String ERR_STAFF_ACC_TRANS =
            "You are not authorised to view STAFF ACCOUNT'S transaction details";
    private static final String ERR_STMT_RESTRICTED_BRANCH =
            "Statement for this branch is restricted";

    private final OnlineEnquiryRepository gateway;

    public OnlineEnquiryService(OnlineEnquiryRepository gateway) {
        this.gateway = gateway;
    }

    /** cmdPrintStmt_Click (OnlineStmt.frm:551) — both dates are day-granular. */
    public OnlineStatementPage onDemandStatement(
            String accNo, String fromDate, String toDate, String lastTransPtr,
            EnquiryUser caller) {
        String account = trim(accNo);
        if (account.isEmpty()) {
            throw new BadRequestException(ERR_EMPTY_ACC);
        }
        if (!isValidDate(fromDate)) {
            throw new BadRequestException(ERR_FROM_DATE);
        }
        if (!isValidDate(toDate)) {
            throw new BadRequestException(ERR_TO_DATE);
        }
        OnlineStatementPage page = gateway.onDemandStatement(
                account, trim(fromDate), trim(toDate), pointer(lastTransPtr));
        checkStatus(page);
        // OnlineStmt.frm:677-690 — two restricted branches, in this order.
        requireOwnBranch(page, caller, STAFF_BRANCH, ERR_STAFF_ACC_STMT);
        requireOwnBranch(page, caller, RESTRICTED_STMT_BRANCH, ERR_STMT_RESTRICTED_BRANCH);
        return page;
    }

    /**
     * cmdGo_Click (frmTransaction.frm:340).
     *
     * <p>The two starting points are mutually exclusive and the legacy enforces
     * it by CLEARING the date controls the moment a start transaction number is
     * typed (:343-347). Reproduced by ignoring the date when a start
     * transaction is given, rather than by rejecting the combination — the
     * legacy never shows an error for it, it just silently wins.
     *
     * @param startTrans optional 1-based transaction number to start at
     */
    public OnlineStatementPage transactionEnquiry(
            String accNo, String fromDate, String startTrans, String lastTransPtr,
            EnquiryUser caller) {
        String account = trim(accNo);
        if (account.isEmpty()) {
            throw new BadRequestException(ERR_EMPTY_ACC);
        }

        String pointer = pointer(lastTransPtr);
        String from = trim(fromDate);
        int start = parsePositive(startTrans);
        if (start > 0) {
            from = "";
            // :371-375 — seeded with the number MINUS ONE, so the numbered
            // transaction is the first one returned rather than the one after.
            if ("00000".equals(pointer)) {
                pointer = pad5(start - 1);
            }
        } else if (!isValidDate(from)) {
            // errInvalidDate — the legacy's single message for a blank or
            // malformed start date once no transaction number was given.
            throw new BadRequestException("Start Date is blank or Incomplete");
        }

        OnlineStatementPage page = gateway.transactionEnquiry(account, from, pointer);
        checkStatus(page);
        // frmTransaction.frm:410-413 — statement wording differs from the above.
        requireOwnBranch(page, caller, STAFF_BRANCH, ERR_STAFF_ACC_TRANS);
        return page;
    }

    /**
     * The gateway's reply codes, mapped to the legacy's own messages
     * (OnlineStmt.frm:662-674, frmTransaction.frm:394-408 — identical sets).
     * "00" and "01" are both success; everything else stops the enquiry.
     */
    private static void checkStatus(OnlineStatementPage page) {
        String status = page.responseStatus() == null ? "" : page.responseStatus().trim();
        if ("00".equals(status) || "01".equals(status)) {
            return;
        }
        throw new BadRequestException(switch (status) {
            case "03" -> "Incorrect Message sent..Check the Account Number and Dates";
            case "05" -> "Given Main Account is incorrect...Please Check";
            case "06" -> "Given contra Account is incorrect..Please Check";
            case "08" -> "Restricted Account.. Please Check..";
            case "12" -> "Communication Error occured..Try Again..";
            default -> "Error " + status + " occurred during communication";
        });
    }

    /** A restricted branch's records are visible only to that branch's operators. */
    private static void requireOwnBranch(
            OnlineStatementPage page, EnquiryUser caller, String branch, String message) {
        if (branch.equals(trim(page.branchCode())) && !branch.equals(trim(caller.branchCode()))) {
            throw new BadRequestException(message);
        }
    }

    private static boolean isValidDate(String yyyymmdd) {
        String value = trim(yyyymmdd);
        if (value.length() != 8) {
            return false;
        }
        try {
            LocalDate.parse(value, DateTimeFormatter.BASIC_ISO_DATE);
            return true;
        } catch (RuntimeException e) {
            return false;
        }
    }

    private static String pointer(String lastTransPtr) {
        String value = trim(lastTransPtr);
        return value.isEmpty() ? "00000" : value;
    }

    private static int parsePositive(String value) {
        try {
            return Math.max(0, Integer.parseInt(trim(value)));
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static String pad5(int value) {
        return String.format("%05d", value);
    }

    private static String trim(String value) {
        return value == null ? "" : value.trim();
    }
}
