# 🧾 Lab 15 – Processing Input in Shell Scripts

## 📌 Lab Overview

This lab focuses on handling input in Bash scripts using positional parameters, interactive prompts, and structured error handling.

It demonstrates how to build command-line utilities that behave dynamically based on user-provided arguments or runtime input.

---

## 🎯 Objectives

By completing this lab, I was able to:

- Use positional parameters ($1, $2, $@, $#)
- Accept interactive input using `read`
- Implement fallback logic (argument or prompt)
- Validate input safely
- Use exit codes and stderr redirection
- Apply `set -e` for controlled script termination

---

## 📋 Prerequisites

- Ubuntu 24.04.1 LTS
- Basic shell scripting knowledge
- Understanding of variables and conditionals
- nano or any text editor

---

## 🗂 Repository Structure

```
lab15-processing-input-in-shell-scripts/
│
├── README.md
├── commands.md
├── scripts/
│   ├── input_script.sh
│   └── double_number.sh
├── outputs.md
├── interview_qna.md
└── troubleshooting.md
```

---

## 🧠 Task Overview

### Task 1 – Using Positional Parameters
- Access command-line arguments
- Print argument count
- Display all provided parameters

### Task 2 – Parsing Interactive Input
- Use `read` to accept runtime input
- Implement argument fallback logic
- Dynamically process directories

### Task 3 – Graceful Error Handling
- Validate directory existence
- Handle invalid input safely
- Return proper exit codes
- Use `set -e` for automatic failure handling

---

## 🏁 What I Learned

- How CLI tools process arguments
- How to design interactive fallback behavior
- How to validate input securely
- How to return meaningful exit codes
- How to build resilient automation scripts

---

## 🌍 Real-World Relevance

Input handling is critical in:

- Automation tools
- DevOps utilities
- Deployment scripts
- Backup systems
- CI/CD pipelines
- Infrastructure provisioning scripts

Every production-grade Bash tool must handle input safely and predictably.

---

## 🚀 Result

Shell input processing and error handling mechanisms implemented successfully in Ubuntu 24.04 environment.

---

✅ Lab Completed  
🧾 Input Processing & Script Validation Verified
