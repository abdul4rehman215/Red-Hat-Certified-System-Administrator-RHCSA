
# 🧪 Lab 30: Managing Systemd Services

## 🖥 Environment
- OS: CentOS / RHEL (Cloud EC2)
- Init System: systemd
- Shell: -bash-4.2$

---

## 🎯 Objectives

By completing this lab, I was able to:

- Start, stop, restart, and reload services using `systemctl`
- Enable and disable services at boot
- Check service status and configuration
- Understand systemd unit files
- Configure and manage boot targets
- Troubleshoot failed services using `journalctl`
- Diagnose service startup issues
- Manage dependencies between services

---

## 📚 Prerequisites

- Basic Linux command line knowledge
- Familiarity with process management
- Understanding of system services
- Basic knowledge of editing configuration files
- Access to a system running systemd

---

## 📂 Repository Structure

```

lab30-managing-systemd-services/
│
├── readme.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

## 🧩 Lab Overview

This lab covers:

### Task 1 — Managing Services
- Checking service status
- Starting and stopping services
- Restarting and reloading services
- Enabling and disabling services at boot
- Installing and managing Apache HTTP Server

### Task 2 — Managing Boot Targets
- Checking default target
- Viewing target dependencies
- Changing system boot target

### Task 3 — Troubleshooting Services
- Using `journalctl`
- Viewing service-specific logs
- Creating and diagnosing a failing systemd service
- Testing service behavior with Apache

---

## 🌍 Real-World Relevance

Systemd is the core init system in modern Linux distributions.  
Every production Linux server relies on systemd for:

- Service lifecycle management
- Automatic service recovery
- Boot-time configuration
- Logging and diagnostics
- Dependency handling

Mastering systemd is essential for:

- RHCSA certification
- Production Linux administration
- Cloud infrastructure management
- DevOps and SRE roles

---

## 🎓 What I Learned

After completing this lab, I can:

- Confidently manage system services
- Diagnose failed services quickly
- Control system startup behavior
- Deploy and manage services like Apache
- Understand unit files and dependencies
- Use journal logs for troubleshooting

---

## 🚀 Why This Matters

Modern Linux = systemd.

Without understanding systemd, you cannot:
- Properly manage production servers
- Troubleshoot outages
- Control boot behavior
- Handle service dependencies

This lab builds foundational skills required for real-world system administration and RHCSA exam objectives.

---
