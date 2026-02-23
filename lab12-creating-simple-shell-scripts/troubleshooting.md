# 🛠️ Troubleshooting Guide - Lab 12: Creating Simple Shell Scripts (Ubuntu 24.04)

---

## 🔎 1️⃣ Permission Denied When Running Script

### ❌ Problem

```
bash: ./hello_world.sh: Permission denied
```

### 📌 Cause

The script does not have execute permission.

### ✅ Solution

Grant execute permission:

```
chmod +x script_name.sh
```

---

## 🔎 2️⃣ Command Not Found Error

### ❌ Problem

```
./script.sh: command not found
```

### 📌 Possible Causes

- Typo in command
- Missing package
- Incorrect PATH variable
- Windows line endings (CRLF)

### ✅ Solutions

Check spelling and availability:

```
which command_name
```

Convert line endings if needed:

```
dos2unix script.sh
```

---

## 🔎 3️⃣ Bad Interpreter Error

### ❌ Problem

```
/bin/bash^M: bad interpreter: No such file or directory
```

### 📌 Cause

Script was created on Windows and contains CRLF line endings.

### ✅ Solution

Convert to Unix format:

```
dos2unix script.sh
```

---

## 🔎 4️⃣ Syntax Error in Conditional

### ❌ Problem

```
syntax error near unexpected token `then'
```

### 📌 Cause

Common mistakes:

- Missing spaces inside `[ ]`
- Missing `fi`
- Using `=` incorrectly

### ✅ Correct Format

```
if [ "$USER" == "root" ]; then
    echo "Running as root"
fi
```

Ensure:

- Space after `[` and before `]`
- Proper closing `fi`

---

## 🔎 5️⃣ Loop Not Executing Properly

### ❌ Problem

Loop outputs incorrect values or fails.

### 📌 Cause

- Incorrect brace expansion
- Running script with `sh` instead of `bash`

### ✅ Solution

Ensure:

```
#!/bin/bash
```

Run using:

```
./script.sh
```

or

```
bash script.sh
```

---

## 🔎 6️⃣ Script Runs but Variables Not Expanding

### ❌ Problem

Output shows literal text like:

```
$USER
```

### 📌 Cause

Single quotes used instead of double quotes.

### ❌ Incorrect

```
echo '$USER'
```

### ✅ Correct

```
echo "$USER"
```

---

## 🔎 7️⃣ Script Executes but Logic Incorrect

### Debugging Method

Use Bash trace mode:

```
bash -x script.sh
```

This displays each command before execution, helping identify logic flow errors.

---

## 🔎 8️⃣ Shebang Ignored or Unexpected Shell Behavior

### 📌 Cause

Script executed using:

```
sh script.sh
```

This may ignore Bash-specific syntax.

### ✅ Best Practice

Always:

```
./script.sh
```

And include:

```
#!/bin/bash
```

---

# 🔐 Best Practices for Reliable Shell Scripts

✔ Always include a shebang  
✔ Use `chmod +x` properly  
✔ Validate syntax before execution  
✔ Use double quotes for variables  
✔ Use `bash -x` for debugging  
✔ Avoid hardcoding sensitive values  

---

# 🏁 Final Status

All common execution, permission, and syntax issues identified and resolved.

🖥️ Shell Script Troubleshooting Verified
