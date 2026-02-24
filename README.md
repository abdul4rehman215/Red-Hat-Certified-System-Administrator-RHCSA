# 🐧 Red Hat Certified System Administrator (RHCSA) – Enterprise Linux Administration Portfolio

> Enterprise Linux Operations • Infrastructure Engineering • System Hardening • Automation & Observability • Production Troubleshooting

### A structured 40-lab hands-on Linux System Administration portfolio aligned with RHCSA objectives and real-world enterprise RHEL operations.

### This repository progresses from Linux Foundations → System Administration → Enterprise Operations, simulating production-style infrastructure workflows.

---

<div align="center">

<!-- PLATFORM -->
![RHEL](https://img.shields.io/badge/OS%20%7C%20Red%20Hat-Enterprise%20Linux%208%20%7C%209-EE0000?style=for-the-badge&logo=redhat&logoColor=EE0000)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04%20LTS-orange?style=for-the-badge&logo=ubuntu)
![Linux](https://img.shields.io/badge/Linux-System%20Administration-black?style=for-the-badge&logo=linux)
![Shell](https://img.shields.io/badge/Shell-Bash-success?style=for-the-badge&logo=gnu-bash)

<!-- FOCUS -->
![Track](https://img.shields.io/badge/Track-RHCSA%20Aligned-blue?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Foundations%20→%20Intermediate%20→%20Enterprise-purple?style=for-the-badge)
![Labs](https://img.shields.io/badge/Labs-40%20Hands--On-brightgreen?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

<!-- SKILL DOMAINS -->
![Networking](https://img.shields.io/badge/Networking-Configured%20%26%20Troubleshot-blue?style=for-the-badge)
![Security](https://img.shields.io/badge/Security-SELinux%20%26%20Firewall-red?style=for-the-badge)
![Storage](https://img.shields.io/badge/Storage-LVM%20%26%20Quotas-yellow?style=for-the-badge)
![Automation](https://img.shields.io/badge/Automation-Bash%20%26%20Cron-orange?style=for-the-badge)
![Containers](https://img.shields.io/badge/Containers-Podman-892CA0?style=for-the-badge&logo=podman)

<!-- ================= REPO METADATA ================= -->

![Repo Size](https://img.shields.io/github/repo-size/abdul4rehman215/Red-Hat-Certified-System-Administrator-RHCSA?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/abdul4rehman215/Red-Hat-Certified-System-Administrator-RHCSA?style=for-the-badge)
![Forks](https://img.shields.io/github/forks/abdul4rehman215/Red-Hat-Certified-System-Administrator-RHCSA?style=for-the-badge)
![Last Commit](https://img.shields.io/github/last-commit/abdul4rehman215/Red-Hat-Certified-System-Administrator-RHCSA?style=for-the-badge)


</div>

---

# 🎯 Executive Summary

This repository showcases a **40-lab, execution-driven Linux System Administration portfolio** aligned with RHCSA objectives and real enterprise RHEL operations.

It demonstrates hands-on capability across:

- ✅ Enterprise Linux administration (RHEL 8/9, Ubuntu)
- ✅ Identity & access lifecycle management (users, groups, ACLs)
- ✅ Service lifecycle & dependency management (systemd)
- ✅ Storage engineering (partitioning, LVM, persistent mounts)
- ✅ Network configuration & validation (nmcli, routing, diagnostics)
- ✅ Firewall enforcement & secure access (firewalld, SSH hardening)
- ✅ SELinux enforcement & policy troubleshooting
- ✅ Centralized logging & operational visibility (journalctl)
- ✅ Automation & scheduling (Bash, cron, systemd jobs)
- ✅ Resource & performance management (nice, renice, process tuning)
- ✅ Container lifecycle management (Podman)
- ✅ Network file services (NFS configuration & validation)

This is **not theoretical coursework**.

Each lab contains:

- Executed command transcripts
- Verified system outputs
- Real configuration changes (`/etc/fstab`, systemd units, SELinux contexts, firewall rules)
- Troubleshooting documentation
- Interview-ready technical explanations

The portfolio reflects **production-style Linux administration workflows** aligned with infrastructure, DevOps, and enterprise system operations roles.

---

# 📌 About This Repository

This repository is a structured **enterprise Linux administration program** simulating real-world RHEL operational environments.

The progression moves through:

> Linux Foundations → Access Control → Service Operations → Storage Engineering → Networking → Security Enforcement → Logging & Observability → Automation → Enterprise Troubleshooting

All labs were executed in controlled lab environments (RHEL 8/9, CentOS Stream, Ubuntu) using real system administration tooling.

The focus is operational execution:

- Real configuration implementation
- Validation through system outputs
- Controlled failure simulation
- Log-based troubleshooting
- Structured documentation

This repository demonstrates applied system engineering capability — not isolated command usage.

---

# 📚 Labs Index (1–40)

> Click any lab title to navigate directly to its folder.

---

## 🗂 Lab Categories Overview

# 🐧 Section 1: Linux Foundations (Labs 1–20)

Focus: Shell mastery → File operations → Bash scripting → Process control

<div align="left">

![Category](https://img.shields.io/badge/Category-Linux%20Foundations-darkgreen?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Shell%20%26%20CLI-blue?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Bash%20Scripting-orange?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Process%20%26%20System%20Control-purple?style=for-the-badge)

</div>

| Lab | Title | Core Focus |
|-----|-------|------------|
| 01 | [Shell Basics](lab01-understanding-shell-basics) | Navigation, redirection |
| 02 | [I/O Redirection](lab02-using-input-output-redirection) | Pipes, stdout/stderr |
| 03 | [grep & Regex](lab03-using-grep-and-regular-expressions) | Pattern search |
| 04 | [SSH Access](lab04-accessing-remote-systems-with-ssh) | Remote login & key auth |
| 05 | [Multi-user Concepts](lab05-managing-multiuser-environments) | su, sudo |
| 06 | [Archiving](lab06-archiving-compressing-and-unpacking-files) | tar, gzip, bzip2 |
| 07 | [Text Editing](lab07-creating-and-editing-text-files) | nano, vi |
| 08 | [File Management](lab08-managing-files-and-directories) | mkdir, cp, mv |
| 09 | [Links](lab09-creating-hard-and-soft-links) | Hard vs Soft links |
| 10 | [Permissions](lab10-managing-file-permissions) | chmod, chown |
| 11 | [Documentation](lab11-using-system-documentation) | man, info |
| 12 | [Shell Scripts](lab12-creating-simple-shell-scripts) | Variables, execution |
| 13 | [Conditionals](lab13-conditionally-execute-code-in-shell-scripts) | if/elif/else |
| 14 | [Loops](lab14-using-loops-in-shell-scripts) | for, while |
| 15 | [Input Handling](lab15-processing-input-in-shell-scripts) | Arguments & validation |
| 16 | [Output Processing](lab16-processing-output-of-shell-commands) | Command substitution |
| 17 | [Running Systems](lab17-operating-running-systems) | Reboot, kill |
| 18 | [Boot Targets](lab18-booting-different-targets) | systemctl isolate |
| 19 | [Resource Control](lab19-cpu-memory-intensive-processes) | CPU/MEM process handling |
| 20 | [Scheduling](lab20-adjusting-process-scheduling) | nice/renice |

---

## 🧠 Skills Demonstrated

- Linux CLI fluency
- Permission models & ownership
- Secure remote access (SSH)
- Bash automation scripting
- Process lifecycle control
- systemd target management
- Performance tuning basics

---

# 🖥 Section 2: Linux System Administration (Labs 21–30)

Focus: Users, packages, storage, services

<div align="left">

![Category](https://img.shields.io/badge/Category-System%20Administration-darkred?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-User%20%26%20Access%20Management-blue?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Storage%20%26%20LVM-orange?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Package%20%26%20Service%20Lifecycle-purple?style=for-the-badge)

</div>

| Lab | Title | Focus |
|-----|-------|-------|
| 21 | [Linux Essentials](lab21-introduction-to-linux-essentials) | CLI & filesystem |
| 22 | [File Navigation](lab22-navigating-the-linux-file-system) | find, locate |
| 23 | [Users & Groups](lab23-managing-users-and-groups) | useradd, passwd |
| 24 | [Permissions & ACLs](lab24-configuring-user-permissions) | setfacl |
| 25 | [Text Processing](lab25-text-processing-tools) | grep, sed, awk |
| 26 | [SSH Configuration](lab26-configuring-ssh-for-remote-access) | Hardening |
| 27 | [Package Management](lab27-installing-managing-packages) | dnf, yum |
| 28 | [Disk Partitioning](lab28-working-with-disk-partitions) | fdisk, mkfs |
| 29 | [LVM](lab29-managing-logical-volumes) | pvcreate, lvextend |
| 30 | [systemd Services](lab30-managing-systemd-services) | journalctl |


---

## 💾 Skills Demonstrated

- Identity & access control
- ACL implementation
- Package lifecycle management
- Persistent mounts
- Logical volume scaling
- Log-based service debugging
- SSH hardening
- Text parsing automation

---

# 🏢 Section 3: RHEL Enterprise Operations (Labs 31–40)

Focus: Networking, Security, Automation, Containers, Troubleshooting

<div align="left">

![Category](https://img.shields.io/badge/Category-RHEL%20Enterprise%20Operations-black?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Networking%20%26%20Firewall-blue?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-SELinux%20Enforcement-red?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Automation%20%26%20Troubleshooting-success?style=for-the-badge)

</div>

| Lab | Title | Core Focus |
|-----|-------|-----------|
| 31 | [Networking](lab31-configuring-networking) | nmcli, diagnostics |
| 32 | [Firewall](lab32-managing-firewalld) | firewalld |
| 33 | [SELinux](lab33-selinux-management) | Contexts & enforcement |
| 34 | [Archiving](lab34-archiving-compressing-files) | Backup validation |
| 35 | [Disk Quotas](lab35-managing-disk-quotas) | usrquota |
| 36 | [journalctl](lab36-journalctl-system-logs) | Log analysis |
| 37 | [Cron Automation](lab37-cron-task-automation) | Scheduled tasks |
| 38 | [Podman](lab38-podman-intro-containers) | Container lifecycle |
| 39 | [NFS](lab39-nfs-networking) | Server-client setup |
| 40 | [Service Troubleshooting](lab40-managing-troubleshooting-services) | systemctl debugging |

---

## 🔐 Enterprise Skills Demonstrated

- Static & dynamic IP configuration
- Firewall zone management
- SELinux troubleshooting
- Storage policy enforcement
- Log filtering by unit/time/priority
- Automated maintenance
- Container deployment (rootless)
- Secure NFS configuration
- Root cause analysis using journald

---

# 🛠 Technical Stack Used

<details>
<summary><b> Click to expand </b></summary>

## 🖥 Operating Systems
- RHEL 8 / 9
- CentOS Stream
- Ubuntu 24.04 LTS

## 🔐 Security
- firewalld
- SELinux (sestatus, restorecon, semanage)
- OpenSSH

## 🌐 Networking
- nmcli
- ip / ss
- dig / ping / traceroute

## 💾 Storage
- fdisk
- mkfs
- LVM
- xfs_growfs
- quotas

## 📜 Logs
- journalctl
- systemd logs

## 📦 Containers
- Podman

## ⏰ Automation
- crontab
- Bash scripting

</details>

---

# 🗂 Repository Structure

```
Red-Hat-Certified-System-Administrator-RHCSA/
│
├── 🔹 Linux-Foundations               (Labs 1–20)
├── 🔹 Linux-System-Administration     (Labs 21–30)
├── 🔹 RHEL-Enterprise-Operations      (Labs 31–40)
│
└── README.md
```

### 🧱 Standard Lab Folder Structure

Each lab follows a consistent professional structure:

```
labXX-name/
├── README.md
├── commands.sh
├── scripts/
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

Each lab includes:

- ✅ Executed commands
- ✅ Captured outputs
- ✅ Configuration evidence
- ✅ Troubleshooting notes
- ✅ Interview-focused explanations

---

# 🎯 Learning Outcomes Across 40 Labs

After completing this portfolio, I can:

- Confidently administer Linux servers from CLI
- Design secure multi-user systems
- Implement disk partitioning & LVM scaling
- Configure production networking
- Enforce firewall & SELinux policies
- Troubleshoot service failures methodically
- Automate maintenance tasks
- Deploy containerized workloads
- Configure NFS shared storage
- Debug system issues using structured log analysis

---

# 🌍 Real-World Alignment

These labs simulate real enterprise Linux administration responsibilities, including:

- Production server provisioning & baseline configuration
- Multi-user identity & access lifecycle management
- Secure service exposure through firewall zoning
- SELinux policy enforcement & denial remediation
- Storage architecture design (partitioning, LVM scaling, quotas)
- Secure remote access deployment & hardening (SSH)
- Log-driven incident troubleshooting (journalctl)
- Network configuration & DNS validation
- Automated system maintenance (cron & scripting)
- Containerized workload deployment using Podman
- Network file sharing (NFS) in controlled environments
- Service failure investigation & recovery workflows

They reflect practical infrastructure operations rather than theoretical lab exercises.

---

# 🏢 Professional Relevance

This portfolio aligns directly with:

- RHCSA certification objectives
- Linux System Administrator roles
- Infrastructure & Production Support engineering
- DevOps foundational operations
- Enterprise Linux server management

It reflects applied operational capability in configuration, security enforcement, storage management, service reliability, and structured troubleshooting within production-style environments.

---

# 🌍 Real-World Simulation

All labs were executed in controlled RHEL-based environments and designed to simulate realistic enterprise Linux workflows:

- Server configuration & validation from CLI
- Persistent filesystem mounting via `/etc/fstab`
- Service lifecycle management with systemd (start → enable → debug → recover)
- Firewall rule implementation & live connectivity testing
- SELinux context modification & AVC log investigation
- LVM lifecycle operations (create → extend → resize → validate)
- Disk quota enforcement & resource control validation
- Log filtering by unit, time, priority & boot session
- Scheduled automation using cron & job output redirection
- Container lifecycle management (pull → run → inspect → troubleshoot)
- NFS server-client deployment with firewall integration
- Structured root cause analysis using logs & system diagnostics

This portfolio demonstrates applied Linux system engineering —  
focused on operational reliability, security enforcement, and production troubleshooting discipline.

---

# 📊 Linux Administration Skills Heatmap

This heatmap reflects **hands-on implementation across 40 labs** in:

**Linux Foundations • RHEL System Administration • Enterprise Operations • Security Enforcement • Automation • Production Troubleshooting**

> Exposure bars use text blocks (█) to reflect execution depth.

| Skill Area | Exposure Level | Practical Depth | Tools / Technologies Used |
|------------|---------------|----------------|----------------------------|
| 🐧 Linux CLI Mastery | ██████████ 100% | Command chaining, redirection, pipelines, system navigation | bash, coreutils |
| 👤 Identity & Access Management | ██████████ 100% | User lifecycle, groups, ACLs, password policies | useradd, chmod, setfacl |
| 📂 File Systems & Storage | ██████████ 100% | Partitioning, persistent mounts, filesystem validation | fdisk, mkfs, /etc/fstab |
| 📦 Logical Volume Management | █████████░ 90% | PV/VG/LV lifecycle, resizing, scaling storage | pvcreate, lvextend, xfs_growfs |
| ⚙️ Service Lifecycle Management | ██████████ 100% | Start/enable/debug/recover workflows | systemctl, journalctl |
| 🌐 Networking Configuration | █████████░ 90% | Static IP setup, DNS validation, routing diagnostics | nmcli, ip, ss, dig |
| 🔥 Firewall Enforcement | █████████░ 90% | Zone policies, port control, service exposure validation | firewalld |
| 🛡 SELinux Administration | █████████░ 90% | Context modification, AVC analysis, policy remediation | sestatus, restorecon |
| 📜 Log Analysis & Observability | ██████████ 100% | Unit filtering, boot analysis, priority filtering | journalctl |
| ⏰ Automation & Scheduling | █████████░ 90% | Cron job design, output logging, scripted tasks | crontab, bash |
| 🐳 Container Fundamentals | ████████░░ 80% | Container lifecycle, inspection, networking | podman |
| 📡 Network File Services | ████████░░ 80% | NFS server/client deployment, firewall integration | nfs-utils |
| 📊 Resource & Performance Control | ████████░░ 80% | CPU/MEM monitoring, priority tuning | top, nice, renice |
| 🧪 Structured Troubleshooting | ██████████ 100% | Failure simulation, root cause analysis, validation workflow | systemd, logs |

## 🎓 Proficiency Scale

- ██████████ = Implemented End-to-End with Validation & Recovery  
- █████████░ = Advanced Practical Implementation  
- ████████░░ = Strong Working Implementation  
- ███████░░░ = Foundational + Applied Exposure  

This heatmap reflects **operational Linux engineering capability**, not isolated commands — covering:

> Configure → Secure → Validate → Automate → Troubleshoot → Recover

---

# 🚀 How To Use

```bash
git clone https://github.com/abdul4rehman215/Red-Hat-Certified-System-Administrator-RHCSA.git
cd Red-Hat-Certified-System-Administrator-RHCSA
cd labXX-name
```

Each lab contains its own `README.md` with setup, execution steps and troubleshooting guidance.

---

# 🧪 Execution Environment

All labs were executed in isolated Linux lab environments designed to simulate real enterprise RHEL operations.

Environment characteristics:

- RHEL 8 / 9, CentOS Stream, Ubuntu (systemd-based)
- CLI-first configuration & administration workflows
- Persistent configuration validation (`/etc/fstab`, systemd units, firewall rules)
- Controlled service & network failure simulation
- Log-driven troubleshooting using journalctl
- Manual + Bash-driven automation tasks

Outputs were validated through system commands, service states, logs, and configuration verification.

---

# 🎯 Intended Use

This repository is designed to support:

- RHCSA-aligned Linux administration practice
- Enterprise Linux system operations & production support readiness
- Infrastructure engineering fundamentals (storage, networking, services)
- Secure server configuration workflows (firewalld, SELinux, SSH hardening)
- Operational troubleshooting discipline (systemd + journalctl)
- Automation-first administration (Bash + cron scheduling)
- Container fundamentals with Podman
- Network file sharing workflows (NFS)

All scripts and configurations are intended for controlled lab use and authorized environments only.

---

# ⚖ Ethical & Legal Notice

All labs in this repository were conducted:

- In controlled lab environments
- On self-configured or authorized test systems
- Without impacting production infrastructure

This repository is intended solely for:

- Educational use
- Professional Linux administration development
- RHCSA-aligned skill practice
- Infrastructure engineering training

No unauthorized systems were accessed or tested.

---

# ⭐ Final Note

This repository represents structured, **hands-on Linux administration** capability — not theoretical study.

It demonstrates operational capability across:

> Configure → Secure → Scale → Automate → Troubleshoot → Validate

If this repository adds value, consider ⭐ starring it.

---

# 👨‍💻 Author

**Abdul Rehman**  
Linux System Administration & RHCSA Practice Portfolio • Enterprise Operations • Security-Focused Infrastructure

### 📧 Reach Out

  <a href="https://github.com/abdul4rehman215">
    <img src="https://img.shields.io/badge/Follow-181717?style=for-the-badge&logo=github&logoColor=white" alt="Follow" />
  </a>  
  <a href="https://linkedin.com/in/abdul4rehman215">
     <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white&v=1" />
  </a>
  <a href="mailto:abdul4rehman215@gmail.com">
    <img src="https://img.shields.io/badge/Email-EE0000?style=for-the-badge&logo=gmail&logoColor=white" />
  </a>

---
