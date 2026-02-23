# 🖥️ Lab 20: Adjusting Process Scheduling

## 📌 Overview

This lab focuses on Linux process scheduling and priority management.  
You will learn how to adjust process priorities, monitor scheduling behavior, and apply advanced real-time scheduling policies.

Environment: Ubuntu 24.04.1 LTS

---

## 🎯 Objectives

- Modify process priorities using nice and renice
- Monitor scheduling behavior using top and htop
- Understand Linux process states
- Apply advanced scheduling policies using chrt
- Analyze priority impact on CPU distribution

---

## 🧰 Prerequisites

- Ubuntu 24.04 (or similar systemd-based Linux)
- sudo privileges
- Basic process management knowledge
- htop installed

---

## 🏗️ Repository Structure

```
lab20-adjusting-process-scheduling/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_questions.md
└── troubleshooting.md
```

---

## 🧩 Lab Task Overview

### Task 1 – Modify Process Priority
- Launch CPU-intensive process
- Check default nice value
- Adjust priority using nice
- Modify running process using renice

### Task 2 – Monitor Scheduling Behavior
- Observe priority changes in top
- Use htop for interactive monitoring
- Compare CPU distribution between processes

### Task 3 – Explore Process States & Advanced Scheduling
- Identify process states (R, S, D, Z)
- Apply real-time scheduling policy using chrt
- Terminate test processes safely

---

## 🏁 Key Learning Outcomes

After completing this lab, you can:

- Control CPU scheduling priority
- Diagnose CPU starvation issues
- Apply performance tuning techniques
- Understand dynamic scheduling behavior
- Work with real-time scheduling policies

---

## 🔥 Why This Matters (Real-World Relevance)

Process scheduling control is critical for:

- Production server performance tuning
- Real-time application environments
- Preventing CPU monopolization
- CI/CD runner optimization
- Container orchestration platforms (OpenShift, Kubernetes)

Understanding scheduling helps maintain stability in high-load systems.

---

## ✅ Result

Process priority adjustment, scheduling monitoring, and real-time policy configuration successfully validated on Ubuntu 24.04.1 LTS.

⚙️ Linux Process Scheduling & Priority Management Verified
