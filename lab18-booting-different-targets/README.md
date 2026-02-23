# 🔄 Lab 18: Booting Systems into Different Targets

## 📌 Overview

This lab focuses on managing Linux boot behavior using **systemd targets**.  
You will learn how to switch between CLI, graphical, rescue, and emergency modes — and configure the system’s default boot state.

The lab simulates real-world server administration and recovery scenarios using Ubuntu 24.04.1 LTS.

---

## 🎯 Objectives

- Understand systemd targets and their purpose
- Identify the current system default target
- Switch between multi-user, graphical, and rescue modes
- Configure persistent default boot targets
- Troubleshoot boot and target switching issues

---

## 🧰 Prerequisites

- Linux system using systemd
- Sudo privileges
- Basic understanding of system services and boot process

---

## 🏗️ Repository Structure

```
lab18-booting-different-targets/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_questions.md
└── troubleshooting.md
```

---

## 🧩 Lab Task Overview

### Task 1 – Boot Into Different Targets
- Identify current default target
- Switch to multi-user mode
- Activate graphical mode
- Simulate rescue mode boot

### Task 2 – Configure systemd Targets
- List available targets
- Change default boot target
- Verify persistent configuration

### Task 3 – Practice Target Switching
- Temporarily isolate targets
- Switch between CLI and GUI
- Reboot directly into rescue mode

---

## 🏁 Key Learning Outcomes

After completing this lab, I can:

- Control Linux boot modes using systemctl
- Safely switch between runtime environments
- Configure production server boot behavior
- Recover systems using rescue mode
- Diagnose target dependency issues

---

## 🌍 Why This Matters (Real-World Relevance)

- Production servers typically run in **multi-user mode**
- Graphical targets are used for workstation environments
- Rescue mode is critical for:
  - Filesystem repair
  - Password recovery
  - Service debugging
- Understanding systemd targets is essential for:
  - Linux Administration
  - DevOps roles
  - Cloud infrastructure management

---

## ✅ Result

systemd target configuration, switching, and recovery boot modes successfully validated on Ubuntu 24.04.1 LTS.

🔄 Boot Control & Target Management Verified
