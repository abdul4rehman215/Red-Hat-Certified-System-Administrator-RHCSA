#!/bin/bash
# ==============================================================
# Lab 36: System Health Check Report (journalctl-based)
# ==============================================================

echo "=== System Health Report ==="
echo "Generated on: $(date)"
echo "Hostname: $(hostname)"
echo ""

echo "=== Disk Usage for Journal ==="
sudo journalctl --disk-usage
echo ""

echo "=== Recent Critical Errors ==="
sudo journalctl -p crit --since "24 hours ago" --no-pager
echo ""

echo "=== Failed Services ==="
sudo systemctl --failed
echo ""

echo "=== Recent Boot Information ==="
sudo journalctl -b --no-pager | head -20
echo ""

echo "=== Authentication Failures (Last 24 Hours) ==="
sudo journalctl --since "24 hours ago" | grep -i "authentication failure" | tail -10
echo ""

echo "=== System Resource Warnings ==="
sudo journalctl --since "24 hours ago" | grep -i "memory\|disk\|cpu" | grep -i "warning\|error" | tail -10
echo ""

echo "=== Report Complete ==="
