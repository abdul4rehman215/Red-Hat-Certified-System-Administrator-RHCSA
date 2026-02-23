# 🎤 Interview Q&A - Lab 15: Processing Input in Shell Scripts

---

## 1️⃣ What are positional parameters in Bash?

Positional parameters are variables that store command-line arguments passed to a script.

- `$1`, `$2`, ... → Individual arguments
- `$@` → All arguments
- `$#` → Total number of arguments

Example:

```bash
./script.sh apple banana
```

- `$1 = apple`
- `$2 = banana`

---

## 2️⃣ What is the difference between `$@` and `$*`?

- `$@` → Expands each argument separately (recommended)
- `$*` → Treats all arguments as a single string

Best practice: Use `"$@"` when forwarding arguments.

---

## 3️⃣ How do you read interactive input in Bash?

Using the `read` command:

```bash
read -p "Enter name: " name
```

- `-p` displays a prompt
- Input is stored in a variable

---

## 4️⃣ How do you check if no arguments were passed?

Using `$#`:

```bash
if [ $# -eq 0 ]; then
    echo "No arguments provided."
fi
```

---

## 5️⃣ How do you check if a directory exists?

Using `-d` test operator:

```bash
if [ -d "$path" ]; then
    echo "Valid directory"
fi
```

---

## 6️⃣ Why should variables be quoted in Bash?

To prevent:

- Word splitting
- Glob expansion
- Errors with spaces in filenames

Correct:

```bash
ls -l "$path"
```

---

## 7️⃣ How do you send error messages to stderr?

Using redirection:

```bash
echo "Error message" >&2
```

This separates normal output from error output.

---

## 8️⃣ What does `exit 1` mean?

- `exit 0` → Success
- `exit 1` (or any non-zero) → Failure

Exit codes are critical for automation and CI/CD pipelines.

---

## 9️⃣ What does `set -e` do?

It forces the script to exit immediately if any command fails.

Used in production scripts to prevent cascading failures.

---

## 🔟 How would you improve input validation in production?

- Use `getopts` for option parsing
- Validate numeric input using regex
- Use `set -u` to detect undefined variables
- Combine `set -euo pipefail` for strict mode
- Provide clear error messages

---

## 🧠 Real-World Application

Input processing is used in:

- Deployment scripts
- Backup utilities
- CLI tools
- Automation frameworks
- DevOps pipelines
- Infrastructure-as-Code wrappers

Robust input validation is critical for production-grade Bash utilities.

---

## ✅ Interview Readiness Summary

This lab demonstrates:

- Understanding of CLI argument handling
- Interactive input processing
- Defensive scripting practices
- Exit code management
- Production-level error handling techniques
