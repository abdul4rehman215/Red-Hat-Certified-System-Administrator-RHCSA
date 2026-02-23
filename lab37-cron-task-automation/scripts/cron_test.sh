#!/bin/bash
# ======================================================
# Cron Job Testing Script
# Lab 37 - Cron Automation
# ======================================================

LOG_FILE="/home/$(whoami)/cron_test.log"
TEST_FILE="/home/$(whoami)/cron_test_output.txt"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S'): $1" >> "$LOG_FILE"
}

# Test basic functionality
log_message "Cron test script started"

# Test environment variables
log_message "USER: $USER"
log_message "HOME: $HOME"
log_message "PATH: $PATH"
log_message "PWD: $PWD"

# Test file operations
echo "Cron test executed at $(date)" >> "$TEST_FILE"

# Test command execution
UPTIME_INFO=$(uptime)
log_message "System uptime: $UPTIME_INFO"

# Test error handling
if [ -w "$LOG_FILE" ]; then
    log_message "Log file is writable - OK"
else
    log_message "ERROR: Cannot write to log file"
fi

log_message "Cron test script completed"
