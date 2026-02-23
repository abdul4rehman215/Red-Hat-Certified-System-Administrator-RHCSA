#!/bin/bash
# Lab 28: Working with Disk Partitions (CentOS/RHEL)

set -euo pipefail

echo "=== Task 1: Disk discovery ==="
lsblk
sudo fdisk -l
df -h

echo
echo "=== Create stable alias /dev/sdb -> /dev/nvme1n1 (if needed) ==="
if [ ! -e /dev/sdb ]; then
  echo "[*] /dev/sdb not found, creating symlink to /dev/nvme1n1"
  sudo ln -s /dev/nvme1n1 /dev/sdb
fi
ls -l /dev/sdb || true
sudo fdisk -l /dev/sdb

echo
echo "=== Task 1: Partitioning (manual via fdisk interactive) ==="
cat << 'EOF'
Run these interactively:

sudo fdisk /dev/sdb

# Create primary 1 (2G)
n
p
1
<enter>
+2G

# Create primary 2 (1G)
n
p
2
<enter>
+1G

# Print table
p

# Write changes
w
EOF

echo
echo "After creating sdb1 and sdb2, verify:"
echo "lsblk /dev/sdb"
echo "sudo fdisk -l /dev/sdb"

echo
echo "=== Task 1: Extended + logical (manual via fdisk interactive) ==="
cat << 'EOF'
sudo fdisk /dev/sdb

# Create extended partition 3 (use remaining space)
n
e
3
<enter>
<enter>

# Create logical partition inside extended (500M)
n
l
<enter>
+500M

# Write
w
EOF

echo
echo "Verify partitions:"
echo "lsblk /dev/sdb"
echo "sudo fdisk -l /dev/sdb"

echo
echo "=== Task 2: Filesystem tools check/install (if needed) ==="
sudo yum -y install e2fsprogs xfsprogs util-linux

echo
echo "List mkfs variants:"
ls /sbin/mkfs* || true
echo "Kernel filesystems:"
cat /proc/filesystems

echo
echo "=== Task 2: Format partitions ==="
sudo mkfs.ext4 /dev/sdb1
sudo mkfs.xfs -f /dev/sdb2
sudo mkfs.ext3 /dev/sdb5

echo
echo "Verify filesystem types + UUIDs:"
sudo blkid /dev/sdb1 /dev/sdb2 /dev/sdb5

echo
echo "=== Task 2: Add labels ==="
sudo e2label /dev/sdb1 "DATA_EXT4"
sudo xfs_admin -L "DATA_XFS" /dev/sdb2
sudo blkid | grep sdb || true

echo
echo "=== Task 3: Create mount points ==="
sudo mkdir -p /mnt/data1 /mnt/data2 /mnt/data3
ls -la /mnt/ || true

echo
echo "=== Task 3: Mount manually ==="
sudo mount /dev/sdb1 /mnt/data1
sudo mount /dev/sdb2 /mnt/data2
sudo mount /dev/sdb5 /mnt/data3

echo "Mounted devices:"
mount | grep sdb || true
df -h | grep sdb || true

echo
echo "=== Task 3: Create + verify test files ==="
sudo touch /mnt/data1/test_ext4.txt /mnt/data2/test_xfs.txt /mnt/data3/test_ext3.txt
echo "This is an ext4 file system" | sudo tee /mnt/data1/test_ext4.txt
echo "This is an xfs file system"  | sudo tee /mnt/data2/test_xfs.txt
echo "This is an ext3 file system" | sudo tee /mnt/data3/test_ext3.txt

sudo ls -la /mnt/data1/
sudo ls -la /mnt/data2/
sudo ls -la /mnt/data3/
df -h /mnt/data1 /mnt/data2 /mnt/data3

echo
echo "=== Task 3: Unmount ==="
sudo umount /mnt/data1
sudo umount /mnt/data2
sudo umount /mnt/data3
mount | grep sdb || true
df -h | grep sdb || true

echo
echo "=== Task 3: Mount by LABEL and UUID ==="
sudo mount LABEL="DATA_EXT4" /mnt/data1

UUID_XFS="$(sudo blkid -s UUID -o value /dev/sdb2)"
sudo mount UUID="${UUID_XFS}" /mnt/data2
mount | grep -E "(data1|data2)" || true

echo
echo "=== Task 4: Persistent mounts (/etc/fstab) ==="
sudo cp /etc/fstab /etc/fstab.backup

UUID_EXT4="$(sudo blkid -s UUID -o value /dev/sdb1)"
UUID_EXT3="$(sudo blkid -s UUID -o value /dev/sdb5)"

echo "UUID=${UUID_EXT4} /mnt/data1 ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=${UUID_XFS} /mnt/data2 xfs  defaults 0 2" | sudo tee -a /etc/fstab
echo "UUID=${UUID_EXT3} /mnt/data3 ext3 defaults 0 2" | sudo tee -a /etc/fstab

echo "Last 3 fstab lines:"
tail -3 /etc/fstab

echo
echo "Test mounts from fstab:"
sudo umount /mnt/data1 /mnt/data2 2>/dev/null || true
sudo mount -a
mount | grep sdb || true
df -h | grep sdb || true

echo
echo "=== Optional: Troubleshooting tools + checks ==="
sudo yum -y install lsof psmisc parted sysstat

echo
echo "Example: check processes holding a mount (if umount says busy):"
echo "sudo lsof /mnt/data1"
echo "sudo fuser -v /mnt/data1"

echo
echo "Filesystem checks (run unmounted):"
echo "sudo fsck.ext4 /dev/sdb1"
echo "sudo xfs_repair /dev/sdb2"

echo
echo "Partition table view:"
sudo parted /dev/sdb print

echo
echo "Performance view:"
iostat -x 1 1 || true

echo
echo "Metadata examples:"
sudo tune2fs -l /dev/sdb1 | head -20 || true
sudo xfs_info /mnt/data2 || true

echo
echo "=== Cleanup (optional) ==="
cat << 'EOF'
# Unmount all:
sudo umount /mnt/data1 /mnt/data2 /mnt/data3 2>/dev/null

# Restore fstab:
sudo cp /etc/fstab.backup /etc/fstab

# Remove mount dirs:
sudo rmdir /mnt/data1 /mnt/data2 /mnt/data3
EOF

echo
echo "DONE."
