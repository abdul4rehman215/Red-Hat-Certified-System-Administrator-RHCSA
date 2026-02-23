# 🔁 Lab 02 – Using Input-Output Redirection 

# 🎯 Objectives

By completing this lab, I was able to:

* Implement output redirection using `>` and `>>`
* Use pipes (`|`) to chain commands efficiently
* Redirect standard error using `2>`
* Combine stdout and stderr using `&>`
* Use `/dev/null` to discard output
* Build structured system and container reports using grouped commands
* Perform verification using compound command execution

These redirection techniques are critical for RHCSA certification and real-world Linux system administration.

---

# 📋 Prerequisites

* Linux-based system
* Terminal access
* Basic CLI familiarity
* Podman installed (for container-based examples)
* GNU core utilities available

---

---

## 📁 Repository Structure

```

lab02-using-input-output-redirection/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md

````

---

## 🖥 Lab Environment

| Component | Details |
|------------|----------|
| OS | Ubuntu 24.04.1 LTS |
| Platform | Cloud Lab (EC2-based environment) |
| User | toor |
| Kernel | Linux 6.8.0-31-generic |
| Container Runtime | Podman 4.9.3 |

### 🔍 Environment Verification

```bash
uname -a
podman --version
````

---

# 🧩 Task Overview

This lab was divided into four major sections:

1. Output Redirection
2. Command Piping
3. Error Redirection
4. Complex Combined Operations

Each section built progressively toward advanced shell-level command orchestration.

---

# 🔁 Task 1 – Output Redirection

## 🔹 Basic Output Redirection (`>`)

Performed:

* Created file using `>`
* Verified content using `cat`
* Overwrote file intentionally

Key concept confirmed:

`>` creates or overwrites a file.

---

## 🔹 Append Output (`>>`)

Performed:

* Appended single line
* Appended multiple lines
* Verified cumulative content

Key concept confirmed:

`>>` preserves existing content and appends new output.

---

# 🔗 Task 2 – Using Pipes (`|`)

## 🔹 Basic Pipe Usage

Executed:

* Filtered file using `grep`
* Counted lines using `wc -l`
* Counted podman-related processes

Verified:

* Pipe sends stdout of first command as stdin to next command
* Enables efficient command chaining
* Helps with filtering and analytics

---

## 🔹 Advanced Pipe Operations

Executed:

* Sorted file output
* Created sorted file using redirection
* Filtered Podman image listing

Confirmed:

* Pipe combined with redirection creates processed output files
* Useful for log filtering and report generation

---

# ⚠️ Task 3 – Error Redirection

## 🔹 Redirect Standard Error (`2>`)

Generated deliberate error:

```
ls /nonexistent 2> error.log
```

Verified:

* Error suppressed from terminal
* Stored in file

---

## 🔹 Separate stdout and stderr

```
ls /nonexistent /etc/passwd > output.log 2> error.log
```

Confirmed:

* Valid output saved separately
* Error saved independently

---

## 🔹 Combine stdout and stderr (`&>`)

```
ls /nonexistent /etc/passwd &> combined.log
```

Confirmed:

* Both error and output redirected into single file

---

## 🔹 Discard Errors (`/dev/null`)

```
ls /nonexistent 2> /dev/null
```

Confirmed:

* Error suppressed completely
* No log file generated

---

## 🔹 Container Error Handling

Executed Podman container with intentional failure:

```
podman run --name testcontainer alpine /bin/false 2> container_error.log
```

Captured:

* Exit code 1
* Container failure message
* Error stored for auditing

---

# 🧪 Task 4 – Combined Operations

## 🔹 Complex Redirection

Executed grouped command:

```
(ls /etc/passwd /nonexistent | wc -l > success.log) 2> fail.log
```

Validated:

* Successful count written to success.log
* Errors written to fail.log
* Controlled separation of data streams

---

## 🔹 Practical System Report

Generated structured system report using grouped commands:

```
{
  echo "=== System Report ==="
  date
  echo "=== Memory ==="
  free -h
  echo "=== Disk Usage ==="
  df -h
} > system_report.txt 2> system_errors.log
```

Verified:

* Organized output formatting
* Clean separation of report and errors

---

## 🔹 Container Report Generation

Grouped container operations:

```
{
  echo "=== Container Images ==="
  podman images
  echo "=== Running Containers ==="
  podman ps
} > container_report.txt 2> container_errors.log
```

Confirmed:

* Structured output
* Container audit capability

---

## 🔹 Final Verification Command

Executed compound verification:

```
(echo "Lab Verification"; ls /etc/passwd | wc -l; podman images 2>/dev/null | wc -l) > verification.txt
```

Validated:

* Multi-command execution
* Combined output stored
* Errors discarded safely

---

# 🧠 What I Learned

* How stdout and stderr are separate streams
* Proper use of `>` vs `>>`
* Practical use of pipes in command chaining
* Importance of `2>` for error logging
* Use of `&>` for unified logging
* `/dev/null` as a discard mechanism
* Grouped commands for structured reporting
* Real-world container log handling using Podman

---

# 🌍 Real-World Relevance

These techniques are critical in:

* RHCSA certification exams
* OpenShift environments
* Container troubleshooting
* System logging and auditing
* Shell scripting automation
* DevOps CI/CD pipelines
* Production server monitoring

---

# 📌 Why This Matters

Understanding redirection is foundational for:

* Writing production-grade shell scripts
* Capturing logs during automation
* Debugging container failures
* Managing system diagnostics
* Implementing enterprise logging policies

Without mastering redirection, advanced Linux administration becomes inefficient and error-prone.

---

# 🏁 Result

✔ Output redirection implemented
✔ Append operations verified
✔ Pipes successfully chained
✔ Error handling mastered
✔ Combined operations executed
✔ Structured reporting generated

Lab 02 completed successfully as part of RHCSA preparation.
