#!/bin/bash
# Lab 05 – Managing Multiuser Environments
# Environment: CentOS Linux 7 (Core)
# Hostname: ip-172-31-10-133
# User: centos (sudo-enabled)

# -----------------------------
# Environment Verification
# -----------------------------
cat /etc/os-release

# -----------------------------
# Setup – Create Users
# -----------------------------
sudo useradd user1
sudo useradd user2

sudo passwd user1
sudo passwd user2

# -----------------------------
# Task 1 – User Switching & Privileges
# -----------------------------
su - user1
whoami
exit

cat /etc/shadow
sudo cat /etc/shadow

sudo -l

# -----------------------------
# Task 2 – File Permissions & Isolation
# -----------------------------
su - user1
touch ~/user1_file.txt
echo "This is user1's file" > ~/user1_file.txt
exit

su - user2
cat /home/user1/user1_file.txt
exit

ls -l /home/user1/user1_file.txt

su - user1
chmod 644 ~/user1_file.txt
exit

su - user2
cat /home/user1/user1_file.txt
exit

# -----------------------------
# Task 3 – Multiuser Targets
# -----------------------------
systemctl get-default

sudo systemctl isolate multi-user.target
sudo systemctl isolate graphical.target

sudo systemctl set-default multi-user.target

# -----------------------------
# Advanced – Container User Management
# -----------------------------
podman run --user 1000 -it fedora /bin/bash
# inside container:
# whoami
# exit

# -----------------------------
# Cleanup
# -----------------------------
sudo userdel -r user1
sudo userdel -r user2

sudo systemctl set-default graphical.target
