@echo off
REM BankSystem enquiry app — real Denodo connection (Windows).
REM Edit the three values below, then double-click this file.
REM Needs Java 21 on PATH (or set JAVA below to the full java.exe path).

set ARCHIVAL_DB_URL=jdbc:vdb://DENODO-HOST:9999/VDB_NAME
set ARCHIVAL_DB_USER=YOUR_USER
set ARCHIVAL_DB_PASSWORD=YOUR_PASSWORD

REM The restore snapshot is NOT set here. It lives in bank-runtime.properties
REM (this folder, created on the first run) so it can be changed WHILE THE APP
REM IS RUNNING - edit, save, done. No restart.

REM Active Directory login. Who may log in is the AD group below (its CN; a
REM user must be a direct member). Blank = every AD-authenticated user.
REM set BANK_LDAP_ENABLED=true
REM set BANK_LDAP_URL=LDAP://dc01.example.com/DC=example,DC=com
REM set BANK_LDAP_DOMAIN=example.com
REM set BANK_LDAP_REQUIRED_GROUPS=BankMaster-Users

REM Once DB #2 exists (any JDBC engine), also set:
REM set ONLINE_DB_URL=...
REM set ONLINE_DB_USER=...
REM set ONLINE_DB_PASSWORD=...
REM set ONLINE_DB_DRIVER=...

set JAVA=java
%JAVA% -Dloader.path=drivers -jar bank-api-0.1.0-SNAPSHOT.jar --spring.profiles.active=denodo
pause
