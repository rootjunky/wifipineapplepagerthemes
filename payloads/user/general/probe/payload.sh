#!/bin/bash
# Title: Collected Probes
# Description: Collect all prodes seen in the last 12 hours by SSID
# Author: RootJunky
# Version: 1

DB="/root/recon/recon.db"
OUTPUT_DIR="/root/loot/probes"
HOURS=12  # Change this to any number of hours you want
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$OUTPUT_DIR/probes_$TIMESTAMP.txt"

# Ensure output directory exists
mkdir -p "$OUTPUT_DIR"

# Calculate seconds for the last N hours
SECONDS=$((HOURS * 3600))

id=$(START_SPINNER "Checking-Database")
# Query unique SSIDs in the last N hours
SSIDS=$(sqlite3 "$DB" "
SELECT DISTINCT
  CAST(ssid AS TEXT)
FROM ssid
WHERE (bssid IS NULL OR bssid = '')
  AND ssid IS NOT NULL
  AND TRIM(CAST(ssid AS TEXT)) != ''
  AND time >= strftime('%s','now') - $SECONDS
ORDER BY ssid ASC;
")
STOP_SPINNER $id
# Save results
if [ -z "$SSIDS" ]; then
    LOG "No probe requests in the last $HOURS hours." > "$OUTPUT_FILE"
else
    LOG "$SSIDS"
    echo "$SSIDS" > "$OUTPUT_FILE"
fi

LOG "Probe SSIDs saved to $OUTPUT_FILE"
LOG "Please Scroll UP To See SSID list"