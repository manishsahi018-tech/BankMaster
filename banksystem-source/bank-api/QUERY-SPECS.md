# Query specifications — ported from the legacy cbcmssrv C code

Source: `docs/CSD C Code` (cbbranch.c, cbbranch2.c, cbothers.c, cbblock.c,
cbswift.c, cbsadad.c, cbsama.c, cblogin.c).

**Part 1 (§1–9)** maps each implemented bank-api repository method to the exact
legacy ISAM read logic and a draft SQL equivalent for the future
`Jdbc*Repository` implementations. **Part 2 (§10+)** specifies the tier-1
missing screens (stubbed buttons in the current UI) ahead of their build.

**Conventions used throughout**
- *Pagination:* every enquiry returns at most **20 rows**; the request carries
  `lastRecCount` (rows already delivered) → SQL `OFFSET :lastRecCount FETCH NEXT 20 ROWS ONLY`.
  A short page (< 20) signals the last page. bank-api models this as `page` ×
  `PagedResult.PAGE_SIZE`.
- *Archival key caveat:* the archival DB tables prefix every primary key with
  `BankingDate` (the restore date) — a column the live ISAM files did not have. Every
  query below therefore needs an additional `BankingDate` predicate (e.g. latest
  restore date, or a date supplied by the UI) on top of the legacy key columns.
- *BM number forms:* the legacy code converts between "actual" and "BankMaster"
  forms: `actualToBmAcc` (14-char account → 13-char BM form), `actualToBmCust`
  (7-char customer → 6-char BM form), `bmAccToActual`, `bmDateToActual`. The customer
  number is embedded in the account number at offset 5 (`accNo[5..11]`). The port
  must replicate these conversions (or store both forms).
- *NUL scrubbing:* records are scrubbed of embedded `\0` bytes (replaced with spaces)
  before use; irrelevant for SQL but explains stray spaces in legacy data.

---

## 1. Customer search — `CustomerRepository.search` (service 16)

Legacy: `processSearchRequest()`, cbbranch.c:1536. Single handler with an
if/else-if chain — **first non-blank criterion wins**, in this priority order:
custNo → cardNo → idNo/crNo → telNo → firstName → secondName → lastName →
mainCategory → branchCode → mobileNo.

All branches scan **stcusttab** on a branch-specific index; the card branch first
resolves the customer via **stcardtab**.

| Branch | stcusttab index | Key fields seeded | Loop break / filters |
|---|---|---|---|
| custNo | key 1 | `custNo` (7) | break when custNo ≠ |
| cardNo | stcardtab key 1 first: `cardNo` (19) → `custNo = bmAccNo[5..11]`, then custNo branch | exact card read; errors 110/111 → "Invalid card number" |
| idNo (or crNo) | key 3 | `idNo` (15), `idType` | break when idNo ≠ (idType seeded but NOT re-checked) |
| telNo | key 4 | `telHomeNo` (10), `telHomeExt` (4) | break when telHomeNo ≠ |
| firstName (Arabic, 1st byte >128) | key 5 | `aFirstName` prefix | break on prefix ≠; `a2ndName`/`aLastName` prefix **continue**-filters when supplied |
| firstName (English) | key 7 | `eFirstName` prefix | same with e-columns |
| secondName | key 11 (A) / 12 (E) | `a2ndName`/`e2ndName` prefix | lastName prefix continue-filter |
| lastName | key 6 (A) / 8 (E) | `aLastName`/`eLastName` prefix | — |
| category | key 10 | `samaMainCategory`+`samaSubCategory` (4 bytes contiguous) | break on 4-byte ≠ |
| branchCode | key 2 | `branchCode` (4) | break on ≠ |
| mobileNo | key 13 | `mobileNo` (10) | break on ≠ |

Name searches are **prefix scans** on the trailing-space-trimmed input → SQL `LIKE :prefix || '%'`.
The Arabic-vs-English index choice is made by inspecting the first byte (>128 ⇒ Arabic).
A search timeout (`alarm(searchTimeOut)`) flushes a partial page with `incompleteFlag='1'`.

**Fallback:** an empty custNo search probes **crd0data** (`isRead` ISEQUAL on the
6-char BM customer) purely as an existence check — contributes no rows; can be dropped.

**Response mapping** (per row): custNo, idType, idNo, telHomeNo/Ext; first/second/last
name from the **Arabic columns when the search was Arabic or `preferredLang` is Arabic,
else English columns**; shortName from `a/eShortName` for consumers vs
`a/eOrgShortName` for corporate (`custType` '1'/'2'), with other-language fallback when
the preferred one is blank; branchCode; samaMainCategory/samaSubCategory.

```sql
-- BY CUSTNO (other branches: swap the WHERE per the table above)
SELECT custNo, idType, idNo, telHomeNo, telHomeExt,
       aFirstName, a2ndName, aLastName, eFirstName, e2ndName, eLastName,
       aShortName, eShortName, aOrgShortName, eOrgShortName,
       custType, preferredLang, branchCode, samaMainCategory, samaSubCategory
FROM   stcusttab
WHERE  BankingDate = :bankingDate AND custNo = :custNo
ORDER  BY custNo
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;

-- name search example (English first name + optional filters)
... WHERE eFirstName LIKE :firstName || '%'
      [AND e2ndName  LIKE :secondName || '%']
      [AND eLastName LIKE :lastName  || '%']
ORDER BY eFirstName ...

-- card resolution
SELECT SUBSTR(bmAccNo, 6, 7) AS custNo FROM stcardtab WHERE cardNo = :cardNo;
```

---

## 2. Customer update history — `CustomerRepository.updateHistory` (service 67)

Legacy: `processCustomerHistory()`, cbbranch2.c:917. Reads **stcustlog** on
**key 3 (custNo)**, ISGTEQ + forward scan; breaks when custNo changes.

**Archive iteration:** loops physical year-files `custlog2000 … custlogYYYY-1`
(skipping missing years), then the current-year `stcustlog` — one continuous
key-ordered stream with a single paging counter across all files. In the archival
DB this collapses to one table (or a `UNION ALL` over per-year partitions) ordered by
year then key.

**Filters:** none besides the custNo boundary — no msgType/status filtering.
**Field rule:** `supervisorId` and `lastUpdateDateTime` are **blanked when
`bmUpdateStatus` is '1' or '2'** (still-pending records).

```sql
SELECT branchCode, userId, dateTime,
       bmUpdateStatus AS pendingStatus,
       CASE WHEN bmUpdateStatus NOT IN ('1','2') THEN supervisorId END        AS supervisorId,
       CASE WHEN bmUpdateStatus NOT IN ('1','2') THEN lastUpdateDateTime END  AS lastUpdateDateTime,
       samaMainCategory, samaSubCategory
FROM   stcustlog
WHERE  BankingDate = :bankingDate AND custNo = :custNo
ORDER  BY custNo, lastUpdateDateTime
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;
```
Header fields (shortName, custBranchCode) come from stcusttab (`getCustName`).

---

## 3. Account grid — `AccountRepository.accountsForCustomer` (service 21)

Legacy: `processAccSearchRequest()`, cbbranch2.c:5609.

**Key architecture finding: service 21 is fully local — no Finacle/gateway call.**
Balances, statuses, limits and the dormant flag all come from **gld0data** (which is in
the archival dictionary). The Finacle online gateway (`FINONLNGWENQ`, services 04/05)
is used only by the sibling card-search path (`validateCustNo`/`validateAccNo`), not
here. So this endpoint can be served entirely from DB #1.

Three input branches: custNo → gld0data **index 3** range scan on the embedded
customer (`accNo[5..10]`, 6-char BM form); accNo → gld0data **index 1** exact read
(13-char BM form); cardNo → **stcardtab** exact read to get `bmAccNo`, then the accNo
branch.

Supporting local reads: **stcusttab** (customer header via `checkCustNo`),
**stabclist** (A-list flag on idType+idNo), **stctltab** (`updateRestricted`,
`balEnqRestrictedFlag` per branch), **stuser**/**stusrbrn** (authority `~86` +
enquiry-allowed branches → per-account `balEnqRestricted`). Staff flag when
`gldRec.branchCode == "0175"` or `custType/businessType == "266"`.

**Response mapping:** accNo (`bmAccToActual`), bookBal, clearedBal,
blockedAmt→blockedBal, accStatus = `'0' + gldRec.passwd` (single status char stored in
a field named `passwd`!), accLimit→creditLimit, transCount, anbDormantFlag→dormant,
branchCode; plus customer header fields from stcusttab.

```sql
-- by customer (index 3): all accounts of a customer
SELECT accNo, bookBal, clearedBal, blockedAmt AS blockedBal,
       '0' || passwd AS accStatus, accLimit AS creditLimit,
       transCount, anbDormantFlag AS dormantFlag, branchCode
FROM   gld0data
WHERE  BankingDate = :bankingDate AND SUBSTR(accNo, 6, 6) = :bmCustNo
ORDER  BY accNo
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;

-- by account (index 1): single row
... WHERE BankingDate = :bankingDate AND accNo = :bmAccNo;

-- supporting lookups
SELECT 1 FROM stabclist WHERE idType = :idType AND idNo = :idNo AND abcListType = 'A';
SELECT updateRestricted, balEnqRestrictedFlag FROM stctltab WHERE branchCode = :branchCode;
SELECT authorityLevel, authorityLevel2 FROM stuser WHERE userId = :userId;
```

---

## 4. Cheque book requests — `AccountRepository.chequeBookRequests`

Legacy: `processChequeBookSearch()`, cbbranch2.c:10159. Reads **stchqtab**
**key 1**, seeded with the full 14-char `accNo`, ISGTEQ; breaks when accNo changes.
Preliminary read of **crd0data** (ISEQUAL on the BM customer from `accNo[5..]`) for
the response-level `alternativeBranchCode`. No status filter — all requests returned.

**Display rule:** `deliveryBranchCode` falls back to `custBranchCode` when blank or
`"0000"`. `requestUserId` gets `branchCode[1..3]` overlaid at offset 7 when it starts
with a digit (legacy user-id normalization).

```sql
SELECT CASE WHEN deliveryBranchCode IN ('    ', '0000') THEN custBranchCode
            ELSE deliveryBranchCode END              AS deliveryBranchCode,
       chequeType, booksRequested,
       requestDateTime                               AS reqDate,   -- first 8 chars used
       requestStatus, chequeNoFrom, chequeNoTo, requestUserId, branchCode
FROM   stchqtab
WHERE  BankingDate = :bankingDate AND accNo = :accNo               -- 14-char actual form
ORDER  BY accNo, requestDateTime
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;
```

---

## 5. Standing orders — `AccountRepository.standingOrders`

Legacy: `processStdOrdSearch()`, cbbranch2.c:10359. Reads **sod0data** **key 1**,
seeded with the **13-char BM account** (`actualToBmAcc`), isstart length 13, ISGTEQ;
breaks when accNo changes. No status filter.

**Response:** sodNo, paymentType, paymentAmt, payAccNo (**converted back** with
`bmAccToActual`), orderType, paymentFrequency, branchCode.

```sql
SELECT sodNo, paymentType, paymentAmt, payAccNo,  -- payAccNo needs bm→actual conversion
       orderType, paymentFrequency, branchCode
FROM   sod0data
WHERE  BankingDate = :bankingDate AND accNo = :bmAccNo   -- 13-char BM form
ORDER  BY accNo, sodNo
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;
```

---

## 6. Stop cheques — `AccountRepository.stopCheques`

Legacy: `processStopChqSearch()`, cbbranch2.c:9766. Reads **pyd0data** **key 1**,
composite seed `recType='CH'` + 13-char BM accNo, isstart length 15, ISGTEQ;
breaks when accNo changes.

**Filter:** when the request's `destroyChequeFlag == '1'`, only rows with
`destroyFlag == '1'` are returned; otherwise ALL rows (an exclusion of destroyed
cheques exists in the code but is commented out). `dateStop` is converted with
`bmDateToActual`.

```sql
SELECT chequeNo, amount, dateStop, payeeName, chequeFrom
FROM   pyd0data
WHERE  BankingDate = :bankingDate
  AND  recType = 'CH'
  AND  accNo   = :bmAccNo                                -- 13-char BM form
  AND  (:destroyChequeFlag <> '1' OR destroyFlag = '1')
ORDER  BY recType, accNo, chequeNo
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;
```

---

## 7–8. Account update history, account/SAMA status history — one legacy handler

**Correction to the table mapping:** all three history grids are served by a single
handler — `getAcctStatusHistory()` (service 57), cbothers.c:7931 — reading **stacclog**
on **key 5 (accNo)**, with a `requestType` switch:

| requestType | Grid | Extra filters | Page |
|---|---|---|---|
| `'0'` | Account status change history | `statusChanged='1'` AND `bmUpdateStatus='9'` | max 50, no cursor |
| `'1'` | **SAMA** status change history | `samaAccStatusChanged='1'` AND `bmUpdateStatus='9'` | max 50, no cursor |
| `'2'` | Account update history | skip rows where userId/supervisorId starts with a letter unless userId='MIGRATION' | 20 + cursor |

So **`stsamaacc` is NOT the SAMA-history source** — the SAMA grid reads the SAMA
columns of stacclog (`fromSamaAccStatus`/`toSamaAccStatus`). This also resolves the
earlier UI question: AccountMaintenance's separate "A/C Status History" and
"SAMA Status History" buttons are requestType 0 vs 1 of the same service/form.
(requestType 0 includes `accStatusChangeReason`; type 1 has no reason field.)

**Archive iteration:** like customer history — physical year-files
`acclog2000 … acclogYYYY-1` scanned oldest-first, then live stacclog, with the
paging counter continuous across files.

**Field rules:** `supervisorId`/`lastUpdateDateTime` blanked while
`bmUpdateStatus` is '1' or '2' (pending). The `branchCode[1..3]`-at-offset-7
overlay on numeric user/supervisor IDs applies ONLY to requestType '0'/'1'
(cbothers.c:8034-8038); requestType '2' (update history) copies the IDs raw
(cbothers.c:8015-8022).

```sql
-- requestType '2' — AccountRepository.updateHistory
SELECT branchCode, userId, dateTime,
       bmUpdateStatus AS pendingStatus,
       CASE WHEN bmUpdateStatus NOT IN ('1','2') THEN supervisorId END       AS supervisorId,
       CASE WHEN bmUpdateStatus NOT IN ('1','2') THEN lastUpdateDateTime END AS lastUpdateDateTime
FROM   stacclog
WHERE  BankingDate = :bankingDate AND accNo = :accNo
  AND  NOT ( (userId LIKE '[A-Za-z]%' OR supervisorId LIKE '[A-Za-z]%')
             AND userId <> 'MIGRATION' )
ORDER  BY accNo, dateTime
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;

-- requestType '1' — AccountRepository.samaStatusHistory
SELECT userId, supervisorId, branchCode,
       dateTime AS changeDateTime,
       fromSamaAccStatus AS fromStatus, toSamaAccStatus AS toStatus,
       lastUpdateDateTime
FROM   stacclog
WHERE  BankingDate = :bankingDate AND accNo = :accNo
  AND  samaAccStatusChanged = '1' AND bmUpdateStatus = '9'
ORDER  BY accNo, dateTime
FETCH FIRST 50 ROWS ONLY;

-- requestType '0' — account status change (future "A/C Status History" screen)
SELECT userId, supervisorId, branchCode, dateTime AS changeDateTime,
       fromStatus, toStatus, accStatusChangeReason, lastUpdateDateTime
FROM   stacclog
WHERE  BankingDate = :bankingDate AND accNo = :accNo
  AND  statusChanged = '1' AND bmUpdateStatus = '9'
ORDER  BY accNo, dateTime
FETCH FIRST 50 ROWS ONLY;
```

*(Aside: `processStatusList()` in cbbranch2.c, despite the name, is the card/PIN
request status list over stcardtab keys 6/7 — relevant later for the card screens.)*

---

## 9. Login / session — `SessionController` (service 00)

Legacy: `processLoginRequest()`, cblogin.c:191. Read-only parts:

**User lookup — stuser, exact on `userId` (10):** fields consumed: password,
liveStatus ('2' locked, '3' closed, '0' force password change), loginStatus,
loginIpAddress, authorityLevel (20) + authorityLevel2 (60), langPreferred,
branchCode, lastChangeDate, bpUserId→tellerId, globalUpdatePriv.

**Password scheme (not expressible in SQL):** the stored `stuser.password` is a
20-char value built from two 8-char halves of the cleartext, each hashed with Unix
`crypt(half, "AR")` (DES, salt "AR", salt prefix stripped, padded to 10). Client
sends a reversibly-scrambled password; server decrypts, re-hashes, compares 20 bytes.
Effective max password length: 16. **Recommendation: do NOT port this** — replace
with modern auth (the revamp's auth design), keeping only the authority-level
semantics.

**Validation order:** version gate → user exists → locked/closed → password →
already-logged-in (loginStatus + IP, skipped for idle re-login) → force-change on
liveStatus '0' → password expiry (>30 days → expired; >24 → alert flag; users with
authority `~99` never expire).

**Branch flags in resMsgLogin come from stctltab**, not stuser:
`recType='BD'` row keyed on homeBranch (cardPrdnAtBranch, nameSearchAllowed,
stdOrdReqAllowed, dormantActivationFlag, … ~22 flags) plus the server-config row
`recType='SC', branchCode='SERV'` (enableSadadProfile, maxAgeLimit). The per-user
allowed-branch table stusrbrn is NOT consulted at login (that check is commented out
in the legacy code / delegated to the client).

**Side effects (out of scope for enquiry, but the new auth needs equivalents):**
stseclog inserts (logon '0', bad password '2', lock '4', expired '9'); stuser rewrite
(lastLoginDateTime, loginStatus, loginIpAddress); lock after client-reported
noOfTries > 3 unless authority `~99`.

```sql
SELECT userId, liveStatus, loginStatus, authorityLevel, authorityLevel2,
       langPreferred, branchCode, lastChangeDate, bpUserId AS tellerId, globalUpdatePriv
FROM   stuser    WHERE BankingDate = :bankingDate AND userId = :userId;

SELECT nameSearchAllowed, stdOrdReqAllowed, dormantActivationFlag /* + ~19 more flags */
FROM   stctltab  WHERE BankingDate = :bankingDate AND recType = 'BD' AND branchCode = :homeBranch;

SELECT enableSadadProfile, maxAgeLimit
FROM   stctltab  WHERE BankingDate = :bankingDate AND recType = 'SC' AND branchCode = 'SERV';
```

---

---

# Part 2 — Tier-1 missing screens

Specs for the screens stubbed as "to be built" in the current UI, extracted from
the same C code. Same conventions as Part 1 (20-row pages via `lastRecCount`,
BankingDate predicate to add, BM↔actual number conversions).

## 10. Stop cheque detail (frmStopChqDetails)

Legacy: `processStopChqDetail()`, cbbranch2.c:9839. Point read on **pyd0data**
key 1 (`recType='CH'` + 13-char BM accNo + chequeNo), plus a "latest log entry"
read on **ststchqlog** key 5: seeds `lastUpdateBmDate='99999999'` sentinel, ISGREAT
then ISPREV — i.e. the most recent log row — to get `stopChqUserId`.

```sql
SELECT p.chequeNo, p.amount, p.dateStop, p.payeeName, p.chequeFrom,
       (SELECT l.userId FROM ststchqlog l
         WHERE l.recType='CH' AND l.accNo=p.accNo AND l.chequeNo=p.chequeNo
         ORDER BY l.lastUpdateBmDate DESC FETCH FIRST 1 ROW ONLY) AS stopChqUserId
FROM   pyd0data p
WHERE  p.BankingDate=:bankingDate AND p.recType='CH'
  AND  p.accNo=:bmAccNo AND p.chequeNo=:chequeNo;
```
Note: the log match compares chequeNo on 8 bytes only (legacy quirk).

## 11. Standing order detail (frmStandingOrderDetail)

Legacy: `processStdOrdDetail()`, cbbranch2.c:10531. Point read on **sod0data**
key 1 (BM accNo + sodNo, ISEQUAL) returning ~28 fields (dates via `bmDateToActual`,
amounts via `bmAmtToDbl`); enriched with:
- **gld0data** key 1 → `custBranchCode` (read errors deliberately ignored);
- **stcusttab** → `payeeCustName` from the customer embedded in `payAccNo[5..11]`
  (aShortName, else eShortName, else "Invalid Customer");
- **stsodlog** key 5 latest row (sentinel + ISPREV) → `lastUpdateUserId/Date`;
- `checkStdOrdPendingStatus`: any stsodlog row with `bmUpdateStatus IN ('1','2')`
  for the acc+sod marks the order as pending.

```sql
SELECT s.*, g.branchCode AS custBranchCode,
       COALESCE(NULLIF(c.aShortName,''), c.eShortName) AS payeeCustName,
       l.userId AS lastUpdateUserId, l.lastUpdateDateTime AS lastUpdateDate
FROM   sod0data s
LEFT JOIN gld0data g ON g.accNo = s.accNo
LEFT JOIN stcusttab c ON c.custNo = SUBSTR(s.payAccNo, 6, 7)
LEFT JOIN LATERAL (SELECT userId, lastUpdateDateTime FROM stsodlog
                    WHERE accNo=s.accNo AND sodNo=s.sodNo
                    ORDER BY lastUpdateDateTime DESC LIMIT 1) l ON TRUE
WHERE  s.BankingDate=:bankingDate AND s.accNo=:bmAccNo AND s.sodNo=:sodNo;

-- pending check
SELECT 1 FROM stsodlog WHERE accNo=:bmAccNo AND sodNo=:sodNo
  AND bmUpdateStatus IN ('1','2') LIMIT 1;
```

## 12. Cheque book history / detail (frmChequeBookHistory)

Legacy: `getChequeBookHistoryDetails()`, cbbranch2.c:10235. Single unique-key read
on **stchqtab** key 1 (`accNo` + `requestDateTime` first 8 chars); a
`historyOrDetail` flag picks the response shape:
- **History**: the full lifecycle audit — request/produced/receivedByBranch/
  issuedToCustomer/rejected date+time+userId triples, rejectedReason. Overlay
  rules differ per field (cbbranch2.c:10279-10295): request/recdByBranch/
  issuedToCust userIds get branchCode[1..3] at offset 7 when numeric;
  producedUserId gets NO overlay; rejectedUserId gets a SELF-overlay (its own
  chars [1..3] at offset 7 — legacy quirk, ground truth).
- **Detail** (`'D'`): accNo, requestDateTime, booksRequested, chequeType,
  requestStatus, custBranchCode, deliveryBranchCode, chequeNoFrom/To.

```sql
SELECT requestUserId, requestDateTime, producedDate, producedTime, producedUserId,
       recdByBranchDate, recdByBranchTime, recdByBranchUserId,
       issuedToCustDate, issuedToCustTime, issuedToCustUserId,
       rejectedDate, rejectedTime, rejectedUserId, rejectedReason,
       booksRequested, chequeType, requestStatus,
       custBranchCode, deliveryBranchCode, chequeNoFrom, chequeNoTo, branchCode
FROM   stchqtab
WHERE  BankingDate=:bankingDate AND accNo=:accNo
  AND  SUBSTR(requestDateTime,1,8)=:reqDate;
```

## 13. Card grid (frmCardGrid — "ATM Cards")

Legacy: `processCardSearchRequest()`, cbbranch2.c:6506. **The most DB #2-dependent
tier-1 screen.** Card rows are local — **stcardtab** with three live index branches:
- by custNo → index 10 on `coreCustNo` (8);
- by accNo → index 9 on `coreAccNo` (16) — after resolving the customer via
  gateway service 04;
- by cardNo → index 1 exact (single row, returns immediately);
- (by idNo → index 4, disabled/index removed in legacy).

But **all customer header data comes from the Finacle gateway (DB #2)**:
`validateCustNo` (service 05) supplies shortName/longName, address1, poBox,
cityName, zipCode, branchCode, custType, preferredLang, idNo, home/office tel.
A local **cbcusttab** read + `stctltab` 'CC' category row can override custType to
"individual" when `atmCardAllowed='1'`. (Legacy stcusttab enrichment is fully
commented out — gateway is authoritative.)

Per-row response from stcardtab: cardNo, nameOnTheCard, firstIssueDate→issueDate,
expireDate→expiryDate, cardStatus, requestStatus, pinRequestStatus, coreAccNo.

```sql
SELECT cardNo, nameOnTheCard, firstIssueDate, expireDate,
       cardStatus, requestStatus, pinRequestStatus, coreAccNo
FROM   stcardtab
WHERE  BankingDate=:bankingDate AND coreCustNo=:custNo    -- or coreAccNo / cardNo
ORDER  BY coreCustNo, cardNo
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;
-- NOTE: the legacy client held CORE identifiers (8-char Finacle custNo /
-- 16-char core accNo via the gateway); the revamp UI sends BM forms. The
-- port dispatches by input length: custNo ≤7 → stcardtab.custNo (key k2),
-- 8 → coreCustNo; accNo ≤14 → bmAccNo, 16 → coreAccNo. Priority order in
-- the C is custNo → accNo → cardNo (cbbranch2.c:6524/6549/6585).
-- + DB #2 (or its replacement DB): customer header by custNo
```
The archival stcardtab **does** carry coreCustNo/coreAccNo (verified in the
workbook), so the local part ports cleanly.

## 14. Card detail (frmCardDetails)

Legacy: `processCardDetailRequest()`, cbbranch2.c:6982. Single point read on
**stcardtab** key 1 by `cardNo` (19). Returns cardNo, coreCustNo→custNo,
requestStatus, deliveryBranchCode, coreAccNo, sequenceNo plus a 374-byte block
from `cardType` (offset 63) through `pCustIssueUserId` (offset 436, per struct
cardInfo, stlayout.h:2183) — card/PIN lifecycle fields, name/address, dates and
the PIN secret fields; NOT the whole record. `newOrUpdate` derived: requestType
'0' → 'N' else 'U'. custName comes from the gateway customer lookup;
custCategory is DERIVED (cbbranch2.c:7046-7051): 'K' if gateway packageCustFlag
> '0', 'P' if businessType is a pension code, else blank — never a raw
custType.

## 15. Card/PIN history + card update history (frmCardHistory, frmCardUpdateHistory)

Legacy: `getCardHistoryDetails()`, cbbranch2.c:7061 — one handler, `msgType` switch,
scanning **stcardlog** key 6 (cardNo) across per-year archives
`cardlog2000…cardlogYYYY-1` then the live file:
- **msgType '1' — update history**: 20/page + cursor; rows: branchCode, userId,
  dateTime, bmUpdateStatus→pendingStatus, supervisorId/lastUpdateDateTime (blanked
  while pending '1'/'2'), requestType. Same shape as the other update histories.
- **else — card/pin tracking history**: cap 51 (the C's `noOfCardRec > 50`
  check breaks only after storing the 51st row), `bmUpdateStatus='9'` only; rows are
  the full card+PIN lifecycle: cardGenerated/branchReceipt/custIssue date+time+user
  triples for both card and PIN, supervisorId, processDateTime (suppressed when
  generated by 'BRCARDPRNT'), rejected date/time/user/reason. Numeric user IDs get
  the branch-code overlay.

```sql
-- update history (msgType 1)
SELECT branchCode, userId, dateTime, bmUpdateStatus AS pendingStatus,
       CASE WHEN bmUpdateStatus NOT IN ('1','2') THEN supervisorId END AS supervisorId,
       CASE WHEN bmUpdateStatus NOT IN ('1','2') THEN lastUpdateDateTime END AS lastUpdateDateTime,
       requestType
FROM   stcardlog
WHERE  BankingDate=:bankingDate AND cardNo=:cardNo
ORDER  BY cardNo, dateTime
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;

-- tracking history (else): WHERE ... AND bmUpdateStatus='9' FETCH FIRST 50 ROWS ONLY
```

## 16. Blocked amount breakup (frmBlockedAmtBreakup)

Legacy: `getBlockingBreakup()`, cbblock.c:256. Header total = `gld0data.blockedAmt`
(key 1 point read). Details = a fixed-order five-source union, capped at 31 rows,
each amount `ABS()`-ed and zero rows skipped:

| # | Source | Key | Filter | productType | productNo | user |
|---|---|---|---|---|---|---|
| 1 | gld0data | idx 3 (customer `accNo[5..10]`) | `settlementAccNo=:bmAccNo`, `blockedArrear2≠0` | 'B' | accNo (or matchingLoan) | — |
| 2 | aad0data | idx 3 | `settlementAccNo=:bmAccNo`, `loanBlockBal≠0` | 'F' | accNo | — |
| 3 | **bkd0data** | idx 1 | `accNo=:bmAccNo`, `recType='1'`, amt≠0 | 'O' | refNo | userId |
| 4 | **ccarrblk** | idx 2 | `bmAccNo=:displayAccNo` (14-char form!) | 'M' (manual) / 'C' (auto) | cardNo | lastBlockedUserId / 'CCARRBLK' |
| 5 | staccblk | idx 1 | `bmAccNo=:displayAccNo`, amt≠0 | 'A' | bmAccNo | lastBlockedUserId |

⚠️ **Schema gap: `bkd0data` and `ccarrblk` are NOT in the archival workbook's 106
tables.** The new DB needs them (or this screen loses the "other BM blocking" and
credit-card-arrear sections). Raise with the archival-DB team. Note also the mixed
key forms: sources 1–3 use the 13-char BM account, 4–5 the 14-char display form.

## 17. SARIE transfer enquiry + detail (frmSarieTransferEnq / frmSarieTransDetails)

Legacy: `processTransferEnq()` cbswift.c:417 and `processTransferDetail()` :1347.
**Fully local — reads rid0data** (outgoing SARIE/SWIFT transfer log; in the
workbook).
- Enquiry: index 4 on issueDate, range fromDate→toDate; filters: `crAccNo=:accNo`
  (always), then **either** `transRef=:bpRefNo` (when supplied — status is then
  IGNORED, cbswift.c:455-467) **or** `statusFlag=:recordStatus` (unless 'A');
  20/page + `totNoOfTrans` count + `completionFlag`. Rows: transRef,
  issueDate, valueDate, drAccNo, transCurrCode, netAmt, payCurrCode, payAmt,
  statusFlag.
- Detail: index 1 point read by transRef (+optional issueDate); returns ~30 fields
  (beneficiary/applicant/bank blocks — note several fields are recycled with
  misleading legacy names, e.g. applicantName is stored in `totAmt` [the 2025
  workbook added a dedicated `applicantName` column], benefAddr1 in
  `pensionerName`; `paymentType` comes from `statusFlag`, cbswift.c:1454);
  custName from stcusttab; `requestType='01'` runs `checkSwiftPendingStatus`
  (cbswift.c:2355): **stswiftlog** keyed `transRefNo`+`issueDate`, pending only
  when `bmUpdateStatus IN ('1','2')` — completed ('9') / rejected ('3') rows do
  NOT block.

## 18. BM transaction enquiry + detail (frmTransaction / frmBMTransDetails)

Legacy: `processBmTransEnq()` cbswift.c:1849 and `processBmTransDetail()` :1941.
**Fully local — reads thd0data** (transaction history, in the workbook).
- Enquiry: index 1 on BM accNo, **seeked with keylen 13 then walked ISNEXT**
  (cbswift.c:1871-1872). Index 1 is 26 bytes — `accNo[13] + filler1[7] +
  transCounter[5] + recType` (layout.h:1575-1578) — so **postDate is NOT in the
  key** and the rows come back in POSTING-SEQUENCE order. Order by
  `transCounter`, not by postDate: both are total orders within one account
  (transCounter is unique there) so paging is stable either way, but they
  disagree wherever a transaction was back-valued or posted late.
  Filters: postDate BETWEEN from/to; transType blank=all, 'RR'=reversals only
  (`statmentFlag>'1'`), else exact. 20/page on the wire — the revamp uses 10 and
  the screen drains every page before summing, so the chunk size is invisible.
  No recType filter at all here (the detail has one); harmless, since a recType
  '1' row's "postDate" bytes are narrative text and never fall in a date range.
  Rows: transRef, postDate, valueDate, userId, transAmt, transCounter, transType.
- Detail: index 2 (accNo+transRef), `recType='0'` header record; in the LEGACY
  files narratives 2/3 came from the recType='1' continuation record correlated
  on accNo+**transCounter** (struct thd1data — no transRef) — but the archival
  workbook folded those narratives into the **thd0data header row** itself;
  the archival `thd0data1` view is the recType-2/3 rate-change family and must
  NOT be used for narratives. custName from stcusttab via `getCustName`
  (cbothers.c:8195) — which **falls back to `crd0data.shortName` when the custNo
  is not in stcusttab** (:8210-8231), and swaps in the ORG short names when
  `custType != '0'` (:8234-8239) before the caller picks Arabic-else-English.
  The crd0data half runs as its own point read AFTER the main query, and only
  when the stcusttab name came back empty — because crd0data is keyed on the
  6-char PACKED BM customer (`BmForms.bmCust`), arithmetic no SUBSTR expresses,
  so it cannot ride along as a correlated subquery. That is also closer to the C,
  which falls back on the stcusttab ROW being absent. Non-printables scrubbed.

```sql
SELECT transRef, postDate, valueDate, userId, transAmt, transCounter, transType
FROM   thd0data
WHERE  BankingDate=:bankingDate AND accNo=:bmAccNo
  AND  postDate BETWEEN :fromDate AND :toDate
  AND  (:transType='' OR (:transType='RR' AND statmentFlag>'1')
        OR (:transType<>'RR' AND transType=:transType))   -- exact branch must exclude the RR case
ORDER  BY transCounter OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;
```

## 19. Utility bills / SADAD (frmBillEnquiry, frmSadadEnq, frmSadadTransEnq)

- **Bill enquiry — NOT a database read.** `processSadadSearch()` (cbsadad.c:292) is
  a live synchronous RPC to the SADAD interface via Tuxedo: service `UTBLENQ`
  (old layout) or `SADBILLENQ` (new layout; customerId/customerType IQA|NAT|BIS|OTH,
  billNo, subscriptionNo, companyId, date range, maxBills≤100). The revamp needs an
  equivalent SADAD integration (or to descope live bill lookup) — neither DB #1 nor
  DB #2 can serve current bills.
- **SADAD transaction history — local**: `processSadadTransEnq()` reads
  **stsadadlog** with a key chosen by the filled filters (key 8 companyId+date+teller,
  key 9 date+teller, key 10 teller); the subscriptionNo filter applies ONLY in
  the companyId (key 8) branch (cbsadad.c:1654-1658), and with all filters
  blank the C returns nothing; 20/page. Rows:
  transDateTime, branchCode, tellerId, companyId, subscriptionNo, drAccNo, billAmt,
  transRefNo, valueDate, transType, paymentType, preOrPostpaid, postingStatus,
  cashOrAcc, supervisorId.

## 20. Signatory details (frmJuristicSignatory)

Legacy: cbsama.c. **Fully local.**
- List: `processSignatoryTabSearch()` (:3798) on **stsigntab** — by customer
  (key 2 on `accNo[5..11]`) or by account (key 1, 14 chars); 20/page. Rows: accNo,
  signatoryNo, idType, idNo, branchCode, shortName (Arabic else English).
- Detail: `readSignTabInfo()` (:3965) — point read stsigntab key 1
  (accNo+signatoryNo) **joined to stidtab** (`custNo=accNo[5..11]`, idType, idNo,
  `idCategory='S'`) for the ID issue/expiry details.
- Audit variants exist against **stsignlog**/**stidlog** (same shapes, keyed
  branchCode+userId+dateTime).

```sql
SELECT s.accNo, s.signatoryNo, s.idType, s.idNo, s.branchCode,
       COALESCE(NULLIF(s.aShortName,''), s.eShortName) AS signatoryShortName
FROM   stsigntab s
WHERE  s.BankingDate=:bankingDate AND SUBSTR(s.accNo,6,7)=:custNo
ORDER  BY s.accNo, s.signatoryNo
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;
```

## 21. Statements — where each one actually lives

### 21.1 On-demand statement + transaction inquiry (services 07/11) — cbrt01, fully local

**Corrected.** An earlier sweep concluded these had no C handler; that sweep covered
`cbcmssrv` only. They live in a SECOND server binary — `bmrtServer`, the "Real Time
Update process" (`docs/cbrt.h`, `docs/cbrt01.c`) — which the VB6 client reaches on its
own socket (`onlineHostName:OnlinePort`, default 2006). Neither handler touches
Tuxedo, Finacle or the core host: `dealWithFingw()` sits in the same file but serves
only the card services (00/31/33/61/62).

Both read the same three local ISAM files:
- **gld0data** — 13-char BM accNo (`actualToBmAcc`); supplies `bookBal`, `branchCode`
- **crd0data** — 6-char BM custNo (`actualToBmCust(&accNo[5])`); supplies `shortName`,
  `address1`, `language`
- **thd0data** — recType `'0'` rows, plus a second handle on the recType `'1'`
  continuation for narratives 2/3

So these are **DB #1 enquiries over the same thd0data as §18**, not DB #2.

#### The two handlers, diffed

`getOndemandStmt()` (cbrt01.c:545) and `getTransEnquiry()` (:915) are near-identical
copies. Every real difference:

| | **07** on-demand statement | **11** transaction inquiry |
|---|---|---|
| row filter (:790 / :1162) | `recType != '0' \|\| statmentFlag >= '1'` → skip | `recType != '0'` → skip |
| blank `toDate` | not substituted; `validate()` fails → `INCORRECTMSG` "03" | substituted with the SERVER's system date (:971-976) |
| per-txn extras | — | `refNo`←`transRef`, `transCounter`, `supervisorId`, `statementFlag` |
| detail record | 111 bytes (`ondemandStmtTrans`) | 130 bytes (`transEnquiryDetails`, "added for version 3.7") |
| B/F balance | reverses out statement-eligible rows only | reverses out every row |

The B/F difference is a definition, not a discrepancy: `bfBal = bookBal + |debits| -
credits` accumulated over exactly the rows that survived the filter, so the two screens
legitimately report DIFFERENT opening balances for the same account and range.

`thd0data.statmentFlag` is documented `/* 1 - do not print */` (cbslib/layout.h:1583).
Note §18's reversal filter uses `statmentFlag > '1'` while 07 excludes `>= '1'` — so
flag value exactly `'1'` is suppressed from statements but is NOT an RR reversal.
Probe real data before relying on either threshold.

#### Shared mechanics

`accNo[5..] > "6199999"` → `NOMAINACC`; overpunch decode at byte 13 (`>= 'P'` →
negative); non-printable scrub (`>= 0 && < 27` → space) on name, address and all three
narratives; 50 rows per page; continuation pages `break` out early rather than
rescanning the whole history.

Paging rides **index 1 = 26 bytes: `accNo[13] + filler1[7] + transCounter[5] +
recType`** (layout.h:1575-1578). The seek is `isstart(..., 26, ISGREAT)` with
`transCounter = lastTransPtr` and `recType='0'`, so ordering is `accNo, transCounter`
and resume is `transCounter > :lastTransPtr`. That also settles §18's note: narratives
2/3 correlate on **transCounter** — `thd1data` carries no `transRef`.

`getTransEnquiry` at :953 has `strncmp(inBuf->lastTransPtr, "00000")` **missing its
length argument** (07 has it at :583), so 11's "skip from-date validation on
continuation pages" branch is decided by whatever the third argument happens to hold.
Port 07's intent; do not replicate the bug.

#### Open before the JDBC port

1. **`crd0data` is a required view** (it was absent when DENODO-VIEWS.md:156 was
   written; treated as present since 2026-08-19). Both handlers source
   `custName`/`custAddress`/`languageCode` from it, so target it directly — no
   `stcusttab`+`staddrtab` substitute. Columns used: `accNo[6]` (the 6-char BM
   custNo from `actualToBmCust(&accNo[5])` = `BmForms.bmCust`, NOT the actual
   form the other views carry — decided 2026-08-19, see DENODO-VIEWS.md item 2),
   `shortName[30]`, `address1[30]`, `address2[30]`, `language`.

   **Amount columns hold MAJOR units.** Measured 2026-08-19: `gld0data.bookBal`
   reads 1552.49, not 155249. The archival amount columns are `numeric(16,3)`
   and the ETL scaled them, so the workbook's "Decimal places are currency
   dependent" (on ~71 columns across 14 tables) is pre-ETL FIELD documentation,
   not a description of the loaded value. Two consequences, opposite directions:
   the UI's `formatAmount` is right to print these as they are, and
   `JdbcOnlineEnquiryRepository` must scale them UP by `decimalPlace` because
   the gateway CONTRACT its screens share with the mock is minor units. The C
   needed neither conversion — the ISAM field was minor units to begin with.

   The packing only bites above 1,000,000: below that it is the last six digits,
   at or above it the leading two digits collapse to a letter (1234567 → C34567).
   So a view keyed the other way would agree on low customers and lose only the
   high ones — pinned by `TransferPagingSqlTest` on exactly that boundary.

   **`address1` is 30 chars, not 60** (cbslib/layout.h:751). Both handlers do
   `strncpy(inBuf->custAddress, crdRec.address1, 60)` — copying 60 bytes from a
   30-char field, so `custAddress[60]` is `address1 ‖ address2` CONCATENATED.
   Requesting `address1` alone yields half the address.
2. **`bookBal` snapshot.** The B/F walk-back starts from `gld0data.bookBal`, so it is
   only meaningful against a single-valued `BankingDate` snapshot. Confirm `gld0data`
   is one of those views first.

Served by `JdbcOnlineEnquiryRepository` under the `denodo` profile. If crd0data
cannot be read it throws `NotAvailableException` (HTTP 501) BEFORE fetching any
transactions, so the screen shows nothing rather than an unnamed customer — a
guard against the view regressing, not an expected state.

### 21.2 Historical & merchant statements — genuinely not in this codebase

- **Historical statement**: no C handler anywhere — verified by sweeping the
  whole `CSD C Code` tree AND `cbrt01.c` for `histstmt`/`stmtFile`/`zipFileNo`,
  zero hits. This one really is VB-only (frmHistStmt.frm), and it never queried a
  database. Served now from **DB #3** (a separate Oracle instance) by
  `JdbcStatementRepository`.

  The legacy had **two sources on the one screen**, chosen by separate buttons:
  - **Branch** — `generateReport` (:1252) loops YYYYMM and opens
    `<stmtPath><brn3>\s<brn3><bmYY><MM>.idx`; each Btrieve row names a zip
    volume `.0<zipFileNo>` and a member `stmtFile`, which is unzipped,
    `lanfix`ed for `stmtSpec.lang` and `fmerge`d into `prtall.$s!`. Several rows
    per account per month are normal — the `Do While … BGETNEXT` merges them in
    sequence, which is what `HistoricalStatement.pageCount` records.
  - **Head Office** — `reqPath\prtall.$s!`, a pre-merged file DELIVERED by HO
    and requested over FTP (`cmdFtp` → `frmSendFile`); missing, the screen says
    "Please call HO".

  That two-source split is the antecedent of the screen's BM/PDP selector and a
  hypothesis for the DB #3 pairing (BM ≈ branch, PDP ≈ HO) — see
  `JdbcStatementRepository`. **Descoped deliberately**: Analyse (an `analyse`
  utility over the merged print file → `prtall.$a!` / `prtall.$h!`, four
  buttons) and the FTP request, both of which act on rendered text on a mapped
  drive. **To-date defaults to 2009/07**, as the legacy hardcodes it — the BM
  archive stops at the Finacle cutover, and the measured views span 1992-2009.
- **Merchant statement**: no C handler either — same sweep, same zero hits. It
  lives in the acquiring/POS system entirely, reached over a THIRD socket whose
  host/port come from `mrchdata.ini` (not `statdata.ini`). Here it is only
  authority role 81, and the port stops at `MerchantRepository`: the mock stands
  in for that system, `UnavailableMerchantRepository` answers under denodo.

  Two details a real client must not lose. **Both dates are shifted forward one
  month** before they go on the wire — `incMonth` on the from-date plus `"01"`,
  `incMonth` on the to-date plus its last day (:875, :884) — so a request for
  Jan-Mar reaches the server as Feb 1 - Apr 30. And **the rows are opaque
  150-char print lines**; the acquiring system formats, paginates and totals,
  and the client spools. Neither is optional: dropping the shift returns the
  wrong months, parsing the lines invents structure that is not there.

  Error text works the OPPOSITE way round from the online gateway. There a
  numeric code arrives and the client owns the wording; here `status != "000"`
  comes with the server's own sentence in `aRemarks`/`eRemarks` and the client
  only picks by language (:421-428). `MerchantService.checkStatus` surfaces that
  sentence rather than a message of ours — inventing one would discard the only
  explanation the acquiring system gives.

## 22. Related parties — heirs/proxy, joint holders, references, owners (tier-2)

Legacy: cbsama.c — four near-identical custNo-keyed scans (key 1, 7-char partial,
ISGTEQ, 20/page), short name = `aShortName` unless blank else `eShortName`
(joint holders pick by `preferredLang` instead):

| Handler | Table | List row fields | Detail variant |
|---|---|---|---|
| processJointTabSearch | stjointtab | custNo, jointCustNo, idType, idNo, branchCode, shortName | — (record itself is the full profile) |
| processHeirTabSearch / readHeirTabInfo | stheirtab | custNo, heirNo, idType, idNo, branchCode, shortName | ⋈ stidtab (idCategory 'H') ⋈ staddrtab (addressType '05') |
| processReferenceTabSearch / readReferenceTabInfo | stcreftab | custNo, referenceNo, idType, idNo, branchCode, shortName | ⋈ stidtab ('R') ⋈ staddrtab ('02') |
| processOwnerTabSearch / readOwnerTabInfo | stowntab | custNo, ownerNo, idType, idNo, branchCode, shortName | ⋈ stidtab ('W') ⋈ staddrtab ('03' local + '04' home) |

```sql
-- list pattern (swap table/number column)
SELECT custNo, heirNo, idType, idNo, branchCode,
       COALESCE(NULLIF(TRIM(aShortName),''), eShortName) AS shortName
FROM   stheirtab
WHERE  BankingDate = :bankingDate AND custNo = :custNo
ORDER  BY custNo
OFFSET :lastRecCount ROWS FETCH NEXT 20 ROWS ONLY;

-- detail pattern: base row ⋈ stidtab (matching idCategory) ⋈ staddrtab
-- (matching addressType, addressNo = heir/reference/owner number; when
--  addrType='1' the poBox displays unitNo instead)
```
Note the ID-category / address-type code pairs: heirs H/'05', references R/'02',
owners W/'03'+'04' (local + home addresses). These also apply to signatories
(S, see §20).

---

## Cross-cutting findings for the port

1. **DB #1 covers more than expected.** Even the account grid (service 21) is fully
   local — balances/status/limits come from `gld0data`. In this extracted slice, the
   Finacle online gateway (**DB #2**) is touched only by the card-search path
   (`validateCustNo`/`validateAccNo`, gateway services 04/05).
2. **The SAMA history grid reads stacclog, not stsamaacc.** The DTO/repository
   javadocs and UI mapping notes have been corrected accordingly.
3. **Per-year archive files** (`custlog2000…`, `acclog2000…`) collapse to single
   tables (or per-year partitions with `UNION ALL`) in the new DB.
4. **Account status char lives in a field named `passwd`** in gld0data — beware when
   mapping columns.
5. **Number-form conversions** (`actualToBmAcc/Cust`, `bmAccToActual`, `bmDateToActual`)
   must be reimplemented. `cbslib/` DOES exist (inside `docs/CSD C Code/cbslib/`) with
   `stlayout.h` (93 ISAM record structs) and the layout headers; only
   `greghijri`/`usr_util` are object-files-without-source — and Java's built-in
   `java.time.chrono.HijrahChronology` replaces the Hijri conversion anyway.
6. **Search timeout** in customer search sets `incompleteFlag='1'` on a partial page —
   worth a query timeout + partial-result convention in the API.
7. **Archival schema gaps (raise with the DB team):** `bkd0data` and `ccarrblk` are
   read by the blocked-amount breakup but are absent from the workbook's 106 tables.
8. **One integration survives the DB consolidation:** live SADAD bill enquiry
   (Tuxedo `UTBLENQ`/`SADBILLENQ`), which neither DB #1 nor DB #2 can serve. The
   on-demand statement was previously listed here as a second one; that was wrong —
   `cbrt01.c` serves services 07 and 11 from local gld0data/crd0data/thd0data, so both
   are DB #1 work. See §21.1.
9. **Tier-1 is otherwise DB #1 territory:** SARIE transfers (rid0data), BM
   transactions AND the two cbrt01 enquiries — on-demand statement and transaction
   inquiry — (thd0data + type-1 continuation rows), cards (stcardtab/stcardlog —
   the workbook already carries the CBS-era coreCustNo/coreAccNo columns),
   signatories (stsigntab⋈stidtab), SADAD history (stsadadlog), stop-cheque /
   standing-order / cheque-book details. Only the card screens' customer header
   needs DB #2.
