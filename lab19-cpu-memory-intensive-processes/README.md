# 🖥️ Lab 19: Identifying and Killing CPU/Memory Intensive Processes

## 📌 Overview

This lab focuses on monitoring system performance, identifying resource-intensive processes, and safely managing them using Linux process management tools.

You will work with CPU-heavy workloads, analyze memory usage, terminate processes, and adjust execution priority using nice and renice.

Environment: Ubuntu 24.04.1 LTS

---

## 🎯 Objectives

- Monitor running processes using top and ps
- Identify high CPU and memory consumers
- Terminate processes using kill, killall, and pgrep
- Adjust process priorities using nice and renice
- Understand Linux process scheduling behavior

---

## 🧰 Prerequisites

- Ubuntu 24.04 (or similar Linux distribution)
- sudo privileges
- Basic understanding of Linux processes

---

## 🏗️ Repository Structure

```
lab19-cpu-memory-intensive-processes/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_questions.md
└── troubleshooting.md
```

---

## 🧩 Lab Task Overview

### Task 1 – Monitor System Processes
- Use top for real-time monitoring
- Use ps for snapshot-based analysis
- Sort processes by CPU and memory usage

### Task 2 – Terminate Resource-Heavy Processes
- Graceful termination using SIGTERM
- Forceful termination using SIGKILL
- Terminate by name using killall

### Task 3 – Adjust Process Priority
- Launch process with nice
- Modify running process using renice
- Observe priority changes in top

---

## 🏁 Key Learning Outcomes

After completing this lab, I can:

- Diagnose CPU and memory spikes
- Identify misbehaving processes
- Apply safe termination methods
- Tune scheduling priority
- Maintain server stability under load

---

## 🔥 Why This Matters (Real-World Relevance)

- Prevent production outages
- Maintain container host performance
- Handle runaway processes
- Optimize system responsiveness
- Manage shared infrastructure environments

Process management is a critical Linux administration skill.

---

## ✅ Result

CPU monitoring, process termination, and priority adjustment validated successfully on Ubuntu 24.04.1 LTS.

⚙️ Linux Process Monitoring & Resource Control Verified
