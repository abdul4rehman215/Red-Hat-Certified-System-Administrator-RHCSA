#!/bin/bash
# Lab 10 – Managing File Permissions (ugo/rwx)
# Environment: Ubuntu 24.04.1 LTS
# Hostname: ip-172-31-10-251
# User: toor (sudo-enabled)

# Verify OS
cat /etc/os-release

# Create sample file and directory
echo "Sample permission file" > example.txt
mkdir directory

# View file permissions
ls -l

# Modify permissions using symbolic mode
chmod u+x example.txt
ls -l example.txt

# Modify permissions using numeric mode
chmod 640 example.txt
ls -l example.txt

# Create new user and group for testing
sudo useradd newuser
sudo groupadd newgroup

# Change file owner
sudo chown newuser example.txt
ls -l example.txt

# Change file group
sudo chgrp newgroup example.txt
ls -l example.txt

# Alternative: change owner and group together
sudo chown newuser:newgroup example.txt
ls -l example.txt

# Cleanup (optional)
sudo userdel newuser
sudo groupdel newgroup
