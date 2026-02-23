# 🛠 Troubleshooting Guide — Lab 30: Managing Systemd Services

---

# 🔴 Issue 1: Service Fails to Start

## ❗ Symptom
```text
Active: failed (Result: exit-code)
````

## 🔍 Diagnose

Check service status:

```bash
systemctl status servicename
```

Check logs:

```bash
journalctl -u servicename -n 20
```

## 🧠 Common Causes

* Incorrect ExecStart path
* Missing binary
* Permission issues
* Syntax errors in unit file
* Port already in use

---

# 🔴 Issue 2: status=203/EXEC Error

## ❗ Example

```text
status=203/EXEC
```

## 🔍 Meaning

* Executable not found
* Wrong path in ExecStart
* Missing permissions

## ✅ Fix

Verify binary exists:

```bash
which binaryname
```

Update service file with correct path:

```bash
systemctl daemon-reload
systemctl restart servicename
```

---

# 🔴 Issue 3: Service Starts But Not Working

## 🔍 Example

Apache running but website not accessible.

Check:

```bash
systemctl status httpd
```

Verify port:

```bash
ss -tulnp | grep 80
```

Check firewall:

```bash
firewall-cmd --list-all
```

Check SELinux:

```bash
getenforce
```

---

# 🔴 Issue 4: Service Does Not Start at Boot

## 🔍 Check

```bash
systemctl is-enabled servicename
```

If disabled:

```bash
systemctl enable servicename
```

Verify default target:

```bash
systemctl get-default
```

---

# 🔴 Issue 5: Cannot Find Logs in /var/log

Modern systems use **journalctl**.

Instead of:

```bash
cat /var/log/messages
```

Use:

```bash
journalctl -u servicename
```

Follow logs live:

```bash
journalctl -u servicename -f
```

---

# 🔴 Issue 6: Dependency Failure

## ❗ Symptom

Service fails due to missing dependency.

Check dependencies:

```bash
systemctl list-dependencies servicename
```

Check target dependencies:

```bash
systemctl list-dependencies multi-user.target
```

---

# 🔴 Issue 7: After Editing Service File Changes Not Applied

## ❗ Cause

systemd daemon cache not reloaded.

## ✅ Fix

```bash
systemctl daemon-reload
systemctl restart servicename
```

---

# 🔴 Issue 8: Port Already in Use

## 🔍 Diagnose

```bash
ss -tulnp | grep :80
```

Or:

```bash
lsof -i :80
```

Kill conflicting process:

```bash
kill -9 PID
```

---

# 🔴 Issue 9: Service Hangs During Stop

Force stop:

```bash
systemctl kill servicename
```

Or:

```bash
systemctl stop servicename --force
```

---

# 🔴 Issue 10: Incorrect Boot Target

Check default:

```bash
systemctl get-default
```

Set correctly:

```bash
systemctl set-default multi-user.target
```

Switch immediately:

```bash
systemctl isolate multi-user.target
```

⚠️ Be cautious — isolate stops other services.

---

# 🔴 Issue 11: Service Keeps Restarting

Check unit file:

```bash
systemctl cat servicename
```

Look for:

```text
Restart=always
```

Logs:

```bash
journalctl -u servicename
```

---

# 📋 Quick Diagnostic Checklist

| Check             | Command                            |
| ----------------- | ---------------------------------- |
| Service state     | `systemctl status name`            |
| Enabled at boot   | `systemctl is-enabled name`        |
| Logs              | `journalctl -u name`               |
| Current boot logs | `journalctl -b`                    |
| Default target    | `systemctl get-default`            |
| Dependencies      | `systemctl list-dependencies name` |
| Open ports        | `ss -tulnp`                        |

---

# 🧠 Best Practices

* Always check `systemctl status` first
* Use `journalctl` for accurate logs
* Reload daemon after editing service files
* Enable services explicitly when needed
* Test services before production deployment
* Understand dependency chain

---

# 🎯 Final Troubleshooting Strategy

When a service fails:

1. `systemctl status servicename`
2. `journalctl -u servicename`
3. Verify configuration files
4. Verify binary path
5. Check ports and firewall
6. Reload and restart service

---

## ✅ Lab 30 Troubleshooting Completed

I now understand how to:

* Diagnose service failures
* Fix configuration mistakes
* Use journalctl effectively
* Manage boot targets safely
* Handle real-world production service issues

