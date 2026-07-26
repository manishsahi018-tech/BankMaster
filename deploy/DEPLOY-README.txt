BankSystem enquiry app — office PC deployment
==============================================

One jar serves everything: the web UI and the API, on http://localhost:8080

What you need on the PC
-----------------------
1. Java 21. Easiest: Eclipse Temurin 21 (adoptium.net) — the Windows .msi,
   or the .zip if you have no install rights (then point the JAVA variable
   in run-denodo.bat at its bin\java.exe).
2. The Denodo JDBC driver: copy denodo-vdp-jdbcdriver.jar from the Denodo
   installation (or Design Studio -> download JDBC driver) into drivers\.
3. Network access from the PC to the Denodo server (default port 9999).

Steps
-----
1. Copy this whole folder to the PC (e.g. C:\banksystem).
2. FIRST run run-mock.bat — no database needed. Open http://localhost:8080
   in a browser; log in with DEVUSER / Passw0rd. This proves Java and the
   app work on the PC.
3. Put the Denodo driver jar in drivers\.
4. Edit run-denodo.bat: set the Denodo URL, user and password.
5. Run run-denodo.bat, then open http://localhost:8080/api/health/db in a
   browser BEFORE using the UI. It must show "ok": true for archival, the
   resolved bankingDate, and a customers row count.
6. Open http://localhost:8080 and compare a known customer against the old
   application. Please specifically check:
   - a customer with a NEGATIVE account balance
   - a customer number above 1,000,000
   (these verify whether the Denodo views hold decoded values or raw
   BankMaster encodings — see bank-api/README.md)

If something fails
------------------
- /api/health/db shows an error: it is a connection/credentials/view-name
  problem — copy the full error text and send it back.
- A screen errors: the API returns the failing SQL column/table in the
  error body — copy the first error text and send it back.

Login users (until real authentication is decided): DEVUSER, OPER1, ENQ1,
MERCH1, NOAUTH1 — all with password Passw0rd. LOCKED1/CLOSED1 simulate
locked/closed accounts.

API explorer (Swagger UI): http://localhost:8080/swagger-ui.html — try any
endpoint directly from the browser; raw OpenAPI JSON at /v3/api-docs.
