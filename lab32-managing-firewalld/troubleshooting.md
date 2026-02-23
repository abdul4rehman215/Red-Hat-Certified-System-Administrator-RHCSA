# 🛠 Troubleshooting Guide — Lab 32: Managing Firewall with firewalld (RHCSA)

This document outlines common issues encountered while configuring firewalld and how they were diagnosed and resolved in a CentOS/RHEL 8/9 environment.

---

# 🔎 Issue 1: firewalld Service Not Running

## ❌ Problem

Command:

```bash
sudo firewall-cmd --state
````

Returns:

```
not running
```

## 🔍 Cause

* firewalld service not started
* Disabled at boot
* Service failure due to configuration error

## ✅ Resolution

Start and enable firewalld:

```bash
sudo systemctl start firewalld
sudo systemctl enable firewalld
```

Verify:

```bash
sudo firewall-cmd --state
```

Expected output:

```
running
```

If still failing, check detailed logs:

```bash
sudo systemctl status firewalld -l
sudo journalctl -xe
```

---

# 🌐 Issue 2: Firewall Rules Not Applying

## ❌ Problem

Service or port added, but traffic still blocked.

Example:

```bash
sudo firewall-cmd --add-service=http --permanent
```

But port remains inaccessible.

## 🔍 Cause

Permanent rules require reload to become active.

## ✅ Resolution

Reload firewall:

```bash
sudo firewall-cmd --reload
```

Verify runtime configuration:

```bash
sudo firewall-cmd --list-all
```

Also compare:

```bash
sudo firewall-cmd --list-all --permanent
```

---

# 🔁 Issue 3: Changes Lost After Reboot

## ❌ Problem

Firewall rules disappear after system restart.

## 🔍 Cause

Rules were added without `--permanent`.

Example (temporary only):

```bash
sudo firewall-cmd --add-port=8080/tcp
```

## ✅ Resolution

Add rules permanently:

```bash
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```

---

# 🔌 Issue 4: Port Still Closed After Opening

## ❌ Problem

nmap shows port as closed:

```
9999/tcp closed
```

## 🔍 Cause

Firewall is open, but **no service is listening** on that port.

Firewall does not start services — it only permits traffic.

## ✅ Resolution

Check listening services:

```bash
ss -tuln
```

Start appropriate service or test server:

```bash
sudo python3 -m http.server 8080
```

Then re-test:

```bash
nmap -p 8080 <server-ip>
```

---

# 🧭 Issue 5: Interface Assigned to Wrong Zone

## ❌ Problem

Expected services are not allowed even though configured.

## 🔍 Cause

Network interface may not belong to expected zone.

Check:

```bash
sudo firewall-cmd --get-active-zones
```

## ✅ Resolution

Assign interface correctly:

```bash
sudo firewall-cmd --zone=public --change-interface=eth0 --permanent
sudo firewall-cmd --reload
```

Verify:

```bash
sudo firewall-cmd --get-zone-of-interface=eth0
```

---

# 🔐 Issue 6: Rich Rule Not Working

## ❌ Problem

Source-specific rule does not behave as expected.

Example:

```bash
sudo firewall-cmd --list-rich-rules
```

Shows rule, but connection still blocked.

## 🔍 Cause

* Wrong source IP
* Wrong zone
* Rule added but not reloaded
* Syntax error during rule creation

## ✅ Resolution

Ensure correct syntax:

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --reload
```

Verify rule:

```bash
sudo firewall-cmd --list-rich-rules
```

---

# 📜 Issue 7: Logging Not Showing Denied Traffic

## ❌ Problem

Denied traffic does not appear in logs.

## 🔍 Cause

Log denied not enabled.

## ✅ Resolution

Enable logging:

```bash
sudo firewall-cmd --set-log-denied=all
```

Monitor logs:

```bash
sudo tail -f /var/log/messages
```

On some RHEL 8/9 systems (journald-based):

```bash
sudo journalctl -f
```

---

# 🚨 Issue 8: Panic Mode Accidentally Enabled

## ❌ Problem

All network traffic blocked suddenly.

## 🔍 Cause

Panic mode activated:

```bash
sudo firewall-cmd --panic-on
```

## ✅ Resolution

Disable panic mode:

```bash
sudo firewall-cmd --panic-off
```

Verify state:

```bash
sudo firewall-cmd --state
```

---

# ⚔ Issue 9: Conflict with iptables

## ❌ Problem

firewalld fails to start or behaves unpredictably.

## 🔍 Cause

iptables service running simultaneously.

## ✅ Resolution

Check:

```bash
sudo systemctl status iptables
```

Stop/disable if present:

```bash
sudo systemctl stop iptables
sudo systemctl disable iptables
```

Restart firewalld:

```bash
sudo systemctl restart firewalld
```

---

# 📦 Issue 10: Custom Service Not Appearing

## ❌ Problem

Custom service `myapp` not visible.

## 🔍 Cause

Forgot to reload firewall after creating service.

## ✅ Resolution

Reload:

```bash
sudo firewall-cmd --reload
```

Verify:

```bash
sudo firewall-cmd --get-services | grep myapp
```

---

# 🧠 Best Practice Checklist

✔ Use `--permanent` for persistent changes
✔ Always run `--reload` after permanent changes
✔ Verify zone assignment before troubleshooting
✔ Use `nmap` to confirm exposure
✔ Enable logging for denied packets
✔ Backup configuration:

```bash
sudo cp -r /etc/firewalld/ /etc/firewalld.backup.$(date +%Y%m%d)
```

✔ Follow least privilege principle
✔ Avoid unnecessary open ports
✔ Test firewall rules before production deployment

---

# ✅ Lab 12 Troubleshooting Completed

This troubleshooting section covers:

* Service startup issues
* Runtime vs permanent configuration mistakes
* Zone misconfiguration
* Port/service mismatch confusion
* Logging and rich rule validation
* Panic mode recovery
* Service conflicts

All firewall rules and configurations were validated successfully in a CentOS/RHEL 8/9 environment.

---
