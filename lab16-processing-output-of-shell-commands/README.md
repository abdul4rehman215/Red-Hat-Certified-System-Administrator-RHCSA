# 🖥️ Lab 16 – Processing Output of Shell Commands in Scripts

## 📌 Lab Overview

This lab focuses on capturing, storing, and processing command output inside Bash scripts.

It demonstrates how system data can be extracted, filtered, transformed, and used in logic and calculations — forming the foundation of monitoring and automation scripts.

---

## 🎯 Objectives

By completing this lab, I was able to:

- Capture command output using backticks and `$()`
- Store command results in variables
- Process multi-line output safely
- Use filtered output in calculations
- Apply output parsing for automation tasks

---

## 📋 Prerequisites

- Ubuntu 24.04.1 LTS
- Bash 4+
- Basic knowledge of variables, loops, and conditionals
- Familiarity with commands like `ps`, `df`, `who`, `awk`, `grep`

---

## 🗂 Repository Structure

```
lab16-processing-output-of-shell-commands/
│
├── README.md
├── commands.md
├── scripts/
│   ├── backtick_example.sh
│   ├── dollar_parenthesis.sh
│   ├── system_info.sh
│   ├── multi_line.sh
│   ├── process_users.sh
│   ├── disk_check.sh
│   ├── array_ips.sh
│   └── large_logs.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🧠 Task Overview

### Task 1 – Capturing Command Output
- Use backticks (` `)
- Use `$()` (preferred syntax)
- Store output in variables

### Task 2 – Processing Multi-line Data
- Preserve formatting with quoting
- Filter output using `grep`
- Extract values using `awk`

### Task 3 – Using Output in Logic
- Perform numeric comparisons
- Convert units for calculation
- Count dynamic results

### Task 4 – Real-World Automation
- Monitor disk space
- Detect large log files
- Process active users
- Extract IP address data

---

## 🏁 What I Learned

- Command substitution techniques
- Output parsing strategies
- Safe variable quoting
- Output filtering and transformation
- Real-world monitoring script patterns

---

## 🌍 Real-World Relevance

Processing command output is essential in:

- Infrastructure monitoring
- Log analysis systems
- Automated reporting
- DevOps pipelines
- Health check scripts
- Cloud instance management

Nearly every production automation script relies on command substitution and output parsing.

---

## 🚀 Result

Shell command output successfully captured, processed, and applied in conditional logic and system monitoring scripts.

---

✅ Lab Completed  
📊 Shell Output Processing & Automation Verified
