# 🧪 Lab 15: Managing Disk Quotas (CentOS/RHEL 8/9)

## 📌 Overview
This lab demonstrates how to **enable, configure, enforce, and monitor disk quotas** on a Linux system.  
The environment uses **CentOS/RHEL-style tooling** and an **XFS root filesystem**, so quota enablement follows **XFS quota options** (`uquota`, `gquota`, `prjquota`) and validation via `xfs_quota`.

---

## 🎯 Objectives
By the end of this lab, I was able to:

- Understand **why quotas matter** in multi-user Linux environments
- Enable quota support on file systems (XFS / ext4 considerations)
- Configure user quotas using `edquota`
- Monitor usage and limits with `quota` and `repquota`
- Validate enforcement with real file creation tests
- Troubleshoot common quota issues (mount options, enforcement, tooling)

---

## ✅ Prerequisites
- Comfortable with Linux CLI
- Basic file permissions + ownership
- Familiarity with users/groups
- Basic text editor usage (vi/nano)

---

## 🧰 Lab Environment
- **OS:** CentOS/RHEL 8/9 style (cloud lab)
- **Filesystem:** XFS on `/` (root)
- **Tools:** `quota`, `quota-nls`, `xfs_quota`
- **Access:** user `centos` with sudo

---

## 🧩 What I Did 
### 1) Enabled Quotas on XFS
- Confirmed filesystem + installed quota tools
- Updated `/etc/fstab` to include:
  - `uquota,gquota` (and observed `prjquota`)
- Remounted `/` to apply the options
- Verified quota state using:
  - `xfs_quota -x -c 'state' /`

### 2) Created Users and Applied Quotas
- Created lab users (`testuser1`, `testuser2`, `testuser3`)
- Set user quota limits with `edquota`
- Copied quota template using `edquota -p`
- Configured grace periods using `edquota -t`

### 3) Monitored and Reported Quotas
- Checked per-user usage using `quota -u`
- Generated system-wide reports using `repquota /` and `repquota -a`
- Verified soft/hard limit behavior and symbols (`+`, `*`)

### 4) Tested Enforcement
- Logged in as `testuser1`
- Created files to cross soft limit (grace period starts)
- Tried exceeding hard limit → `Disk quota exceeded`

---

## ✅ Key Commands Used
### Filesystem + quota setup
```bash
df -h
cat /etc/fstab
sudo mount -o remount /
mount | grep " on / "
sudo xfs_quota -x -c 'state' /
````

### User quota management

```bash
sudo useradd testuser1
sudo passwd testuser1
sudo edquota -u testuser1
sudo edquota -p testuser1 testuser3
sudo edquota -t
```

### Monitoring

```bash
sudo quota -u testuser1 -h
sudo repquota -h /
sudo repquota -a
sudo warnquota
```

### Enforcement testing

```bash
sudo su - testuser1
dd if=/dev/zero of=testfile1 bs=1M count=40
quota -u
dd if=/dev/zero of=testfile2 bs=1M count=70
exit
```

---

## 📂 Repository Contents

* `README.md` — overview + what was done
* `commands.sh` — clean command log for replication
* `output.txt` — captured outputs (copy-paste friendly)
* `scripts/` — helper scripts (verification/reporting)
* `interview_qna.md` — RHCSA + admin interview questions
* `troubleshooting.md` — common quota issues + fixes

---

## 🏁 Result

Quotas were successfully enabled and enforced on the XFS filesystem:

* Soft limit exceeded ✅ (grace period triggered)
* Hard limit enforced ✅ (`Disk quota exceeded`)
* Reporting validated ✅ (`repquota`, `quota`)
