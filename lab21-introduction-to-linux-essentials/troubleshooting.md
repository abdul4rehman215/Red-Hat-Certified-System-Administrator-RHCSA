# 🛠 Troubleshooting Guide – Lab 21: Introduction to Linux Essentials

---

## 🔍 Overview

This document outlines common issues that may occur while performing basic Linux navigation and command-line tasks, along with structured diagnosis and resolution steps.

Although this lab focuses on foundational skills, early troubleshooting discipline is critical for RHCSA exam success and real-world system administration.

---

## ⚠️ Issue 1: Command Not Found

### 🧾 Problem
Running a command returns:

```

bash: command: command not found

````

### 🔎 Possible Causes
- Typographical error
- Command not installed
- Incorrect PATH environment variable
- Attempting to run a shell builtin with `man`

### 🛠 Diagnosis
Check spelling:
```bash
which <command>
````

Verify PATH:

```bash
echo $PATH
```

Check if it is a builtin:

```bash
help <command>
```

### ✅ Resolution

* Correct spelling
* Install missing package (if required)
* Use `help` for shell builtins like `cd`

---

## ⚠️ Issue 2: Permission Denied When Listing Files

### 🧾 Problem

```
ls: cannot open directory: Permission denied
```

### 🔎 Possible Causes

* Insufficient permissions
* Attempting to access restricted directories (e.g., `/root`)

### 🛠 Diagnosis

Check permissions:

```bash
ls -ld <directory>
```

Check current user:

```bash
whoami
```

### ✅ Resolution

* Navigate to allowed directories
* Use `sudo` (if permitted)
* Request proper access in production systems

---

## ⚠️ Issue 3: "No manual entry for cd"

### 🧾 Problem

```
No manual entry for cd
```

### 🔎 Cause

`cd` is a shell builtin, not an external command.

### 🛠 Diagnosis

Verify using:

```bash
type cd
```

### ✅ Resolution

Use:

```bash
help cd
```

---

## ⚠️ Issue 4: Cannot Navigate Using Relative Paths

### 🧾 Problem

```
bash: cd: ../directory: No such file or directory
```

### 🔎 Possible Causes

* Incorrect directory structure
* Typo in directory name
* Wrong current working directory

### 🛠 Diagnosis

Check current location:

```bash
pwd
```

List directories:

```bash
ls
```

### ✅ Resolution

Use correct path or switch to absolute path for verification:

```bash
cd /usr/share
```

---

## ⚠️ Issue 5: Hidden Files Not Visible

### 🧾 Problem

Configuration files like `.bashrc` are not visible.

### 🔎 Cause

Hidden files start with a dot (`.`) and are not displayed by default.

### 🛠 Diagnosis

Run:

```bash
ls -a
```

### ✅ Resolution

Use:

```bash
ls -la
```

---

## ⚠️ Issue 6: Confusion Between `/` and `~`

### 🧾 Problem

User mistakenly assumes `/` is home directory.

### 🔎 Explanation

* `/` → Root of entire filesystem
* `~` → Current user's home directory

### 🛠 Diagnosis

Check:

```bash
pwd
```

### ✅ Resolution

Return home using:

```bash
cd ~
```

or

```bash
cd
```

---

## ⚠️ Issue 7: Manual Search Not Working

### 🧾 Problem

Search inside man page fails.

### 🔎 Cause

Incorrect search syntax inside man.

### 🛠 Correct Usage

Inside `man`:

* Press `/` to search
* Type keyword
* Press `n` for next match
* Press `q` to quit

---

## ⚠️ Issue 8: Incorrect File Type Identification

### 🧾 Problem

File type unexpected when running:

```bash
file filename
```

### 🔎 Possible Cause

File may be binary, symbolic link, or compressed.

### 🛠 Diagnosis

Check detailed listing:

```bash
ls -l
```

### ✅ Resolution

Use correct command to open based on file type:

* `cat` for text
* `less` for larger text
* `tar` for archives
* `chmod +x` for executables

---

## 🎯 RHCSA Exam Tip

During the RHCSA exam:

* Always verify location using `pwd`
* Use `ls -l` to check permissions before editing
* Use `man` pages if unsure about command flags
* Avoid guessing — verify everything

Precision is critical in exam and production environments.

---

## 📌 Final Note

Even simple commands can fail due to:

* Incorrect assumptions
* Permission issues
* Path misunderstandings

Developing troubleshooting discipline early ensures:

* Faster problem resolution
* Reduced system downtime
* Higher confidence during practical exams

---
