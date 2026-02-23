#!/bin/bash
# ======================================================
# Disk Usage Monitoring Script
# Lab 37 - Cron Automation
# ======================================================

THRESHOLD=80
LOG_FILE="/home/$(whoami)/disk_monitor.log"

# Check disk usage for root partition
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "$(date): WARNING - Disk usage is ${USAGE}% (threshold: ${THRESHOLD}%)" >> "$LOG_FILE"
    # In real production:
    # mail -s "Disk Usage Alert" admin@example.com <<< "Disk usage is ${USAGE}%"
else
    echo "$(date): OK - Disk usage is ${USAGE}%" >> "$LOG_FILE"
fi
