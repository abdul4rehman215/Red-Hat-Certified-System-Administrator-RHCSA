#!/bin/bash
# ======================================================
# Cron Job Status Dashboard
# Lab 37 - Cron Automation
# ======================================================

echo "=================================="
echo " CRON JOB STATUS DASHBOARD"
echo "=================================="
echo "Generated on: $(date)"
echo

# Show current user's cron jobs
echo "Current User Cron Jobs:"
echo "----------------------"
crontab -l 2>/dev/null || echo "No cron jobs found for current user"
echo

# Show recent cron activity
echo "Recent Cron Activity (last 10 entries):"
echo "---------------------------------------"
sudo grep CRON /var/log/messages 2>/dev/null | tail -10 || \
sudo journalctl -u crond --no-pager -n 10 2>/dev/null || \
echo "Unable to access cron logs"
echo

# Show at jobs
echo "Pending 'at' Jobs:"
echo "------------------"
atq 2>/dev/null || echo "No pending at jobs"
echo

# Show cron service status
echo "Cron Service Status:"
echo "-------------------"
systemctl is-active crond 2>/dev/null || echo "Unable to check service status"
echo

# Check for common cron files
echo "System Cron Files:"
echo "-----------------"
ls -la /etc/cron* 2>/dev/null | head -10
echo

echo "Dashboard generation completed."
