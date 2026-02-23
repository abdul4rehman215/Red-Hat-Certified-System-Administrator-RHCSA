# 🎤 Interview Q&A - Lab 17: Operating Running Systems

---

## 1️⃣ What is a process in Linux?

A process is a running instance of a program.  
Each process has:

- PID (Process ID)
- Owner (User)
- CPU & Memory usage
- State (Running, Sleeping, Stopped, Zombie)

---

## 2️⃣ What is the difference between reboot and shutdown?

- `reboot` → Restarts the system.
- `shutdown -h now` → Halts and powers off the system.
- `poweroff` → Immediate system power-off.

Reboot is used for system updates or recovery.  
Shutdown is used for safe system termination.

---

## 3️⃣ How do you schedule and cancel a shutdown?

Schedule:

```bash
sudo shutdown -h +10
```

Cancel:

```bash
sudo shutdown -c
```

---

## 4️⃣ What is the difference between top and ps?

| Command | Type | Usage |
|----------|------|--------|
| top | Real-time | Live process monitoring |
| ps aux | Snapshot | Static list of processes |

`top` continuously updates.  
`ps` shows a one-time view.

---

## 5️⃣ What is htop?

`htop` is an interactive, enhanced version of `top`.

Features:
- Color-coded metrics
- Easy sorting
- Mouse support
- Interactive process killing

---

## 6️⃣ What is a PID?

PID (Process ID) is a unique number assigned to each running process.

Used for:
- Monitoring
- Debugging
- Termination

---

## 7️⃣ What is the difference between kill and pkill?

- `kill <PID>` → Terminates a process by PID.
- `pkill <name>` → Terminates processes by name.

Example:

```bash
kill -9 1042
pkill -9 sleep
```

---

## 8️⃣ What does kill -9 mean?

`-9` sends the SIGKILL signal.

- Forcefully stops process
- Cannot be ignored
- Used when process does not respond to normal termination

Safer alternative:

```bash
kill -15 <PID>
```

(SIGTERM – graceful shutdown)

---

## 9️⃣ What are common Linux process states?

- R → Running
- S → Sleeping
- D → Uninterruptible sleep
- T → Stopped
- Z → Zombie

Check using:

```bash
ps aux
```

---

## 🔟 How is process management used in production?

Used for:

- Killing stuck applications
- Managing server load
- Handling runaway processes
- Restarting failed services
- Debugging performance issues
- Maintaining container hosts

Process control is critical for system reliability.

---

## 🧠 Best Practices

- Use SIGTERM before SIGKILL
- Monitor CPU/memory before killing processes
- Avoid killing system processes (PID 1)
- Validate PID before execution
- Use htop for safe interactive monitoring

---

## ✅ Interview Readiness Summary

This lab demonstrates:

- Understanding of Linux process lifecycle
- Real-time vs snapshot monitoring
- Signal-based process termination
- System power management
- Practical production troubleshooting skills
