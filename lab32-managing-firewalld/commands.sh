#!/bin/bash
# Lab 32: Managing Firewall with firewalld (RHCSA)
# Commands Executed During Lab

# ------------------------------------------------------------
# Task 1.1: firewalld Basics
# ------------------------------------------------------------

sudo systemctl status firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --state
sudo firewall-cmd --list-all

# ------------------------------------------------------------
# Task 1.2: Basic Rules (Zones + Services)
# ------------------------------------------------------------

sudo firewall-cmd --get-default-zone
sudo firewall-cmd --get-zones
sudo firewall-cmd --zone=public --list-all

sudo firewall-cmd --add-service=http
sudo firewall-cmd --list-services

sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload

# ------------------------------------------------------------
# Task 1.3: Ports and Protocols
# ------------------------------------------------------------

sudo firewall-cmd --add-port=8080/tcp
sudo firewall-cmd --add-port=3000-3005/tcp

sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --add-port=3000-3005/tcp --permanent
sudo firewall-cmd --remove-port=3000-3005/tcp --permanent

sudo firewall-cmd --add-port=53/udp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

# ------------------------------------------------------------
# Task 2.1: Zones Overview
# ------------------------------------------------------------

sudo firewall-cmd --list-all-zones
sudo firewall-cmd --zone=dmz --list-all
sudo firewall-cmd --zone=internal --list-all
sudo firewall-cmd --zone=trusted --list-all

sudo firewall-cmd --get-active-zones

sudo firewall-cmd --set-default-zone=internal
sudo firewall-cmd --get-default-zone

# ------------------------------------------------------------
# Task 2.2: Interfaces + Sources
# ------------------------------------------------------------

ip addr show

sudo firewall-cmd --zone=public --change-interface=eth0 --permanent
sudo firewall-cmd --get-zone-of-interface=eth0

sudo firewall-cmd --zone=trusted --add-source=192.168.1.0/24 --permanent
sudo firewall-cmd --zone=trusted --remove-source=192.168.1.0/24 --permanent

# ------------------------------------------------------------
# Task 2.3: Services by Zone + Custom Service
# ------------------------------------------------------------

sudo firewall-cmd --get-services

sudo firewall-cmd --zone=public --add-service=ssh --permanent
sudo firewall-cmd --zone=public --add-service=https --permanent
sudo firewall-cmd --zone=internal --add-service=samba --permanent

sudo firewall-cmd --zone=public --remove-service=dhcpv6-client --permanent

sudo firewall-cmd --permanent --new-service=myapp
sudo firewall-cmd --permanent --service=myapp --set-description="My Custom Application"
sudo firewall-cmd --permanent --service=myapp --set-short="MyApp"
sudo firewall-cmd --permanent --service=myapp --add-port=9090/tcp

sudo firewall-cmd --zone=public --add-service=myapp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --zone=public --list-services

# ------------------------------------------------------------
# Task 3.1: Port Accessibility Testing
# ------------------------------------------------------------

sudo yum install -y nmap telnet nc
sudo yum install -y nmap telnet nmap-ncat

sudo python3 -m http.server 8080 &
curl http://localhost:8080

ip -4 addr show eth0 | grep inet
nmap -p 8080 192.168.1.101
nmap -p 9999 192.168.1.101

sudo pkill -f "python3 -m http.server"

# ------------------------------------------------------------
# Task 3.2: Zone Testing + Zone Switching
# ------------------------------------------------------------

sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=internal --add-service=ssh --permanent
sudo firewall-cmd --zone=dmz --add-port=8443/tcp --permanent
sudo firewall-cmd --reload

sudo firewall-cmd --zone=public --list-services
sudo firewall-cmd --zone=internal --list-services
sudo firewall-cmd --zone=dmz --list-ports

sudo firewall-cmd --set-default-zone=dmz
sudo firewall-cmd --get-default-zone
sudo firewall-cmd --list-all

sudo firewall-cmd --set-default-zone=public

# ------------------------------------------------------------
# Task 3.3: Logging + Rich Rules
# ------------------------------------------------------------

sudo firewall-cmd --set-log-denied=all

sudo tail -f /var/log/messages | grep -i firewall &

telnet 192.168.1.101 9999

sudo firewall-cmd --direct --get-all-rules

sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --list-rich-rules

sudo firewall-cmd --remove-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent

# ------------------------------------------------------------
# Troubleshooting + Best Practice Commands
# ------------------------------------------------------------

sudo firewall-cmd --reload
sudo firewall-cmd --list-all --permanent
sudo firewall-cmd --list-all

sudo systemctl status firewalld -l
sudo systemctl status iptables
sudo systemctl stop iptables
sudo systemctl disable iptables
sudo systemctl restart firewalld

sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone=public --change-interface=eth0 --permanent
sudo firewall-cmd --reload

sudo firewall-cmd --state && sudo firewall-cmd --get-default-zone
sudo firewall-cmd --list-all

sudo firewall-cmd --panic-on
sudo firewall-cmd --panic-off

sudo cp -r /etc/firewalld/ /etc/firewalld.backup.$(date +%Y%m%d)

# ------------------------------------------------------------
# Verification Script
# ------------------------------------------------------------

cd ~/lab11-networking
nano firewall-test.sh
chmod +x firewall-test.sh
./firewall-test.sh
