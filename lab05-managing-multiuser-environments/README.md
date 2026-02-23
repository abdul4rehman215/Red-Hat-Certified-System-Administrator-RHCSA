# 👥 Lab 05 – Managing Multiuser Environments  


# 🎯 Objectives

By completing this lab, I gained hands-on experience in:

- Linux user creation and management
- Switching users using `su`
- Executing privileged commands with `sudo`
- File permission management
- Multiuser system target configuration
- Container-based user isolation using Podman

---

# 📋 Prerequisites

- RHEL/CentOS/Fedora-based system
- Root or sudo privileges
- Podman installed
- Basic Linux CLI knowledge

---

## 🖥️ Lab Environment 

**Environment:** CentOS Linux 7 (Core)  
**Hostname:** ip-172-31-10-133  
**User:** centos (sudo-enabled)

This lab was performed on a real CentOS 7 system to simulate enterprise-grade multiuser management and privilege control scenarios.

---

# 📂 Repository Structure

```
lab05-managing-multiuser-environments/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── artifacts/
    └── user1_file.txt
```

---

# 🧩 Task Overview

---

## 🔹 Task 1 – User Creation & Privilege Verification

- Created new users (`user1`, `user2`)
- Set secure passwords
- Verified `sudo` privileges
- Accessed restricted system files (`/etc/shadow`)
- Observed permission enforcement

---

## 🔹 Task 2 – User Isolation & File Permissions

- Created file as `user1`
- Attempted access from `user2`
- Verified permission denial
- Modified permissions using `chmod`
- Confirmed controlled access

### 🔎 Permission Breakdown

```
644
Owner: read/write (6)
Group: read (4)
Others: read (4)
```

---

## 🔹 Task 3 – Multiuser System Targets (Systemd)

- Checked current default target
- Switched between:
  - `graphical.target`
  - `multi-user.target`
- Set default boot target

This simulates real-world server vs desktop deployment configurations.

---

## 🐳 Advanced Task – Container User Isolation

- Ran container using specific UID
- Verified user identity inside container
- Observed namespace-based user mapping

```bash
podman run --user 1000 -it fedora /bin/bash
```

This demonstrates container security and user isolation concepts used in OpenShift environments.

---

# 🔐 Security Concepts Applied

- Principle of Least Privilege
- User isolation enforcement
- Privileged command control via sudo
- File permission model (Owner/Group/Others)
- Systemd target management
- Container namespace isolation

---

# 🏁 Results

✔ Users created successfully  
✔ Privilege escalation validated  
✔ File isolation tested  
✔ Permission modification confirmed  
✔ System targets managed correctly  
✔ Container UID mapping verified  

---

# 🌍 Real-World Relevance

This lab reflects enterprise Linux administration practices:

- Managing shared systems
- Controlling privileged access
- Configuring server runlevels
- Supporting multi-tenant environments
- Container user security

These skills are critical for:

- RHCSA / RHCE certification
- Linux System Administration
- DevOps & Cloud Infrastructure
- OpenShift Security
- SOC & Compliance operations

---

# 🎓 What I Learned

- How Linux enforces user isolation
- How sudo grants controlled privilege escalation
- How file permissions protect user data
- How systemd targets define system modes
- How containers isolate users via UID mapping

---

# 🚀 Why This Matters

Multiuser management is foundational in:

- Enterprise servers
- Cloud deployments
- Shared hosting systems
- Containerized platforms
- Security-hardening strategies

Mastering user management ensures controlled access, data protection, and operational security.

---

# 🧹 Cleanup Performed

```bash
sudo userdel -r user1
sudo userdel -r user2
sudo systemctl set-default graphical.target
```

---

**✅ Lab Completed Successfully on CentOS 7**  
🔐 Multiuser Environment Management Verified
