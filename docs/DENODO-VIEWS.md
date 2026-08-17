# Denodo views required for the enquiry app

Every table below is referenced by a `FROM`/`JOIN` in `bank-api` under the
`denodo` profile. Extracted from
`bank-api/src/main/java/com/banksystem/api/infrastructure/persistence/jdbc/Jdbc*Repository.java`.

**38 views total** — 30 on the BM archival schema, 8 on the online/Finacle side.

## Availability (confirmed against Cloudera/Denodo, 2026-07-28)

**35 of the 38 exist. Three do not:**

| Missing view | Screen impact | Severity |
|---|---|---|
| `bkd0data` | Blocked Amount Breakup loses source 3 (`O` — other BM blocking) | degrades |
| `ccarrblk` | Blocked Amount Breakup loses source 4 (`M`/`C` — credit-card arrear blocks) | degrades |
| `stswiftlog` | Transfer Detail's pending-SWIFT-amendment guard never fires | degrades |

None of the three breaks a screen. All are read inside their own try/catch and
fail to a warn log — see `JdbcAccountRepository.blockedSource` and
`JdbcTransferRepository.hasPendingSwiftUpdate`. The one user-visible symptom is
on Blocked Amount Breakup: the "Total Blocked Balance" tile comes from the
`gld0data` header and is independent of the detail rows, so for an account
carrying an `O` or credit-card block the total will exceed the sum of the rows
shown, with nothing on screen explaining the difference.

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

⚠️ These are the tables the legacy `cbcmssrv` TCP/IP server read. **All of them
are queried through the archival connection** — every repository is wired to
`@Qualifier("archivalJdbc")` — so they must exist as Denodo views on the
archival datasource. There is no longer a separate `online-db`: it pointed at
the same Denodo server, nothing queried it, and it has been merged into DB #1.
The heading stays because these views come from a different SYSTEM in the
legacy, which is why they are the ones most likely to be missing.

| View | Used by (screen) |
|---|---|
| `gld0data` | Account list for customer, Account Detail (current master), Standing Order Detail branch, Blocked Amount Breakup |
| `sod0data` | Standing Order grid + detail |
| `pyd0data` | Stop Cheque grid + detail |
| `thd0data` | Transaction Type Enquiry + Transaction Detail |
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
3. **`aad0data` account column** is `FinoneAlcoAccNo` in the workbook, not the
   spec's `accNo`.
4. **`crd0data`** is *not* in the list — the cheque-book search's
   `alternativeBranchCode` was deliberately not ported. Add it only if that
   field is required.
