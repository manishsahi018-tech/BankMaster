# Denodo views required for the enquiry app

Every table below is referenced by a `FROM`/`JOIN` in `bank-api` under the
`denodo` profile. Extracted from
`bank-api/src/main/java/com/banksystem/api/infrastructure/persistence/jdbc/Jdbc*Repository.java`.

**38 views total** — 30 on the BM archival schema, 8 on the online/Finacle side.

## Naming

The repositories use the bare legacy names (`stcusttab`, `gld0data`, …).
`SqlTablePrefixer` prepends an environment prefix at runtime, configured by
`bank.archival-db.table-prefix` (staging default
`bv_impala_stg_bankmaster_`) and `bank.online-db.table-prefix`. So the view to
create in staging is `bv_impala_stg_bankmaster_stcusttab`, etc. Only the
prefix changes between environments — no SQL changes.

All views are **read-only**. Both pools are `read-only: true`.

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
| `stswiftlog` | Transaction Detail (SWIFT leg) |
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
| `stctltabSC` | Only used by `/api/db-health` as the online-DB reachability probe |

---

## DB #2 — online / Finacle source (`onlineJdbc`)

⚠️ These are the tables the legacy `cbcmssrv` TCP/IP server read. The engine
for DB #2 is still undecided; **today all of these are queried through the
archival connection** (every repository is wired to `@Qualifier("archivalJdbc")`),
so for the current build they must exist as Denodo views on the archival
datasource too.

| View | Used by (screen) |
|---|---|
| `gld0data` | Account list for customer, Account Detail (current master), Standing Order Detail branch, Blocked Amount Breakup |
| `sod0data` | Standing Order grid + detail |
| `pyd0data` | Stop Cheque grid + detail |
| `thd0data` | BM Transaction Enquiry + Transaction Detail |
| `rid0data` | SARIE Transfer Enquiry + Transfer Detail |
| `aad0data` | Blocked Amount Breakup (source 2) |
| `bkd0data` | Blocked Amount Breakup (source 3) |
| `ccarrblk` | Blocked Amount Breakup (source 4) |

---

## Open items to confirm with the Denodo team

1. **`bkd0data` and `ccarrblk` are absent from `BM archival Version 9.xlsx`.**
   Their column names (`bkd0data`: refNo/amount/userId; `ccarrblk`:
   cardNo/blockedAmt/lastBlockedUserId) are assumed from the query spec. Each
   Blocked-Amount source runs in its own try/catch, so a missing view degrades
   to a warning rather than a failure — but the breakup will be incomplete.
2. **Account key length.** All account predicates use the 14-char ACTUAL form
   (`CCMMMNNNNNNNSS`) per the workbook, and the customer scan uses
   `gld0data.custNo`. The legacy C used the 13-char BM form. `bkd0data` keeps
   the 13-char key. Needs one real-data probe to validate.
3. **`aad0data` account column** is `FinoneAlcoAccNo` in the workbook, not the
   spec's `accNo`.
4. **`crd0data`** is *not* in the list — the cheque-book search's
   `alternativeBranchCode` was deliberately not ported. Add it only if that
   field is required.
