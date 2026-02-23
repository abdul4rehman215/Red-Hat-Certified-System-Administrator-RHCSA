#!/usr/bin/env bash
# Lab 33: Understanding and Managing SELinux
# Environment: CentOS/RHEL 8/9 (Cloud Lab)
# User: centos (sudo access)
# NOTE: This file lists the commands executed during the lab, in order.

# -----------------------------
# Task 1: Check SELinux Status
# -----------------------------
whoami
sudo su -

sestatus
getenforce
cat /etc/selinux/config

# --------------------------------
# Task 1.3: Examine SELinux Contexts
# --------------------------------
ls -Z /etc/passwd
ps -eZ | head -10
id -Z

# ----------------------------------------
# Task 2: Configure SELinux Modes (Temporary)
# ----------------------------------------
getenforce
setenforce 0
getenforce
sestatus

# -------------------------------
# Task 2.2: Test Scenario (Permissive)
# -------------------------------
mkdir /tmp/selinux-test
cd /tmp/selinux-test
echo "This is a test file" > testfile.txt
ls -Z testfile.txt
chcon -t httpd_exec_t testfile.txt
ls -Z testfile.txt

# -------------------------------
# Task 2.3: Return to Enforcing
# -------------------------------
setenforce 1
getenforce

# -----------------------------------------
# Task 2.4: Permanent Mode Concept (Backup Only)
# -----------------------------------------
cp /etc/selinux/config /etc/selinux/config.backup
cat /etc/selinux/config
# (Demonstration only in lab text; not executed)
# sed -i 's/SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config

# ---------------------------------------------------------
# Task 3: Troubleshoot SELinux Issues using ausearch/audit2allow
# ---------------------------------------------------------
systemctl status auditd
tail -20 /var/log/audit/audit.log

# ----------------------------------------
# Task 3.2: Create a SELinux Violation (HTTPD Scenario)
# ----------------------------------------
mkdir -p /var/www/html/test
echo "<h1>Test Page</h1>" > /var/www/html/test/index.html
ls -Z /var/www/html/test/index.html

echo "<h1>Moved Test Page</h1>" > /tmp/moved-page.html
mv /tmp/moved-page.html /var/www/html/test/
ls -Z /var/www/html/test/moved-page.html

# ------------------------------------------------
# Task 3.3: Search for SELinux Denials (AVC Records)
# ------------------------------------------------
ausearch -m AVC -ts recent

# ------------------------------------------------
# Task 3.3/3.4: Install + Run HTTPD to Trigger Denial
# ------------------------------------------------
yum install -y httpd
systemctl start httpd
systemctl enable httpd
curl http://localhost/test/moved-page.html

ausearch -m AVC -c httpd
ausearch -m AVC -c httpd | audit2allow
ausearch -m AVC -c httpd | audit2allow -w

# ------------------------------------------------
# Task 3.4: Generate a Policy Module (Demonstration)
# ------------------------------------------------
ausearch -m AVC -c httpd | audit2allow -M myhttpd
ls -l myhttpd.*

# ------------------------------------------------
# Task 3.5: Correct Fix (Relabel Instead of Allow Rule)
# ------------------------------------------------
restorecon -Rv /var/www/html/test/
ls -Z /var/www/html/test/
curl http://localhost/test/moved-page.html

# ------------------------------------------------
# Task 3.6: Use sealert (User-Friendly Analysis)
# ------------------------------------------------
yum install -y setroubleshoot-server
sealert -a /var/log/audit/audit.log

# ------------------------------------------------
# Advanced: Booleans + semanage tooling
# ------------------------------------------------
getsebool -a | grep httpd
getsebool httpd_can_network_connect
setsebool httpd_can_network_connect on
# (Permanent form shown in lab text; not executed)
# setsebool -P httpd_can_network_connect on

# semanage may not exist in minimal installs
semanage fcontext -l | grep "/var/www" || true
yum install -y policycoreutils-python-utils
semanage fcontext -l | grep "/var/www"
semanage port -l | grep http

# ------------------------------------------------
# Practical Exercise: Custom App Context Management
# ------------------------------------------------
mkdir -p /opt/myapp/bin
mkdir -p /opt/myapp/data

# Created via nano in lab; script stored in scripts/ directory in repo
# nano /opt/myapp/bin/myapp.sh
chmod +x /opt/myapp/bin/myapp.sh

echo "Important data" > /opt/myapp/data/data1.txt
echo "More data" > /opt/myapp/data/data2.txt

ls -Z /opt/myapp/bin/
ls -Z /opt/myapp/data/

semanage fcontext -a -t bin_t "/opt/myapp/bin(/.*)?"
semanage fcontext -a -t var_t "/opt/myapp/data(/.*)?"
restorecon -Rv /opt/myapp/

ls -Z /opt/myapp/bin/
ls -Z /opt/myapp/data/

# Optional execution check (performed in lab)
 /opt/myapp/bin/myapp.sh

# ------------------------------------------------
# Cleanup + Final Verification
# ------------------------------------------------
rm -rf /tmp/selinux-test
rm -rf /var/www/html/test
rm -rf /opt/myapp

sestatus
getenforce
ausearch -m AVC -ts today | tail -5
