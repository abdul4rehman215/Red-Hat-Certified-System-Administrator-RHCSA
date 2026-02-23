# 🎯 Interview Q&A — Lab 35: Managing Disk Quotas (RHCSA Focus)

> This section contains practical interview questions and answers based on real-world Linux system administration and RHCSA-level expectations.

---

## 1️⃣ What is a disk quota in Linux?

A disk quota is a mechanism that limits the amount of disk space and number of files (inodes) a user or group can use on a filesystem.  
It prevents individual users from consuming excessive storage resources.

---

## 2️⃣ What is the difference between soft limit and hard limit?

- **Soft Limit:** Warning threshold. User can exceed it temporarily during a grace period.
- **Hard Limit:** Absolute maximum. System blocks further writes immediately once reached.

---

## 3️⃣ What happens when a user exceeds the soft limit?

- User can still write data.
- Grace period countdown starts.
- If usage is not reduced before grace expires, soft limit becomes enforced like hard limit.

---

## 4️⃣ How do you enable quotas on an XFS filesystem?

1. Add mount options in `/etc/fstab`:
```

defaults,uquota,gquota

```
2. Remount filesystem:
```

mount -o remount /

```
3. Verify:
```

xfs_quota -x -c 'state' /

````

---

## 5️⃣ How is enabling quotas different on ext4 vs XFS?

| Feature | ext4 | XFS |
|----------|------|------|
| Mount Options | usrquota,grpquota | uquota,gquota |
| Database Files | aquota.user/group | Not used |
| Enable Tool | quotacheck + quotaon | xfs_quota |

---

## 6️⃣ Which commands are used to manage quotas?

- `edquota` → Edit user/group quotas  
- `quota` → Check user quota  
- `repquota` → Generate reports  
- `warnquota` → Notify users  
- `xfs_quota` → XFS quota management  

---

## 7️⃣ How do you copy quota settings from one user to another?

```bash
sudo edquota -p sourceuser targetuser
````

This duplicates soft/hard limits from one user to another.

---

## 8️⃣ How do you check if quota is enforced?

For XFS:

```bash
sudo xfs_quota -x -c 'state' /
```

Look for:

```
Accounting: ON
Enforcement: ON
```

---

## 9️⃣ What does `*` mean in quota output?

* `*` next to block usage → Soft limit exceeded.
* `+` in `repquota` → User exceeded limit.

Example:

```
40960*   50000   100000   6days
```

---

## 🔟 What command generates a full quota report?

```bash
sudo repquota -a
```

This shows all users, usage, limits, and grace status.

---

## 1️⃣1️⃣ How do you test quota enforcement?

Switch to user and attempt to exceed limits:

```bash
dd if=/dev/zero of=file bs=1M count=100
```

If hard limit is reached:

```
Disk quota exceeded
```

---

## 1️⃣2️⃣ Why are quotas important in enterprise environments?

* Prevent disk exhaustion
* Protect system stability
* Ensure fair resource allocation
* Support multi-user environments
* Essential for shared hosting & corporate servers

---

## 1️⃣3️⃣ How do you temporarily disable quotas?

For ext4:

```bash
sudo quotaoff /mountpoint
```

For XFS, manage via mount options or xfs tools.

---

## 1️⃣4️⃣ What is grace period?

Grace period defines how long a user may exceed the soft limit before enforcement begins.

Configured using:

```bash
sudo edquota -t
```

---

## 1️⃣5️⃣ RHCSA Exam Tip

On RHCSA:

* Always verify filesystem type first (`df -T`)
* Use correct mount options
* Remember XFS uses `uquota/gquota`
* Validate using `xfs_quota -x -c 'state'`
* Always test with `repquota`

---

# 🏁 Interview Readiness Summary

If you can:

* Enable quotas correctly
* Configure user limits
* Interpret quota reports
* Troubleshoot enforcement issues

You demonstrate real-world Linux system administration competency.

---
