#!/bin/bash
# ==========================================================
# Lab 32: firewalld Verification Script
# File: firewall-test.sh
# Purpose: Validate firewalld configuration and rules
# Environment: CentOS/RHEL 8/9
# ==========================================================

echo "==============================================="
echo "🔥 Firewall Configuration Verification Script"
echo "==============================================="
echo ""

# ----------------------------------------------------------
# 1. Check firewalld service status
# ----------------------------------------------------------

echo "1️⃣ Checking firewalld service status..."
sudo systemctl is-active firewalld
echo ""

# ----------------------------------------------------------
# 2. Display default zone
# ----------------------------------------------------------

echo "2️⃣ Current default zone:"
sudo firewall-cmd --get-default-zone
echo ""

# ----------------------------------------------------------
# 3. Show active zones and interfaces
# ----------------------------------------------------------

echo "3️⃣ Active zones and associated interfaces:"
sudo firewall-cmd --get-active-zones
echo ""

# ----------------------------------------------------------
# 4. List services in default zone
# ----------------------------------------------------------

echo "4️⃣ Services allowed in default zone:"
sudo firewall-cmd --list-services
echo ""

# ----------------------------------------------------------
# 5. List open ports in default zone
# ----------------------------------------------------------

echo "5️⃣ Open ports in default zone:"
sudo firewall-cmd --list-ports
echo ""

# ----------------------------------------------------------
# 6. Display rich rules
# ----------------------------------------------------------

echo "6️⃣ Rich rules configured:"
sudo firewall-cmd --list-rich-rules
echo ""

# ----------------------------------------------------------
# 7. Show permanent configuration snapshot
# ----------------------------------------------------------

echo "7️⃣ Permanent configuration (default zone):"
sudo firewall-cmd --list-all --permanent
echo ""

# ----------------------------------------------------------
# 8. Display runtime configuration snapshot
# ----------------------------------------------------------

echo "8️⃣ Runtime configuration (active zone):"
sudo firewall-cmd --list-all
echo ""

# ----------------------------------------------------------
# 9. Confirm log denied setting
# ----------------------------------------------------------

echo "9️⃣ Log denied setting:"
sudo firewall-cmd --get-log-denied
echo ""

# ----------------------------------------------------------
# 10. Final status confirmation
# ----------------------------------------------------------

echo "🔎 Firewall state:"
sudo firewall-cmd --state
echo ""

echo "==============================================="
echo "✅ Firewall Verification Complete"
echo "==============================================="
