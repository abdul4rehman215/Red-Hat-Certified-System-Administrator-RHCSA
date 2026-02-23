# 🛠 Troubleshooting Guide – Lab 01: Understanding Shell Basics

---

## 📌 Overview

This document outlines common issues that may occur while working with basic shell commands, navigation, and input/output redirection. Each issue includes:

- Problem
- Possible Cause
- Resolution

---

## 1️⃣ Command Not Found Error

### ❌ Problem
```

bash: ls: command not found

```

### 🔎 Cause
- `$PATH` environment variable misconfigured
- Core utilities missing (rare in standard Ubuntu/RHEL systems)

### ✅ Resolution
Verify PATH:
```

echo $PATH

```

Check command location:
```

which ls

```

If missing, reinstall core utilities:
```

sudo apt reinstall coreutils

```

---

## 2️⃣ Permission Denied When Accessing Directory

### ❌ Problem
```

ls: cannot open directory '/root': Permission denied

```

### 🔎 Cause
User lacks required permissions to access the directory.

### ✅ Resolution
Use sudo (if authorized):
```

sudo ls /root

```

Or verify directory permissions:
```

ls -ld /root

```

---

## 3️⃣ cd Command Does Not Change Directory

### ❌ Problem
```

bash: cd: /invalid/path: No such file or directory

```

### 🔎 Cause
Incorrect or non-existent path provided.

### ✅ Resolution
Verify path exists:
```

ls /

```

Use tab completion to reduce errors:
```

cd /tm<TAB>

```

---

## 4️⃣ Output Redirection Not Working

### ❌ Problem
File not created after:
```

ls -l > file.txt

```

### 🔎 Cause
- Directory not writable
- Incorrect path specified

### ✅ Resolution
Check permissions:
```

ls -ld .

```

Confirm file creation:
```

ls -l file.txt

```

Ensure you have write permission in current directory.

---

## 5️⃣ Accidental File Overwrite Using `>`

### ❌ Problem
Previous content lost after:
```

echo "data" > file.txt

```

### 🔎 Cause
`>` overwrites file content by design.

### ✅ Resolution
Use append operator:
```

echo "data" >> file.txt

```

Prevent overwrite:
```

set -o noclobber

```

---

## 6️⃣ Input Redirection Produces No Output

### ❌ Problem
```

sort < emptyfile.txt

```

No output displayed.

### 🔎 Cause
Input file is empty.

### ✅ Resolution
Verify file content:
```

cat emptyfile.txt

```

Add data and retry.

---

## 7️⃣ Hidden Files Not Visible

### ❌ Problem
`.bashrc` not showing in `ls`.

### 🔎 Cause
Default `ls` does not show hidden files.

### ✅ Resolution
Use:
```

ls -a

```

---

## 8️⃣ Pipe Not Filtering Results

### ❌ Problem
```

ls -l | grep ".log"

```
Returns nothing.

### 🔎 Cause
No matching files exist.

### ✅ Resolution
Verify files:
```

ls -l

```

Check correct pattern:
```

ls -l | grep log

```

---

## 9️⃣ Wrong Working Directory Confusion

### ❌ Problem
Commands affecting unexpected location.

### 🔎 Cause
User unaware of current directory.

### ✅ Resolution
Always verify:
```

pwd

```

Before running file-modifying commands.

---

## 🔟 File Permission Confusion in ls -l

### ❌ Problem
Unsure what this means:
```

drwxr-xr-x

```

### 🔎 Cause
Lack of understanding of permission model.

### ✅ Resolution
Breakdown:

- `d` → directory
- `rwx` → owner permissions
- `r-x` → group permissions
- `r-x` → others permissions

Use:
```

man chmod

```

---

## 1️⃣1️⃣ Incorrect Use of Relative Paths

### ❌ Problem
```

cd Documents

```
Fails from `/tmp`.

### 🔎 Cause
Directory not present in current location.

### ✅ Resolution
Use absolute path:
```

cd /home/toor/Documents

```

Or navigate step-by-step.

---

# 📘 Preventive Best Practices

- Always verify current directory with `pwd`
- Use `ls` before modifying files
- Prefer `>>` over `>` when unsure
- Use tab completion to reduce path errors
- Check permissions before accessing restricted directories

---

# 🏁 Lab 01 Troubleshooting Summary

All commands in this lab executed successfully without system-level errors.  
This troubleshooting reference serves as a preventive and interview-preparation resource for RHCSA exam readiness.

---
