# 🧪 Lab 29: Managing Logical Volumes (LVM)

## 📌 Overview
This lab demonstrates **end-to-end Logical Volume Management (LVM)** on CentOS/RHEL 8/9 using three unused practice disks (`/dev/sdb`, `/dev/sdc`, `/dev/sdd`). The workflow covers **PV → VG → LV**, mounting filesystems, **online expansion**, and validating the LVM state with monitoring commands.

---

## 🎯 Objectives
By the end of this lab, I was able to:
- Explain **LVM concepts** (PV, VG, LV, PE)
- Create **Physical Volumes** using `pvcreate`
- Build **Volume Groups** using `vgcreate` and extend with `vgextend`
- Create **Logical Volumes** using `lvcreate`
- Format LVs using `mkfs.ext4` and `mkfs.xfs`
- Mount LVs and verify usage with `df`, `mount`
- Extend LVs with `lvextend` and grow filesystems (`resize2fs`, `xfs_growfs`)
- Check LVM status using `pvs`, `vgs`, `lvs`, and scan tools

---

## ✅ Prerequisites
- Comfortable with Linux CLI
- Understanding of disks/partitions and filesystems
- Familiarity with mounting (`mount`, `umount`) and formatting (`mkfs`)
- Sudo/root access in a CentOS/RHEL-based environment

---

## 🧰 Lab Environment
- CentOS/RHEL 8/9 cloud machine (EC2)
- Shell prompt style: `-bash-4.2$`
- Practice disks provided:
  - `/dev/sdb`, `/dev/sdc`, `/dev/sdd` (unused)

---

## 🧩 Tasks Summary (High-Level)
### Task 1 — Physical Volumes (PV)
- Identify available disks and confirm they are unused
- Initialize disks as LVM physical volumes

### Task 2 — Volume Groups (VG)
- Create a VG from multiple PVs
- (Optional) Extend the VG by adding an additional PV

### Task 3 — Logical Volumes (LV)
- Create multiple LVs using fixed sizes and `%VG`
- Format LVs with ext4 and xfs
- Mount at designated mountpoints and validate

### Task 4 — Online Expansion
- Extend LVs dynamically
- Grow filesystems online (ext4 + XFS)
- Validate size changes after expansion

### Task 5 — Monitoring & Verification
- Use LVM reporting commands (`pvs/vgs/lvs`)
- Use scan commands (`pvscan/vgscan/lvscan`)
- Validate allocation and free space

### Task 6 — Persistent Mounts
- Add entries in `/etc/fstab`
- Test safely with `mount -a`

### Task 7 (Bonus) — Snapshots
- Create snapshots for point-in-time recovery testing
- Validate snapshot content vs. live LV changes

---

## ✅ What I Learned
- How LVM abstracts physical disks into a flexible storage pool
- How to resize storage safely without repartitioning
- Correct procedures for growing ext4 vs XFS filesystems
- How to validate LVM state and troubleshoot common storage issues

---

## 📌 Real-World Relevance
LVM is widely used in production for:
- Expanding storage without downtime
- Managing multi-disk capacity as one pool
- Supporting operational needs like snapshots (backup workflows)
- Scaling web/database/log volumes as usage grows

---

## 📎 Files in This Lab
- `README.md` → Overview + learning outcomes (this file)
- `commands.sh` → All commands executed (task-wise, clean)
- `output.txt` → Captured outputs (trimmed where needed)
- `interview.md` → Common interview questions + strong answers
- `troubleshooting.md` → Real-world issues, fixes, and safe recovery steps
