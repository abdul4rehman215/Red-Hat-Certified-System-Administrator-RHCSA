#!/bin/bash
# Lab 26: Configuring SSH for Remote Access
# CentOS / RHEL 8/9

# ==============================
# Task 1: Verify SSH Installation
# ==============================

which ssh
which sshd
systemctl status sshd

# ==============================
# Task 1.2: Install OpenSSH
# ==============================

sudo dnf update -y
sudo dnf install -y openssh-server openssh-clients
rpm -qa | grep openssh

# ==============================
# Task 1.3: Start and Enable SSH
# ==============================

sudo systemctl start sshd
sudo systemctl enable sshd
sudo systemctl status sshd

sudo netstat -tlnp | grep :22

# ==============================
# Task 1.4: Configure Firewall
# ==============================

sudo firewall-cmd --state
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
sudo firewall-cmd --list-services

# ==============================
# Task 2.1: Create SSH Test User
# ==============================

sudo useradd -m sshuser
sudo passwd sshuser
sudo usermod -aG wheel sshuser
id sshuser

# ==============================
# Task 2.2: Local SSH Testing
# ==============================

ip addr show

ssh sshuser@localhost
exit

ssh sshuser@127.0.0.1
exit

# ==============================
# Task 2.3: Remote SSH Testing
# ==============================

ssh sshuser@172.31.10.206
exit

ssh -v sshuser@172.31.10.206
exit

ssh -p 22 sshuser@172.31.10.206
exit

# ==============================
# Task 2.4: Check SSH Config
# ==============================

sudo cat /etc/ssh/sshd_config
sudo grep -E "^(Port|PermitRootLogin|PasswordAuthentication|PubkeyAuthentication)" /etc/ssh/sshd_config

# ==============================
# Task 3.1: Generate SSH Keys
# ==============================

su - sshuser

ssh-keygen -t rsa -b 4096 -C "sshuser@lab-machine"
ssh-keygen -t ed25519 -C "sshuser@lab-machine"

ls -la ~/.ssh/

exit

# ==============================
# Task 3.2: Copy Public Key
# ==============================

su - sshuser

ssh-copy-id sshuser@localhost

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh

ssh-copy-id sshuser@172.31.10.206

ssh sshuser@172.31.10.206 "cat ~/.ssh/authorized_keys"

exit

# ==============================
# Task 3.3: Test Key-Based Login
# ==============================

su - sshuser

ssh sshuser@localhost
exit

ssh -v sshuser@localhost
exit

ssh sshuser@172.31.10.206
exit

exit

# ==============================
# Task 3.4: Disable Password Authentication
# ==============================

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

sudo nano /etc/ssh/sshd_config

sudo grep -E "^(PasswordAuthentication|PubkeyAuthentication|AuthorizedKeysFile|PermitRootLogin)" /etc/ssh/sshd_config

sudo sshd -t
sudo systemctl restart sshd
sudo systemctl status sshd

# ==============================
# Task 3.5: Verify Security Config
# ==============================

ssh -o PreferredAuthentications=password sshuser@localhost
ssh sshuser@localhost
exit

# ==============================
# Advanced Security Configuration
# ==============================

sudo nano /etc/ssh/sshd_config

sudo grep -E "^(Port|AllowUsers|PermitEmptyPasswords|MaxAuthTries|MaxStartups|X11Forwarding|ClientAliveInterval|ClientAliveCountMax)" /etc/ssh/sshd_config

sudo sshd -t

sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --add-port=2222/tcp
sudo firewall-cmd --reload

sudo systemctl restart sshd

sudo ss -tlnp | grep sshd

# ==============================
# Troubleshooting Commands
# ==============================

sudo systemctl status sshd
sudo netstat -tlnp | grep :22
sudo firewall-cmd --list-all

ls -la ~/.ssh/

chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/authorized_keys

sudo journalctl -u sshd -f

cat ~/.ssh/authorized_keys

ssh -vvv -p 2222 sshuser@localhost

# ==============================
# Final Verification
# ==============================

sudo systemctl is-active sshd
sudo systemctl is-enabled sshd

sudo ss -tlnp | grep :22

ssh -o PreferredAuthentications=publickey -p 2222 sshuser@localhost
exit

sudo sshd -t

sudo grep -E "^(PasswordAuthentication|PubkeyAuthentication|PermitRootLogin)" /etc/ssh/sshd_config
