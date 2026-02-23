# 🛠️ Troubleshooting Guide — Lab 27: Installing & Managing Software Packages

---

## 🔧 Issue 1: Package Not Found

### ❌ Problem

```bash
No match for argument: package-name
```

### 🔍 Check

```bash
dnf search package-name
dnf repolist
```

### ✅ Solution

* Ensure repositories are enabled:

```bash
sudo dnf repolist all
```

* Enable required repo:

```bash
sudo dnf config-manager --set-enabled <repo-name>
```

* Refresh metadata:

```bash
sudo dnf makecache
```

---

## 🔧 Issue 2: Dependency Conflict

### ❌ Problem

```
Error: Problem with installed package
conflicting requests
```

### ✅ Solutions

Try:

```bash
sudo dnf install package-name --allowerasing
```

Or:

```bash
sudo dnf install package-name --skip-broken
```

Check conflicts:

```bash
sudo dnf repoquery --unsatisfied
```

---

## 🔧 Issue 3: Corrupted RPM Database

### ❌ Symptoms

* Slow package commands
* RPM errors
* Metadata inconsistency

### ✅ Fix

```bash
sudo rpm --rebuilddb
```

Verify:

```bash
sudo rpm -qa | head
```

---

## 🔧 Issue 4: GPG Key Error

### ❌ Problem

```
GPG key verification failed
```

### ✅ Fix

Import correct key:

```bash
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
```

Retry:

```bash
sudo dnf install package-name
```

---

## 🔧 Issue 5: Repository Metadata Expired

### ❌ Problem

```
Metadata expired
```

### ✅ Fix

```bash
sudo dnf clean all
sudo dnf makecache
```

---

## 🔧 Issue 6: Disk Space Full

### ❌ Problem

```
No space left on device
```

### 🔍 Check

```bash
df -h
```

### ✅ Clean

```bash
sudo dnf autoremove -y
sudo dnf clean all
sudo journalctl --vacuum-time=7d
```

---

## 🔧 Issue 7: Package Installed But Command Not Found

### 🔍 Check

```bash
rpm -ql package-name
echo $PATH
```

### ✅ Fix

* Verify binary location:

```bash
which package-name
```

* Ensure directory is in PATH.
* Reinstall if necessary:

```bash
sudo dnf reinstall package-name
```

---

## 🔧 Issue 8: Repository Connectivity Issue

### ❌ Problem

Slow downloads or timeout

### 🔍 Check

```bash
ping google.com
dnf repolist
```

### ✅ Fix

* Check DNS:

```bash
cat /etc/resolv.conf
```

* Try different mirror:

```bash
sudo dnf config-manager --setopt=baseurl=<mirror-url>
```

---

## 🔧 Issue 9: Configuration File Modified Warning

When running:

```bash
rpm -Va
```

You may see:

```
S.5....T.  c /etc/httpd/conf/httpd.conf
```

### Meaning:

* File has been modified (likely expected for config files)

### Action:

* Review manually:

```bash
diff /etc/httpd/conf/httpd.conf /usr/share/doc/httpd*/httpd.conf
```

---

## 🔒 Security-Focused Troubleshooting

### Check Package Signature

```bash
rpm -K package.rpm
```

### Verify Installed Package Integrity

```bash
rpm -V package-name
```

No output = verified.

---

# 🧠 Admin-Level Troubleshooting Workflow

1. Check repo:

```bash
dnf repolist
```

2. Refresh metadata:

```bash
dnf clean all
dnf makecache
```

3. Check dependencies:

```bash
dnf check
```

4. Rebuild database if needed:

```bash
rpm --rebuilddb
```

5. Review logs:

```bash
sudo journalctl -xe
```

---

# ✅ Final Reminder

Always troubleshoot in this order:

1. Repository issue
2. Network issue
3. Dependency conflict
4. RPM database issue
5. Disk space issue
