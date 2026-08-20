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
It is keyed on **`custNo`** — see item 2 below, where the earlier packed-`accNo`
decision is reversed.
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

## Banking date

Every view here carries the ETL's `BankingDate` column ("Data Restored date",
key part 1 on 98 of the 106 archival views), and **every query the app issues
filters on it**:

```sql
WHERE ... AND <alias>.BankingDate = :bankingDate
```

The value is one setting, `banking-date` in the runtime configuration file
(`bank-runtime.properties`, next to the jar), read through `BankingDateProvider`;
a blank value falls back to `MAX(BankingDate) FROM stcusttab` with a warning. It
is a plain string compared with `=`, so it must be written exactly as the views
store it — `2009-07-11` if BankingDate is a DATE column, `20090711` if it is a
YYYYMMDD string. A format mismatch is not an error, it is every screen returning
no rows, which is why the file is validated on load and an unusable date is
refused outright rather than applied.

**It can be changed while the application is running.** Save the file and the
next query binds the new date — no restart, no dropped session — so moving the
screens onto another restore snapshot is an operational act, not a redeploy.

Why it is mandatory rather than optional: several views hold the SAME record
once per restore snapshot (a real account in `sod0data` was measured with four
rows for one `sodNo`, four different BankingDates), so without the predicate a
grid shows duplicates and a detail point read picks an arbitrary snapshot.
Pinning the application to one snapshot restores the legacy's one-row-per-key
guarantee.

Two consequences to keep in mind when choosing the value. The 29 CSD `st*` views
were measured single-valued at 11/07/2009; the five BM views
(`gld0data`, `pyd0data`, `sod0data`, `rid0data`, `thd0data`) span 1992/1995 →
11/07/2009; and `stcardtab` extends to 08/12/2012. So one global date cannot be
the latest snapshot of every view: a key present only in an older snapshot, and
any `stcardtab` row written after the chosen date, will not be returned.

`BankingDateFilterTest` scans the repository sources and fails the build if a
statement reading one of these views loses the predicate.

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
   **`crd0data` was made an exception on 2026-08-19 and the exception is
   REVERSED (2026-08-20): it is keyed on `custNo`, the plain 7-digit customer**,
   like every other archival view. It was keyed the legacy way — `accNo` bound
   to the 6-char PACKED customer `actualToBmCust(&accNo[5])` builds
   (`BmForms.bmCust`) — on the rule that the legacy read is the specification
   and that inferring a key from a neighbouring view's convention is what
   produced the earlier BankingDate and accounts-key mistakes.

   That rule is right about LOGIC and does not extend to COLUMN NAMES. The
   workbook has no `accNo` on this view at all (`crd0data.ts`: `custNo`, string,
   size 7), so the read could not miss rows the way a wrong key form does — it
   threw `BadSqlGrammarException` on every call. On Transfer Detail that landed
   unguarded after the main query and turned the whole enquiry into a 500
   ("Could not open this transfer…" with a support reference, the row already
   fetched and thrown away); the size-7 column also settles the key FORM, since
   the packed form is six.

   Note the two forms differ only by a leading zero below 1,000,000 and
   genuinely diverge above it, so had the column existed under the legacy name
   this would have been a subset-of-accounts bug found months later. **When a
   view's own dictionary and the C record layout disagree on a column, the
   dictionary wins — it describes what was actually delivered.**
3. **`aad0data` account column** is `FinoneAlcoAccNo` in the workbook, not the
   spec's `accNo`.
4. **`crd0data` is now required** (2026-08-19). It was previously left out
   because its only consumer was the cheque-book search's
   `alternativeBranchCode`; the two cbrt01 enquiries changed that.
   Columns needed now: `custNo` (7, the key — see item 2), `shortName` (30),
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

   **Values checked 2026-08-19: they VARY by currency — 0, 2 and 3 all occur.**
   That is the shape the C always assumed (`readCnd` looks the value up per
   account, keyed `"XC00"` + the account's 2-char currency), and
   `JdbcOnlineEnquiryRepository` already does the same, so nothing needed
   changing server-side. `0` is not an unhandled case either: the legacy's own
   `Else` branch gives `coinDenomination = 1, coinPrecision = 0`
   (frmTransaction.frm:428-440) and `gateway.ts` ports exactly that.

   What DID need fixing was the mock, which answered a flat `'3'` for every
   account and so never once exercised the whole-unit path — the branch where
   dividing by the wrong power of ten looks least wrong on screen. It now
   derives decimalPlace from the currency like the real repository, and scales
   the amounts it generates to match. Every DemoData account is currency `01`
   (`ACC_PREFIX`), so to see a 0-decimal statement in dev, ask for an account
   number starting `03`.
