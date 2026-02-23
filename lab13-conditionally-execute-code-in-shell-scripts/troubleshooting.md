# 🛠️ Troubleshooting Guide - Lab 13: Conditional Execution in Shell Scripts (Ubuntu 24.04)

---

## 🔎 1️⃣ Error: `[: missing ]`

### ❌ Problem

```
./script.sh: line 4: [: missing `]'
```

### 📌 Cause

Improper spacing inside condition brackets.

### ❌ Incorrect

```
if [$num -gt 10]; then
```

### ✅ Correct

```
if [ $num -gt 10 ]; then
```

✔ Always include spaces after `[` and before `]`.

---

## 🔎 2️⃣ Error: `unary operator expected`

### ❌ Problem

```
[: -gt: unary operator expected
```

### 📌 Cause

Variable is empty and not quoted.

Example:

```
if [ $num -gt 10 ]
```

If `$num` is empty → syntax error.

### ✅ Solution

Quote variables when appropriate:

```
if [ "$num" -gt 10 ]
```

Or validate input before comparison.

---

## 🔎 3️⃣ Numeric Comparison Fails

### ❌ Problem

```
integer expression expected
```

### 📌 Cause

User entered a non-numeric value for numeric comparison.

### ✅ Solution

Add input validation:

```
if [[ "$num" =~ ^[0-9]+$ ]]; then
```

Always validate numeric input in production scripts.

---

## 🔎 4️⃣ String Comparison Not Working

### ❌ Problem

Script behaves unexpectedly when comparing strings.

### 📌 Cause

Using `=` without quotes:

```
if [ $answer = yes ]
```

If variable is empty → syntax error.

### ✅ Correct Format

```
if [ "$answer" = "yes" ]
```

✔ Always quote string variables.

---

## 🔎 5️⃣ File Check Always Returns False

### ❌ Problem

File existence check fails even though file exists.

### 📌 Cause

Incorrect path or typo.

### ✅ Solution

Verify path:

```
ls -l /etc/passwd
```

Then use:

```
if [ -f "/etc/passwd" ]
```

Use absolute paths in production scripts.

---

## 🔎 6️⃣ Script Works with bash But Fails with sh

### 📌 Cause

`sh` may not support certain Bash features.

Example:

```
sh script.sh
```

May ignore Bash-specific syntax.

### ✅ Best Practice

Include:

```
#!/bin/bash
```

Run with:

```
./script.sh
```

---

## 🔎 7️⃣ Logic Executes Wrong Branch

### 📌 Cause

Using wrong comparison operator:

- `-eq` → numeric
- `=` → string

Using numeric operator on strings causes errors.

### ✅ Fix

Use correct operator based on data type.

---

## 🔎 8️⃣ Input Causes Script Crash

### 📌 Cause

No input validation implemented.

### ✅ Best Practice

Always validate user input before comparison:

- Check if empty
- Check if numeric (for arithmetic operations)
- Provide default handling

---

# 🔐 Best Practices for Conditional Logic

✔ Always quote variables  
✔ Always include proper spacing in `[ ]`  
✔ Validate numeric input before comparison  
✔ Use absolute file paths  
✔ Use meaningful echo messages  
✔ Keep conditionals readable and properly indented  

---

# 🏁 Final Status

All common conditional syntax, spacing, and input-related issues identified and resolved.

🧠 Conditional Shell Logic Troubleshooting Verified
