# 🛠 Troubleshooting Guide — Lab 20: Managing & Troubleshooting Services (systemctl + journalctl)

> This guide provides a structured, real-world troubleshooting approach for service and network failures on CentOS/RHEL 9 systems.

---

# 🔎 1️⃣ Service Fails to Start

## ❌ Symptom
```

Active: failed (Result: exit-code)

````

## ✅ Troubleshooting Steps

### Step 1: Check Service Status
```bash
systemctl status <service>
````

Look for:

* Exit codes
* Recent log entries
* Missing dependencies

---

### Step 2: Check Logs

```bash
journalctl -u <service> -n 50 --no-pager
```

Look for:

* File not found errors
* Permission denied
* Port conflicts
* Configuration syntax errors

---

### Step 3: Test Manually

Run the service’s `ExecStart` command directly to isolate errors.

---

### Step 4: Fix & Restart

```bash
systemctl restart <service>
systemctl status <service>
```

---

# 🔎 2️⃣ Service Keeps Restarting

## ❌ Symptom

Service enters restart loop.

## 🔍 Cause

`Restart=always` or `Restart=on-failure` combined with script failure.

## ✅ Fix

* Correct root cause
* Temporarily disable restart:

```bash
systemctl edit <service>
```

Adjust:

```
Restart=no
```

Reload daemon:

```bash
systemctl daemon-reload
```

---

# 🔎 3️⃣ Port Already in Use

## ❌ Symptom

```
Address already in use
```

## ✅ Diagnose

```bash
ss -tulpen | grep :<port>
```

## ✅ Fix

* Stop conflicting service
* Change port configuration
* Restart original service

---

# 🔎 4️⃣ Permission Denied Errors

## ❌ Symptom

Service fails due to file access.

## ✅ Check

```bash
ls -la /path/to/file
```

Check:

* Ownership
* Permissions
* SELinux context

## 🔐 SELinux Check

```bash
getenforce
journalctl -xe
```

If needed:

```bash
restorecon -Rv /path
```

---

# 🔎 5️⃣ DNS Resolution Failure

## ❌ Symptom

```
ping 8.8.8.8 works
ping google.com fails
```

## ✅ Diagnose

```bash
cat /etc/resolv.conf
nslookup google.com
```

## ✅ Fix

Correct nameserver entries:

```
nameserver 8.8.8.8
```

If managed by NetworkManager:

```bash
nmcli device show
```

---

# 🔎 6️⃣ No Internet Connectivity

## ❌ Symptom

Cannot ping external IP.

## ✅ Diagnose

```bash
ip addr
ip route
ping <gateway>
```

Check:

* Interface up?
* Default route configured?
* Firewall blocking?

---

# 🔎 7️⃣ Service Works Manually but Fails in systemd

## 🔍 Cause

Environment differences.

Systemd does NOT load:

* .bashrc
* .profile
* Custom PATH variables

## ✅ Fix

In unit file:

```
Environment="PATH=/usr/local/bin:/usr/bin:/bin"
WorkingDirectory=/path
```

Reload:

```bash
systemctl daemon-reload
```

---

# 🔎 8️⃣ Journal Logs Too Large

## Check Usage

```bash
journalctl --disk-usage
```

## Reduce Size

```bash
journalctl --vacuum-time=7d
```

Or:

```bash
journalctl --vacuum-size=100M
```

---

# 🔎 9️⃣ Service Fails After Reboot

## Diagnose

```bash
systemctl is-enabled <service>
```

## Fix

```bash
systemctl enable <service>
```

---

# 🔎 🔟 Configuration File Errors

## Symptom

Service fails immediately after config change.

## Fix Pattern

1. Validate syntax (service-specific test command)
2. Revert last change
3. Restart
4. Monitor logs

Example:

```bash
nginx -t
```

---

# 🔎 1️⃣1️⃣ High Error Logs in Journal

## Filter Errors

```bash
journalctl -p err -b
```

Focus on:

* Repeated failures
* Resource exhaustion
* Network timeouts

---

# 🔎 1️⃣2️⃣ Root Filesystem Full

## Diagnose

```bash
df -h
```

## Fix

* Remove old logs
* Clean journal
* Delete temp files
* Expand volume (production case)

---

# 📊 Systematic Troubleshooting Framework

Use this repeatable model:

1. Identify symptom
2. Check service status
3. Inspect logs
4. Validate dependencies
5. Confirm network
6. Validate permissions
7. Implement fix
8. Restart service
9. Validate functionality
10. Document root cause

---

# 🧠 Enterprise Best Practices

✔ Always test configuration before restart
✔ Use staged rollouts in production
✔ Monitor services automatically
✔ Log rotation and journal limits
✔ Use health-check scripts
✔ Maintain rollback plans

---

# 🏁 Lab 40 Complete

You now understand:

* Service lifecycle management
* Log-based diagnostics
* DNS/network troubleshooting
* System-wide health validation
* Structured incident response methodology

These skills directly map to:

* RHCSA exam objectives
* Linux production administration
* DevOps / SRE troubleshooting workflows
