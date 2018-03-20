#!/bin/bash
set -u

YEAR=$(date +'%Y')
SUMMARY_FILEPATH="doc/$YEAR/$(date +'%Y-%m-%d').md"
LAST_SUMMARY_DATE=$(basename $(ls doc/*/*-*.md | sort | tail -1 ) .md)

if [ ! -d "doc/$YEAR" ]; then
    mkdir -p "doc/$YEAR"
fi

if [ -e "$SUMMARY_FILEPATH" ]; then
    rm "$SUMMARY_FILEPATH"
fi

cp template.md "$SUMMARY_FILEPATH"
./upload_report.py "$LAST_SUMMARY_DATE" >> "$SUMMARY_FILEPATH"
