# 🧪 Lab 37: Using Cron Jobs for Task Automation

## 📌 Overview
This lab focuses on **Linux task automation** using **cron** (recurring schedules) and **at** (one-time schedules). It demonstrates how to:
- verify scheduler services (`crond`, `atd`)
- create and manage per-user cron schedules with `crontab`
- automate real sysadmin workflows (uptime logging, backups, disk monitoring)
- validate execution using journald (`journalctl -u crond`)
- apply troubleshooting and reliability best practices

This lab is aligned with **RHCSA-style administration** and real production automation patterns.

---

## 🎯 Objectives
By the end of this lab, I was able to:

- understand cron’s purpose and scheduling model
- write correct cron expressions and manage jobs with `crontab`
- build automation scripts for backups and monitoring
- schedule one-time tasks using `at`
- verify scheduled task execution and audit activity
- troubleshoot failures caused by permissions, environment, logging, or service issues

---

## ✅ Prerequisites
You should already know:
- basic Linux CLI navigation and file operations
- file permissions + ownership (`chmod`, `chown`)
- text editing (`nano` or `vi`)
- basic shell scripting
- how to check services and processes using systemd tools

---

## 🧰 Lab Environment
- OS: CentOS/RHEL 8/9 style system
- Scheduling: `crond` and `atd` available
- Logging: journald enabled (cron activity validated via `journalctl`)
- Shell prompt: `-bash-4.2$`

---

## 🧩 What You Built in This Lab
### 1) Cron jobs (recurring automation)
- **Uptime logger** (every 5 minutes)
- **Daily backup automation** (scheduled for 3:00 AM)
- **Disk usage monitoring** (hourly)
- **Cron test runner** (every 2 minutes) to confirm scheduler execution and environment behavior

### 2) at jobs (one-time automation)
- queued one-time tasks using `at`
- inspected jobs with `atq` and `at -c`
- removed jobs using `atrm`

### 3) Monitoring & verification workflow
- validated cron execution via:
  - output files created/updated by jobs
  - service log visibility via journald (`crond` unit logs)

---

## 📂 Repository Artifacts
This lab repo is structured:

- `README.md` → overview + learning outcomes (this file)
- `commands.sh` → all commands used in the lab (clean + ordered)
- `scripts/`
  - `backup_script.sh`
  - `disk_monitor.sh`
  - `cron_test.sh`
  - `cron_dashboard.sh`
- `output.txt` → captured outputs (service status, job lists, journal logs, file checks)
- `interview_qna.md` → cron + at interview questions with strong answers
- `troubleshooting.md` → common failures + fixes (PATH, permissions, logging, service issues)

---

## ✅ Results
After completion, you have:
- working scheduled automation tasks (cron)
- one-time deferred execution workflows (at)
- verification + audit approach using journald
- reusable scripts that follow sysadmin-friendly patterns (logs + safety)

---

## 💡 What I Learned
- how cron differs from at (recurring vs one-time)
- cron environment limitations (PATH, HOME, shell differences)
- how to build reliable scheduled scripts (absolute paths, log redirection, error handling)
- how to validate scheduler health using systemd + journald

---

## 🌍 Why This Matters
Cron-based automation is used everywhere:
- backups and rotations
- housekeeping jobs (cleanup, temp files)
- monitoring snapshots
- scheduled reporting
- compliance evidence (repeatable logs)

If you can automate safely, you reduce human error and improve uptime.

---

## 🧠 Real-World Relevance
This lab directly maps to tasks performed by:
- Linux system administrators
- cloud operations engineers
- SOC / security engineers maintaining scheduled checks
- DevOps teams running maintenance workflows

---

## 🏁 Next Steps
- harden scripts (lock files, retries, failure alerts)
- centralize logs (forward journald / cron results)
- use `systemd timers` as a modern alternative to cron for some workloads
