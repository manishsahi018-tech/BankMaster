@echo off
REM BankSystem enquiry app — real Denodo connection (Windows).
REM Edit the four values below, then double-click this file.
REM Needs Java 21 on PATH (or set JAVA below to the full java.exe path).

set ARCHIVAL_DB_URL=jdbc:vdb://DENODO-HOST:9999/VDB_NAME
set ARCHIVAL_DB_USER=YOUR_USER
set ARCHIVAL_DB_PASSWORD=YOUR_PASSWORD
REM Optional fixed restore snapshot (YYYYMMDD); leave unset to auto-detect:
REM set ARCHIVAL_BANKING_DATE=20251231

REM Once DB #2 exists (any JDBC engine), also set:
REM set ONLINE_DB_URL=...
REM set ONLINE_DB_USER=...
REM set ONLINE_DB_PASSWORD=...
REM set ONLINE_DB_DRIVER=...

set JAVA=java
%JAVA% -Dloader.path=drivers -jar bank-api-0.1.0-SNAPSHOT.jar --spring.profiles.active=denodo
pause
