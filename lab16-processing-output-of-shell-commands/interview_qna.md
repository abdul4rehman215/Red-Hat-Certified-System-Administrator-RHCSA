# 🎤 Interview Q&A - Lab 16: Processing Output of Shell Commands

---

## 1️⃣ What is command substitution in Bash?

Command substitution allows the output of a command to be used as a value inside a script.

There are two syntaxes:

- Backticks: `` `command` ``
- Preferred: `$(command)`

Example:

```bash
current_user=$(whoami)
```

---

## 2️⃣ Why is `$()` preferred over backticks?

- Easier to read
- Supports nesting
- Better quoting behavior
- Modern and recommended syntax

Example of nesting:

```bash
echo $(date +%Y-$(date +%m))
```

---

## 3️⃣ How do you store command output in a variable?

Using command substitution:

```bash
output=$(ls -l)
```

Always quote when printing:

```bash
echo "$output"
```

---

## 4️⃣ Why should multi-line output be quoted?

Without quotes:

- Word splitting occurs
- Formatting breaks
- Data integrity is lost

Correct:

```bash
echo "$disk_info"
```

---

## 5️⃣ How do you extract specific fields from command output?

Using tools like:

- `awk`
- `cut`
- `grep`
- `sed`

Example:

```bash
df -BG / | awk 'NR==2 {print $4}'
```

---

## 6️⃣ How do you perform calculations using captured output?

Example:

```bash
avail_space=$(df -BG / | awk 'NR==2 {print $4}' | tr -d 'G')
```

Then compare numerically:

```bash
if [ "$avail_space" -lt 5 ]; then
```

---

## 7️⃣ What is readarray in Bash?

`readarray` reads lines of input into an array.

Example:

```bash
readarray -t lines <<< "$data"
```

It is useful for handling structured multi-line output.

---

## 8️⃣ How would you monitor disk space in a production script?

Steps:

1. Capture `df` output
2. Extract available space
3. Convert to numeric value
4. Compare with threshold
5. Trigger alert if below limit

This lab demonstrates that workflow.

---

## 9️⃣ Why redirect errors using `2>/dev/null`?

To suppress unwanted error messages.

Example:

```bash
find /var/log -type f -size +1M 2>/dev/null
```

Used when scanning system directories without cluttering output.

---

## 🔟 What are real-world uses of command output processing?

- Health check scripts
- Log aggregation
- Disk monitoring
- User session tracking
- Container health verification
- CI/CD validation checks
- Infrastructure monitoring tools

---

## 🧠 Advanced Best Practices

- Quote all variables
- Use `set -euo pipefail` in production
- Validate numeric values before comparison
- Avoid unquoted variable expansion in commands
- Prefer structured parsing over fragile grep pipelines

---

## ✅ Interview Readiness Summary

This lab demonstrates:

- Strong understanding of command substitution
- Output filtering and transformation
- Data extraction using Unix utilities
- Safe numeric comparisons
- Automation-oriented scripting patterns
