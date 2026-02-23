# 🛠 Troubleshooting Guide — Lab 39: Network and Configuration NFS (Server & Client)

> This guide covers real-world NFS issues seen in CentOS/RHEL environments.

---

# 🔎 1️⃣ Mount Fails: "access denied by server"

## ❌ Error
```

mount.nfs: access denied by server while mounting

````

## ✅ Checklist

### Step 1: Verify Exports on Server
```bash
exportfs -v
````

Ensure:

* Client IP is allowed
* Correct subnet defined
* No syntax errors in `/etc/exports`

---

### Step 2: Refresh Exports

```bash
exportfs -a
```

---

### Step 3: Confirm Client Visibility

```bash
showmount -e SERVER_IP
```

If not visible → firewall or export issue.

---

### Step 4: Check Firewall on Server

```bash
firewall-cmd --list-all
```

Ensure:

* nfs
* rpc-bind
* mountd
  are allowed OR proper rich rules exist.

---

# 🔎 2️⃣ Permission Denied When Writing

## ❌ Error

```
Permission denied
```

## ✅ Possible Causes

| Cause            | Explanation                  |
| ---------------- | ---------------------------- |
| ro export        | Share is read-only           |
| root_squash      | Root mapped to nobody        |
| Wrong ownership  | Server directory perms wrong |
| UID mismatch     | Different user IDs           |
| SELinux blocking | Context issue                |

---

### Fix Steps

Check server permissions:

```bash
ls -la /nfs/shared
```

Check export options:

```bash
cat /etc/exports
```

Check SELinux context:

```bash
ls -Z /nfs/shared
```

Temporary test (if needed):

```bash
setenforce 0
```

⚠ Only for troubleshooting.

---

# 🔎 3️⃣ Stale File Handle

## ❌ Error

```
Stale file handle
```

## 🔍 Cause

* File removed/recreated on server
* Server restarted
* Underlying FS changed

## ✅ Fix

```bash
umount -f /mnt/nfs-shared
mount -t nfs SERVER_IP:/nfs/shared /mnt/nfs-shared
```

---

# 🔎 4️⃣ Client Hangs When Accessing Mount

## Symptoms

* `ls` freezes
* High I/O wait

## ✅ Diagnose

Check server:

```bash
systemctl status nfs-server
```

Check RPC:

```bash
rpcinfo -p SERVER_IP
```

Check connectivity:

```bash
ping SERVER_IP
telnet SERVER_IP 2049
```

---

# 🔎 5️⃣ Services Not Starting

## ❌ Symptoms

nfs-server fails

## ✅ Diagnose

```bash
systemctl status nfs-server
journalctl -u nfs-server --no-pager
```

Ensure:

* rpcbind is running
* No syntax errors in `/etc/exports`

---

# 🔎 6️⃣ Firewall Blocking NFS

## Required Ports

| Service | Port  |
| ------- | ----- |
| rpcbind | 111   |
| nfs     | 2049  |
| mountd  | 20048 |

Check:

```bash
firewall-cmd --list-all
```

Add services:

```bash
firewall-cmd --permanent --add-service=nfs
firewall-cmd --reload
```

---

# 🔎 7️⃣ Mount Fails at Boot

## ❌ Symptoms

System boots slowly or mount fails.

## ✅ Fix

Ensure `_netdev` in `/etc/fstab`:

```
SERVER:/share /mnt nfs defaults,_netdev 0 0
```

Test:

```bash
mount -a
```

---

# 🔎 8️⃣ SELinux Blocking Access

Check mode:

```bash
getenforce
```

Check context:

```bash
ls -Z /nfs/shared
```

Set proper context:

```bash
semanage fcontext -a -t public_content_rw_t "/nfs/shared(/.*)?"
restorecon -Rv /nfs/shared
```

---

# 🔎 9️⃣ UID/GID Mismatch Issues

NFS relies on numeric UID/GID matching.

Check on both systems:

```bash
id username
```

If mismatch:

* Align UID manually
* Use centralized directory service (LDAP/AD)

---

# 🔎 🔟 Network Interruptions

## Symptoms

Connection timed out.

## Recovery

```bash
systemctl restart nfs-server
```

Client:

```bash
umount -f /mnt/nfs-shared
mount -a
```

---

# 🔎 1️⃣1️⃣ Verify NFS Version

```bash
mount | grep nfs
```

Force NFSv4:

```bash
mount -t nfs -o vers=4 SERVER:/share /mnt
```

---

# 🔎 1️⃣2️⃣ Check Active Connections

```bash
ss -tuln | grep :2049
netstat -an | grep :2049
```

---

# 🔎 1️⃣3️⃣ Export Not Updating

If you modified `/etc/exports`:

```bash
exportfs -ra
```

---

# 🔐 Security Hardening Checklist

✔ Use specific subnet instead of `*`
✔ Enable `root_squash`
✔ Prefer NFSv4
✔ Use firewall restrictions
✔ Consider Kerberos authentication
✔ Monitor logs

---

# 📊 Enterprise Troubleshooting Workflow

1. Confirm server service status
2. Validate exports
3. Validate firewall
4. Check RPC visibility
5. Test mount manually
6. Validate permissions
7. Check SELinux
8. Inspect logs
9. Test network
10. Validate fstab configuration

---

# 🏁 Lab 39 Completed

You now understand:

* NFS server configuration
* Export access control
* Firewall management
* Client mount persistence
* Real-world NFS troubleshooting
* Security best practices

---
