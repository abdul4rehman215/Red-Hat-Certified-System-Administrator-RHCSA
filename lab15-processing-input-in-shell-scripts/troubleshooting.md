# 🛠️ Troubleshooting Guide - Lab 15: Processing Input in Shell Scripts (Ubuntu 24.04)

---

## 🔎 1️⃣ Script Fails with “Permission Denied”

### ❌ Problem
```
bash: ./input_script.sh: Permission denied
```

### 📌 Cause
Execute permission is missing.

### ✅ Solution
```
chmod +x input_script.sh
```

---

## 🔎 2️⃣ Script Fails When Directory Path Contains Spaces

### ❌ Problem
```
ls: cannot access My: No such file or directory
```

### 📌 Cause
Variable not quoted.

### ❌ Incorrect
```
ls -l $path
```

### ✅ Correct
```
ls -l "$path"
```

Always quote variables when handling paths.

---

## 🔎 3️⃣ “Unary operator expected” Error

### ❌ Problem
```
[: -eq: unary operator expected
```

### 📌 Cause
Empty variable in numeric comparison.

### ❌ Example
```
if [ $num -eq 5 ]
```

### ✅ Fix
```
if [ "$num" -eq 5 ]
```

Always quote variables in conditionals.

---

## 🔎 4️⃣ Invalid Directory Not Handled

### ❌ Problem
Script crashes when invalid path is given.

### 📌 Cause
Missing validation check.

### ✅ Proper Validation
```
if [ ! -d "$path" ]; then
  echo "Invalid directory" >&2
  exit 1
fi
```

---

## 🔎 5️⃣ Script Does Not Exit on Error

### 📌 Cause
`set -e` not enabled.

### ✅ Enable Strict Failure Mode
```
set -e
```

Optional stronger mode:
```
set -euo pipefail
```

---

## 🔎 6️⃣ Numeric Calculation Fails

### ❌ Problem
```
syntax error: operand expected
```

### 📌 Cause
Non-numeric input passed to arithmetic expansion.

### ✅ Recommended Improvement
Validate numeric input:

```
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
  echo "Invalid number" >&2
  exit 1
fi
```

---

## 🔎 7️⃣ Arguments Not Being Counted Correctly

### 📌 Cause
Incorrect use of `$@` or `$#`.

### ✅ Debug Tip
Add temporary debug line:
```
echo "Argument count: $#"
```

---

## 🔎 8️⃣ Script Works with Bash but Not with sh

### 📌 Cause
Using Bash-specific features.

### ✅ Always Include Shebang
```
#!/bin/bash
```

Run with:
```
./script.sh
```

---

# 🔐 Best Practices for Input Processing Scripts

✔ Always validate user input  
✔ Quote variables  
✔ Use proper exit codes  
✔ Send errors to stderr  
✔ Implement fallback logic  
✔ Enable strict mode in production  

---

# 🏁 Final Status

All input parsing, argument handling, and error management scenarios tested successfully.

🧾 Shell Input Processing & Validation Troubleshooting Verified
