#!/bin/bash
# ======================================================
# Simple Log Rotation Script
# Lab 37 - Cron Automation
# ======================================================

LOG_DIR="/home/$(whoami)"
MAX_SIZE=1048576  # 1MB in bytes

for log_file in "$LOG_DIR"/*.log; do
    if [ -f "$log_file" ] && [ $(stat -c%s "$log_file") -gt $MAX_SIZE ]; then
        mv "$log_file" "${log_file}.old"
        touch "$log_file"
        echo "$(date): Rotated $log_file" >> "$LOG_DIR/rotation.log"
    fi
done
