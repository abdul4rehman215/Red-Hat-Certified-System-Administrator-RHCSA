# 🧪 Lab 33: Understanding and Managing SELinux (RHCSA)

> **Environment:** CentOS/RHEL 8/9 (Cloud Lab)  
> **User:** `centos` (sudo access)  
> **Shell Prompt Style:** `-bash-4.2$` / `-bash-4.2#`

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand what **SELinux** is and why it matters for enterprise Linux security
- Check and interpret SELinux state using `sestatus` and `getenforce`
- Switch between **Enforcing** and **Permissive** modes using `setenforce`
- Inspect SELinux labels (contexts) on **files**, **processes**, and **users**
- Troubleshoot SELinux denials using:
  - `ausearch` (audit log filtering)
  - `audit2allow` (explain / generate policy modules)
  - `sealert` (human-friendly analysis)
- Fix SELinux problems correctly using **context repair** (`restorecon`, `semanage`) instead of blindly disabling SELinux

---

## ✅ Prerequisites

- Comfortable with Linux CLI
- Basic understanding of file permissions and ownership
- Familiarity with system services (`systemctl`)
- Basic log awareness (audit logs)
- A system with SELinux enabled (RHEL/CentOS/Fedora family)

---

## 🧰 Lab Environment

This lab assumes a cloud-based RHEL/CentOS machine where:

- SELinux is installed and enabled
- Audit logging (`auditd`) is running
- SELinux utilities are available (or installable via `yum`)
- A test service (`httpd`) can be installed for practical SELinux denial simulation

---

## 🧩 What I Did (Task Overview)

### ✅ Task 1: Check SELinux Status
- Verified active user and escalated privileges (`whoami`, `sudo su -`)
- Confirmed SELinux state and policy details using:
  - `sestatus`
  - `getenforce`
- Reviewed the persistent configuration in:
  - `/etc/selinux/config`

### ✅ Task 2: Explore SELinux Contexts
- Checked SELinux context labeling on:
  - Files (`ls -Z`)
  - Processes (`ps -eZ`)
  - Current shell/user context (`id -Z`)

### ✅ Task 3: Change SELinux Modes (Temporary + Persistent Concepts)
- Switched mode to permissive and verified:
  - `setenforce 0`
  - `getenforce` and `sestatus`
- Switched back to enforcing:
  - `setenforce 1`
- Backed up `/etc/selinux/config`
- Documented how a permanent change would be done (without applying it)

### ✅ Task 4: Troubleshoot a Real SELinux Denial (HTTPD Scenario)
- Created web content in `/var/www/html/test/`
- Moved a file from `/tmp` into web root to intentionally produce incorrect context
- Started `httpd` and reproduced the denial (403 Forbidden)
- Located AVC denials using:
  - `ausearch -m AVC -c httpd`
- Analyzed solutions using:
  - `audit2allow` (rule suggestion + explanation)
  - `audit2allow -M` (module generation, shown as a learning path)

### ✅ Task 5: Fix the Root Cause the Right Way (Labeling)
- Restored correct labeling using:
  - `restorecon -Rv /var/www/html/test/`
- Verified the label fix with `ls -Z`
- Confirmed the issue was resolved by accessing the page via `curl`

### ✅ Task 6: Use sealert for Human-Friendly Guidance
- Installed `setroubleshoot-server`
- Generated actionable denial explanation using:
  - `sealert -a /var/log/audit/audit.log`

### ✅ Task 7: Advanced SELinux Admin Tools (Booleans + semanage)
- Reviewed relevant booleans with:
  - `getsebool -a | grep httpd`
- Demonstrated enabling a boolean (`setsebool`)
- Installed `policycoreutils-python-utils` when `semanage` was missing
- Listed:
  - file context rules (`semanage fcontext -l`)
  - SELinux port types (`semanage port -l`)

### ✅ Task 8: Practical Context Management (Custom App Example)
- Created `/opt/myapp/` layout
- Built a small shell app (`myapp.sh`) and data files
- Observed default labels (`default_t`)
- Assigned correct labels using:
  - `semanage fcontext -a ...`
  - `restorecon -Rv ...`
- Verified correct labeling with `ls -Z`

### ✅ Task 9: Cleanup + Verify Final State
- Removed test directories
- Verified SELinux returned to enforcing
- Confirmed no recent AVCs in the final state

---

## 📁 Repository Structure

```text
lab33-selinux-management/
├── README.md
├── commands.sh
├── scripts/
│   └── myapp.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
````

---

## 📄 Files Included

* **README.md** → structured walkthrough + portfolio explanation
* **commands.sh** → every command executed (in order)
* **scripts/** → scripts created during the lab (no truncation)
* **output.txt** → terminal outputs captured from the lab run
* **interview_qna.md** → RHCSA-focused interview questions (10–15)
* **troubleshooting.md** → common SELinux issues + fixes (practical + exam-aligned)

---

## ✅ Verification Checklist

* [ ] `sestatus` shows SELinux enabled
* [ ] `getenforce` correctly switches between modes using `setenforce`
* [ ] File contexts visible using `ls -Z`
* [ ] Process labels visible using `ps -eZ`
* [ ] SELinux denial identified via `ausearch`
* [ ] Denial analyzed using `audit2allow` and `sealert`
* [ ] Issue resolved via `restorecon` (proper labeling fix)
* [ ] `semanage` tools installed and used successfully
* [ ] Final SELinux mode returned to **Enforcing**

---

## 🧠 What I Learned

* SELinux is **mandatory access control (MAC)** — it can block actions even when Unix permissions look correct
* Most “mysterious permission errors” in RHEL systems are often **SELinux labeling issues**
* The correct fix is usually:

  * **Relabel** content (`restorecon`)
  * Or define persistent labeling rules (`semanage fcontext`)
    instead of disabling SELinux or generating broad allow rules
* Audit logs + AVC records are the truth source for SELinux troubleshooting

---

## 🌍 Why This Matters (Real-World Relevance)

SELinux is critical in real enterprise environments for:

* Preventing post-exploitation damage even if a service is compromised
* Enforcing separation between services (e.g., `httpd_t` vs system files)
* Meeting compliance requirements that require MAC enforcement
* Hardening servers running public-facing workloads (web, API, apps)

---

## ✅ Result

✔ SELinux state and policy verified
✔ Modes tested safely (temporary)
✔ Real denial created, detected, analyzed, and fixed correctly
✔ Context management performed using best practices
✔ System returned to secure enforcing mode

---
