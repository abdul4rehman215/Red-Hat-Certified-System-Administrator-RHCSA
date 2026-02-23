#!/usr/bin/env bash
# Lab 39: Networking and Configuring NFS (Server + Client)
# Note: Commands are grouped by machine. Run them on the correct host.

set -euo pipefail

###############################################################################
# [NFS-SERVER] CentOS/RHEL 8/9 - Server Setup
###############################################################################

# Become root
sudo su -

# Update + install packages
dnf update -y
dnf install -y nfs-utils rpcbind

# Verify packages
rpm -qa | grep nfs-utils || true
rpm -qa | grep rpcbind || true

# Create export directories
mkdir -p /nfs/shared /nfs/public /nfs/private

# Permissions + ownership (as per lab run)
chmod 755 /nfs/shared
chown nobody:nobody /nfs/shared

chmod 755 /nfs/public
chown nobody:nobody /nfs/public

chmod 750 /nfs/private
chown root:root /nfs/private

# Create test files
echo "This is a shared file"  > /nfs/shared/shared_file.txt
echo "This is a public file"  > /nfs/public/public_file.txt
echo "This is a private file" > /nfs/private/private_file.txt

# Quick verification
ls -la /nfs/shared /nfs/public /nfs/private

# Backup and configure exports
cp -f /etc/exports /etc/exports.backup 2>/dev/null || true

cat > /etc/exports << 'EOF'
# NFS Export Configuration
# Format: directory client_ip(options)

# Shared directory - read/write access
/nfs/shared *(rw,sync,no_root_squash,no_subtree_check)

# Public directory - read-only access
/nfs/public *(ro,sync,root_squash,no_subtree_check)

# Private directory - specific client only
/nfs/private 192.168.1.0/24(rw,sync,root_squash,no_subtree_check)
EOF

# Apply exports
exportfs -a
exportfs -v

# Start services
systemctl start rpcbind
systemctl start nfs-server
systemctl start rpc-statd
systemctl start nfs-idmapd

# Enable services at boot
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable rpc-statd
systemctl enable nfs-idmapd

# Check statuses
systemctl status nfs-server --no-pager
systemctl status rpcbind --no-pager

# Verify RPC/NFS ports locally
rpcinfo -p localhost

###############################################################################
# [NFS-SERVER] Firewall (firewalld) - allow NFS
###############################################################################

# Verify firewall
firewall-cmd --state
firewall-cmd --list-all

# Allow common NFS services (recommended)
firewall-cmd --permanent --add-service=nfs
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --permanent --add-service=mountd

# Optional: explicit ports (lab included these)
firewall-cmd --permanent --add-port=2049/tcp
firewall-cmd --permanent --add-port=2049/udp
firewall-cmd --permanent --add-port=111/tcp
firewall-cmd --permanent --add-port=111/udp
firewall-cmd --permanent --add-port=20048/tcp
firewall-cmd --permanent --add-port=20048/udp

# Reload + verify
firewall-cmd --reload
firewall-cmd --list-all
firewall-cmd --list-services
firewall-cmd --list-ports

###############################################################################
# [NFS-SERVER] Optional Hardening - restrict NFS to 192.168.1.0/24 (rich rules)
###############################################################################

# Add rich rules
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="nfs" accept'
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="rpc-bind" accept'
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="mountd" accept'

# Remove broad services if using rich rules only
firewall-cmd --permanent --remove-service=nfs || true
firewall-cmd --permanent --remove-service=rpc-bind || true
firewall-cmd --permanent --remove-service=mountd || true

# Reload + verify rich rules
firewall-cmd --reload
firewall-cmd --list-rich-rules

###############################################################################
# [NFS-CLIENT] CentOS/RHEL 8/9 - Client Setup
###############################################################################

# Become root
sudo su -

# Install client utilities
dnf install -y nfs-utils

# Start/enable rpcbind (commonly needed)
systemctl start rpcbind
systemctl enable rpcbind
systemctl status rpcbind --no-pager

# Identify server IP (lab derived .100)
SERVER_IP=$(hostname -I | awk '{print $1}' | sed 's/\.[0-9]*$/.100/')
echo "Server IP: $SERVER_IP"

# Discover exports
showmount -e "$SERVER_IP"

# RPC visibility test
rpcinfo -p "$SERVER_IP"

# Create mount points
mkdir -p /mnt/nfs-shared /mnt/nfs-public /mnt/nfs-private
chmod 755 /mnt/nfs-shared /mnt/nfs-public /mnt/nfs-private

# Mount shares manually (NFSv4 negotiated automatically on RHEL9)
mount -t nfs "$SERVER_IP:/nfs/shared"  /mnt/nfs-shared
mount -t nfs "$SERVER_IP:/nfs/public"  /mnt/nfs-public
mount -t nfs "$SERVER_IP:/nfs/private" /mnt/nfs-private

# Verify mounts
df -h | grep nfs || true
mount | grep nfs || true

# Validate access + expected behavior
ls -la /mnt/nfs-shared/
cat /mnt/nfs-shared/shared_file.txt

ls -la /mnt/nfs-public/
cat /mnt/nfs-public/public_file.txt

ls -la /mnt/nfs-private/
cat /mnt/nfs-private/private_file.txt

# Write test: RW should work, RO should fail
echo "Test from client" > /mnt/nfs-shared/client_test.txt
ls -la /mnt/nfs-shared/

# Expected failure (read-only export)
( echo "This should fail" > /mnt/nfs-public/test.txt ) || true

###############################################################################
# [NFS-CLIENT] Persist mounts with /etc/fstab
###############################################################################

cp -f /etc/fstab /etc/fstab.backup

# Append entries (safe append; avoid duplicates in real usage)
cat >> /etc/fstab << EOF

# NFS Mounts (Lab 19)
${SERVER_IP}:/nfs/shared  /mnt/nfs-shared  nfs  defaults,_netdev     0 0
${SERVER_IP}:/nfs/public  /mnt/nfs-public  nfs  defaults,_netdev,ro  0 0
${SERVER_IP}:/nfs/private /mnt/nfs-private nfs  defaults,_netdev     0 0
EOF

tail -n 12 /etc/fstab

# Test fstab mounts
umount /mnt/nfs-shared || true
umount /mnt/nfs-public || true
umount /mnt/nfs-private || true

mount -a
df -h | grep nfs || true

###############################################################################
# [NFS-CLIENT] Firewall (optional) - rpc-bind allowed (lab did this)
###############################################################################

firewall-cmd --state
firewall-cmd --list-all
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --reload

###############################################################################
# Connectivity checks (optional)
###############################################################################

# telnet may not be installed; this matches lab style checks
# telnet "$SERVER_IP" 2049
# telnet "$SERVER_IP" 111

echo "Done."
