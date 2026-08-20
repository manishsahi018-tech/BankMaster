#!/bin/sh
# BankSystem enquiry app — real Denodo connection (macOS/Linux).
# Edit the values below, then: sh run-denodo.sh
export ARCHIVAL_DB_URL="jdbc:vdb://DENODO-HOST:9999/VDB_NAME"
export ARCHIVAL_DB_USER="YOUR_USER"
export ARCHIVAL_DB_PASSWORD="YOUR_PASSWORD"
# The login allow-list and the restore snapshot are NOT set here: they live in
# bank-runtime.properties (this folder, created on the first run) so they can be
# changed WHILE THE APP IS RUNNING - edit, save, done. No restart.
# One connection only: the online/Finacle source was the same Denodo server, so
# DB #1 and DB #2 are merged. Nothing else to export here.

exec java -Dloader.path=drivers -jar bank-api-0.1.0-SNAPSHOT.jar --spring.profiles.active=denodo
