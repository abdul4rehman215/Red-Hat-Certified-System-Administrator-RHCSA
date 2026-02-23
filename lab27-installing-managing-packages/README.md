# 📦 Lab 27: Installing and Managing Software Packages

---

## 🎯 Objective

This lab focuses on installing, managing, updating, verifying, and removing software packages on RHEL-based systems using `dnf`, `yum`, and `rpm`.

By completing this lab, you will gain practical experience in package lifecycle management — a core responsibility of Linux system administrators.

---

## 🧠 Skills Gained

- Installing packages using `dnf`
- Managing package groups
- Searching and querying packages
- Understanding the relationship between `dnf`, `yum`, and `rpm`
- Updating individual and system-wide packages
- Removing and cleaning unused packages
- Verifying package integrity
- Handling dependencies and conflicts
- Installing and verifying a web server stack

---

## 📋 Prerequisites

Before starting this lab, I should have:

- Basic Linux command-line knowledge
- Root or sudo privileges
- Internet connectivity
- Familiarity with system updates
- Basic understanding of software dependencies

---

## 🖥 Lab Environment

- RHEL / CentOS / Rocky Linux 8 or 9
- DNF package manager
- Internet-connected VM
- firewalld and system services available

---

## 🛠 Tasks Overview

### 1️⃣ Installing Packages Using dnf
- Checking package manager availability
- Updating repository metadata
- Searching for available packages
- Installing single and multiple packages
- Installing package groups

### 2️⃣ Querying Installed Packages
- Listing installed packages using `dnf`
- Querying packages using `rpm`
- Viewing package details
- Finding file ownership
- Verifying package integrity

### 3️⃣ Updating and Removing Packages
- Checking available updates
- Performing system-wide updates
- Removing unwanted packages
- Cleaning package cache
- Autoremoving unused dependencies

### 4️⃣ Practical Scenario: Installing Web Stack
- Installing Apache (httpd)
- Installing PHP and MariaDB
- Verifying installation
- Querying configuration files
- Removing specific components safely

---

## 🔐 Why This Lab Matters

Package management is a fundamental RHCSA exam objective and a daily system administration task.

Without proper package control:
- Systems become insecure
- Dependencies break
- Servers become unstable
- Patch management fails

Mastering `dnf` and `rpm` ensures secure and stable Linux environments.

---

## 🌍 Real-World Applications

- Installing production web servers
- Managing security updates
- Deploying development tools
- Automating system builds
- Maintaining clean and optimized servers
- Troubleshooting dependency conflicts

---

## 📊 Result

After completing this lab, I will be able to:

- Confidently install and remove software packages
- Verify integrity and package ownership
- Manage dependencies properly
- Maintain updated Linux systems
- Deploy and validate a web server stack

---

## 📁 Repository Structure

```

lab27-installing-managing-packages/
│
├── README.md
├── commands.sh
├── output.txt
├── interview.md
└── troubleshooting.md

```

---

## ✅ Conclusion

Package management is one of the most critical Linux administration skills.

This lab strengthens your understanding of:
- System updates
- Dependency resolution
- Software verification
- Secure package management practices

These skills are essential for RHCSA certification and real-world enterprise Linux environments.
