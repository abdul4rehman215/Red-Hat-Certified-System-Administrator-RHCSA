
# 🧪 Lab 28: Working with Disk Partitions (fdisk, mkfs, mount, fstab)

## 📌 Overview

This lab demonstrates practical **Linux disk administration** on a CentOS/RHEL-based cloud system. You’ll inspect block devices, create **primary + extended + logical partitions**, format them with different file systems, mount/unmount them safely, and configure **persistent mounts** using `/etc/fstab`.

---

## 🎯 Objectives

* Understand disk/partition terminology and layout
* Create and manage partitions using `fdisk`
* Format partitions using `mkfs` (ext4, xfs, ext3)
* Mount/unmount file systems using `mount` / `umount`
* Mount reliably using **LABEL** and **UUID**
* Configure persistent mounts using `/etc/fstab`
* Validate partitions and usage using common system utilities

---

## ✅ Prerequisites

* Comfortable with Linux CLI and directory structure
* Basic understanding of file permissions / ownership
* Familiarity with commands like `ls`, `cat`, `df`, `mount`
* Sudo/root access in a lab environment

---

## 🧰 Lab Environment

* CentOS/RHEL-based cloud machine (EC2)
* User: `centos` (sudo enabled)
* Tools available: `fdisk`, `lsblk`, `mkfs.*`, `blkid`, `mount`, `umount`, `parted`, `fsck`, `xfs_repair`
* Extra virtual disk provided for practice (secondary NVMe disk)

---

## 🧩 Tasks Summary

### Task 1 — Disk Discovery + Partitioning

* Identify system disk vs practice disk
* Standardize naming (optional symlink) to keep lab steps consistent
* Create:

  * Primary partitions (`/dev/sdb1`, `/dev/sdb2`)
  * Extended partition (`/dev/sdb3`)
  * Logical partition (`/dev/sdb5`)

### Task 2 — File System Formatting + Labels

* Format partitions with different file systems:

  * ext4 (sdb1), xfs (sdb2), ext3 (sdb5)
* Apply labels for easier identification

### Task 3 — Mounting, Testing, and Unmounting

* Create mount points under `/mnt`
* Mount manually and verify with `df` + `mount`
* Create test files and validate persistence
* Unmount cleanly, and practice mounting by LABEL/UUID

### Task 4 — Persistent Mounts with `/etc/fstab`

* Backup `/etc/fstab`
* Add UUID-based mount rules
* Test safely using `mount -a` before reboot

### Task 5 — Admin Checks + Monitoring (Optional)

* Inspect partitions with `parted`
* Run filesystem checks (`fsck`, `xfs_repair`)
* Review performance using `iostat`
* View filesystem metadata (`tune2fs`, `xfs_info`)

### Cleanup (Optional)

* Unmount volumes
* Restore original `/etc/fstab`
* Remove mount point directories

---

## ✅ Result

* Practice disk successfully partitioned into primary + extended + logical layouts
* File systems created and verified (ext4/xfs/ext3)
* Mounting performed using device path, LABEL, and UUID
* Persistent mounts configured and validated with `mount -a`
* Common errors (busy mount, fsck workflows) tested and understood

---

## 🧠 What I Learned

* How to safely verify the correct target disk before partitioning
* Differences between primary/extended/logical partitions (msdos table)
* Choosing file systems based on workload (ext4 vs xfs)
* Why UUID/LABEL-based mounting is more stable than device names
* How to prevent boot issues by testing `/etc/fstab` changes correctly

---

## 🚀 Why This Matters

Disk and file system management is a **core Linux admin responsibility**. Most outages from storage changes come from:

* editing `/etc/fstab` incorrectly
* mounting the wrong device
* unmounting busy file systems without validating open handles

This lab builds safe habits to avoid those mistakes.

---

## 🌍 Real-World Relevance

* Adding a new disk to a server and mounting it permanently
* Separating workloads (logs, backups, application data) into dedicated partitions
* Recovering from mount failures using `fsck`, logs, and UUID verification
* Validating storage performance and filesystem metadata in production

---
