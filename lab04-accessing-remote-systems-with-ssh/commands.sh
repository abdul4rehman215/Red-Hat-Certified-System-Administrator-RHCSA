#!/bin/bash
# Lab 04 – Accessing Remote Systems with SSH
# Commands Executed During Lab
# Environment: Ubuntu 24.04.1 LTS (EC2)
# Local: toor@ip-172-31-10-91
# Remote: student@172.31.10.200

# -----------------------------
# Task 1 – Verify SSH Installation
# -----------------------------

ssh -V

sudo apt update && sudo apt install openssh-client -y

ssh student@172.31.10.200

sudo systemctl status ssh

exit

# -----------------------------
# Task 2 – SSH Key-Based Authentication
# -----------------------------

ssh-keygen -t ed25519 -C "your_email@example.com"

ssh-copy-id -i ~/.ssh/id_ed25519.pub student@172.31.10.200

ssh student@172.31.10.200

exit

# -----------------------------
# Task 3 – Secure File Transfer (SCP)
# -----------------------------

echo "This is a secure file transfer test." > localfile.txt

scp localfile.txt student@172.31.10.200:/home/student/

ssh student@172.31.10.200
ls
exit

ssh student@172.31.10.200
echo "Remote system file." > remotefile.txt
exit

scp student@172.31.10.200:/home/student/remotefile.txt ~/

cat remotefile.txt
