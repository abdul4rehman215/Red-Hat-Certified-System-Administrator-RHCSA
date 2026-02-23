# 🎤 Interview Q&A - Lab 18: Booting Systems into Different Targets (systemd)

---

## 🔹 1️⃣ What is a systemd target?

A systemd target is a logical grouping of system services that defines a specific system state (similar to runlevels in older Linux systems).

Examples:
- multi-user.target
- graphical.target
- rescue.target
- emergency.target

---

## 🔹 2️⃣ What replaced traditional runlevels in modern Linux systems?

systemd targets replaced SysV runlevels.

Mapping example:

| SysV Runlevel | systemd Target        |
|---------------|-----------------------|
| 3             | multi-user.target     |
| 5             | graphical.target      |
| 1             | rescue.target         |

---

## 🔹 3️⃣ How do you check the default boot target?

```
systemctl get-default
```

---

## 🔹 4️⃣ How do you change the default boot target permanently?

```
sudo systemctl set-default multi-user.target
```

This updates the symbolic link:
```
/etc/systemd/system/default.target
```

---

## 🔹 5️⃣ What is the difference between isolate and set-default?

- isolate → Temporarily switches to a target immediately
- set-default → Changes boot target for next reboot

---

## 🔹 6️⃣ What is rescue mode used for?

Rescue mode is used for:

- Filesystem repair
- Password reset
- System recovery
- Debugging failed services

It loads minimal services and provides single-user access.

---

## 🔹 7️⃣ What is emergency.target?

- Even more minimal than rescue
- No network services
- Used for severe system failures

---

## 🔹 8️⃣ How can you view target dependencies?

```
systemctl list-dependencies multi-user.target
```

---

## 🔹 9️⃣ How do you troubleshoot a failed target?

Use system logs:

```
journalctl -xe
```

Check failed services:

```
systemctl --failed
```

---

## 🔹 🔟 Why is multi-user.target commonly used in production?

Because production servers:

- Do not require a GUI
- Consume fewer resources
- Reduce attack surface
- Improve stability and performance

---

# 💡 Real-World Scenario Question

**Scenario:**  
A Linux server boots into a black screen and no login prompt appears. What steps would you take?

Expected approach:
1. Boot into rescue mode via GRUB
2. Check logs using journalctl
3. Verify display-manager status
4. Reset default target if misconfigured

---

# 🏁 Interview Readiness

After this lab, you should confidently explain:

- systemd architecture basics
- Target switching
- Boot troubleshooting methods
- Server vs GUI boot design decisions

🔄 systemd Target Management – Interview Ready
