# Screen Flow

How an operator moves between screens.

## 1. Starting points

Everything begins at the search screen.

```
Login
  └─> Customer Static Data  (search)
```

From there, five ways out:

| Button | Opens | Needs |
|---|---|---|
| Search | Search Results | any search criteria |
| Accounts | Account Information | a customer, account or card number |
| Cards | Card Management | a customer, account or card number |
| PDP Statement | Historical Statement Printing — PDP | nothing — keyed on the form |
| Deleted Acct | Historical Statement Printing | nothing — keyed on the form |

---

## 2. Search Results

Two actions per row:

```
Search Results
  ├─ Enquiry ─> a profile screen  
  └─ History ─> Customer Update History
```

---

## 3. Which profile screen opens

**Enquiry** does not open one fixed screen. The customer's **main category** and
**sub category** decide. The same rule picks the screen on the history route
, so a customer always reaches the same form either way.

| Main | Sub category | Opens |
|---|---|---|
| `01` | 01, 02, 59, 69, 73 | **Individual — Saudi** |
| `01` | 65 | **Individual — Saudi**, with Heirs unlocked |
| `01` | 03–09, 60–63, 70–72, 74, 84 | **Individual — Other Nationality** |
| any | 10–38, 57, 58, 64, 75, 81, 83, 87 | **Juristic** — *Customer Profile* |
| any | 41–44, 53–55, 67, 76–80, 82, 85, 86, 88 | **Juristic** — *Customer Profile* |
| any | 39, 40 | **Juristic** — *Resident Juristic Customer* |
| any | 45–52, 66 | **Juristic** — *Non-Resident Juristic Customer* |
| either code blank | | **Customer Maintenance** — the general customer form |
| `00` | 00, 56, 99 | nothing — these are create screens, not in this build |
| anything else | | nothing — a message says there is no profile screen |

Two buttons on the individual profiles depend on the sub category:

| Button | Shown for | Opens |
|---|---|---|
| Heirs | sub category `65` | Heirs / Proxy Details |
| References | sub category `02` or `63` | Reference / Legal Representative Details |

---

## 4. Individual — Saudi  ·  2 pages

```
Individual Saudi                    ← Back returns to Search Results
  │
  │ Next Page                       ↑ Previous Page
  ▼
Account Details  (page 2 of 2)      ← Cancel returns to Search Results
  ├─ Joint Account ─> Joint Account Holders ─> Joint Holder Details
  └─ Documents ─────> Documents for Sub Category
```

Page 1 also carries:

| Button | Opens |
|---|---|
| Accounts | Account Information |
| Cards | Card Management  |
| Heirs | Heirs / Proxy Details → Heir Details *(sub category 65)* |
| References | Reference Details grid → Reference Details *(sub category 02 / 63)* |

---

## 5. Individual — Other Nationality  ·  3 pages

Same as the Saudi flow with one extra page in the middle.

```
Individual Others                   ← Back returns to Search Results
  │
  │ Next Page                       ↑ Previous Page
  ▼
Customer Details  (page 2 of 3)
  │
  │ Next Page                       ↑ Previous Page
  ▼
Account Details  (page 3 of 3)      ← Cancel returns to Search Results
  ├─ Joint Account ─> Joint Account Holders ─> Joint Holder Details
  └─ Documents ─────> Documents for Sub Category
```

Pages 2 and 3 share one payload, so stepping between them makes no second server
call. Page 1 carries the same four buttons as the Saudi profile.

---

## 6. Juristic  ·  2 pages

All three headings — *Customer Profile*, *Resident Juristic Customer*,
*Non-Resident Juristic Customer* — are the same screen and the same flow.

```
Juristic Main                       ← Back returns to Search Results
  ├─ Accounts ─> Account Information 
  ├─ Owners ───> Owner / Management Details ─> Owner Details
  │
  │ Next Page                       ↑ Previous Page
  ▼
Account Details  (page 2 of 2)      ← Cancel returns to Search Results
  ├─ Signatories ─> Signatory grid ─> Signatory Details
  ├─ Owners ──────> Owner / Management Details ─> Owner Details
  └─ Documents ───> Documents for Sub Category
```

---

## 7. Customer Maintenance  ·  the general form

A customer whose category pair is blank has nothing to pick a specialised form
with, so both routes open the general one instead. It carries the personal
frames and the company frames together.

```
Customer Maintenance                ← Cancel returns to Search Results
  ├─ Account ──> Account Information
  ├─ Card Info > Card Management
  │
  │ Next Page                       ↑ Previous Page
  ▼
Account Details                     ← the same employment, income and
                                      ownership page the Saudi profile uses
```

---

## 8. The accounts branch

Opened from a profile's **Accounts** button or from the search screen. Exit
returns to whichever opened it; every sub-screen below returns to the grid.

```
Account Information  (the account grid)
  │
  ├─ Enquiry ──────────> Account Maintenance
  │                        ├─ SAMA History ───> SAMA Account Status History
  │                        ├─ Status History ─> Account Status History
  │                        ├─ Signatories ────> Signatory grid ─> Signatory Details
  │                        ├─ Cards ──────────> Card Management 
  │                        └─ Customer Info ──> the customer profile
  │
  ├─ Cheque Book ──────> Cheque Book Requests ────> Cheque Book History
  ├─ Standing Order ───> Standing Orders ─────────> Standing Order Detail
  ├─ Stop Cheque ──────> Stop Cheque Information ─> Stop Cheque Details
  ├─ Update History ───> Account Update History ──> Account Maintenance (as-of)
  ├─ Blocked Amount ───> Breakup of Blocked Amount
  │
  ├─ Transactions ─────> BM Transaction Enquiry ──> Bankmaster Transaction Detail
  ├─ Transfers ────────> Transfer Enquiry ────────> Transfer Details
  │
  ├─ Hist Statement ───> Historical Statement Printing
  ├─ OnLine Statement ─> OnLine Statement Printing
  └─ Trans Inquiry ────> Transaction Enquiry (online)
```

---

## 9. The cards branch

Opened from the search screen, an individual profile's **Cards** button, or
Account Maintenance. Exit returns to whichever opened it.

```
Card Management  (the card grid)
  ├─ Detail ─────────> Card Maintenance
  ├─ History ────────> Card / Pin History
  └─ Update History ─> Card Update History
                         └─ View ─> Card Maintenance (as-of)
```

---

## 10. History mode

Three grids let you open a record as it stood at a chosen timestamp. The screen
that opens is the ordinary one, read-only, with a banner showing the timestamp.

| Reached from | Grid | Opens as-of |
|---|---|---|
| Search Results → History | Customer Update History | the profile screen from |
| Account grid → Update History | Account Update History | Account Maintenance |
| Card grid → Update History | Card Update History | Card Maintenance |

---

## 11. Where Back and Exit go

Return paths are remembered rather than fixed — a screen goes back to whichever
screen opened it.

| Screen | Returns to |
|---|---|
| Any profile screen | Search Results, or Customer Update History if opened from there |
| Account Information | the profile that opened it, or the search screen |
| Card Management | the profile, Account Maintenance, or the search screen |
| Documents for Sub Category | the page 2 or page 3 that opened it |
| Heirs / References / Owners | the profile page that opened them |
| Signatory grid | Account Maintenance, or juristic page 2 |
| Card Maintenance | the card grid — or Card Update History when opened as-of |
| PDP / Deleted-account statement | the search screen |
| Every account sub-screen | Account Information |
