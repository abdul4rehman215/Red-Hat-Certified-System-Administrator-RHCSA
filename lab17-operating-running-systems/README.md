# 🖥️ Lab 17 – Operating Running Systems

## 📌 Lab Overview

This lab focuses on managing a live Linux system.  
It covers system power operations, real-time monitoring, and process management — essential skills for system administrators and DevOps engineers.

You will learn how to safely reboot systems, monitor performance metrics, and identify and terminate misbehaving processes.

---

## 🎯 Objectives

By completing this lab, I was able to:

- Reboot and shut down a Linux system
- Schedule and cancel shutdown operations
- Monitor system processes using `top`, `ps`, and `htop`
- Identify running processes
- Terminate processes using `kill`, `pkill`, and `pgrep`

---

## 📋 Prerequisites

- Ubuntu 24.04.1 LTS
- sudo privileges
- Basic command-line familiarity
- Understanding of processes and PIDs

---

## 🗂 Repository Structure

```
lab17-operating-running-systems/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

(Note: This lab does not require custom scripts.)

---

## 🧠 Task Overview

### Task 1 – Managing System Power States
- Reboot system
- Shutdown and poweroff
- Schedule shutdown
- Cancel scheduled shutdown

### Task 2 – Monitoring Running Processes
- Use `top` for real-time monitoring
- Use `ps aux` for process snapshots
- Use `htop` for interactive monitoring

### Task 3 – Terminating Processes
- Locate process by PID
- Use `kill -9` for forced termination
- Use `pkill` for name-based termination
- Verify process removal with `pgrep`

---

## 🏁 What I Learned

- How Linux handles system power operations
- Real-time vs static process monitoring
- Safe process termination techniques
- Using signals for process control
- Managing system stability under load

---

## 🌍 Real-World Relevance

These skills are essential for:

- Production server management
- Incident response
- Performance troubleshooting
- Cloud VM operations
- Container host management
- DevOps and SRE workflows

System administrators rely on these commands daily to maintain uptime and stability.

---

## 🚀 Result

System power operations, monitoring tools, and process control commands successfully executed and verified in Ubuntu 24.04.

---

✅ Lab Completed  
🖥️ Running System Operations & Process Management Verified
