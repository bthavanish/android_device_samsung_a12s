#!/bin/bash
# extract-files.sh - Extract proprietary blobs from Samsung Galaxy A12s
#
# Usage:
#   ./extract-files.sh [adb_serial]
#
# This script pulls proprietary blobs from a stock Samsung A12s
# connected via ADB. The blobs are placed in the vendor directory
# and are NOT committed to git.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENDOR_DIR="${SCRIPT_DIR}/../../vendor/samsung/a12s/proprietary"
PROPRIETARY_FILES="${SCRIPT_DIR}/proprietary-files.txt"

if [ ! -f "$PROPRIETARY_FILES" ]; then
    echo "ERROR: proprietary-files.txt not found at ${PROPRIETARY_FILES}"
    exit 1
fi

ADB="adb"
if [ -n "$1" ]; then
    ADB="adb -s $1"
fi

echo "=== Checking ADB connection ==="
if ! $ADB get-state >/dev/null 2>&1; then
    echo "ERROR: No ADB device found. Connect a Samsung A12s via USB."
    echo "Make sure USB debugging is enabled in Developer Options."
    exit 1
fi

DEVICE_MODEL=$($ADB shell getprop ro.product.model 2>/dev/null | tr -d '\r')
echo "Connected device: ${DEVICE_MODEL}"

if [[ ! "$DEVICE_MODEL" =~ A127 ]]; then
    echo "WARNING: Device model '${DEVICE_MODEL}' doesn't look like a Samsung A127F/A127F."
    echo "Press Ctrl+C within 5 seconds to abort, or wait to continue..."
    sleep 5
fi

echo ""
echo "=== Creating vendor directory ==="
mkdir -p "$VENDOR_DIR"

echo "=== Extracting proprietary files ==="
FAIL_COUNT=0
SUCCESS_COUNT=0

while IFS= read -r line; do
    # Skip empty lines and comments
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    
    DEST_DIR="$(dirname "${VENDOR_DIR}/${line}")"
    mkdir -p "$DEST_DIR"
    
    echo -n "  Pulling ${line}... "
    if $ADB pull "/system/${line}" "${VENDOR_DIR}/${line}" >/dev/null 2>&1; then
        echo "OK"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    elif $ADB pull "/vendor/${line}" "${VENDOR_DIR}/${line}" >/dev/null 2>&1; then
        echo "OK (from vendor)"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "FAILED"
        FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
done < "$PROPRIETARY_FILES"

echo ""
echo "=== Extraction complete ==="
echo "  Success: ${SUCCESS_COUNT}"
echo "  Failed:  ${FAIL_COUNT}"
echo "  Total:   $((SUCCESS_COUNT + FAIL_COUNT))"

if [ "$FAIL_COUNT" -gt 0 ]; then
    echo ""
    echo "WARNING: Some files failed to extract. This may be normal if"
    echo "the device is running a different firmware version."
fi

echo ""
echo "=== Blob directory ==="
echo "${VENDOR_DIR}"
du -sh "${VENDOR_DIR}"
