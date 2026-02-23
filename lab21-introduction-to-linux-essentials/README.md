# 🐧 Lab 21 – Introduction to Linux Essentials (RHCSA Track)

## 🎯 Objective

This lab introduces the foundational Linux command-line skills required for Red Hat Certified System Administrator (RHCSA) preparation.

By completing this lab, I achieved the ability to:

- Navigate the Linux terminal confidently
- Execute essential file and directory commands
- Understand the Linux filesystem hierarchy
- Use manual pages for command documentation
- Work with absolute and relative paths
- Apply beginner-level system administration commands

This lab establishes the fundamental skills required for all advanced Linux administration tasks.

---

## 📌 Prerequisites

Before performing this lab, the following knowledge was required:

- Basic computer literacy
- Understanding of files and folders
- No prior Linux experience required
- Access to cloud-based Linux environment

---

## 🖥️ Lab Environment

| Component | Details |
|------------|----------|
| OS | CentOS Linux 7 (Core) |
| Distribution Type | RHEL-based |
| Shell | bash 4.2 |
| Hostname | ip-172-31-12-48 |
| User | centos |
| Environment Type | Cloud-based persistent lab |

Verified using:

```

cat /etc/os-release

```

---

## 📁 Repository Structure

```

lab21-introduction-to-linux-essentials/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

## 🧭 Task Overview & Execution Summary

---

### 🖥️ Task 1 – Terminal Navigation & Basic Commands

Performed the following:

- Verified operating system details
- Used `pwd` to determine working directory
- Used `ls` with multiple flags:
  - `-l`
  - `-la`
  - `-lh`
- Navigated directories using:
  - Absolute paths
  - Relative paths
  - `cd /`
  - `cd ~`
  - `cd ..`
  - `cd`

Verified root directory structure and returned to home safely.

---

### 📂 Task 2 – Linux Directory Structure Exploration

Explored key filesystem locations:

- `/`
- `/bin`
- `/etc`
- `/home`
- `/var`
- `/usr`
- `/tmp`
- `/dev`
- `/proc`

Observed:

- Core system binaries in `/bin`
- Configuration files in `/etc`
- User directories in `/home`
- Logs and variable data in `/var`
- Device files in `/dev`
- Process information in `/proc`

Practiced path traversal using:

- `cd /usr/bin`
- `cd ../share`
- `cd ../../home`

---

### 📘 Task 3 – Manual Pages & Documentation

Used:

- `man`
- `help`
- `whatis`
- `apropos`

Key activities:

- Opened manual pages (`man ls`)
- Searched inside manual using `/`
- Used manual sections (`man 1 passwd`, `man 5 passwd`)
- Identified built-in shell command documentation (`help cd`)
- Used `apropos` for keyword-based command search

---

### 🧪 Additional Practice

Executed:

- `whoami`
- `hostname`
- `date`
- `uptime`
- `file`
- `wc -l`

Verified:

- Current user identity
- System hostname
- System uptime and load average
- File types
- Count of binaries in `/usr/bin`

---

## 📊 Result

✔ Successfully navigated Linux terminal  
✔ Verified system details  
✔ Explored full filesystem hierarchy  
✔ Demonstrated absolute and relative path usage  
✔ Accessed command documentation effectively  
✔ Practiced foundational RHCSA command patterns  

All commands executed successfully in a CentOS 7 cloud lab environment.

---

## 🧠 What I Learned

- The Linux filesystem follows a standardized hierarchy
- The root directory (`/`) contains all system-level directories
- Hidden files begin with `.`
- `man` pages are critical for real-world system administration
- Some commands (like `cd`) are shell built-ins
- Relative paths improve navigation efficiency
- Every Linux system administrator relies heavily on terminal mastery

---

## 🚀 Why This Matters (RHCSA Relevance)

This lab builds:

- Command-line fluency
- Filesystem awareness
- Documentation lookup skills
- Administrative navigation confidence

These are **core competencies tested directly in RHCSA practical exams**.

Without mastering these basics, advanced tasks such as:

- User management
- File permissions
- Service configuration
- System troubleshooting

become significantly harder.

---

## 🌍 Real-World Applications

Skills from this lab apply directly to:

- Linux Server Administration
- Cloud VM Management
- DevOps environments
- Security Operations (SOC)
- Container host management
- Troubleshooting production systems

---

## 🏁 Conclusion

In this lab, I successfully:

- Navigated Linux using essential commands
- Explored system directories and structures
- Used documentation tools effectively
- Practiced RHCSA-aligned terminal workflows

This lab forms the foundation for all upcoming RHCSA system administration tasks.

---

✅ Lab 21 Completed Successfully  
📍 Environment: CentOS 7 (Cloud Lab)  
🎓 RHCSA Preparation Track
