#!/usr/bin/env bash
# Lab 9: Managing Logical Volumes (LVM)
# Environment: CentOS/RHEL 8/9
# Disks used: /dev/sdb /dev/sdc /dev/sdd

set -euo pipefail

echo "=== Task 1: Identify disks and confirm clean state ==="
lsblk
sudo fdisk -l
mount | grep -E "(sdb|sdc|sdd)" || true
lsblk /dev/sdb /dev/sdc /dev/sdd
pvs || true

echo "=== Task 1: Create Physical Volumes (PV) ==="
sudo pvcreate /dev/sdb
sudo pvcreate /dev/sdc
sudo pvcreate /dev/sdd

echo "=== Verify PVs ==="
sudo pvs
sudo pvdisplay

echo "=== Task 2: Create Volume Groups (VG) ==="
sudo vgcreate vg_data /dev/sdb /dev/sdc
sudo vgs
sudo vgdisplay vg_data

echo "=== Create second VG (as per lab run) ==="
sudo vgcreate vg_backup /dev/sdd
sudo vgs

echo "=== Task 2: Extend vg_data using /dev/sdd (as performed) ==="
# Remove PV from vg_backup first (lab run did this)
sudo vgreduce vg_backup /dev/sdd || true
# Extend vg_data
sudo vgextend vg_data /dev/sdd
sudo vgs
sudo vgdisplay vg_data

echo "=== Task 3: Create Logical Volumes (LV) ==="
sudo lvcreate -L 10G -n lv_web vg_data
sudo lvcreate -L 5G  -n lv_database vg_data
sudo lvcreate -l 50%VG -n lv_logs vg_data

echo "=== Verify LVs ==="
sudo lvs
sudo lvdisplay

echo "=== Task 3: Format LVs (ext4 + xfs) ==="
sudo mkfs.ext4 /dev/vg_data/lv_web
sudo mkfs.xfs  /dev/vg_data/lv_database
sudo mkfs.ext4 /dev/vg_data/lv_logs

echo "=== Task 3: Create mount points and mount LVs ==="
sudo mkdir -p /mnt/web /mnt/database /mnt/logs
sudo mount /dev/vg_data/lv_web /mnt/web
sudo mount /dev/vg_data/lv_database /mnt/database
sudo mount /dev/vg_data/lv_logs /mnt/logs

echo "=== Verify mounts ==="
df -h
mount | grep vg_data

echo "=== Task 3: Write test files ==="
echo "Web server data"  | sudo tee /mnt/web/index.html
echo "Database content" | sudo tee /mnt/database/data.sql
echo "Application logs" | sudo tee /mnt/logs/app.log

echo "=== Verify files ==="
ls -la /mnt/web
ls -la /mnt/database
ls -la /mnt/logs
du -sh /mnt/web /mnt/database /mnt/logs

echo "=== Task 4: Extend LVs and resize filesystems ==="
echo "--- Before extension ---"
sudo lvs
sudo vgs

echo "--- Extend lv_web by +5G and grow ext4 ---"
sudo lvextend -L +5G /dev/vg_data/lv_web
sudo resize2fs /dev/vg_data/lv_web

echo "--- Extend lv_database by +3G and grow XFS (must be mounted) ---"
sudo lvextend -L +3G /dev/vg_data/lv_database
sudo xfs_growfs /mnt/database

echo "--- One-step extend lv_logs by +2G with resize (-r) ---"
sudo lvextend -L +2G -r /dev/vg_data/lv_logs

echo "=== Verify final sizes ==="
sudo lvs
df -h /mnt/web /mnt/database /mnt/logs

echo "=== Task 5: Monitoring and scan commands ==="
sudo pvs && echo "---" && sudo vgs && echo "---" && sudo lvs
sudo pvscan
sudo vgscan
sudo lvscan
sudo lvs -o +origin,snap_percent 2>/dev/null || true
sudo lvs -o +lv_layout,lv_role
sudo vgs -o +vg_extent_size,vg_extent_count,vg_free_count
sudo pvs -o +pv_used,pv_free

echo "=== Task 6: Persistent mounts (/etc/fstab) ==="
sudo cp /etc/fstab /etc/fstab.backup

echo "/dev/vg_data/lv_web /mnt/web ext4 defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/vg_data/lv_database /mnt/database xfs defaults 0 2" | sudo tee -a /etc/fstab
echo "/dev/vg_data/lv_logs /mnt/logs ext4 defaults 0 2" | sudo tee -a /etc/fstab

tail -3 /etc/fstab

echo "=== Test fstab safely (mount -a) ==="
sudo umount /mnt/web /mnt/database /mnt/logs || true
sudo mount -a
df -h | grep vg_data || true

echo "=== Task 7 (Bonus): Snapshots (as lab run) ==="
sudo lvcreate -L 1G -s -n lv_web_snapshot /dev/vg_data/lv_web
sudo lvcreate -L 1G -s -n lv_database_snapshot /dev/vg_data/lv_database

echo "=== Verify snapshots ==="
sudo lvs -o +origin,snap_percent

echo "=== Mount snapshot read-only (explicit type) ==="
sudo mkdir -p /mnt/web_snapshot
sudo mount -t ext4 -o ro /dev/vg_data/lv_web_snapshot /mnt/web_snapshot
ls -la /mnt/web_snapshot

echo "=== Modify original and compare ==="
echo "Modified web content" | sudo tee -a /mnt/web/index.html
cat /mnt/web/index.html
cat /mnt/web_snapshot/index.html

echo "=== Cleanup snapshots only (as performed) ==="
sudo umount /mnt/web_snapshot || true
sudo lvremove -y /dev/vg_data/lv_web_snapshot
sudo lvremove -y /dev/vg_data/lv_database_snapshot

echo "=== Done ==="
