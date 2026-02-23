#!/bin/bash
# ==========================================================
# Network Configuration Lab Script
# Lab 31 – Configuring Networking (RHCSA)
# Environment: CentOS/RHEL 8/9
# ==========================================================

echo "=========================================="
echo "   Network Configuration Lab Script"
echo "=========================================="

# ----------------------------------------------------------
# Task 1: Configure Network Interface (Static IP)
# ----------------------------------------------------------

echo ""
echo "[*] Configuring network interface using nmcli..."

sudo nmcli connection add \
 type ethernet \
 con-name "lab-connection" \
 ifname eth0 \
 ip4 192.168.1.150/24 \
 gw4 192.168.1.1

sudo nmcli connection modify "lab-connection" \
 ipv4.dns "8.8.8.8,8.8.4.4" \
 ipv4.method manual

sudo nmcli connection up "lab-connection"

echo "[✓] Static IP configuration applied."

# ----------------------------------------------------------
# Task 2: Set Hostname
# ----------------------------------------------------------

echo ""
echo "[*] Setting system hostname..."

sudo hostnamectl set-hostname "lab-network-server"

sudo bash -c 'echo "127.0.0.1 lab-network-server" >> /etc/hosts'

echo "[✓] Hostname updated and added to /etc/hosts."

# ----------------------------------------------------------
# Task 3: Connectivity Tests
# ----------------------------------------------------------

echo ""
echo "[*] Testing local gateway connectivity..."
ping -c 2 192.168.1.1

echo ""
echo "[*] Testing external DNS connectivity..."
ping -c 2 8.8.8.8

echo ""
echo "[*] Testing domain resolution..."
nslookup google.com

echo ""
echo "=========================================="
echo "   Lab Configuration Complete"
echo "=========================================="
