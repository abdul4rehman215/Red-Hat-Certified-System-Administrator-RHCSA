# 🎤 Interview Q&A — Lab 326: journalctl & System Logs

---

## 🔹 1. What is journalctl?

**Answer:**

`journalctl` is a command-line utility used to query and display logs collected by **systemd-journald**.

It allows administrators to:
- View system logs
- Filter logs by service, time, priority
- Analyze boot logs
- Investigate system failures

---

## 🔹 2. Where does journald store logs by default?

**Answer:**

There are two storage modes:

### 1️⃣ Runtime Storage (Default in many cloud systems)
- Location: `/run/log/journal`
- Logs are lost after reboot

### 2️⃣ Persistent Storage
- Location: `/var/log/journal`
- Logs survive reboots
- Enabled when directory exists and `Storage=persistent`

---

## 🔹 3. How do you enable persistent logging?

**Answer:**

```bash
sudo mkdir -p /var/log/journal
sudo chown root:systemd-journal /var/log/journal
sudo chmod 2755 /var/log/journal
````

Then edit:

```
/etc/systemd/journald.conf
```

Set:

```
Storage=persistent
```

Restart:

```bash
sudo systemctl restart systemd-journald
```

---

## 🔹 4. How do you view logs for a specific service?

**Answer:**

```bash
sudo journalctl -u sshd
```

To combine with time filter:

```bash
sudo journalctl -u sshd --since today
```

---

## 🔹 5. How do you filter logs by priority?

**Answer:**

```bash
sudo journalctl -p err
```

Priority levels (low → high):

| Level   | Meaning                   |
| ------- | ------------------------- |
| debug   | Debug info                |
| info    | Informational             |
| notice  | Normal but significant    |
| warning | Warning                   |
| err     | Error                     |
| crit    | Critical                  |
| alert   | Immediate action required |
| emerg   | System unusable           |

---

## 🔹 6. How do you view logs from the current boot?

**Answer:**

```bash
sudo journalctl -b
```

Previous boot:

```bash
sudo journalctl -b -1
```

List boots:

```bash
sudo journalctl --list-boots
```

---

## 🔹 7. How do you check journal disk usage?

**Answer:**

```bash
sudo journalctl --disk-usage
```

---

## 🔹 8. How do you clean old logs manually?

**Answer:**

Vacuum by size:

```bash
sudo journalctl --vacuum-size=1G
```

Vacuum by time:

```bash
sudo journalctl --vacuum-time=2weeks
```

---

## 🔹 9. How do you troubleshoot failed services using journalctl?

**Answer:**

1️⃣ Check failed services:

```bash
systemctl --failed
```

2️⃣ Inspect service logs:

```bash
journalctl -u servicename
```

3️⃣ Filter errors:

```bash
journalctl -u servicename -p err
```

---

## 🔹 10. What is the difference between rsyslog and journald?

**Answer:**

| journald               | rsyslog            |
| ---------------------- | ------------------ |
| systemd native logging | Traditional syslog |
| Structured logs        | Text-based logs    |
| Binary journal format  | Plain text logs    |
| Faster filtering       | Simpler format     |

Many systems use both together.

---

## 🔹 11. How do you allow non-root users to view logs?

**Answer:**

Add user to `systemd-journal` group:

```bash
sudo usermod -a -G systemd-journal username
```

---

## 🔹 12. How would you investigate SSH brute-force attempts?

**Answer:**

```bash
sudo journalctl -u sshd | grep -i "failed"
```

Or:

```bash
sudo journalctl -u sshd -p warning
```

Look for:

* Failed password
* authentication failure
* invalid user

---

## 🔹 13. What happens if logs are not persistent after reboot?

**Answer:**

Possible causes:

* `/var/log/journal` does not exist
* `Storage=auto` default behavior
* Incorrect permissions
* journald not restarted

Fix by:

* Creating directory
* Setting permissions
* Restarting service

---

## 🔹 14. How do you output logs in JSON format?

**Answer:**

```bash
journalctl -o json
```

Pretty JSON:

```bash
journalctl -o json-pretty
```

Used for:

* Log parsing
* Monitoring systems
* Automation

---

## 🔹 15. Why is journalctl important in enterprise environments?

**Answer:**

Because it allows:

* Fast troubleshooting
* Security monitoring
* Incident response
* Root cause analysis
* Compliance reporting
* Boot diagnostics

It is the primary logging mechanism in systemd-based Linux systems.

---

# 🧠 Scenario-Based Questions

---

### Q: A service failed after reboot. What do you do?

1. `systemctl status service`
2. `journalctl -u service -b`
3. Check priority errors: `journalctl -u service -p err`

---

### Q: Disk space is filling up due to logs. What do you do?

1. Check usage:

   ```bash
   journalctl --disk-usage
   ```
2. Vacuum:

   ```bash
   journalctl --vacuum-size=1G
   ```
3. Configure:

   ```
   SystemMaxUse=2G
   ```

---

# 🎯 Certification Relevance (RHCSA)

You should know:

* `journalctl -b`
* `journalctl -u`
* `journalctl -p`
* Persistent log configuration
* Troubleshooting failed services
* Log filtering by time

---

# ✅ Final Takeaway

If you understand this lab fully, you can:

✔ Investigate production incidents
✔ Diagnose system failures
✔ Manage journal storage
✔ Prepare for RHCSA
✔ Work effectively in enterprise Linux environments

---
