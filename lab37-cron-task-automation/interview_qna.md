# 🎤 Interview Q&A — Lab 37: Cron & Task Automation

---

## 🔹 1️⃣ What is cron in Linux?

**Answer:**

Cron is a time-based job scheduler in Linux used to automate recurring tasks such as:

- Backups
- Log rotation
- Monitoring scripts
- Maintenance tasks

It runs commands or scripts at specified times and intervals using crontab entries.

---

## 🔹 2️⃣ What is the difference between cron and at?

| Feature | cron | at |
|----------|------|------|
| Execution type | Recurring | One-time |
| Scheduling style | Fixed intervals | Specific future time |
| Typical usage | Daily/weekly automation | One-time future tasks |

Example:
- `cron` → Run backup every day at 3 AM
- `at` → Run shutdown at 6 PM today

---

## 🔹 3️⃣ Explain cron syntax.

Cron format:

```

* * * * * command
          | | | | |
          | | | | +---- Day of week (0-7)
          | | | +------ Month (1-12)
          | | +-------- Day of month (1-31)
          | +---------- Hour (0-23)
          +------------ Minute (0-59)

```

Example:

```

0 3 * * * /home/user/backup.sh

````

Runs daily at 3:00 AM.

---

## 🔹 4️⃣ How do you edit a user’s cron jobs?

```bash
crontab -e
````

To list:

```bash
crontab -l
```

To remove:

```bash
crontab -r
```

---

## 🔹 5️⃣ How do you check if cron is running?

```bash
systemctl status crond
```

If not running:

```bash
sudo systemctl start crond
sudo systemctl enable crond
```

---

## 🔹 6️⃣ Why do cron jobs sometimes fail even though scripts work manually?

Common causes:

* Missing environment variables
* PATH not set correctly
* Relative paths used
* Permission issues
* Script not executable

Best practice:

Always use full paths:

```
/usr/bin/uptime
/home/user/script.sh
```

---

## 🔹 7️⃣ How do you check cron execution logs on RHEL 8/9?

Modern RHEL systems use journald:

```bash
sudo journalctl -u crond
```

Older systems:

```bash
/var/log/cron
```

---

## 🔹 8️⃣ How do you schedule a job to run every 5 minutes?

```
*/5 * * * * command
```

---

## 🔹 9️⃣ How do you schedule a job to run every Monday at 2:30 PM?

```
30 14 * * 1 command
```

---

## 🔹 🔟 How do you list scheduled at jobs?

```bash
atq
```

To remove a job:

```bash
atrm <job_id>
```

---

## 🔹 1️⃣1️⃣ What are best practices for cron jobs?

✔ Use full absolute paths
✔ Redirect output properly
✔ Test scripts manually first
✔ Handle errors inside scripts
✔ Monitor execution logs
✔ Avoid heavy jobs during peak hours

---

## 🔹 1️⃣2️⃣ How can you debug a failing cron job?

Steps:

1. Run script manually.
2. Add logging inside script.
3. Redirect output in crontab:

```
*/5 * * * * /home/user/script.sh >> /home/user/cron_debug.log 2>&1
```

4. Check:

```bash
journalctl -u crond
```

---

## 🔹 1️⃣3️⃣ What is the difference between user crontab and system crontab?

User crontab:

```
crontab -e
```

System crontab:

```
/etc/crontab
```

System crontab requires specifying the user field.

Example:

```
0 3 * * * root /usr/local/bin/script.sh
```

---

## 🔹 1️⃣4️⃣ When would you use systemd timers instead of cron?

Systemd timers provide:

* Better dependency handling
* Integrated logging
* Service-based execution
* More flexible triggers

In enterprise systems, systemd timers are often preferred.

---

## 🔹 1️⃣5️⃣ Real-World Scenario Question

**Q:** A daily backup cron job did not run. What do you check?

**Answer:**

1. Check cron service:

   ```bash
   systemctl status crond
   ```

2. Check cron logs:

   ```bash
   journalctl -u crond
   ```

3. Verify script permissions:

   ```bash
   ls -l backup_script.sh
   ```

4. Test script manually.

5. Verify PATH/environment issues.

---

# 🧠 RHCSA Relevance

You should confidently know how to:

* Create cron jobs
* Manage crontab entries
* Enable crond service
* Use at command
* Troubleshoot failed scheduled tasks
* Verify execution via journald

---

# ✅ Key Takeaway

Cron automation is a fundamental Linux administration skill.

Mastering cron means you can:

* Automate backups
* Implement monitoring
* Reduce manual work
* Improve system reliability
* Prepare for RHCSA exam scenarios

---

End of Interview Q&A

