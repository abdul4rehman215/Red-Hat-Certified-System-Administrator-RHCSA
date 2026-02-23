# 🎤 Interview Q&A — Lab 28: Working with Disk Partitions

## 1) What is the difference between a disk and a partition?
A **disk** is the physical/virtual block device (example: `/dev/nvme1n1` or `/dev/sdb`).  
A **partition** is a logical slice of that disk (example: `/dev/sdb1`, `/dev/sdb2`).

---

## 2) What does `lsblk` show and why is it useful?
`lsblk` shows block devices in a tree view: disks → partitions → mount points.  
It’s the fastest way to confirm:
- which disks exist
- which partitions exist
- what is mounted and where

---

## 3) What does `fdisk -l` provide that `lsblk` does not?
`fdisk -l` shows partition table details such as:
- start/end sectors
- partition type (Linux, extended, etc.)
- size in sectors/blocks
This helps validate partition layout and boot/MBR-style partitioning.

---

## 4) Why did we create a symlink `/dev/sdb -> /dev/nvme1n1`?
Cloud environments may use **NVMe naming** (`/dev/nvme*`) instead of `/dev/sd*`.  
Creating a symlink keeps the lab steps consistent without rewriting every command.

---

## 5) What is the difference between primary, extended, and logical partitions?
- **Primary**: real partitions on disk (max 4 on MBR/msdos)
- **Extended**: a container partition used when you need more than 4 partitions
- **Logical**: partitions created *inside* the extended partition (start at number 5)

---

## 6) What happens when you run `mkfs.ext4 /dev/sdb1`?
It creates a file system structure (metadata + journal + inode tables) on the partition.  
It **erases any existing data** on that partition.

---

## 7) How do you confirm the file system type and UUID?
Use:
- `blkid /dev/sdb1`
- `lsblk -f`

This confirms `TYPE=ext4/xfs/ext3`, `UUID=...`, and labels if set.

---

## 8) Why mount points are required?
A mount point is just an empty directory where the file system becomes accessible.  
Without a mount point, the file system exists but cannot be used in the Linux directory tree.

---

## 9) What is the difference between `mount /dev/sdb1 /mnt/data1` and `mount /mnt/data1`?
- `mount /dev/sdb1 /mnt/data1` mounts directly by specifying device + mount point.
- `mount /mnt/data1` works only when `/etc/fstab` has an entry for `/mnt/data1`.

---

## 10) Why is mounting by UUID/Label better than using `/dev/sdb1`?
Device names can change across boots or VM reattachment.  
UUID/Label stays consistent, so it’s safer for persistent mounts.

---

## 11) What is `/etc/fstab` used for?
`/etc/fstab` defines file systems that should be mounted automatically at boot, including:
- UUID/Label
- mount path
- file system type
- mount options
- fsck order

---

## 12) Why do we run `mount -a` after editing `/etc/fstab`?
To test the config safely **without rebooting**.  
If there is a typo, `mount -a` will fail immediately and prevent boot issues later.

---

## 13) What causes “target is busy” when unmounting?
A process is still using the mount (common causes):
- shell working directory is inside the mount
- open file handles inside the mount

Check with:
- `lsof /mnt/data1`
- `fuser -v /mnt/data1`

---

## 14) Why do we use `fsck` and `xfs_repair`?
- `fsck.ext4` checks/repairs ext* file systems.
- `xfs_repair` checks/repairs XFS file systems.

They help recover from file system corruption after crashes or improper shutdowns.

---

## 15) What’s the safest workflow when editing storage on Linux?
1. Identify correct disk (`lsblk`, `fdisk -l`)
2. Partition safely (`fdisk`)
3. Format partitions (`mkfs.*`)
4. Create mount points (`mkdir -p /mnt/...`)
5. Mount and test
6. Add `/etc/fstab` entries using UUID
7. Validate with `mount -a`
8. Document changes
