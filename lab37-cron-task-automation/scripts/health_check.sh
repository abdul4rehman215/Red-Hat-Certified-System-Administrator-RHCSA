#!/bin/bash
# ======================================================
# System Health Check Script
# Lab 37 - Cron Automation
# ======================================================

HEALTH_LOG="/home/$(whoami)/health_check.log"

echo "=== Health Check - $(date) ===" >> "$HEALTH_LOG"

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
echo "CPU Usage: ${CPU_USAGE}%" >> "$HEALTH_LOG"

# Check memory usage
MEM_USAGE=$(free | grep Mem | awk '{printf "%.2f", $3/$2 * 100.0}')
echo "Memory Usage: ${MEM_USAGE}%" >> "$HEALTH_LOG"

# Check disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}')
echo "Disk Usage: $DISK_USAGE" >> "$HEALTH_LOG"

# Check load average
LOAD_AVG=$(uptime | awk -F'load average:' '{print $2}')
echo "Load Average:$LOAD_AVG" >> "$HEALTH_LOG"

echo "Health check completed" >> "$HEALTH_LOG"
echo "" >> "$HEALTH_LOG"
