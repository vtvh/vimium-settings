#!/bin/bash

# This script lists user defined search engines in Chromium.
# It replaces {inputEncoding}, which appears in some search engine definitions, with
# UTF-8, {google:baseURL} with the Google URL, and omits other such tokens.

# Location of Chromium's 'Web Data' SQLite3 file
CHROMIUM_WEB_DATA="C:\Users\andre\AppData\Local\Google\Chrome\User Data\Default\Web Data"

# Location to create temporary copy of 'Web Data', since the database is locked while
# Chromium is running
COPY=$(mktemp)

cp "$CHROMIUM_WEB_DATA" "$COPY"

sqlite3 "$COPY" <<COMMANDS |
.echo off
.separator ': '
select keyword, url from keywords;
.quit
COMMANDS
    sed -e \ '
s#{searchTerms}#%s#g
s#{google:baseURL}#https://google.com/#g
s#{inputEncoding}#UTF-8#g
s#&?[^{}?&]\+={[^}]\+}##g
s#{[^}]\+}##g
'
rm "$COPY"
