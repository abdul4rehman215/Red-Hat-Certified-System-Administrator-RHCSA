#!/usr/bin/env bash
# Lab 37: Using Cron Jobs for Task Automation
# Commands-only script (copy/paste friendly). Run lines as needed.

set -euo pipefail

echo "[1] Verify cron service (crond)"
systemctl status crond || true
sudo systemctl start crond
sudo systemctl enable crond

echo
echo "[2] Understand cron syntax (concept section - no commands)"
echo "Format: * * * * * command"

echo
echo "[3] Create first cron job (uptime logger)"
crontab -e
crontab -l

echo
echo "[4] Create backup script + schedule daily at 03:00"
mkdir -p "/home/$(whoami)/backups"
nano "/home/$(whoami)/backup_script.sh"
chmod +x "/home/$(whoami)/backup_script.sh"
ls -la "/home/$(whoami)/backup_script.sh"
crontab -e
crontab -l

echo
echo "[5] Create disk monitor script + schedule hourly"
nano "/home/$(whoami)/disk_monitor.sh"
chmod +x "/home/$(whoami)/disk_monitor.sh"
crontab -e
crontab -l

echo
echo "[6] Verify atd (at service) + enable"
systemctl status atd || true
sudo yum install at -y
sudo systemctl start atd
sudo systemctl enable atd
systemctl status atd || true

echo
echo "[7] Schedule one-time jobs with at"
echo "echo 'Hello from at command!' >> /home/$(whoami)/at_test.txt" | at now + 2 minutes
echo "echo 'Scheduled task executed at $(date)' >> /home/$(whoami)/scheduled_task.txt" | at 16:30
echo "echo 'Tomorrow task: $(date)' >> /home/$(whoami)/tomorrow_task.txt" | at 10:00 tomorrow

# Heredoc job (kept as per lab)
at now + 1 minute << 'EOF'
echo "=== System Information Report ===" > /home/$(whoami)/system_report.txt
echo "Date: $(date)" >> /home/$(whoami)/system_report.txt
echo "Uptime: $(uptime)" >> /home/$(whoami)/system_report.txt
echo "Memory Usage:" >> /home/$(whoami)/system_report.txt
free -h >> /home/$(whoami)/system_report.txt
echo "Disk Usage:" >> /home/$(whoami)/system_report.txt
df -h >> /home/$(whoami)/system_report.txt
EOF

echo
echo "[8] Inspect and manage at jobs"
atq || true
at -c 1 | head -40 || true
atrm 2 || true
atq || true
atq | awk '{print $1}' | xargs -r atrm
atq || true

echo
echo "[9] Monitor cron jobs and logs (journald-based)"
crontab -l || true
sudo crontab -l || true
sudo crontab -u username -l || true

sudo journalctl -u crond -f
sudo journalctl -u crond --no-pager -n 25

echo
echo "[10] Create cron test script and schedule every 2 minutes"
nano "/home/$(whoami)/cron_test.sh"
chmod +x "/home/$(whoami)/cron_test.sh"
crontab -e
crontab -l

echo
echo "[11] Create cron dashboard script (status overview)"
nano "/home/$(whoami)/cron_dashboard.sh"
chmod +x "/home/$(whoami)/cron_dashboard.sh"
"/home/$(whoami)/cron_dashboard.sh" || true

echo
echo "[12] Verify file outputs created by cron/at jobs"
ls -la "/home/$(whoami)/system_log.txt" || true
tail -5 "/home/$(whoami)/system_log.txt" || true

ls -la "/home/$(whoami)/cron_test.log" || true
tail -10 "/home/$(whoami)/cron_test.log" || true

ls -la "/home/$(whoami)/disk_monitor.log" || true
tail -5 "/home/$(whoami)/disk_monitor.log" || true

ls -la "/home/$(whoami)/at_test.txt" || true
cat "/home/$(whoami)/at_test.txt" 2>/dev/null || true

echo
echo "[13] Troubleshooting quick checks"
systemctl status crond || true
ls -la "/home/$(whoami)/cron_test.sh" || true
"/home/$(whoami)/cron_test.sh" && echo "Manual run: OK"

echo
echo "Done."
