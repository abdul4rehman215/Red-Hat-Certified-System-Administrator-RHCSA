#!/usr/bin/env bash
# Lab 35: Managing Disk Quotas (CentOS/RHEL 8/9)
# command log (XFS quotas on /)

set -euo pipefail

echo "=== [1] Baseline checks ==="
df -h
echo
cat /etc/fstab
echo
rpm -qa | grep -E '^quota|^quota-nls' || true

echo "=== [2] (Optional) Install quota tools ==="
sudo yum install -y quota quota-nls || true

echo "=== [3] Backup fstab ==="
sudo cp /etc/fstab /etc/fstab.backup

echo "=== [4] Enable XFS quota options on / in /etc/fstab ==="
echo "NOTE: Edit /etc/fstab and ensure the / mount has defaults,uquota,gquota"
echo "Example:"
echo "UUID=...  /  xfs  defaults,uquota,gquota  0 0"
echo
echo "Showing current /etc/fstab:"
sudo cat /etc/fstab
echo

echo "=== [5] Remount / to apply quota options ==="
sudo mount -o remount /
echo

echo "=== [6] Verify mount options include quota ==="
mount | grep " on / "
echo

echo "=== [7] Verify quota state with xfs_quota ==="
sudo xfs_quota -x -c 'state' /
echo

echo "=== [8] Create test users ==="
sudo useradd testuser1 || true
sudo useradd testuser2 || true
sudo useradd testuser3 || true

echo "=== [9] (Interactive) Set passwords (skip in automation if not needed) ==="
echo "Run manually:"
echo "  sudo passwd testuser1"
echo "  sudo passwd testuser2"
echo "  sudo passwd testuser3"
echo

echo "=== [10] Ensure home dirs exist + ownership ==="
sudo mkdir -p /home/testuser1 /home/testuser2 /home/testuser3
sudo chown testuser1:testuser1 /home/testuser1
sudo chown testuser2:testuser2 /home/testuser2
sudo chown testuser3:testuser3 /home/testuser3
echo

echo "=== [11] (Interactive) Set user quotas using edquota ==="
echo "Run manually (opens editor):"
echo "  sudo edquota -u testuser1"
echo "    -> soft=50000 hard=100000 blocks"
echo "  sudo edquota -u testuser2"
echo "    -> soft=25000 hard=50000 blocks; inode soft=100 hard=150"
echo "  sudo edquota -p testuser1 testuser3"
echo
echo "Grace periods:"
echo "  sudo edquota -t"
echo "    -> block grace=7days inode grace=7days"
echo

echo "=== [12] Validate quotas ==="
sudo quota -u testuser1 -h || true
sudo quota -u testuser2 -h || true
sudo quota -u testuser3 -h || true
echo
sudo repquota -h / || true
echo

echo "=== [13] Enforcement test (manual) ==="
cat <<'EOF'
Run manually:
  sudo su - testuser1
  dd if=/dev/zero of=testfile1 bs=1M count=40
  quota -u
  dd if=/dev/zero of=testfile2 bs=1M count=70
  exit

Expected:
  - usage shows soft limit exceeded with "*"
  - hard limit attempt returns: "Disk quota exceeded"
EOF

echo
echo "=== Done ==="
