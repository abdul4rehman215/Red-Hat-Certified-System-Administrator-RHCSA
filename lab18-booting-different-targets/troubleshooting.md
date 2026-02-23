# 🛠️ Troubleshooting Guide - Lab 18: Booting Systems into Different Targets (systemd)

---

## 🔎 1️⃣ Target Fails to Switch

### ❌ Problem
`systemctl isolate graphical.target` does not start GUI.

### 📌 Possible Causes
- Display manager not installed
- Missing desktop environment
- Broken dependency

### ✅ Solution

Check display manager:

```
systemctl status display-manager
```

Install minimal desktop if missing:

```
sudo apt install ubuntu-desktop-minimal
```

---

## 🔎 2️⃣ System Boots Into Wrong Target

### ❌ Problem
After reboot, system boots into CLI instead of GUI (or vice versa).

### 📌 Cause
Incorrect default target configuration.

### ✅ Fix

Check current default:

```
systemctl get-default
```

Set correct target:

```
sudo systemctl set-default graphical.target
```

Reboot:

```
sudo reboot
```

---

## 🔎 3️⃣ Rescue Mode Not Working

### ❌ Problem
System does not enter rescue mode.

### 📌 Causes
- Incorrect GRUB parameter
- Wrong boot entry

### ✅ Correct Kernel Parameter

Append in GRUB:

```
systemd.unit=rescue.target
```

Press `Ctrl + X` to boot.

---

## 🔎 4️⃣ System Hangs After Target Switch

### 📌 Cause
Dependency failure or service conflict.

### ✅ Diagnose

Check failed services:

```
systemctl --failed
```

View logs:

```
journalctl -xe
```

---

## 🔎 5️⃣ Graphical Target Installed But No Login Screen

### 📌 Cause
Display manager service inactive.

### ✅ Fix

Restart display manager:

```
sudo systemctl restart gdm
```

Or enable it:

```
sudo systemctl enable gdm
```

---

## 🔎 6️⃣ Incorrect Target Dependency

### 📌 Diagnose Dependencies

```
systemctl list-dependencies multi-user.target
```

If a required service fails, check its status individually.

---

## 🔎 7️⃣ Emergency Mode Triggered Automatically

### ❌ Problem
System boots directly into emergency mode.

### 📌 Common Causes
- Corrupted filesystem
- Failed mount in `/etc/fstab`

### ✅ Check Filesystem

```
fsck /dev/sdX
```

Verify fstab entries:

```
cat /etc/fstab
```

---

# 🔐 Best Practices

✔ Use multi-user.target for servers  
✔ Avoid unnecessary GUI installation on production systems  
✔ Always verify target before rebooting  
✔ Use rescue mode carefully in remote environments  
✔ Check logs before making changes  

---

# 🏁 Final Status

Target configuration, switching, and recovery troubleshooting validated successfully.

🔄 Boot Target Troubleshooting Verified
