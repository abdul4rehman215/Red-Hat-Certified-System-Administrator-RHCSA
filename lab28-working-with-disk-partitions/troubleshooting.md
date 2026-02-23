# 🛠️ Troubleshooting Guide — Lab 8: Working with Disk Partitions

This document covers common issues encountered during disk partitioning,
formatting, mounting, and persistent configuration.

------------------------------------------------------------
1️⃣ Wrong Disk Selected (Critical Risk)
------------------------------------------------------------

Problem:
You accidentally partitioned the OS disk instead of the practice disk.

Prevention:
Always verify using:
  lsblk
  sudo fdisk -l

Confirm:
- OS disk has "/" mounted
- Practice disk has no important partitions

Best Practice:
Never run fdisk until you confirm the correct device name.

------------------------------------------------------------
2️⃣ "Device or resource busy" During umount
------------------------------------------------------------

Error:
umount: /mnt/data1: target is busy.

Cause:
A process is using the mount.

Diagnosis:
  lsof /mnt/data1
  fuser -v /mnt/data1

Fix:
- Exit the directory (cd /)
- Stop the process using it
- Retry umount

Avoid using -f unless necessary.

------------------------------------------------------------
3️⃣ Partition Not Showing After fdisk
------------------------------------------------------------

Problem:
New partition created but not visible in lsblk.

Fix:
  sudo partprobe
OR
  sudo partx -u /dev/sdb

If still not visible:
Reboot system (rare case).

------------------------------------------------------------
4️⃣ Mount Fails with "wrong fs type"
------------------------------------------------------------

Error:
mount: wrong fs type, bad option, bad superblock

Cause:
Partition not formatted OR wrong filesystem type specified.

Check:
  blkid /dev/sdb1

Fix:
- Format properly:
    mkfs.ext4 /dev/sdb1
- Mount using correct type:
    mount -t ext4 /dev/sdb1 /mnt/data1

------------------------------------------------------------
5️⃣ System Fails to Boot After Editing /etc/fstab
------------------------------------------------------------

Cause:
Invalid UUID, typo in filesystem type, or wrong mount point.

Prevention:
Always test using:
  mount -a

If boot fails:
- Boot into rescue mode
- Restore backup:
    cp /etc/fstab.backup /etc/fstab

------------------------------------------------------------
6️⃣ "Filesystem has unsupported feature" During fsck
------------------------------------------------------------

Cause:
Using older fsck tools on newer file system features.

Fix:
Ensure correct utilities installed:
  yum install e2fsprogs xfsprogs -y

------------------------------------------------------------
7️⃣ UUID Not Found
------------------------------------------------------------

Error:
mount: special device UUID=xxxx does not exist

Fix:
Re-check UUID:
  blkid

Update correct UUID in /etc/fstab.

------------------------------------------------------------
8️⃣ Disk Full Unexpectedly
------------------------------------------------------------

Check usage:
  df -h
  du -sh /mnt/data1/*

Check inode usage:
  df -i

Sometimes inode exhaustion causes "disk full".

------------------------------------------------------------
9️⃣ Partition Table Corruption
------------------------------------------------------------

Use:
  sudo parted /dev/sdb print

If corrupted:
- Backup data immediately
- Use testdisk or recovery tools
- Recreate partition table if safe

------------------------------------------------------------
🔟 Performance Issues
------------------------------------------------------------

Monitor disk I/O:
  iostat -x 1 5

Check mount options:
  mount | grep sdb

Consider:
- Using xfs for large data workloads
- Using ext4 for general purpose systems

------------------------------------------------------------
Best Practices Summary
------------------------------------------------------------

✔ Always verify target disk before modifying
✔ Backup /etc/fstab before editing
✔ Use UUID instead of device names
✔ Test with mount -a before reboot
✔ Unmount cleanly before fsck
✔ Document partition layout changes

------------------------------------------------------------
Lab 28 Troubleshooting Completed
------------------------------------------------------------
