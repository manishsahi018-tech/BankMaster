package com.banksystem.api.application;

import com.banksystem.api.domain.model.EnquiryUser;
import com.banksystem.api.domain.model.HistoricalStatement;
import com.banksystem.api.domain.repository.AccountRepository;
import com.banksystem.api.domain.repository.StatementRepository;
import java.util.List;
import java.util.Locale;
import org.springframework.stereotype.Service;

/**
 * Historical Statement use case — legacy frmHistStmt, reached from the
 * frmAccount cmdHistStmt button.
 *
 * <p>Everything the legacy checked before it would extract anything is
 * reproduced here, in its order. The row-level gates that ran BEFORE the form
 * opened (dormant, enquiry-restricted, password flag) belong to the account
 * grid and stay on the client with the rest of frmAccount's row checks —
 * AccountInfo.tsx already applies the balance-enquiry restriction to every row
 * action. What lands here is cmdGenerate_Click's own validation plus the one
 * authorisation rule that needs the caller's identity.
 */
@Service
public class StatementService {

    /** The staff branch. Hard-coded in the legacy too (frmHistStmt.frm:783). */
    private static final String STAFF_BRANCH = "0175";

    /** The two archives the screen's System selector offers. */
    private static final String BM = "BM";
    private static final String PDP = "PDP";

    /**
     * Legacy message text, from the inline comments beside each MsgBox in
     * frmHistStmt.frm — the errXxx(UserLang) string table is not in the source
     * dump, so those comments are the only record of the wording.
     */
    private static final String ERR_BRANCH_CODE =
            "Branch Code should be 4 characters..Please enter it again";
    private static final String ERR_ACCOUNT =
            "Account number cannot be spaces...Please enter it...";
    private static final String ERR_FROM_YEAR =
            "From year cannot be blank...please enter it ..";
    private static final String ERR_FROM_MONTH =
            "From month cannot be blank..please enter it...";
    private static final String ERR_TO_YEAR = "To Date cannot be blank...please enter it ..";
    private static final String ERR_TO_MONTH = "To month cannot be blank..please enter it...";
    private static final String ERR_STAFF_BRANCH =
            "Not authorized to print the statement for the staff branch";

    /**
     * Not a legacy message — the System selector is new, so there is no MsgBox
     * to transcribe. Worded the same way as the ones that are.
     */
    private static final String ERR_SYSTEM = "System must be BM or PDP..please select it...";

    /**
     * errHistStmtNotAllowed (globalVaribles.bas:7358), verbatim — the legacy
     * spells out why the refusal is not a permission problem.
     */
    private static final String ERR_ACCOUNT_STILL_EXISTS =
            "9031-Account number exists in Bankmaster; This option is avaiable to generate "
                    + "historical statements for deleted accounts; hence, the historical "
                    + "statements cannot be produced through this route";

    private final StatementRepository statements;
    private final AccountRepository accounts;

    public StatementService(StatementRepository statements, AccountRepository accounts) {
        this.statements = statements;
        this.accounts = accounts;
    }

    /**
     * @param branchCode     the account's GL branch, which the legacy copies from
     *                       the grid into txtBranchCode (frmAccount.frm:853).
     *                       Validated here and used for the staff-branch rule
     *                       below; it also FILTERS the PDP header query, and
     *                       only that one — see {@code JdbcStatementRepository}.
     * @param fromYearMonth  YYYYMM inclusive
     * @param toYearMonth    YYYYMM inclusive
     * @param system         which archive to read: {@code "BM"} or {@code "PDP"},
     *                       the two header/detail table pairs DB #3 holds. The
     *                       legacy had no such control — it read one Btrieve
     *                       index tree and there was nothing to choose between —
     *                       so this is a NEW input, added because the relational
     *                       archive holds both systems and only the operator
     *                       knows which one the enquiry is about. Exactly one is
     *                       read; blank defaults to BM.
     * @param deletedAccount the DELETED-ACCOUNT route — the legacy's
     *                       {@code frmHistStmt.tag = "D"}, opened from the search
     *                       screen rather than the account grid
     *                       (frmCustomerSearch.frm:1177). It differs in exactly
     *                       two ways, both handled below: the account must NOT
     *                       still exist, and the staff-branch rule is skipped.
     */
    public List<HistoricalStatement> historicalStatements(
            String accNo, String branchCode, String fromYearMonth, String toYearMonth,
            String system, boolean deletedAccount, EnquiryUser caller) {

        String branch = trim(branchCode);
        String account = trim(accNo);

        // cmdGenerate_Click (:686) checks branch code first, then the account,
        // then the four date parts — keep the order so the operator gets the
        // same message the legacy would have shown for the same input.
        if (branch.length() != 4) {
            throw new BadRequestException(ERR_BRANCH_CODE);
        }
        if (account.isEmpty()) {
            throw new BadRequestException(ERR_ACCOUNT);
        }
        requireYearMonth(fromYearMonth, ERR_FROM_YEAR, ERR_FROM_MONTH);
        requireYearMonth(toYearMonth, ERR_TO_YEAR, ERR_TO_MONTH);

        if (deletedAccount) {
            // frmHistStmt.frm:730-751 — the route sends service 21 for the typed
            // account and refuses if it comes back with ANY rows. The point is
            // not permission: an account that still exists has a live statement
            // path through the account grid, and this route exists only for ones
            // that no longer do.
            if (accounts.accountByNumber(account).isPresent()) {
                throw new BadRequestException(ERR_ACCOUNT_STILL_EXISTS);
            }
        } else if (STAFF_BRANCH.equals(branch) && !STAFF_BRANCH.equals(caller.branchCode())) {
            // frmHistStmt.frm:782 guards this with `tag <> "D"` — the staff-branch
            // rule keys on the account's branch as the GRID reported it, and the
            // deleted-account route has no grid row to have reported one.
            throw new BadRequestException(ERR_STAFF_BRANCH);
        }

        // A backwards range would silently return nothing: generateReport's
        // `For i = fromDate To toDate` simply never enters the loop. Saying so
        // is more useful than an empty result the operator has to interpret.
        if (trim(fromYearMonth).compareTo(trim(toYearMonth)) > 0) {
            throw new BadRequestException("From Date cannot be later than To Date");
        }

        // Checked last, after every legacy rule, so that adding an input the
        // legacy never had cannot change which message the legacy inputs
        // produce for the same form.
        return statements.historicalStatements(
                account, branch, trim(fromYearMonth), trim(toYearMonth), archiveOf(system));
    }

    /**
     * The System selector, normalised. Only the two archives DB #3 actually
     * holds are accepted — anything else would reach the repository, find no
     * table pair under that name and come back as "not configured", which reads
     * as a deployment fault rather than a bad request.
     */
    private static String archiveOf(String system) {
        String value = trim(system).toUpperCase(Locale.ROOT);
        if (value.isEmpty()) {
            return BM;
        }
        if (!BM.equals(value) && !PDP.equals(value)) {
            throw new BadRequestException(ERR_SYSTEM);
        }
        return value;
    }

    /**
     * The legacy validates year and month as two separate controls with two
     * separate messages, so a YYYYMM argument is split back apart to report the
     * same way rather than collapsing both into one "invalid date".
     */
    private static void requireYearMonth(String yearMonth, String yearMessage, String monthMessage) {
        String value = trim(yearMonth);
        if (value.length() < 4 || !isDigits(value.substring(0, 4)) || value.startsWith("0000")) {
            throw new BadRequestException(yearMessage);
        }
        if (value.length() != 6 || !isDigits(value.substring(4, 6))) {
            throw new BadRequestException(monthMessage);
        }
        int month = Integer.parseInt(value.substring(4, 6));
        if (month < 1 || month > 12) {
            // cmbFromMonth_Change / cmbToMonth_Change (:457, :482) — the one
            // message the legacy did NOT put through the language table.
            throw new BadRequestException("Enter a valid Date");
        }
    }

    private static boolean isDigits(String value) {
        return value.chars().allMatch(Character::isDigit);
    }

    private static String trim(String value) {
        return value == null ? "" : value.trim();
    }
}
