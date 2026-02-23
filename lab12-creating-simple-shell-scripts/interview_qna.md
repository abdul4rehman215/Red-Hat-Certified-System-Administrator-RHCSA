# 🎤 Interview Q&A - Lab 12: Creating Simple Shell Scripts

---

### 1️⃣ What is a shell script?

A shell script is a plain text file containing a sequence of commands executed by a shell interpreter (e.g., Bash). It automates tasks that would otherwise be executed manually in the terminal.

---

### 2️⃣ What is the purpose of the shebang (#!) line?

The shebang line (e.g., `#!/bin/bash`) tells the system which interpreter should execute the script.  
Without it, the script may execute using a default shell, which can cause compatibility issues.

---

### 3️⃣ Why do we need `chmod +x` for scripts?

Scripts must have execute permission to be run directly (`./script.sh`).  
Without execute permission, the system returns:

```
Permission denied
```

---

### 4️⃣ What is the difference between running:

```
./script.sh
```

and

```
bash script.sh
```

- `./script.sh` → Requires execute permission and uses the interpreter defined in the shebang.
- `bash script.sh` → Explicitly runs the script using Bash, regardless of execute permission.

---

### 5️⃣ How do you declare and use variables in Bash?

Variables are declared without spaces:

```
name="value"
```

Access using:

```
$name
```

Variables are commonly used to store user input, configuration values, and command outputs.

---

### 6️⃣ How does an if statement work in Bash?

Basic syntax:

```
if [ condition ]; then
    commands
else
    commands
fi
```

It allows conditional execution of logic based on environment values, user identity, file existence, etc.

---

### 7️⃣ What is a for loop used for in shell scripting?

A `for` loop is used to repeat commands for a sequence of values.

Example:

```
for i in {1..5}; do
    echo $i
done
```

Used in automation tasks like iterating over files, users, or servers.

---

### 8️⃣ How do you debug a shell script?

Use trace mode:

```
bash -x script.sh
```

This prints each command before execution, helping identify logic or syntax errors.

---

### 9️⃣ What are common shell scripting errors?

- Missing execute permission
- Missing shebang line
- Incorrect variable syntax
- Unclosed conditionals (`fi` missing)
- Using `sh` for Bash-specific syntax

---

### 🔟 Where are shell scripts used in real-world environments?

- System startup automation
- DevOps CI/CD pipelines
- Log monitoring
- Backup scripts
- User management automation
- Security scanning workflows
- Container lifecycle automation

Shell scripting is foundational in Linux system administration, cloud operations, and container platforms like OpenShift.

---

## ✅ Interview Readiness Summary

This lab demonstrates:

- Script creation and execution
- Permission handling
- Variables and control flow
- Debugging practices
- Practical automation fundamentals
