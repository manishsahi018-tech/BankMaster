---
name: verify
description: Build, launch and drive the bank-ui + bank-api stack to verify changes end-to-end in a headless browser.
---

# Verify BankSystem changes

## Launch (two servers)

```bash
# Java backend (mock repositories, no DB needed) — port 8085
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-25.jdk/Contents/Home
cd bank-api && "$HOME/Developer/tools/apache-maven-3.9.16/bin/mvn" -q package -DskipTests
"$JAVA_HOME/bin/java" -jar target/bank-api-0.1.0-SNAPSHOT.jar   # background

# React frontend — port 5199
cd bank-ui && npx vite --port 5199 --strictPort                  # background
```

**JDK 25, not 21.** `pom.xml` sets `<java.version>25</java.version>`, so the
jar carries class file version 69 and a JDK 21 runtime rejects it with
`UnsupportedClassVersionError ... only recognizes class file versions up to
65.0`. Running `mvn package` under JDK 21 does NOT surface this — without
`clean` it reuses the existing JDK 25 `.class` files, appears to succeed, and
fails only at launch. If you must switch JDKs, `mvn clean package`.

The API base URL is `http://localhost:8085` (`src/api.ts:35`, overridable via
`VITE_API_URL`); Vite proxies nothing, the UI calls it cross-origin.

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

**Authority gating cannot be tested through login right now.** The LDAP/JWT
revamp issues one interim admin authority to every user, so DEVUSER, OPER1,
ENQ1 and MERCH1 all come back with
`~00~01~02~04~06~32~41~42~43~45~50~60~61~62~81~86~87~94~` regardless of their
`MockUserProfileRepository` entry — the per-user descriptions above are what
the mocks *say*, not what the running app does. To exercise a gate, log in
normally for a real JWT and then rewrite just the authority:

```js
await page.evaluate((auth) => {
  const s = JSON.parse(sessionStorage.getItem('csd.session'))
  s.authorityLevel = auth
  sessionStorage.setItem('csd.session', JSON.stringify(s))
}, '~81~')
await page.reload({ waitUntil: 'networkidle0' })
```

Seeding `csd.session` WITHOUT logging in does not work: `initCodes()` calls
`/api/codes`, the 401 hits `onUnauthorized()` in `api.ts:86`, and the session
is signed straight back out to the logon window. The JWT lives separately in
`csd.token`.

## Drive (puppeteer-core, already in bank-ui devDependencies)

Chrome binary: `/Applications/Google Chrome.app/Contents/MacOS/Google Chrome`.
From a script outside bank-ui, resolve the package with
`createRequire('<repo>/bank-ui/package.json')`.

After a navigation click, wait ~700ms for the API round-trip before reading
the grid. Track backend traffic with
`page.on('request', r => r.url().includes(':8085') && ...)`.

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
- Search screen → **Merchant** (needs `~81`) → Merchant Statement Printing, a
  self-contained form (no customer context). **Generate Statement** always
  fails with `MerchantSourceUnavailable` — the acquiring/POS source does not
  exist here, so only validation and the ~81 gate are testable end to end; to
  exercise the report, View and Print, temporarily make `fetchStatement()`
  return sample lines and revert afterwards.
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
- Print sheets (`.print-sheet` in `index.css`) are `display:none` on screen.
  To check one, `await page.emulateMediaType('print')` before the screenshot
  and switch back to `'screen'` after — and note a `.print-sheet pre` still
  matches a bare `section pre` selector even while hidden.
