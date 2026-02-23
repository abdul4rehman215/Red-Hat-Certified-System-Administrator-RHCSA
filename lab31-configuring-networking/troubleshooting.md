# 🛠 Troubleshooting Guide — Lab 31: Configuring Networking (RHCSA)

This document outlines common networking issues encountered during this lab and how they were diagnosed and resolved.

---

# 🔎 Issue 1: Network Interface Not Found

## ❌ Problem

Error displayed:

```

Device 'eth0' not found

````

## 🔍 Cause

Modern Linux systems may not use `eth0` as the interface name.  
Alternative interface names may include:

- `ens33`
- `enp0s3`
- `eno1`
- `ens192`

## ✅ Resolution

List available interfaces:

```bash
nmcli device status
````

or

```bash
ip link show
```

Identify correct interface name and use it in the `nmcli` command.

---

# 🌐 Issue 2: DNS Resolution Fails

## ❌ Problem

Commands like:

```bash
ping google.com
nslookup google.com
```

Fail with:

* Temporary failure in name resolution
* Unknown host

## 🔍 Cause

DNS servers may not be configured correctly in:

```
/etc/resolv.conf
```

Or the connection profile lacks DNS configuration.

## ✅ Resolution

Check current DNS:

```bash
cat /etc/resolv.conf
```

Modify DNS servers using:

```bash
sudo nmcli connection modify "lab-static-connection" ipv4.dns "8.8.8.8,8.8.4.4"
```

Restart NetworkManager if required:

```bash
sudo systemctl restart NetworkManager
```

---

# 🔐 Issue 3: Permission Denied Errors

## ❌ Problem

Network configuration commands fail due to insufficient privileges.

Example:

```
Error: insufficient permissions
```

## 🔍 Cause

User does not have sudo privileges.

## ✅ Resolution

Check sudo permissions:

```bash
sudo -l
```

Ensure user is part of wheel group:

```bash
sudo usermod -a -G wheel centos
```

Log out and back in for changes to apply.

---

# 🔄 Issue 4: Network Changes Lost After Reboot

## ❌ Problem

Static IP configuration disappears after system restart.

## 🔍 Cause

Configuration was applied using:

* `ifconfig`
* `route`

These changes are temporary.

## ✅ Resolution

Use persistent configuration via `nmcli`.

Verify autoconnect is enabled:

```bash
nmcli connection show "lab-static-connection" | grep autoconnect
```

Enable if needed:

```bash
sudo nmcli connection modify "lab-static-connection" connection.autoconnect yes
```

---

# 🚫 Issue 5: Default Route Already Exists

## ❌ Problem

Running:

```bash
sudo route add default gw 192.168.1.1
```

Returns:

```
SIOCADDRT: File exists
```

## 🔍 Cause

A default route already exists from an active NetworkManager profile.

## ✅ Resolution

Verify routing table:

```bash
route -n
```

No further action required if gateway is correct.

---

# 🧭 Issue 6: Cannot Reach External IP

## ❌ Problem

Ping to `8.8.8.8` fails.

## 🔍 Cause

Possible reasons:

* Incorrect gateway configuration
* Firewall blocking ICMP
* Network isolation
* Cloud security group restrictions

## ✅ Resolution

Verify gateway:

```bash
ip route
```

Ensure correct default route exists:

```
default via 192.168.1.1 dev eth0
```

Check firewall status:

```bash
sudo firewall-cmd --state
```

Temporarily disable firewall (testing only):

```bash
sudo systemctl stop firewalld
```

---

# 🛰 Issue 7: Traceroute Shows Asterisks (*)

## ❌ Problem

Traceroute output shows:

```
* * *
```

## 🔍 Cause

Intermediate routers may:

* Block ICMP
* Block UDP traceroute probes
* Filter TTL expired messages

## ✅ Resolution

This is normal behavior in many networks.

Try alternative method:

```bash
traceroute -U google.com
```

Or:

```bash
traceroute -I google.com
```

---

# 📡 Issue 8: Hostname Not Resolving Locally

## ❌ Problem

Running:

```bash
nslookup lab-server-01
```

Fails.

## 🔍 Cause

Hostname not added to `/etc/hosts`.

## ✅ Resolution

Add entry:

```bash
sudo bash -c 'echo "127.0.0.1 lab-server-01" >> /etc/hosts'
```

Verify:

```bash
cat /etc/hosts
```

---

# 📊 Issue 9: Listening Ports Not Showing

## ❌ Problem

`ss -tuln` shows no listening services.

## 🔍 Cause

No services are running except SSH.

## ✅ Resolution

Verify SSH service:

```bash
sudo systemctl status sshd
```

Start if necessary:

```bash
sudo systemctl start sshd
```

---

# 🧠 Best Practice Summary

✔ Always use `nmcli` for persistent network configuration
✔ Verify changes using `ip addr`, `nmcli`, and `ip route`
✔ Validate connectivity in this order:

1. Local interface
2. Gateway
3. External IP
4. Domain name
   ✔ Use `traceroute` to diagnose routing issues
   ✔ Confirm DNS with `nslookup` and `dig`
   ✔ Avoid legacy tools for permanent changes

---

# ✅ Lab 31 Troubleshooting Section Completed

All networking configuration, hostname management, and connectivity diagnostics were successfully implemented and validated in a CentOS/RHEL cloud environment.
