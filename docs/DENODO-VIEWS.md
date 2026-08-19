# Denodo views required for the enquiry app

Every table below is referenced by a `FROM`/`JOIN` in `bank-api` under the
`denodo` profile. Extracted from
`bank-api/src/main/java/com/banksystem/api/infrastructure/persistence/jdbc/Jdbc*Repository.java`.

**39 views total** — 30 on the BM archival schema, 9 on the online/Finacle side.

## Availability (confirmed against Cloudera/Denodo, 2026-07-28; `crd0data` added 2026-08-19)

**36 of the 39 exist. Three do not:**

| Missing view | Screen impact | Severity |
|---|---|---|
| `bkd0data` | Blocked Amount Breakup loses source 3 (`O` — other BM blocking) | degrades |
| `ccarrblk` | Blocked Amount Breakup loses source 4 (`M`/`C` — credit-card arrear blocks) | degrades |
| `stswiftlog` | Transfer Detail's pending-SWIFT-amendment guard never fires | degrades |

None of the three breaks a screen. All are read inside their own try/catch
and fail to a warn log — see `JdbcAccountRepository.blockedSource` and
`JdbcTransferRepository.hasPendingSwiftUpdate`. The one user-visible symptom is
on Blocked Amount Breakup: the "Total Blocked Balance" tile comes from the
`gld0data` header and is independent of the detail rows, so for an account
carrying an `O` or credit-card block the total will exceed the sum of the rows
shown, with nothing on screen explaining the difference.

**`crd0data` is required, not optional** (added to this list 2026-08-19). It
supplies the customer name, address and language on the two cbrt01 enquiries,
and the stcusttab-miss name fallback on Transfer Detail and Transaction Detail.
Nothing degrades around it: `JdbcOnlineEnquiryRepository` queries it FIRST and
throws `NotAvailableException` (HTTP 501) if it cannot be read, before a single
transaction is fetched, because on a banking enquiry a nameless customer header
is worse than no screen. A missing crd0data ROW is a different case and stays
the legacy's answer for it (status "05", NOMAINACC).

Two lookalikes exist in Denodo and must **not** be substituted:
`stsodlog` is the standing-order audit log, not `sod0data` (the order master);
`thd0data1` is the recType 2/3 rate-change family, not `thd0data` (the recType
0/1 posting header) — see `JdbcTransferRepository.java:258-259`.

## Naming

The repositories use the bare legacy names (`stcusttab`, `gld0data`, …).
`SqlTablePrefixer` prepends an environment prefix at runtime, configured by
`bank.archival-db.table-prefix` (staging default
`bv_impala_stg_bankmaster_`). So the view to create in staging is
`bv_impala_stg_bankmaster_stcusttab`, etc. Only the prefix changes between
environments — no SQL changes.

All views are **read-only**; the pool is `read-only: true`.

---

## DB #1 — BM archival schema (`archivalJdbc`)

### Customer

| View | Used by (screen) |
|---|---|
| `stcusttab` | Customer Search, Individual Saudi/Others, Juristic Main, Cust Acct Info, Required Documents, Account Maintenance header, Card grid/detail, Transfer/Transaction header |
| `stcustlog` | Cust Update History, Customer Profile As-Of (temporal replay) |
| `stidtab` | Customer Search (by ID), Essential Documents, Signatory Detail |
| `stidlog` | Customer Profile As-Of (ID section) |
| `staddrtab` | Juristic Account Info (address) |
| `staddrlog` | Customer Profile As-Of (address section) |
| `stheirtab` | Heirs / Proxy |
| `stjointtab` | Joint Holders |
| `stcreftab` | References |
| `stowntab` | Owners |

### Account

| View | Used by (screen) |
|---|---|
| `stacclog` | Acct Update History, Acct Status History, SAMA Status History, Account Snapshot (as-of), maker/checker on Account Detail, Juristic Account Info |
| `staccblk` | Blocked Amount Breakup |
| `stchqtab` | Cheque Book grid + Cheque Book History |
| `ststchqlog` | Stop Cheque Detail (last-update user) |
| `stsodlog` | Standing Order Detail (last-update user/time) |

### Card

| View | Used by (screen) |
|---|---|
| `stcardtab` | Card grid, Card Detail, Customer Search (by card no) |
| `stcardlog` | Card Update History, Card Tracking History |

### Signatory / transfers / bills

| View | Used by (screen) |
|---|---|
| `stsigntab` | Signatory grid, Signatory Detail |
| `stswiftlog` | Transfer Detail — pending-SWIFT-update guard only, no displayed data (⚠ absent) |
| `stsadadlog` | SADAD transactions |

### Security / users

| View | Used by |
|---|---|
| `stuser` | Login, user profile |
| `stusrbrn` | Enquiry-allowed branch list (per-user authorisation) |

### Control / reference tables

| View | Contents |
|---|---|
| `stctltab` | Generic code table keyed on `RecordType` — `ID` (ID types), `BS` (business type), `SM` (SAMA main category) |
| `stctltabBD` | Branch directory; also the branch balance-enquiry restriction flag |
| `stctltabNA` | Country codes |
| `stctltabSS` | SAMA sub-category |
| `stctltabDC` | Document codes (Essential / Required Documents) |
| `stctltabMM` | Account product / scheme names |
| `stctltabXC` | Currency codes |
| `stctltabSC` | Only used by `/api/health/db`, as a second differently-shaped view to prove the prefix resolves |

---

## DB #2 — online / Finacle source (no connection of its own)

⚠️ These are the tables the legacy TCP/IP servers read — `cbcmssrv` for most,
and `cbrt01` (`bmrtServer`, the second socket) for `gld0data`/`crd0data`/
`thd0data` on services 07 and 11. **All of them are queried through the archival
connection** — every repository is wired to
`@Qualifier("archivalJdbc")` — so they must exist as Denodo views on the
archival datasource. There is no longer a separate `online-db`: it pointed at
the same Denodo server, nothing queried it, and it has been merged into DB #1.
The heading stays because these views come from a different SYSTEM in the
legacy, which is why they are the ones most likely to be missing.

| View | Used by (screen) |
|---|---|
| `gld0data` | Account list for customer, Account Detail (current master), Standing Order Detail branch, Blocked Amount Breakup, On-demand Statement + Transaction Inquiry (bookBal, branchCode) |
| `sod0data` | Standing Order grid + detail |
| `pyd0data` | Stop Cheque grid + detail |
| `thd0data` | Transaction Type Enquiry + Transaction Detail, On-demand Statement + Transaction Inquiry |
| `crd0data` | On-demand Statement + Transaction Inquiry (customer header); Transfer Detail + Transaction Detail (`getCustName` fallback for a custNo absent from stcusttab) |
| `rid0data` | SARIE Transfer Enquiry + Transfer Detail |
| `aad0data` | Blocked Amount Breakup (source 2) |
| `bkd0data` | Blocked Amount Breakup (source 3) |
| `ccarrblk` | Blocked Amount Breakup (source 4) |

---

## Open items to confirm with the Denodo team

1. **The three missing views (see Availability above).** All three are also
   absent from `BM archival Version 9.xlsx`, so their column names are assumed
   rather than verified: `bkd0data` refNo/recType/blockedAmt/userId and
   `ccarrblk` cardNo/blockedAmt/lastBlockedUserId, both from the C record
   layouts (`layout.h:3055` and `:3162`), `stswiftlog`
   transRefNo/issueDate/bmUpdateStatus likewise
   (`stlayout.h struct stswiftlog`). Note the query spec names `bkd0data`'s
   amount column `amount`; the record has no such field and the C reads
   `bkdRec.blockedAmt` (cbblock.c:390) — following the spec there is what put
   `bkd0data` in `unavailableSources` on a view that exists. Prefer the record
   layout over the spec table for any view the workbook does not cover. Worth
   one round with the Denodo team:
   `bkd0data`/`ccarrblk` are online/Finacle-side and may genuinely not exist,
   but `stswiftlog` sits alongside `stacclog`/`stcustlog`, which were both
   delivered — a naming difference is more likely than a real absence. Ask for
   it by the C struct name.
2. **Account key length.** All account predicates use the 14-char ACTUAL form
   (`CCMMMNNNNNNNSS`) per the workbook, and the customer scan uses
   `gld0data.custNo`. The legacy C used the 13-char BM form. `bkd0data` keeps
   the 13-char key. Needs one real-data probe to validate.
   **`crd0data` is the exception, decided 2026-08-19: it is keyed the LEGACY
   way** — the 6-char PACKED BM customer `actualToBmCust(&accNo[5])` builds
   (`BmForms.bmCust`), not the actual form the other views carry. The rule is
   that the legacy read is the specification; inferring a key from a
   neighbouring view's convention is what produced the earlier BankingDate and
   accounts-key mistakes. Note the packing is only visible above 1,000,000 —
   below that it is just the last six digits, so a view keyed either way agrees
   on low customers and diverges only on high ones. If crd0data turns out to be
   ETL'd to the actual form after all, the symptom is high-numbered customers
   losing their name while low ones keep it.
3. **`aad0data` account column** is `FinoneAlcoAccNo` in the workbook, not the
   spec's `accNo`.
4. **`crd0data` is now required** (2026-08-19). It was previously left out
   because its only consumer was the cheque-book search's
   `alternativeBranchCode`; the two cbrt01 enquiries changed that.
   Columns needed now: `accNo` (6, the key — see item 2), `shortName` (30),
   `address1` (30), `address2` (30), `language` (1).
   **Ask for `address1` AND `address2`.** `cbrt01.c` copies 60 bytes starting at
   `address1`, which is only 30 wide (`cbslib/layout.h:751`), so the reply's
   60-char `custAddress` is the two columns CONCATENATED. `address1` alone
   yields half the address and looks like clean data. Since the view is being
   built anyway, request the whole record — `branchCode` (1860),
   `alternativeBranchCode` (1864), `packageAcc` (1922), `vipFlag` (1921) and
   `nonResident` (148) all have callers in the C, and one creation unblocks the
   cheque-book field too.
5. ~~**`stctltabXC.decimalPlace`** — is the column exposed?~~ **Confirmed
   present, 2026-08-19.** (Offset 92 of `struct cnd0dataXC`,
   `cbslib/layout.h:1054`; it is the divisor every amount on the two cbrt01
   enquiries is scaled by.) `JdbcOnlineEnquiryRepository` still refuses the
   enquiry if the column cannot be read — that branch is now a regression guard
   rather than an expected state, and the reasoning behind it is unchanged:
   defaulting silently would render every figure off by a factor of ten with
   nothing on screen to say so.

   **Still worth one probe: what VALUES it holds.** The legacy's read-failure
   fallback is `'2'` and the mock assumes `'3'` for SAR, so the two disagree
   about the local currency. Whichever the column says now wins for real, but a
   glance at `SELECT currCode, decimalPlace FROM stctltabXC` would confirm the
   SAR row and settle which of the two guesses was right.
