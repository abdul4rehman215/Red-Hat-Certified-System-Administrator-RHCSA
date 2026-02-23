#!/bin/bash
# ==============================================================
# Lab 36: Using journalctl for System Logs
# Environment: CentOS Stream 9 / RHEL 9
# Shell: -bash-4.2$
# ==============================================================


# ==============================================================
# TASK 1 — View and Filter Logs
# ==============================================================

# Check journald service status
sudo systemctl status systemd-journald

# View system hostname details
hostnamectl

# View all logs (opens pager)
sudo journalctl

# Follow logs in real time
sudo journalctl -f

# View logs without pager
sudo journalctl --no-pager

# Show last 20 log entries
sudo journalctl -n 20

# Show first 50 entries
sudo journalctl --no-pager | head -50


# ==============================================================
# Time-Based Filtering
# ==============================================================

# Logs from today
sudo journalctl --since today

# Logs from yesterday
sudo journalctl --since yesterday

# Logs from last hour
sudo journalctl --since "1 hour ago"

# Logs from specific date/time
sudo journalctl --since "2026-08-18 10:00:00"

# Logs between time range
sudo journalctl --since "2026-08-18 10:00:00" --until "2026-08-18 12:00:00"

# Logs from last 30 minutes
sudo journalctl --since "30 minutes ago"

# Logs until 1 hour ago
sudo journalctl --until "1 hour ago"


# ==============================================================
# Service / Unit Filtering
# ==============================================================

# SSH logs
sudo journalctl -u sshd

# NetworkManager logs
sudo journalctl -u NetworkManager

# All systemd service logs
sudo journalctl -u "*.service"

# SSH logs from today
sudo journalctl -u sshd --since today

# Multiple services
sudo journalctl -u sshd -u NetworkManager --since "1 hour ago"

# Follow SSH logs live
sudo journalctl -u sshd -f


# ==============================================================
# Priority / Severity Filtering
# ==============================================================

# Errors and above
sudo journalctl -p err

# Warnings and above
sudo journalctl -p warning

# Info level and above
sudo journalctl -p info -n 10

# Debug level
sudo journalctl -p debug -n 10

# SSH errors from today
sudo journalctl -u sshd -p err --since today

# Critical logs in last 24 hours
sudo journalctl -p crit --since "24 hours ago"


# ==============================================================
# Boot & Kernel Logs
# ==============================================================

# Current boot logs
sudo journalctl -b

# Previous boot logs
sudo journalctl -b -1

# List boots
sudo journalctl --list-boots

# Kernel logs
sudo journalctl -k | head -20


# ==============================================================
# TASK 2 — Persistent Journal Configuration
# ==============================================================

# Check disk usage
sudo journalctl --disk-usage

# View journald config
sudo cat /etc/systemd/journald.conf

# Check persistent directory
ls -la /var/log/journal/

# Check runtime journal directory
ls -la /run/log/journal/

# Verify journal integrity
sudo journalctl --verify


# --------------------------------------------------------------
# Enable Persistent Storage
# --------------------------------------------------------------

sudo mkdir -p /var/log/journal
sudo chown root:systemd-journal /var/log/journal
sudo chmod 2755 /var/log/journal

sudo cp /etc/systemd/journald.conf /etc/systemd/journald.conf.backup
sudo nano /etc/systemd/journald.conf

sudo grep -v '^#' /etc/systemd/journald.conf | grep -v '^$'

sudo systemctl restart systemd-journald
sudo systemctl status systemd-journald

ls -la /var/log/journal/

sudo journalctl --disk-usage


# ==============================================================
# Log Rotation & Retention
# ==============================================================

sudo nano /etc/systemd/journald.conf

sudo grep -v '^#' /etc/systemd/journald.conf | grep -v '^$'

sudo systemctl restart systemd-journald

# Force rotation
sudo systemctl kill --signal=SIGUSR2 systemd-journald

sudo journalctl --disk-usage
ls -lh /var/log/journal/*/


# ==============================================================
# TASK 3 — Log Investigation
# ==============================================================

# Generate test logs
logger -p user.info "Test info message for lab practice"
logger -p user.warning "Test warning message for lab practice"
logger -p user.err "Test error message for lab practice"

# Generate failed service
sudo systemctl start nonexistent-service 2>/dev/null || true

# Check recent errors
sudo journalctl -p err --since "10 minutes ago" -n 10


# --------------------------------------------------------------
# Authentication Checks
# --------------------------------------------------------------

sudo journalctl -u sshd | grep -i "failed\|error\|denied"
sudo journalctl | grep -i "authentication failure"
sudo journalctl | grep -i sudo


# --------------------------------------------------------------
# Advanced Filtering
# --------------------------------------------------------------

sudo journalctl -u sshd -o json | head -5
sudo journalctl -u sshd -o json-pretty -n 3

sudo journalctl --since "1 hour ago" | grep -i "error\|fail\|critical"
sudo journalctl --since today | grep -c -i error
sudo journalctl -p err --since today | grep -o "error.*" | sort | uniq -c


# --------------------------------------------------------------
# Resource Monitoring
# --------------------------------------------------------------

sudo journalctl | grep -i "out of memory\|oom\|memory" | head -10
sudo journalctl | grep -i "no space\|disk full\|filesystem" | head -10
sudo journalctl -u NetworkManager --since "1 hour ago"


# ==============================================================
# Health Check Script Execution
# ==============================================================

sudo nano /usr/local/bin/system-health-check.sh
sudo bash -n /usr/local/bin/system-health-check.sh
sudo chmod +x /usr/local/bin/system-health-check.sh
sudo /usr/local/bin/system-health-check.sh


# ==============================================================
# Cron Automation
# ==============================================================

echo "0 6 * * * /usr/local/bin/system-health-check.sh > /var/log/daily-health-report.log 2>&1" | sudo crontab -
sudo crontab -l


# ==============================================================
# Maintenance & Troubleshooting
# ==============================================================

sudo journalctl --vacuum-size=1G
sudo usermod -a -G systemd-journal centos
sudo systemctl restart systemd-journald
timedatectl status


# ==============================================================
# Verification
# ==============================================================

sudo journalctl --disk-usage
ls -la /var/log/journal/
sudo systemctl status systemd-journald
sudo journalctl -p err --since "1 hour ago" -n 5
ls -la /usr/local/bin/system-health-check.sh
sudo /usr/local/bin/system-health-check.sh | head -20

# End of Lab 36 commands
