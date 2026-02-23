# 🧪 Lab 36: Using journalctl for System Logs

## 📌 Overview

This lab focuses on mastering **system log management using journalctl** in a CentOS/RHEL environment powered by systemd.

You will learn how to navigate logs efficiently, apply advanced filtering techniques, configure persistent storage, implement retention policies, and use logs to troubleshoot real-world system issues.

This lab simulates practical system administration scenarios aligned with RHCSA-level expectations.

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Navigate and filter system logs using journalctl
- Analyze system logs to diagnose system and service issues
- Filter logs by time, service, boot session, and priority level
- Enable persistent log storage across reboots
- Configure journal retention and rotation policies
- Generate system health insights using journal data

---

## ✅ Prerequisites

Before starting this lab, I should have:

- Basic Linux command-line knowledge
- Understanding of systemd services
- Familiarity with file permissions and directories
- Basic troubleshooting mindset
- Experience using vi/nano editors

---

## 🧰 Lab Environment

- CentOS Stream 9 (systemd-based)
- Root/sudo access
- journald service running
- Cloud-based VM environment

---

## 📂 Repository Structure

```text
lab36-journalctl-system-logs/
├── README.md
├── output.txt
├── commands.sh
├── interview_qna.md
└── troubleshooting.md
```

---

## 🧩 Lab Tasks Overview

### Task 1: Log Exploration & Filtering
- Viewing logs
- Time-based filtering
- Service/unit filtering
- Priority filtering
- Boot and kernel logs

### Task 2: Persistent Journal Configuration
- Runtime vs persistent storage
- Configuring `/etc/systemd/journald.conf`
- Storage size limits
- Retention policies
- Log rotation

### Task 3: Log Analysis & Diagnostics
- Investigating authentication failures
- Detecting failed services
- Kernel message analysis
- Creating a system health report script
- Automating log checks using cron

---

## 📊 What You Learned

- How journald stores logs (runtime vs persistent)
- How to filter logs using time, priority, and units
- How to diagnose service failures using logs
- How to manage journal disk usage
- How to create automated health-check reporting

---

## 🌍 Why This Matters

System logs are the **primary source of truth** during:

- Service failures
- Security incidents
- Authentication issues
- Boot problems
- Resource exhaustion
- Compliance audits

Mastering journalctl allows administrators to troubleshoot faster and maintain system stability.

---

## 🏢 Real-World Relevance

journalctl skills are critical for:

- Linux system administrators
- DevOps engineers
- Cloud engineers
- SOC analysts
- Incident response teams

Most enterprise Linux systems use systemd and journald as their logging backbone.

---

## 🏆 Result

At the end of this lab, I can:

✔ Investigate production incidents using journalctl  
✔ Configure persistent logging policies  
✔ Control journal disk usage  
✔ Automate log health checks  
✔ Prepare confidently for RHCSA-level tasks  

---

## 🔐 Certification Alignment

This lab reinforces:

- RHCSA log management objectives
- Service troubleshooting skills
- System monitoring fundamentals
- Log retention configuration

---
