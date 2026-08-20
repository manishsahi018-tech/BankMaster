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
4b. Edit bank-runtime.properties: list the user IDs allowed to log in, and
   set the restore snapshot (banking-date). See "Changing settings while the
   app is running" below - you can also leave it for later and change it
   without stopping anything.
5. Run run-denodo.bat, then open http://localhost:8080/api/health/db in a
   browser BEFORE using the UI. It must show "ok": true for archival, the
   resolved bankingDate, and a customers row count.
6. Open http://localhost:8080 and compare a known customer against the old
   application. Please specifically check:
   - a customer with a NEGATIVE account balance
   - a customer number above 1,000,000
   (these verify whether the Denodo views hold decoded values or raw
   BankMaster encodings — see bank-api/README.md)

Changing settings while the app is running
-----------------------------------------
Two settings live in bank-runtime.properties (this folder) instead of inside
the jar, because they are the ones that get changed in service:

    allowed-users   who may log in, comma-separated. BLANK = anyone who
                    authenticates gets in, which is a dev convenience only.
                    e.g.  allowed-users=DEVUSER,OPER1,ENQ1
    banking-date    the restore snapshot every screen reads. Write it exactly
                    as the Denodo views store it - 2009-07-11 for a DATE
                    column, 20090711 for a YYYYMMDD string.

Edit the file in Notepad and SAVE IT. Within a second the next login sees the
new list and the next query uses the new date. Do not restart the API, do not
close anyone's session - there is nothing else to do.

Nothing else moved: the Denodo URL, the user, the password and the port are
startup settings and still need run-denodo.bat to be stopped and started.

If you mistype something - a date in the wrong format, a broken line - the
edit is REFUSED and the app keeps running on the values it already had. The
application log says what was wrong and which values are still in force.
Correct the file and save it again.

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
