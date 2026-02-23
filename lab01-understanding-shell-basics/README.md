# 🐚 Lab 01 – Understanding Shell Basics 

# 🎯 Objectives

By completing this lab, I was able to:

* Understand the structure of shell commands
* Execute and interpret basic shell commands (`ls`, `pwd`, `cd`)
* Navigate the Linux file system efficiently
* Perform input and output redirection
* Combine commands using pipes
* Work with hidden files and file attributes

These foundational skills are essential for RHCSA certification and Linux system administration.

---

# 📋 Prerequisites

* Linux-based operating system
* Terminal access
* Basic familiarity with CLI environment

---

## 📁 Repository Structure

```

lab01-understanding-shell-basics/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md

```

---

## 🖥 Lab Environment

| Component | Details |
|------------|----------|
| OS | Ubuntu 24.04.1 LTS |
| Platform | Cloud Lab (EC2-based environment) |
| User | toor |
| Shell | Bash |

---

# 🧩 Task Overview

This lab was divided into three major sections:

1. Understanding shell command structure
2. Practicing core shell navigation commands
3. Managing input/output redirection and command combinations

Each section builds fundamental command-line confidence required for Red Hat system administration.

---

# 🧩 Task 1 – Understanding Shell Command Structure

Shell commands follow the format:

```
command [options] [arguments]
```

### Example:

```bash
ls -l /home
```

* `ls` → command
* `-l` → option
* `/home` → argument

### What Was Performed

* Executed command with option and argument
* Verified directory structure
* Observed how options modify command behavior

This confirmed how shell commands are structured and interpreted.

---

# 📂 Task 2 – Core Shell Command Practice

## 🔹 Listing Files with `ls`

Commands executed:

* `ls`
* `ls -l`
* `ls -a`

### Key Concepts Observed

* Default listing view
* Long listing format (`-l`)
* Viewing hidden files (`-a`)
* File permissions
* Ownership and file sizes

---

## 🔹 Print Working Directory – `pwd`

Used to verify absolute path of current directory.

Confirmed:

* Working directory changes reflect immediately
* Absolute path always begins with `/`

---

## 🔹 Directory Navigation – `cd`

Commands used:

* `cd ~`
* `cd /tmp`
* `cd ..`

Verified:

* Home directory shortcut (`~`)
* Absolute paths
* Relative paths
* Moving up directory hierarchy

---

# 🔄 Task 3 – Input and Output Redirection

## 🔹 Output Redirection (`>`)

Redirected command output into file:

```
ls -l > file_list.txt
```

Observed:

* File created
* Terminal output suppressed
* File overwritten if exists

---

## 🔹 Append Output (`>>`)

Appended date to existing file:

```
date >> file_list.txt
```

Confirmed:

* Data appended
* Existing content preserved

---

## 🔹 Input Redirection (`<`)

Used file as input to command:

```
sort < names.txt
```

Confirmed:

* File contents processed without manual typing
* Standard input redirected

---

# 🔄 Additional Practice – Command Combination

## 🔹 Piping (`|`)

```
ls -l | grep ".txt"
```

Filtered output to show only `.txt` files.

## 🔹 Human Readable Format

```
ls -lh
```

Displayed file sizes in KB format instead of bytes.

---

# 🧠 What I Learned

* How shell commands are structured internally
* Difference between options and arguments
* Importance of absolute vs relative paths
* File permission visibility in long format
* Output redirection vs append
* Input redirection mechanics
* Basic command chaining using pipes

This lab reinforced the foundation of Linux CLI usage.

---

# 🌍 Real-World Relevance

These skills are critical for:

* Linux system administration
* Log analysis
* Automation scripting
* File management
* DevOps workflows
* Red Hat Certification exams
* Cybersecurity operations

Command-line proficiency is mandatory in enterprise Linux environments.

---

# 📌 Why This Matters

Understanding the shell is the first and most important step in:

* Server management
* Service configuration
* Security hardening
* Troubleshooting production systems
* Working in headless Linux environments

Without strong shell fundamentals, advanced RHCSA tasks become difficult.

---

# 🏁 Result

All tasks executed successfully.

✔ Command structure validated
✔ File navigation confirmed
✔ Redirection techniques demonstrated
✔ Command combination tested

Lab 01 completed successfully as part of RHCSA preparation.

---
