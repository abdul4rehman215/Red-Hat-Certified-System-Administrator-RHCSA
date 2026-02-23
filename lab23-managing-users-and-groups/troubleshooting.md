# 🛠 Troubleshooting Guide – Lab 23: Managing Users and Groups

This document provides structured troubleshooting guidance for common issues encountered during Linux user and group administration.

Each issue is presented as:

- 🔴 Problem  
- 🔎 Root Cause  
- 🧪 Diagnosis  
- ✅ Resolution  

---

# 1️⃣ User Already Exists

## 🔴 Problem
While creating a user:

```bash
useradd john
````

Error:

```text
useradd: user 'john' already exists
```

---

## 🔎 Root Cause

* The username already exists in `/etc/passwd`
* UID conflict
* User was previously created but not removed

---

## 🧪 Diagnosis

Check if the user exists:

```bash
id john
```

or

```bash
grep john /etc/passwd
```

Example output:

```text
john:x:1001:1001::/home/john:/bin/bash
```

---

## ✅ Resolution

Option 1 – Use a different username.

Option 2 – Remove existing user:

```bash
userdel -r john
```

⚠️ Warning: `-r` removes the home directory.

---

# 2️⃣ Permission Denied While Creating Users

## 🔴 Problem

```bash
useradd newuser
```

Error:

```text
useradd: Permission denied.
```

---

## 🔎 Root Cause

* Command executed without root privileges
* Current user lacks sudo permissions

---

## 🧪 Diagnosis

Check current user:

```bash
whoami
```

If output is not `root`, then privileges are insufficient.

---

## ✅ Resolution

Switch to root:

```bash
sudo -i
```

Or execute with sudo:

```bash
sudo useradd newuser
```

---

# 3️⃣ Home Directory Not Created

## 🔴 Problem

User created successfully, but no home directory exists:

```bash
ls -ld /home/username
```

Output:

```text
No such file or directory
```

---

## 🔎 Root Cause

* `useradd` executed without `-m`
* HOME setting misconfigured in `/etc/default/useradd`

---

## 🧪 Diagnosis

Check default settings:

```bash
cat /etc/default/useradd
```

Look for:

```text
CREATE_MAIL_SPOOL=yes
HOME=/home
```

---

## ✅ Resolution

Manually create home directory:

```bash
mkdir /home/username
cp -r /etc/skel/. /home/username/
chown -R username:username /home/username
```

Or recreate properly:

```bash
useradd -m username
```

---

# 4️⃣ Shell Does Not Exist Error

## 🔴 Problem

```bash
usermod -s /bin/zsh jsmith
```

Error:

```text
Shell /bin/zsh does not exist
```

---

## 🔎 Root Cause

* Shell not installed
* Shell not listed in `/etc/shells`

---

## 🧪 Diagnosis

Check installed shells:

```bash
cat /etc/shells
```

Verify shell path:

```bash
ls /bin/zsh
```

---

## ✅ Resolution

Install shell:

```bash
yum install -y zsh
```

Then retry:

```bash
usermod -s /bin/zsh jsmith
```

---

# 5️⃣ Group Assignment Not Working

## 🔴 Problem

User added to group but membership not reflected:

```bash
groups john
```

Output does not show expected group.

---

## 🔎 Root Cause

* Used `-G` without `-a`
* Existing groups overwritten

Incorrect usage:

```bash
usermod -G developers john
```

---

## 🧪 Diagnosis

Check group membership:

```bash
id john
```

---

## ✅ Resolution

Correct command:

```bash
usermod -a -G developers john
```

Recheck:

```bash
groups john
```

---

# 6️⃣ Password Policy Not Enforced

## 🔴 Problem

Password expiration not working as expected.

---

## 🔎 Root Cause

* `chage` not configured
* System-wide policy not set in `/etc/login.defs`

---

## 🧪 Diagnosis

Check current settings:

```bash
chage -l username
```

Check system defaults:

```bash
grep PASS_MAX_DAYS /etc/login.defs
```

---

## ✅ Resolution

Set per-user:

```bash
chage -M 90 username
chage -m 7 username
chage -W 7 username
```

Or modify `/etc/login.defs`:

```text
PASS_MAX_DAYS   90
PASS_MIN_DAYS   7
PASS_WARN_AGE   7
```

---

# 7️⃣ Account Locked Unexpectedly

## 🔴 Problem

User cannot log in.

---

## 🔎 Root Cause

* Account locked (`usermod -L`)
* Password field contains `!`
* Expired account

---

## 🧪 Diagnosis

Check shadow file:

```bash
grep username /etc/shadow
```

If you see:

```text
username:!!:...
```

Account is locked.

---

## ✅ Resolution

Unlock account:

```bash
usermod -U username
```

Or reset password:

```bash
passwd username
```

---

# 8️⃣ Cannot Delete Group

## 🔴 Problem

```bash
groupdel developers
```

Error:

```text
groupdel: cannot remove the primary group of user 'bdev'
```

---

## 🔎 Root Cause

* Group is primary group for an existing user

---

## 🧪 Diagnosis

Check group usage:

```bash
grep developers /etc/passwd
```

---

## ✅ Resolution

Change user's primary group first:

```bash
usermod -g anothergroup bdev
```

Then delete group:

```bash
groupdel developers
```

---

# 9️⃣ Files Not Inheriting Group in Shared Directory

## 🔴 Problem

Files created in shared directory do not inherit group ownership.

---

## 🔎 Root Cause

* setgid bit not set on directory

---

## 🧪 Diagnosis

Check permissions:

```bash
ls -ld /shared/marketing
```

If it does not show:

```text
drwxrws---
```

Then setgid not enabled.

---

## ✅ Resolution

Enable setgid:

```bash
chmod g+s /shared/marketing
```

---

# 🔟 Incorrect File Ownership After User Deletion

## 🔴 Problem

User deleted but files remain owned by numeric UID.

---

## 🔎 Root Cause

* Files remain on system after user deletion

---

## 🧪 Diagnosis

Search by UID:

```bash
find / -uid 1001 2>/dev/null
```

---

## ✅ Resolution

Reassign ownership:

```bash
chown newuser:newgroup filename
```

Or remove orphaned files if safe.

---

# 🔐 Security Audit Checklist

After managing users and groups, always verify:

✔ Unused accounts are locked
✔ No users have unnecessary sudo access
✔ Password policies are enforced
✔ System users use `/sbin/nologin`
✔ Shared directories use correct permissions
✔ `/etc/passwd` and `/etc/shadow` are secured

---

# 🧾 Final Notes

User and group misconfiguration is one of the most common causes of:

* Privilege escalation
* Unauthorized access
* Service misbehavior
* Compliance violations

Mastery of troubleshooting user and group issues is essential for:

* RHCSA certification
* Production Linux administration
* Security hardening
* DevOps and infrastructure roles

---

✅ End of Lab 23 – Troubleshooting Guide
