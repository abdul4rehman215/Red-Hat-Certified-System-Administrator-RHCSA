# 🛠 Troubleshooting Guide — Lab 35: Managing Disk Quotas (CentOS/RHEL, XFS Focus)

> This guide documents common quota-related problems encountered in real-world Linux environments and how to resolve them properly.

---

# 🔎 Issue 1: Quotas Not Enforcing After Configuration

## ❌ Symptoms
- `edquota` configured limits
- `repquota` shows limits
- Users can still exceed limits without restriction

## 🔍 Root Cause
- Filesystem not mounted with quota options
- Filesystem not remounted
- Quota enforcement not enabled

## ✅ Fix (XFS)

### 1️⃣ Verify mount options

```bash
mount | grep " on / "
````

You should see:

```
uquota,gquota
```

### 2️⃣ If missing, edit `/etc/fstab`

Ensure:

```
UUID=... / xfs defaults,uquota,gquota 0 0
```

### 3️⃣ Remount filesystem

```bash
sudo mount -o remount /
```

### 4️⃣ Verify state

```bash
sudo xfs_quota -x -c 'state' /
```

Look for:

```
Accounting: ON
Enforcement: ON
```

---

# 🔎 Issue 2: `quota: Cannot find filesystem`

## ❌ Example

```bash
quota -u testuser1
```

Error:

```
Cannot find filesystem to check or filesystem not supported
```

## 🔍 Cause

* Quota not enabled on that mount
* Wrong mount point used
* `/home` not a separate filesystem

## ✅ Fix

Check actual mount:

```bash
df -T
```

If `/home` is part of `/`, run:

```bash
sudo repquota /
```

Not:

```bash
sudo repquota /home
```

---

# 🔎 Issue 3: `quotacheck` Not Working on XFS

## ❌ Example

```bash
sudo quotacheck -avug
```

Error:

```
Cannot find filesystem to check or filesystem not supported.
```

## 🔍 Explanation

`quotacheck` is mainly for **ext2/3/4**.

XFS does not use `aquota.user` or `aquota.group`.

## ✅ Correct Approach for XFS

Use:

```bash
sudo xfs_quota -x -c 'state' /
```

Manage limits via:

```bash
sudo edquota -u username
```

or

```bash
sudo xfs_quota -x -c 'limit bsoft=50m bhard=100m username' /
```

---

# 🔎 Issue 4: `Disk quota exceeded` Immediately

## ❌ Cause

* Hard limit too low
* Grace period expired
* Inode limit reached

## 🔍 Diagnose

```bash
quota -u username
```

Look at:

* Block usage
* Inode usage
* Grace period remaining

## ✅ Fix

Increase limits:

```bash
sudo edquota -u username
```

Or delete files to reduce usage.

---

# 🔎 Issue 5: Soft Limit Exceeded But No Block

## ❓ Why?

Soft limit allows temporary excess during grace period.

Example output:

```
40960*   50000   100000   6days
```

`*` means soft limit exceeded.

System only blocks writes after grace period expires.

---

# 🔎 Issue 6: `warnquota` Shows No Violations

## ❓ Why?

User exceeded soft limit but still within grace period.

`warnquota` only flags users who:

* Exceeded hard limit
* Or exceeded soft limit AND grace expired

---

# 🔎 Issue 7: Permission Denied Running edquota

## ❌ Example

```bash
edquota -u testuser1
```

Error:

```
Permission denied
```

## ✅ Fix

Must run as root:

```bash
sudo edquota -u testuser1
```

---

# 🔎 Issue 8: Home Directories Not Owned by User

## ❌ Symptoms

* Quota appears unused
* User cannot create files

## 🔍 Diagnose

```bash
ls -ld /home/testuser1
```

## ✅ Fix

```bash
sudo chown testuser1:testuser1 /home/testuser1
```

---

# 🔎 Issue 9: Quotas Work After Reboot? (Persistence)

## ❓ Important RHCSA Question

If quotas stop working after reboot:

* Mount options missing in `/etc/fstab`

Verify:

```bash
cat /etc/fstab
```

Correct entry required for persistence.

---

# 🔎 Issue 10: Understanding `+` and `*` in repquota

Example:

```
testuser1 +- 40960 50000 100000 6days
```

Meaning:

| Symbol | Meaning                |
| ------ | ---------------------- |
| `+`    | Soft limit exceeded    |
| `-`    | No hard limit exceeded |
| `*`    | Hard limit exceeded    |

---

# 🧠 Enterprise Best Practices

✔ Always verify mount options before setting quotas
✔ Use soft + hard limits together
✔ Configure grace period policy
✔ Monitor regularly using `repquota -a`
✔ Document quota policies
✔ Test enforcement before production rollout

---

# 🔐 Security & Stability Impact

Without quotas:

* One user can fill entire disk
* System services may crash
* Logs may fail to write
* Applications may break
* Database corruption risk increases

Quotas protect system stability.

---

# 🎯 RHCSA Exam Tips

* Know difference: ext4 vs XFS quotas
* Verify mount options first
* Use `edquota` correctly
* Understand grace period behavior
* Test with `dd`
* Always validate using `repquota`

---

# ✅ Final Verification Checklist

* [x] Quota mount options applied
* [x] Quota enforcement enabled
* [x] User limits configured
* [x] Soft limit tested
* [x] Hard limit enforced
* [x] Reports generated
* [x] Grace period verified

---

# 🏁 Lab 35 Completed Successfully

I have demonstrated:

* Filesystem-level configuration
* User-level resource control
* Monitoring & reporting
* Enforcement validation
* Real-world troubleshooting

These skills are essential for RHCSA and enterprise Linux system administration.
