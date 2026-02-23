# 🛠 Troubleshooting Guide – Lab 22: Navigating the Linux File System

---

## 🔍 Overview

This document outlines common issues encountered while navigating the Linux filesystem and using file location tools such as `find`, `locate`, and `which`.

The issues below reflect realistic behavior observed in minimal CentOS/RHEL environments and during RHCSA-style lab work.

---

# ⚠️ Issue 1: `sudo: command not found`

## 🧾 Problem

```

-bash: sudo: command not found

````

## 🔎 Cause

Minimal CentOS installations often do not include `sudo` or `mlocate` by default.

## 🛠 Diagnosis

Verify if sudo exists:

```bash
which sudo
````

If no output appears, it is not installed.

## ✅ Resolution

Switch to root:

```bash
su -
```

Install required packages:

```bash
yum install -y mlocate sudo
```

Then return to normal user:

```bash
exit
```

---

# ⚠️ Issue 2: `locate` Not Finding Recently Created Files

## 🧾 Problem

`locate report.txt` returns nothing even though the file exists.

## 🔎 Cause

The locate database has not been updated since file creation.

`locate` depends on a database, not real-time scanning.

## 🛠 Diagnosis

Run:

```bash
sudo updatedb
```

## ✅ Resolution

Update database:

```bash
sudo updatedb
```

Then retry:

```bash
locate report.txt
```

---

# ⚠️ Issue 3: Permission Denied Errors with find

## 🧾 Problem

```
find: ‘/etc/somefolder’: Permission denied
```

## 🔎 Cause

The current user does not have permission to read certain directories.

## 🛠 Diagnosis

Check directory permissions:

```bash
ls -ld /etc/somefolder
```

## ✅ Resolution

Suppress errors:

```bash
find /etc -name "*.conf" 2>/dev/null
```

Or run as root:

```bash
sudo find /etc -name "*.conf"
```

---

# ⚠️ Issue 4: `which` Does Not Find Custom Script

## 🧾 Problem

```
which hello.sh
```

Returns nothing.

## 🔎 Cause

Directory containing script is not included in PATH.

## 🛠 Diagnosis

Check PATH:

```bash
echo $PATH
```

## ✅ Resolution

Temporarily add directory:

```bash
export PATH=$PATH:~/lab2/scripts
```

Verify:

```bash
which hello.sh
```

---

# ⚠️ Issue 5: Relative Path Navigation Fails

## 🧾 Problem

```
cd ../../../it/servers
bash: cd: No such file or directory
```

## 🔎 Cause

Incorrect number of `..` references or wrong starting directory.

## 🛠 Diagnosis

Check current directory:

```bash
pwd
```

List directories:

```bash
ls
```

## ✅ Resolution

Use absolute path for verification:

```bash
cd ~/lab2/company/it/servers
```

Then retry relative navigation carefully.

---

# ⚠️ Issue 6: `find -size +0c` Only Shows hello.sh

## 🧾 Explanation

Files created with `touch` are 0 bytes.

Only `hello.sh` contains content, therefore:

```bash
find ~/lab2 -type f -size +0c
```

Returns only:

```
hello.sh
```

This behavior is correct and expected.

---

# ⚠️ Issue 7: `find` Appears Slow

## 🔎 Explanation

`find` performs a real-time filesystem scan.

Example timing comparison:

* `locate passwd` → ~0.007s
* `find / -name "passwd"` → ~2 seconds

This difference is normal.

---

# ⚠️ Issue 8: PATH Conflicts

## 🧾 Problem

Unexpected binary runs when typing a command.

## 🔎 Cause

Multiple versions of command exist.

Check all versions:

```bash
which -a python
```

Order of directories in PATH determines execution priority.

## ✅ Resolution

Adjust PATH carefully:

```bash
export PATH=/preferred/path:$PATH
```

---

# ⚠️ Issue 9: Using `cd -` Confusion

## 🔎 Explanation

`cd -` toggles between current and previous directory only.

It does NOT cycle through multiple directory history entries.

Use `pushd/popd` for stack-based navigation if needed.

---

# 🎯 RHCSA Exam Tips

* Always confirm location using `pwd`
* Prefer absolute paths when copying/moving important files
* Use `2>/dev/null` to suppress noise in exam environment
* Install missing packages when necessary (minimal installations are common)
* Use `which` before troubleshooting command behavior

---

# 📌 Final Notes

This lab reinforced troubleshooting awareness in:

* Minimal OS environments
* PATH misconfigurations
* Permission-related filesystem scanning
* Database-based vs real-time file searching

Understanding these behaviors prevents common administrative mistakes and improves efficiency in production Linux systems.
