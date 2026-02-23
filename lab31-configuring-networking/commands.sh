#!/bin/bash
# Lab 31: Configuring Networking (RHCSA)
# Commands Executed During Lab

# ------------------------------------------------------------
# Task 1: Explore Current Network Configuration
# ------------------------------------------------------------

nmcli connection show
nmcli device status
ip addr show

# ------------------------------------------------------------
# Task 1: Create a New Network Connection Profile (Static IP)
# ------------------------------------------------------------

sudo nmcli connection add \
  type ethernet \
  con-name "lab-static-connection" \
  ifname eth0 \
  ip4 192.168.1.100/24 \
  gw4 192.168.1.1

sudo nmcli connection modify "lab-static-connection" \
  ipv4.dns "8.8.8.8,8.8.4.4"

sudo nmcli connection modify "lab-static-connection" \
  ipv4.method manual

sudo nmcli connection up "lab-static-connection"
nmcli connection show --active
ip addr show eth0

# ------------------------------------------------------------
# Task 1 (Legacy): ifconfig + route (Temporary)
# ------------------------------------------------------------

sudo yum install net-tools -y
sudo ifconfig eth0 192.168.1.101 netmask 255.255.255.0
sudo route add default gw 192.168.1.1
ifconfig eth0
route -n

# ------------------------------------------------------------
# Task 2: Hostname Management with hostnamectl
# ------------------------------------------------------------

hostnamectl status
hostname
cat /etc/hostname

sudo hostnamectl set-hostname "lab-server-01"
hostnamectl status
cat /etc/hostname

sudo bash -c 'echo "127.0.0.1 lab-server-01" >> /etc/hosts'
cat /etc/hosts
nslookup lab-server-01

sudo hostnamectl set-hostname "Lab Server 01" --pretty
sudo hostnamectl set-deployment "development"
sudo hostnamectl set-location "Training Lab"
hostnamectl status

# ------------------------------------------------------------
# Task 3: Network Connectivity Testing
# ------------------------------------------------------------

ping -c 4 192.168.1.1
ping -c 4 8.8.8.8
ping -c 4 google.com
ping google.com

# ------------------------------------------------------------
# Task 3.2: traceroute
# ------------------------------------------------------------

sudo yum install traceroute -y
traceroute google.com
traceroute 8.8.8.8
traceroute -U google.com

# ------------------------------------------------------------
# Task 3.3: nslookup
# ------------------------------------------------------------

nslookup google.com
nslookup -type=MX google.com
nslookup google.com 8.8.8.8
nslookup 8.8.8.8
nslookup

# ------------------------------------------------------------
# Task 3.4: Additional Tools + Diagnostics
# ------------------------------------------------------------

sudo yum install bind-utils wget curl -y
dig google.com
curl -I http://google.com
wget --spider http://google.com
ss -tuln
netstat -i

# ------------------------------------------------------------
# Comprehensive Script Build + Run
# ------------------------------------------------------------

mkdir -p ~/lab11-networking
cd ~/lab11-networking
nano network_lab.sh
chmod +x network_lab.sh
./network_lab.sh

# ------------------------------------------------------------
# Troubleshooting Commands Used
# ------------------------------------------------------------

nmcli device status
ip link show
cat /etc/resolv.conf
sudo systemctl restart NetworkManager
sudo -l
sudo usermod -a -G wheel username
sudo nmcli connection modify "connection-name" connection.autoconnect yes
nmcli connection show "lab-static-connection" | grep autoconnect
