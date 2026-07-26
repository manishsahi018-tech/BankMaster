---
name: verify
description: Build, launch and drive the bank-ui + bank-api stack to verify changes end-to-end in a headless browser.
---

# Verify BankSystem changes

## Launch (two servers)

```bash
# Java backend (mock repositories, no DB needed) — port 8080
export JAVA_HOME="$HOME/Developer/tools/jdk-21.0.11+10/Contents/Home"
cd bank-api && "$HOME/Developer/tools/apache-maven-3.9.16/bin/mvn" -q package -DskipTests
"$JAVA_HOME/bin/java" -jar target/bank-api-0.1.0-SNAPSHOT.jar   # background

# React frontend — port 5199
cd bank-ui && npx vite --port 5199 --strictPort                  # background
```

The app boots to the LOGON WINDOW (`src/screens/Login.tsx` → `POST
/api/login`); every flow starts by logging in. Mock users (password
`Passw0rd` for all, `MockAuthenticator` / `MockUserProfileRepository` in
bank-api): **DEVUSER** full authority, **OPER1** branch operator (no
teller ops — Standing Order / Stop Cheque / Destroy Cheque disabled),
**ENQ1** enquiry-only (~99), **MERCH1** merchant-only (Customer search
disabled), **NOAUTH1** fails the privilege gate, **LOCKED1** / **CLOSED1**
locked / closed accounts. Fill the two `form input`s (User Id text,
Password password), click **Login** (the only button on the form);
**Sign out** in the TopNav returns to the logon window. With the API down, login fails with the fetch error in
the form banner — there is no offline fallback session. Screens fetch
real data from bank-api on navigation (`goFetch` in `App.tsx`); with the
API down, navigation shows an error banner and stays put.

## Drive (puppeteer-core, already in bank-ui devDependencies)

Chrome binary: `/Applications/Google Chrome.app/Contents/MacOS/Google Chrome`.
From a script outside bank-ui, resolve the package with
`createRequire('<repo>/bank-ui/package.json')`.

After a navigation click, wait ~700ms for the API round-trip before reading
the grid. Track backend traffic with
`page.on('request', r => r.url().includes(':8080') && ...)`.

Navigation map (button labels, exact text):
- Search screen → results: fill `#customerNo` (or `#idNumber`), click **Customer**
- Search screen → account grid: fill `#customerNo`, click **Account**
- Results → **Customer Update History** (stcustlog grid)
- Account grid → **Account Update History**, **Cheque Book Request**,
  **Standing Order**, **Stop Cheque**, **Enquiry** (→ Account Maintenance,
  which has the SAMA status history button)
- Stop Cheque / Standing Order grids → select row → **Enquiry** (detail screens)
- Cheque Book grid → select row → **History** (lifecycle detail)
- Account grid → **Blocked Amount Breakup**, **BM Transaction Enquiry** and
  **Transfer Enquiry** (self-fetching screens: fill dates, click **Fetch
  Transactions** / **Fetch Transfers**, select row → **Transaction Detail** /
  **Transfer Detail** renders inline; **Return** restores the grid)
- Search screen → fill `#customerNo` → **ATM Cards** (card grid; card numbers
  masked) → **Card Detail** / **Card / Pin History** / **Update History**
- Search screen → fill `#cardNumber` (4489370001234567890) → **Account**
  resolves the card to its customer, then the account grid
- Cust/Acct Update History → select row → **View Details** opens the profile /
  account screen in history mode (amber "History — record as of" banner;
  account snapshot overrides come from `/api/accounts/{accNo}/snapshot/{dt}`)
- Account Maintenance → **A/C Status History** (stacclog requestType 0 grid,
  with Reason column; SAMA variant is the neighbouring button)
- Juristic profile (0417003) → **Next Page** → "Account Details" page 2
  (frmJuristicAccountInfo, read-only) → **Previous Page** returns
- NOTE: grid/detail column headers and kickers are CSS-uppercased —
  `innerText` sees "REASON FOR CHANGING"; form field values live in
  `input.value`/`select.value`, NOT in `innerText`
- Account Maintenance → **Signatory** (rows exist for account 01008078394503)
  → select row → **Enquiry**; **ATM Card** also opens the card grid
- Results → **Enquiry** routes by customer type: mainCategory ≠ 01 → juristic
  profile (0417003, has **Owner / Management** + **References** + **Accounts**);
  mainCategory 01 + idType ≠ 'I' → read-only Others profile (0415742, has
  **Heirs / Proxy**, **References**, **Joint Holders**); else the editable
  Saudi profile (0415741, same three related-party buttons in its footer)
- Detail screens use **Return**; profile screens use **Back**; grids use
  **Exit**; **Cancel** on results returns to search

Capture `page.on('pageerror')` — screens build grid columns at module scope
from `src/schema/` (see `column()` in `src/schema/helpers.ts`), so a bad
field name crashes the whole app to a blank page.

## Gotchas

- bank-api mock rows are shaped like archival records (raw
  YYYYMMDD / YYYYMMDDHH24MISS values); the UI formats them via schema
  helpers, so grids show `28/05/2002 22:04:19`, not the raw string.
- The workbook mistypes `stchqtab.chequeNoFrom/To` as Date — ChequeBookGrid
  overrides their render; watch for the same on other 8-digit non-date fields.
- Reference-data codes load once at boot (`initCodes()` in main.tsx from
  `/api/codes`); `codeLabel`/`codeOptions` must be called at RENDER time —
  module-scope calls run before the fetch resolves and silently fall back.
- All tables page at 10 rows (`PAGE_SIZE`/`Pager` in `GridScreen.tsx`,
  reused by EnquirySelect): the pager footer (Showing X–Y of N, ‹ Previous /
  Next ›) appears once more than 10 rows are loaded. **More** still fetches
  the next 10 from the server on search results and the cust/acct/card
  update histories (server `PagedResult.PAGE_SIZE` = 10; mock cust history
  has 25 rows → two More clicks = 3 pages); other grids page client-side
  over the full fetched list.
