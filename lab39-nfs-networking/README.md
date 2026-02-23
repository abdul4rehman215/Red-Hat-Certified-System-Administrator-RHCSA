# 🧪 Lab 39: Networking and Configuring NFS (Server + Client)

## 📌 Overview
This lab implements a complete **NFS file sharing setup** using a **CentOS/RHEL 8/9-style** environment with two machines:

- **NFS Server**: exports multiple directories with different access controls
- **NFS Client**: discovers, mounts, validates, and persists NFS mounts

The focus is on **real admin workflow**: exports, services, firewall rules, mount verification, persistence, and troubleshooting.

---

## 🎯 Objectives
By the end of this lab, I was able to:

- Understand **NFS fundamentals** and common enterprise use cases
- Configure and manage an **NFS server**
- Mount NFS exports on a **client system** (manual + persistent via `/etc/fstab`)
- Configure **firewalld** rules for NFS securely
- Troubleshoot **connectivity, permissions, and export issues**
- Apply basic NFS security practices (squashing, network restriction)

---

## ✅ Prerequisites
- Linux CLI fundamentals
- Permissions & ownership (UID/GID)
- `systemctl` service management
- Basic networking (IP, ports, connectivity checks)
- Firewall concepts (`firewalld`)
- Comfort editing config files (`vi` / `nano`)

---

## 🧰 Lab Environment
Two hosts in the same network:

- **Server (nfs-server):** CentOS/RHEL 8 or 9
- **Client (nfs-client):** CentOS/RHEL 8 or 9
- Root access available on both machines

> Outputs are captured from two terminals labeled: `[NFS-SERVER]` and `[NFS-CLIENT]`.

---

## 🧩 What Was Implemented

### 1) NFS Server Configuration
- Installed: `nfs-utils`, `rpcbind`
- Created exports:
  - `/nfs/shared` → **Read/Write** for clients
  - `/nfs/public` → **Read-only**
  - `/nfs/private` → restricted to **192.168.1.0/24**
- Configured `/etc/exports` with real-world options:
  - `rw / ro`, `sync`, `root_squash / no_root_squash`, `no_subtree_check`
- Started and enabled services:
  - `rpcbind`, `nfs-server`, `rpc-statd`, `nfs-idmapd`

### 2) NFS Client Configuration
- Installed: `nfs-utils`
- Discovered exports using `showmount`
- Mounted exports to:
  - `/mnt/nfs-shared`
  - `/mnt/nfs-public`
  - `/mnt/nfs-private`
- Persisted mounts using `/etc/fstab` with `_netdev`

### 3) Firewall Configuration (firewalld)
- Opened required NFS services:
  - `nfs`, `rpc-bind`, `mountd`
- Verified allowed ports (including `111`, `2049`, `20048`)
- Implemented **restricted access** using rich rules for `192.168.1.0/24`

---

## ✅ Results & Validation
- Client successfully mounted all exports and verified access behavior:
  - RW share: write allowed
  - RO share: write correctly denied
  - Private share: accessible from allowed subnet
- Verified network + RPC visibility:
  - `rpcinfo -p`
  - `showmount -e`
- Verified mount state via:
  - `df -h`, `mount | grep nfs`
- Verified persistence via:
  - `mount -a` after unmounting

---

## 🔐 Security Notes (What Matters in Real Deployments)
- Prefer **root_squash** unless you *must* allow server-side root equivalency
- Restrict exports to known networks (avoid `*` for production)
- Prefer NFSv4 and consider Kerberos for enterprise auth (advanced topic)
- Watch SELinux contexts when exports behave unexpectedly

---

## 🌍 Real-World Relevance
This setup maps directly to:
- shared team storage (dev, build artifacts, logs)
- centralized storage for Linux fleets
- enterprise environments where “one source of truth” matters

NFS is a common RHCSA/RHCE skill and still heavily used in production.

---

## 📂 Repository Files
- `commands.sh` → all commands executed (server + client, ordered)
- `output.txt` → captured outputs (verification + checks)
- `troubleshooting.md` → common issues + fixes (firewall, exports, perms, SELinux)
- `interview_qna.md` → interview-style Q&A for NFS concepts

---

## 🏁 Conclusion
This lab demonstrates an end-to-end NFS deployment:
- **exports + access control**
- **service readiness**
- **firewall hardening**
- **client mounts + persistence**
- **real troubleshooting workflow**

---
