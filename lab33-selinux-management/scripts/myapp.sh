#!/bin/bash
# ============================================================
# Lab 33 - SELinux Practical Scenario
# Script: myapp.sh
# Location (lab runtime): /opt/myapp/bin/myapp.sh
# Purpose:
#   Simple demonstration application used to explore
#   SELinux file context labeling and execution behavior.
# ============================================================

echo "====================================="
echo "        MyApp SELinux Test App       "
echo "====================================="

echo ""
echo "Application Status:"
echo "MyApp is running successfully."

echo ""
echo "Current User:"
whoami

echo ""
echo "SELinux Context of Script:"
ls -Z "$0"

echo ""
echo "Data Directory Contents (/opt/myapp/data):"
echo "-------------------------------------"
ls -la /opt/myapp/data/

echo ""
echo "SELinux Context of Data Directory:"
ls -Zd /opt/myapp/data/

echo ""
echo "SELinux Context of Data Files:"
ls -Z /opt/myapp/data/

echo ""
echo "Execution Complete."
echo "====================================="
