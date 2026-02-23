# 🧠 Lab 13: Conditionally Execute Code in Shell Scripts

## 📌 Lab Overview

This lab focuses on implementing conditional logic in Bash shell scripts.  
It demonstrates how decision-making structures such as `if`, `elif`, and `else` enable scripts to behave dynamically based on user input, file state, and evaluated conditions.

Conditional execution is essential for building intelligent automation workflows in Linux environments.

---

## 🎯 Objectives

By completing this lab, I was able to:

- Use `if`, `elif`, and `else` statements for conditional execution
- Perform numeric comparisons in Bash
- Implement string comparison logic
- Perform file existence checks
- Use conditional expressions with `[ ]` and `test`
- Apply proper syntax to avoid common scripting errors

---

## 📋 Prerequisites

- Linux-based system (Ubuntu 24.04 used here)
- Basic shell scripting knowledge
- Understanding of variables and script execution
- Text editor (nano used in this lab)

---

**Environment:** Ubuntu 24.04.1 LTS  
**User:** toor  
**Hostname:** ip-172-31-10-268  

---

## 📂 Repository Structure

```
lab13-conditionally-execute-code-in-shell-scripts/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── scripts/
    ├── basic_if.sh
    ├── if_elif_else.sh
    ├── file_check.sh
    ├── string_compare.sh
    └── test_command.sh
```

---

## 🧩 Task Overview

### Task 1: Conditional Execution Using if, elif, else
- Implemented basic `if` statements
- Expanded logic using `elif` and `else`
- Performed numeric comparisons based on user input

### Task 2: Performing Tests
- Checked file existence using `-f`
- Compared string values using conditional expressions
- Handled multiple input cases

### Task 3: Using `test` vs `[ ]`
- Implemented conditionals using the `test` command
- Rewrote logic using `[ ]` syntax
- Observed identical functional behavior
- Applied best-practice syntax formatting

---

## 🧠 What I Learned

- Conditional statements allow dynamic script behavior
- Numeric comparisons require operators like `-gt`, `-eq`, `-lt`
- String comparisons require proper quoting
- File checks improve script reliability
- `[ ]` is a preferred and readable alternative to `test`
- Proper spacing inside conditional brackets is critical

---

## 🌍 Why This Matters

Conditional execution is foundational for:

- System health monitoring scripts
- Input validation in automation
- Backup verification scripts
- Deployment decision logic
- Security enforcement scripts

Without conditionals, automation cannot adapt to runtime conditions.

---

## 🏢 Real-World Relevance

In enterprise Linux environments, conditionals are used to:

- Validate user input before execution
- Ensure required files exist before processing
- Prevent unsafe operations
- Trigger alerts based on thresholds
- Control deployment flows in CI/CD pipelines
- Implement decision logic in container orchestration scripts

Conditional logic transforms static scripts into intelligent automation tools.

---

## 🏁 Result

Conditional logic successfully implemented and tested in Ubuntu 24.04 EC2 environment.

✔ Numeric comparisons  
✔ String comparisons  
✔ File existence checks  
✔ `test` and `[ ]` syntax  
✔ Multi-branch decision logic  

---

## ✅ Lab Completed Successfully

🧠 Conditional Shell Scripting Verified
