#!/bin/sh
# BankSystem enquiry app — real Denodo connection (macOS/Linux).
# Edit the values below, then: sh run-denodo.sh
export ARCHIVAL_DB_URL="jdbc:vdb://DENODO-HOST:9999/VDB_NAME"
export ARCHIVAL_DB_USER="YOUR_USER"
export ARCHIVAL_DB_PASSWORD="YOUR_PASSWORD"
# export ARCHIVAL_BANKING_DATE=20251231   # optional fixed snapshot
# Once DB #2 exists: export ONLINE_DB_URL=... ONLINE_DB_USER=... ONLINE_DB_PASSWORD=... ONLINE_DB_DRIVER=...

exec java -Dloader.path=drivers -jar bank-api-0.1.0-SNAPSHOT.jar --spring.profiles.active=denodo
