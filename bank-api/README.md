# bank-api

Java 21 / Spring Boot enquiry API for the CSD revamp — the modern replacement
for the legacy `cbcmssrv` Tuxedo/socket server (`docs/CSD C Code`).

## Build & run

No system-wide Java is required; a local toolchain lives in `~/Developer/tools`:

```bash
export JAVA_HOME="$HOME/Developer/tools/jdk-21.0.11+10/Contents/Home"
alias mvn="$HOME/Developer/tools/apache-maven-3.9.16/bin/mvn"

mvn package -DskipTests
java -jar target/bank-api-0.1.0-SNAPSHOT.jar     # serves http://localhost:8080
```

With no profile the app runs on the **mock** fixtures (no database needed).
CORS is open to the bank-ui dev server (localhost:5173 / 5199).

Interactive API explorer (Swagger UI): **http://localhost:8080/swagger-ui.html**
— every endpoint below can be called directly from the browser ("Try it
out"). Raw OpenAPI JSON at `/v3/api-docs`.

## Deploying against Denodo (target PC)

The real data layer is the `denodo` Spring profile: one JDBC connection,
`archival-db` (DB #1, Denodo Hive views of the BM archival schema), which every
repository queries. The online/Finacle source (DB #2) has no connection of its
own — it was the same Denodo server, so the two are merged; the screens that
need gateway data report themselves unavailable instead. Historical Statement
has its own optional Oracle connection (DB #3, off by default). All settings
come from environment variables (see `application.yml`), so nothing is
hardcoded or committed.

1. **Java 21** on the PC (copy the `~/Developer/tools` JDK if none installed).
2. **Denodo JDBC driver**: copy `denodo-vdp-jdbcdriver.jar` from the Denodo
   installation (or Design Studio download page) into a `drivers/` folder
   next to the app jar. It is not on Maven Central, so it is loaded at
   runtime — the jar is built with the PropertiesLauncher (`ZIP` layout)
   for exactly this. Same folder for any other engine's driver (Oracle's, if
   Historical Statement is switched on).
3. **Configure + run**:

   ```bash
   export ARCHIVAL_DB_URL="jdbc:vdb://<denodo-host>:9999/<vdb-name>"
   export ARCHIVAL_DB_USER="..."
   export ARCHIVAL_DB_PASSWORD="..."

   java -Dloader.path=drivers -jar bank-api-0.1.0-SNAPSHOT.jar \
        --spring.profiles.active=denodo
   ```

   The restore snapshot and the login allow-list are **not** environment
   variables: they live in `bank-runtime.properties` next to the jar, created
   with a documented template on first start.

   ```properties
   allowed-users=DEVUSER,OPER1,ENQ1   # blank = allow every authenticated user
   banking-date=2009-07-11            # blank = MAX(BankingDate) from stcusttab
   ```

   Edit and save that file **while the API is running** — the next login sees
   the new list and the next query binds the new date, within a second. Nothing
   else moved out of `application.yml`: database URLs, credentials, JWT settings
   and ports are startup configuration and still need a restart. A file that
   fails to parse (or a `banking-date` that is neither `yyyy-MM-dd` nor
   `yyyyMMdd`) is rejected with an error in the log and the previously loaded
   values stay in force, so a typo cannot take a running application down.

4. **Smoke test before opening the UI**: `curl http://localhost:8080/api/health/db`
   — reports both connections, the resolved BankingDate and the stcusttab
   row count.

### The error reference

An unexpected failure never sends its stack trace to the browser. `ApiExceptionHandler`
mints a six-character reference (`SecureRandom` over `ABCDEFGHJKLMNPQRSTUVWXYZ23456789`
— no vowels, no `0/O` or `1/I`, so it survives being read aloud), returns it to the
SPA as the `reference` property of the `ProblemDetail`, and logs the exception
against it:

```
ERROR c.b.a.p.rest.ApiExceptionHandler : [KQ7MTX] Unhandled
CannotGetJdbcConnectionException on GET /api/customers/0415741/accounts
```

That log is `logs/bank-api.log` (relative to the working directory), rolling at
20MB and keeping 30 days. **Archives are deliberately not gzipped** — Windows has
no `zgrep`, and an archive the help desk cannot search is the same as no log at
all — so `findstr /S KQ7MTX logs\*` finds a reference wherever it landed.

Two limits worth knowing. Only the `RuntimeException` catch-all (HTTP 500) mints a
server reference; 4xx and 501 carry ported business messages and deliberately have
none. And when the request never reached the API, `clientReference()` in
`bank-ui/src/api.ts` mints one with the same alphabet that exists **only** in the
browser console — a reference that yields no server hit means "look in DevTools",
not "the log is broken". Nothing in the code distinguishes the two on sight.

Still pending on this path: real authentication (login still uses the
in-memory `MockAuthenticator` demo users — LDAP decision open), the
`bkd0data`/`ccarrblk` schema gap (blocked-amount screen degrades
gracefully), and the SADAD live bill gateway.

## SQL audit log (which queries ran behind an API call)

Off by default. Switched on, every `/api/**` call and each statement it issued
is appended to a file of its own — never to the console, never mixed into the
application log:

```bash
export BANK_SQL_LOG=true
# optional: default is logs/bank-api-sql.log, relative to the working directory
export BANK_SQL_LOG_FILE=logs/bank-api-sql.log
java -Dloader.path=drivers -jar bank-api-0.1.0-SNAPSHOT.jar --spring.profiles.active=denodo
```

```
2026-08-19 14:22:01.412 [r-7f] >>>> GET /api/customers/0123456/profile user=DEVUSER
2026-08-19 14:22:01.502 [r-7f] SQL #1 · archival · 1 row · 84 ms
    SELECT c.custNo, c.name1 FROM bv_impala_stg_bankmaster_stcusttab c
    WHERE c.custNo = '0123456' AND c.BankingDate = '2009-07-11'
2026-08-19 14:22:01.560 [r-7f] <<<< 200 · 1 query · 148 ms
```

The SQL is what the JDBC driver received — Denodo view prefixes already
applied — with the bound values substituted for their `?`, so an entry can be
pasted into Design Studio and run as it stands. Values keep their JDBC type:
strings are quoted (`'0123456'` — the leading zeros the BM keys depend on
survive), numbers are bare, a null binding is `NULL`. Only a real placeholder is
replaced; a `?` inside a string literal, a quoted identifier or a comment is left
alone. If the substitution does not line up exactly (a `?` left over, or a value
with no `?`), the raw bindings are printed on an `ARGS` line as well and the
inlined text should not be trusted.

`archival` / `statement` names the connection, and the `[r-NN]` id ties a query
to its request when several operators are working at once. A request that ran no
query still gets its two lines, which is how you tell "no SQL was issued" from
"the SQL returned nothing".

Rolls at `BANK_SQL_LOG_MAX_MB` (50) keeping `BANK_SQL_LOG_HISTORY` (3) files.
Mechanism: `infrastructure/sqllog` — a servlet filter opens the entry,
`SqlLoggingDataSource` proxies the datasource underneath the table prefixer.
Only the `denodo` profile has a database, so on mock you get the request lines
and nothing else.

**This file holds live bank data.** Bound values are written in the clear, so
an enabled log contains real customer, account and ID numbers: keep it off
shared paths and delete it when the diagnosis is done. It is a diagnostic
switch, not something to leave on.

## Endpoint ↔ legacy service-code map

| Endpoint | Legacy service (cbrouter.c) | Legacy module | Data source |
|---|---|---|---|
| `POST /api/login` | 00 logon (`reqMsgLogin`/`resMsgLogin`) | cblogin.c | LDAP bind (mock `Authenticator`) + user profile (`MockUserProfileRepository`) |
| `GET /api/session` | 00 login (`resMsgLogin`) | cblogin.c | Dev fallback only — UI now logs in via `POST /api/login` |
| `GET /api/customers?custNo=…&idNo=…&page=` | 16 customer search (`reqMsgSearch`) | cbbranch2.c | DB #1 `stcusttab` |
| `GET /api/customers/{custNo}/update-history` | 67 customer history | cbbranch2.c | DB #1 `stcustlog` |
| `GET /api/customers/{custNo}/accounts` | 21 account search | cbbranch2.c | DB #1 `gld0data` (fully local — no gateway) |
| `GET /api/accounts/{accNo}/update-history` | 57 requestType 2 | cbothers.c getAcctStatusHistory | DB #1 `stacclog` |
| `GET /api/accounts/{accNo}/status-history` | 57 requestType 0 | cbothers.c getAcctStatusHistory | DB #1 `stacclog` (statusChanged='1', incl. reason) |
| `GET /api/accounts/{accNo}/snapshot/{dateTime}` | 33 requestType 01 | cbbranch2.c processAccPendingDetail | DB #1 `stacclog` / `acclogYYYY` (history mode) |
| `GET /api/customers/{custNo}/profile-asof/{dateTime}` | 11 requestType 01 | cbbranch.c processSupervisorAction | DB #1 `stcustlog` / `custlogYYYY` (history mode) |
| `GET /api/customers/{custNo}/juristic-account-info` | juristic page 2 | cbjuristic.c | DB #1 `stcusttab` (frmJuristicAccountInfo fields) |
| `GET /api/accounts/{accNo}/chequebook-requests` | cheque book grid | cbbranch2.c | DB #1 `stchqtab` |
| `GET /api/accounts/{accNo}/standing-orders` | `reqMsgStdOrdSearch` | cbbranch2.c | DB #1 `sod0data` |
| `GET /api/accounts/{accNo}/stop-cheques` | stop cheque search | cbbranch2.c | DB #1 `pyd0data` |
| `GET /api/accounts/{accNo}/sama-status-history` | 57 requestType 1 | cbothers.c getAcctStatusHistory | DB #1 `stacclog` (SAMA columns — not stsamaacc) |

The rest of the endpoints, specified in QUERY-SPECS.md Part 2. That part calls
them the "tier-1 missing screens" because none of them existed when it was
written; all of them are built now — every row below is reachable in bank-ui
(see the navigation map in `.claude/skills/verify/SKILL.md`). They are listed
apart from the table above only because they answer to no single cbrouter
service code, so the spec section is the reference instead:

| Endpoint | Spec | Data source |
|---|---|---|
| `GET /api/accounts/{accNo}/stop-cheques/{chequeNo}` | §10 | DB #1 `pyd0data` + `ststchqlog` |
| `GET /api/accounts/{accNo}/standing-orders/{sodNo}` | §11 | DB #1 `sod0data` ⋈ `gld0data` ⋈ `stcusttab` ⋈ `stsodlog` |
| `GET /api/accounts/{accNo}/chequebook-requests/{reqDate}/history` | §12 | DB #1 `stchqtab` |
| `GET /api/accounts/{accNo}/blocked-amount-breakup` | §16 | DB #1 five-table union (⚠ `bkd0data`/`ccarrblk` missing from workbook) |
| `GET /api/cards?custNo=\|accNo=\|cardNo=` | §13 | DB #1 `stcardtab` + DB #2 customer header |
| `GET /api/cards/{cardNo}` | §14 | DB #1 `stcardtab` |
| `GET /api/cards/{cardNo}/update-history` | §15 | DB #1 `stcardlog` |
| `GET /api/cards/{cardNo}/history` | §15 | DB #1 `stcardlog` (completed only, max 50) |
| `GET /api/accounts/{accNo}/transfers?fromDate=&toDate=` | §17 | DB #1 `rid0data` |
| `GET /api/transfers/{refNo}` | §17 | DB #1 `rid0data` + `stswiftlog` pending check |
| `GET /api/accounts/{accNo}/transactions?fromDate=&toDate=` | §18 | DB #1 `thd0data` |
| `GET /api/accounts/{accNo}/transactions/{refNo}` | §18 | DB #1 `thd0data` (+ recType-1 narratives) |
| `GET /api/sadad/transactions` | §19 | DB #1 `stsadadlog` (live bill enquiry NOT scaffolded — SADAD gateway decision pending) |
| `GET /api/customers/{custNo}/signatories`, `GET /api/accounts/{accNo}/signatories[/{signatoryNo}]` | §20 | DB #1 `stsigntab` ⋈ `stidtab` |
| `GET /api/customers/{custNo}/profile` | §1 | DB #1 `stcusttab` (drives juristic/other-individual screens) |
| `GET /api/customers/{custNo}/heirs` | §22 | DB #1 `stheirtab` |
| `GET /api/customers/{custNo}/joint-holders` | §22 | DB #1 `stjointtab` |
| `GET /api/customers/{custNo}/references` | §22 | DB #1 `stcreftab` |
| `GET /api/customers/{custNo}/owners` | §22 | DB #1 `stowntab` |
| `GET /api/codes` | — | DB #1 `stctltab` recTypes + legacy Access combo tables (samamaincategoryinfo etc.) |

Pagination keeps the legacy's SHAPE but not its page size: the legacy server
returned 20 rows via `lastRecCount`, and the revamp standardises on 10 —
`PagedResult.PAGE_SIZE`, which says so in its own javadoc. `hasMore` = a full
page was returned; the UI's "More" button requests `page+1`.

## Architecture (onion)

Packages under `com.banksystem.api` are onion rings — dependencies only
point inward:

```
domain/           core — no framework, no I/O
  model/          enquiry records (field names = archival column names)
  repository/     data-access ports (engine-agnostic interfaces)
  auth/           Authenticator port (future LDAP bind)
application/      use-case services: pagination, validation, not-found
                  rules, the logon flow (AuthService); throws
                  NotFoundException / BadRequestException
infrastructure/   adapters implementing the domain ports
  persistence/mock/   mock repositories (→ future Jdbc*Repository)
  auth/               MockAuthenticator
presentation/     inbound HTTP adapter
  rest/           thin @RestControllers + ApiExceptionHandler
                  (maps application exceptions to 404/400)
  config/         CORS
```

Controllers hold no business rules — they bind HTTP params and delegate to
an application service; services depend only on domain ports, so swapping
the mocks for JDBC implementations touches `infrastructure/` alone.

## Data layer

`domain/repository/` holds engine-agnostic interfaces; the active
implementations under `infrastructure/persistence/mock/` return fixtures
shaped exactly like the archival records (raw `YYYYMMDD` /
`YYYYMMDDHH24MISS` strings — the UI formats them).

When the two database engines are known:
1. add the JDBC driver to `pom.xml`,
2. fill in the datasource placeholders in `application.yml`,
3. implement `Jdbc*Repository` classes under `infrastructure/persistence/`
   — **the exact queries are already
   specified in [QUERY-SPECS.md](QUERY-SPECS.md)** (extracted from the C code:
   keys, filters, pagination, field mappings and draft SQL per method),
4. remove or `@Profile("mock")` the mock repositories.

DTO field names intentionally equal the archival column names so rows bind
straight to the bank-ui grids with no mapping layer.
