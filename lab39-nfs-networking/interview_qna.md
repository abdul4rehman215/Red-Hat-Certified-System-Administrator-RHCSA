# 🎤 Interview Q&A — Lab 39: NFS (Network File System)

This section prepares you for:
- RHCSA-style questions
- Linux System Administrator interviews
- Real-world troubleshooting discussions
- Enterprise infrastructure scenarios

---

# 🔹 Basic Concept Questions

## 1️⃣ What is NFS?

**Answer:**
NFS (Network File System) is a distributed file system protocol that allows a system to share directories and files with others over a network as if they were local.

It enables:
- Centralized storage
- Shared development environments
- Distributed system collaboration

---

## 2️⃣ What port does NFS use?

**Answer:**
- NFS (v4): TCP/UDP **2049**
- rpcbind: TCP/UDP **111**
- mountd: usually TCP/UDP **20048**

---

## 3️⃣ What is the difference between NFSv3 and NFSv4?

| Feature | NFSv3 | NFSv4 |
|----------|--------|--------|
| Port usage | Multiple dynamic ports | Primarily 2049 |
| Security | Basic | Stronger auth options |
| Firewall friendly | Less | More |
| Performance | Good | Improved state management |

NFSv4 is preferred in modern deployments.

---

## 4️⃣ What is `/etc/exports`?

**Answer:**
It is the configuration file on the NFS server that defines:
- Which directories are shared
- Which clients can access them
- What permissions apply

Example format:
```

/directory client(options)

````

---

# 🔹 Export Option Questions

## 5️⃣ What does `root_squash` do?

**Answer:**
Maps remote root user to anonymous user (`nfsnobody`).

✔ Improves security  
❌ Prevents root privilege abuse  

---

## 6️⃣ What is `no_root_squash`?

**Answer:**
Allows remote root user to retain root privileges on the share.

⚠ Dangerous in production unless absolutely necessary.

---

## 7️⃣ Difference between `sync` and `async`?

- `sync`: Write changes to disk before replying (safer, slower)
- `async`: Respond before writing (faster, less safe)

Production systems typically use `sync`.

---

## 8️⃣ What does `no_subtree_check` do?

Disables subtree verification to improve performance when exporting subdirectories.

---

# 🔹 Practical Administration Questions

## 9️⃣ How do you check what shares are exported?

On server:
```bash
exportfs -v
````

From client:

```bash
showmount -e SERVER_IP
```

---

## 🔟 How do you verify NFS services are running?

```bash
systemctl status nfs-server
systemctl status rpcbind
rpcinfo -p
```

---

## 1️⃣1️⃣ How do you make NFS mounts persistent?

Add entries to:

```
/etc/fstab
```

Example:

```
192.168.1.100:/nfs/shared /mnt/nfs-shared nfs defaults,_netdev 0 0
```

Then:

```bash
mount -a
```

---

## 1️⃣2️⃣ Why use `_netdev` in fstab?

Ensures mount waits until network is available during boot.

---

# 🔹 Troubleshooting Questions

## 1️⃣3️⃣ Mount fails: "access denied by server"

Possible causes:

* Incorrect `/etc/exports`
* Wrong client IP
* Firewall blocking ports
* Export not refreshed (`exportfs -a`)

---

## 1️⃣4️⃣ Permission denied when writing to share

Check:

* Export options (root_squash?)
* Directory ownership
* File permissions
* SELinux contexts
* UID/GID mismatch

---

## 1️⃣5️⃣ What is a "stale file handle"?

Occurs when:

* File removed or changed on server
* Server restarted

Fix:

```bash
umount -f /mountpoint
mount -t nfs server:/path /mountpoint
```

---

## 1️⃣6️⃣ How to check if firewall is blocking NFS?

```bash
firewall-cmd --list-all
```

Test connectivity:

```bash
telnet SERVER_IP 2049
rpcinfo -p SERVER_IP
```

---

# 🔹 Security & Architecture Questions

## 1️⃣7️⃣ How do you secure NFS in production?

✔ Restrict exports to specific networks
✔ Use `root_squash`
✔ Avoid wildcard `*`
✔ Use firewall rules
✔ Prefer NFSv4
✔ Implement Kerberos authentication

---

## 1️⃣8️⃣ What is `all_squash`?

Maps all users to anonymous user.

Used for:

* Public read-only shares
* Highly restricted environments

---

## 1️⃣9️⃣ Can NFS be encrypted?

Not by default.

Solutions:

* Kerberos (NFSv4)
* VPN
* SSH tunnels
* IPsec

---

## 2️⃣0️⃣ When would you choose NFS over SMB?

| NFS                    | SMB                    |
| ---------------------- | ---------------------- |
| Linux-native           | Windows-native         |
| Lightweight            | Rich AD integration    |
| Dev/infra environments | Corporate file servers |

---

# 🔹 Scenario-Based Questions

## Scenario 1:

"Users can read files but cannot write."

Answer:

* Check export options (ro?)
* Check root_squash
* Check ownership on server
* Validate UID mapping

---

## Scenario 2:

"Client hangs when accessing mount."

Answer:

* Server down?
* Firewall blocking?
* Network interruption?
* Check `rpcinfo -p`
* Check logs via `journalctl`

---

## Scenario 3:

"NFS mount fails at boot."

Answer:

* Missing `_netdev`
* Network not ready
* DNS resolution issue

---

# 🔹 RHCSA-Relevant Commands to Remember

```bash
dnf install nfs-utils
exportfs -a
exportfs -v
showmount -e
mount -t nfs
umount
systemctl status nfs-server
rpcinfo -p
firewall-cmd --add-service=nfs
```

---

# 🧠 Real-World Importance

NFS is used for:

* Shared home directories
* Centralized logs
* CI/CD artifact storage
* Backup targets
* Application shared data
* Enterprise Linux environments

---

# 🏁 Final Interview Tip

When discussing NFS:

Explain:

1. Server configuration
2. Export options
3. Firewall configuration
4. Client mounting
5. Persistence via fstab
6. Troubleshooting workflow

This shows end-to-end understanding — not just command memorization.

---
