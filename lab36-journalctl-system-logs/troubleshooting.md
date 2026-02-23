# 🛠 Troubleshooting Guide — Lab 36: journalctl & System Logs

> This document covers common journald and journalctl-related issues encountered in production environments.

---

# 🔎 Issue 1: Logs Not Persistent After Reboot

## ❌ Symptoms

- Logs disappear after system restart
- `journalctl --list-boots` shows only current boot
- `/var/log/journal` directory missing

## 🔍 Root Cause

- Persistent storage not enabled
- journald using runtime storage only (`/run/log/journal`)

## ✅ Solution

1️⃣ Create persistent directory:

```bash
sudo mkdir -p /var/log/journal
sudo chown root:systemd-journal /var/log/journal
sudo chmod 2755 /var/log/journal
````

2️⃣ Edit config:

```bash
sudo nano /etc/systemd/journald.conf
```

Set:

```
Storage=persistent
```

3️⃣ Restart service:

```bash
sudo systemctl restart systemd-journald
```

4️⃣ Verify:

```bash
ls -la /var/log/journal/
journalctl --list-boots
```

---

# 🔎 Issue 2: journalctl Consuming Too Much Disk Space

## ❌ Symptoms

* Disk usage increasing rapidly
* `df -h` shows root filling
* `journalctl --disk-usage` shows high usage

## 🔍 Root Cause

* No retention policy configured
* Unlimited journal size
* No vacuuming performed

## ✅ Immediate Fix

```bash
sudo journalctl --vacuum-size=1G
```

Or:

```bash
sudo journalctl --vacuum-time=2weeks
```

## ✅ Permanent Fix

Edit:

```
/etc/systemd/journald.conf
```

Set:

```
SystemMaxUse=2G
SystemKeepFree=1G
SystemMaxFileSize=200M
MaxRetentionSec=2month
```

Restart:

```bash
sudo systemctl restart systemd-journald
```

---

# 🔎 Issue 3: Permission Denied Viewing Logs

## ❌ Error

```
Failed to open journal: Permission denied
```

## 🔍 Cause

User not in `systemd-journal` group.

## ✅ Fix

```bash
sudo usermod -a -G systemd-journal username
```

Log out and back in.

---

# 🔎 Issue 4: journalctl Shows No Logs

## ❌ Symptoms

* `journalctl` returns empty
* `journalctl -b -1` shows no entries

## 🔍 Possible Causes

* journald not running
* Corrupted journal files
* Wrong system time
* Persistent storage not enabled

## ✅ Diagnose

Check service:

```bash
sudo systemctl status systemd-journald
```

Verify integrity:

```bash
sudo journalctl --verify
```

Check system time:

```bash
timedatectl status
```

Restart service:

```bash
sudo systemctl restart systemd-journald
```

---

# 🔎 Issue 5: Failed Service But No Logs Visible

## ❌ Symptoms

`systemctl status service` shows failed, but journal shows nothing.

## 🔍 Cause

Service may log to:

* Separate log file
* Different unit name
* Another boot session

## ✅ Steps

1️⃣ Confirm unit name:

```bash
systemctl list-units | grep service
```

2️⃣ Check full logs:

```bash
journalctl -u servicename
```

3️⃣ Check boot:

```bash
journalctl -b
```

4️⃣ Check previous boot:

```bash
journalctl -b -1
```

---

# 🔎 Issue 6: Authentication Failures Not Appearing

## 🔍 Check SSH Logs Specifically

```bash
journalctl -u sshd
```

Filter:

```bash
journalctl -u sshd | grep -i "failed"
```

If nothing appears:

* Check firewall
* Check sshd config
* Ensure logging level in sshd_config

---

# 🔎 Issue 7: Journal File Corruption

## ❌ Symptoms

```
File corruption detected
```

## ✅ Fix

Stop service:

```bash
sudo systemctl stop systemd-journald
```

Move corrupted files:

```bash
sudo mv /var/log/journal/*/*.journal /tmp/
```

Restart service:

```bash
sudo systemctl start systemd-journald
```

---

# 🔎 Issue 8: Log Rotation Not Working

## 🔍 Diagnose

Check config:

```bash
cat /etc/systemd/journald.conf | grep -v "^#"
```

Force rotation:

```bash
sudo systemctl kill --signal=SIGUSR2 systemd-journald
```

Verify files:

```bash
ls -lh /var/log/journal/*/
```

---

# 🔎 Issue 9: Boot Logs Missing

If:

```bash
journalctl -b -1
```

Returns:

```
-- No entries --
```

It means:

* Persistent storage not enabled previously
* Previous logs lost due to runtime-only mode

---

# 🔎 Issue 10: Journal Performance Issues

## Symptoms

* Slow log queries
* High CPU usage

## Fix

Limit size:

```
SystemMaxUse=2G
SystemMaxFiles=10
```

Restart:

```bash
sudo systemctl restart systemd-journald
```

---

# 🧠 Enterprise Best Practices

✔ Always enable persistent logging in production
✔ Set retention limits to prevent disk exhaustion
✔ Monitor journal size regularly
✔ Use centralized logging in enterprise environments
✔ Restrict log access using proper permissions
✔ Automate health checks

---

# 🔐 Security Considerations

Logs may contain:

* Authentication attempts
* IP addresses
* Usernames
* Service errors
* Kernel messages

Protect logs by:

* Restricting access
* Setting correct permissions
* Monitoring suspicious activity
* Forwarding to SIEM if needed

---

# 🎯 RHCSA Exam Tips

Know how to:

* View logs for a service
* View logs for current boot
* Filter by priority
* Enable persistent logging
* Vacuum journal
* Investigate failed services

---

# ✅ Final Validation Checklist

* [x] journald running
* [x] Persistent logging enabled
* [x] Retention configured
* [x] Log filtering tested
* [x] Failed service diagnosed
* [x] Health-check script operational
* [x] Cron automation configured

---

# 🏁 Lab 36 Completed

I now have:

* Strong log troubleshooting capability
* Practical journalctl command mastery
* Log storage management knowledge
* Real-world production readiness
* RHCSA-aligned experience

End of Troubleshooting Guide
