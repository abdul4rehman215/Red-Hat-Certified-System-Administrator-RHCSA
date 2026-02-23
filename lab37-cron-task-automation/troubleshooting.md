# 🛠 Troubleshooting Guide — Lab 37: Cron & Task Automation

> This document covers common cron and at-related issues encountered in real-world Linux environments (RHEL/CentOS style).

---

# 🔎 Issue 1: Cron Job Not Running

## ❌ Symptoms
- Cron job appears in `crontab -l`
- Script does not execute
- Output files not created

## ✅ Step 1: Check Cron Service

```bash
systemctl status crond
````

If inactive:

```bash
sudo systemctl start crond
sudo systemctl enable crond
```

---

## ✅ Step 2: Check Execution Logs

On RHEL 8/9 systems:

```bash
sudo journalctl -u crond --no-pager -n 50
```

Look for:

* `(user) CMD (...)`
* Permission errors
* Script not found errors

---

## ✅ Step 3: Test Script Manually

```bash
/home/centos/your_script.sh
```

If manual run fails, cron will also fail.

---

# 🔎 Issue 2: Script Works Manually But Fails in Cron

## ❌ Symptoms

* Works when run directly
* Fails when run by cron

## 🔍 Cause

Cron runs in a limited environment.

Missing variables:

* PATH
* HOME
* USER

## ✅ Solution 1: Use Absolute Paths

Instead of:

```bash
uptime
```

Use:

```bash
/usr/bin/uptime
```

---

## ✅ Solution 2: Define PATH in Crontab

Add at top of crontab:

```bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
HOME=/home/centos
```

---

# 🔎 Issue 3: Permission Denied

## ❌ Error

```
Permission denied
```

## ✅ Fix

Make script executable:

```bash
chmod +x script.sh
```

Verify ownership:

```bash
ls -la script.sh
chown centos:centos script.sh
```

---

# 🔎 Issue 4: Cron Output Not Visible

Cron does not display output in terminal.

## ✅ Redirect Output

Modify cron entry:

```
*/5 * * * * /home/centos/script.sh >> /home/centos/cron.log 2>&1
```

This captures:

* Standard output
* Errors

---

# 🔎 Issue 5: at Command Not Working

## ❌ Symptoms

* `at` command gives error
* Job not executing

## ✅ Check Service

```bash
systemctl status atd
```

Start if needed:

```bash
sudo systemctl start atd
sudo systemctl enable atd
```

---

# 🔎 Issue 6: at Job Scheduled But Not Executed

## ✅ Check Pending Jobs

```bash
atq
```

## ✅ Inspect Job

```bash
at -c <job_id>
```

Ensure:

* Correct path
* Correct user
* Correct time format

---

# 🔎 Issue 7: Cron Running But Script Produces No Output

## Possible Causes

* Script logic incorrect
* Condition not met
* Wrong file path
* Wrong user

## ✅ Add Debug Logging

Inside script:

```bash
echo "Debug: Script started at $(date)" >> /home/centos/debug.log
```

---

# 🔎 Issue 8: Time-Based Scheduling Not Triggering

## ✅ Verify System Time

```bash
timedatectl status
```

Ensure:

* Correct timezone
* NTP active
* System clock synchronized

---

# 🔎 Issue 9: High CPU or Overlapping Cron Jobs

If a job runs longer than its interval:

* Multiple instances may overlap

## ✅ Prevent Overlap

Use lock file method:

```bash
flock -n /tmp/script.lock /home/centos/script.sh
```

---

# 🔎 Issue 10: Cron Logs Not Found in /var/log/cron

Modern RHEL uses journald.

Instead of:

```bash
/var/log/cron
```

Use:

```bash
journalctl -u crond
```

---

# 🔎 Issue 11: Script Not Found Error

Error example:

```
/bin/sh: script.sh: command not found
```

## ✅ Fix

Use full path:

```
/home/centos/script.sh
```

---

# 🔎 Issue 12: Backup Script Not Creating Files

## ✅ Check Directory Exists

```bash
ls -la /home/centos/backups
```

## ✅ Check Tar Installed

```bash
which tar
```

## ✅ Test Command Manually

```bash
tar -czf test.tar.gz /home/centos
```

---

# 🧠 Enterprise Best Practices

✔ Always use full paths
✔ Redirect output
✔ Log execution
✔ Monitor via journald
✔ Avoid running heavy tasks during peak hours
✔ Use lock mechanisms
✔ Validate system time

---

# 🔐 Security Considerations

* Avoid storing passwords inside cron scripts
* Restrict script permissions
* Validate user ownership
* Monitor suspicious cron entries
* Periodically review crontab entries

---

# 🎯 RHCSA Exam Focus

You must know how to:

* Create cron jobs
* Enable crond
* Schedule at jobs
* Remove scheduled jobs
* Troubleshoot failed automation
* Validate via system logs

---

# ✅ Final Validation Checklist

* [x] crond service running
* [x] atd service running
* [x] Cron jobs listed via `crontab -l`
* [x] Output files created
* [x] Jobs visible via journald
* [x] Scripts executable
* [x] Environment variables understood

---

# 🏁 Lab 37 Completed

You now have:

* Automated recurring tasks
* One-time scheduled execution
* Logging and verification workflow
* Real-world automation troubleshooting skills
* RHCSA-level cron mastery

End of Troubleshooting Guide
