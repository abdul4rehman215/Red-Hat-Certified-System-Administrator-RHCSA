#!/bin/bash

# ==========================================================
# Lab 34: Archive Verification Script
# File: verify_archive.sh
# Purpose: Validate tar.gz and tar.bz2 archives safely
# ==========================================================

ARCHIVE_FILE="$1"

# ------------------------------------------
# Validate Input
# ------------------------------------------
if [ -z "$ARCHIVE_FILE" ]; then
    echo "Usage: $0 <archive_file>"
    exit 1
fi

echo "Verifying archive: $ARCHIVE_FILE"

# ------------------------------------------
# Check if file exists
# ------------------------------------------
if [ ! -f "$ARCHIVE_FILE" ]; then
    echo "ERROR: Archive file not found"
    exit 1
fi

# ------------------------------------------
# Determine archive type and verify
# ------------------------------------------
if [[ "$ARCHIVE_FILE" == *.tar.gz ]]; then

    echo "Testing gzip compressed tar archive..."

    # Test archive integrity silently
    tar -tzf "$ARCHIVE_FILE" > /dev/null

    if [ $? -eq 0 ]; then
        echo "SUCCESS: Archive is valid"
        echo "Archive contains $(tar -tzf "$ARCHIVE_FILE" | wc -l) files"
    else
        echo "ERROR: Archive is corrupted"
        exit 1
    fi

elif [[ "$ARCHIVE_FILE" == *.tar.bz2 ]]; then

    echo "Testing bzip2 compressed tar archive..."

    tar -tjf "$ARCHIVE_FILE" > /dev/null

    if [ $? -eq 0 ]; then
        echo "SUCCESS: Archive is valid"
        echo "Archive contains $(tar -tjf "$ARCHIVE_FILE" | wc -l) files"
    else
        echo "ERROR: Archive is corrupted"
        exit 1
    fi

else
    echo "Unsupported archive format"
    echo "Supported formats:"
    echo "  - .tar.gz"
    echo "  - .tar.bz2"
    exit 1
fi

# ------------------------------------------
# Display Additional Metadata
# ------------------------------------------
echo ""
echo "Archive Size: $(ls -lh "$ARCHIVE_FILE" | awk '{print $5}')"
echo "Created On:  $(ls -l "$ARCHIVE_FILE" | awk '{print $6, $7, $8}')"

echo ""
echo "Verification completed successfully."
exit 0
