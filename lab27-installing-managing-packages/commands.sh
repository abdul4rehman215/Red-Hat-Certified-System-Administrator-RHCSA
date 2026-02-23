#!/bin/bash
# Lab 27: Installing and Managing Software Packages
# RHEL / CentOS / Rocky Linux 8/9

# ==================================
# Task 1: Check Package Manager
# ==================================

which dnf
which yum
cat /etc/redhat-release

# ==================================
# Task 1.3: Update Repository Info
# ==================================

sudo dnf update -y
sudo dnf makecache

# ==================================
# Task 1.4: Search for Packages
# ==================================

sudo dnf search wget
sudo dnf info wget

# ==================================
# Task 1.5: Install Single Packages
# ==================================

sudo dnf install wget nano tree -y

which wget
which nano
which tree

# ==================================
# Task 1.6: Install Multiple Packages
# ==================================

sudo dnf install htop curl unzip -y

# ==================================
# Task 1.7: Install Package Groups
# ==================================

sudo dnf group list
sudo dnf group install "Development Tools" -y

# ==================================
# Task 2: Query Installed Packages
# ==================================

sudo dnf list installed | head -10
sudo dnf list installed | grep wget

rpm -q wget
rpm -qi wget
rpm -ql wget
rpm -qf /usr/bin/wget

# ==================================
# Task 2.4: Package Integrity
# ==================================

rpm -V wget
rpm -Va | head -5

# ==================================
# Task 3: Update Packages
# ==================================

sudo dnf check-update
sudo dnf update -y

# ==================================
# Task 3.3: Remove Packages
# ==================================

sudo dnf remove tree -y
which tree

# ==================================
# Clean Cache
# ==================================

sudo dnf clean all

# ==================================
# Practical Scenario: Install Web Stack
# ==================================

sudo dnf update -y
sudo dnf makecache

sudo dnf install httpd php php-mysqlnd mariadb-server -y

rpm -q httpd php mariadb-server

sudo dnf list installed | grep -E "(httpd|php|mariadb)"

rpm -qc httpd

# ==================================
# Maintenance
# ==================================

sudo dnf autoremove -y

sudo dnf remove php-mysqlnd -y
rpm -q php-mysqlnd

# ==================================
# Troubleshooting Commands
# ==================================

sudo dnf install package-name --skip-broken
sudo rpm --rebuilddb
sudo dnf repolist
