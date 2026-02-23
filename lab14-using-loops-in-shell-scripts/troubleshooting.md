# 🛠️ Troubleshooting Guide - Lab 14: Using Loops in Shell Scripts (Ubuntu 24.04)

---

## 🔎 1️⃣ Permission Denied When Running Script

### ❌ Problem

```
bash: ./script.sh: Permission denied
```

### 📌 Cause

Script does not have execute permission.

### ✅ Solution

```
chmod +x script.sh
```

---

## 🔎 2️⃣ Infinite Loop Issue

### ❌ Problem

Script keeps running and does not stop.

Example:

```
while true; do
    echo "Running..."
done
```

### 📌 Cause

Loop condition never becomes false.

### ✅ Solutions

- Press `Ctrl + C` to stop execution.
- Add proper exit condition.
- Use `break` when required.

---

## 🔎 3️⃣ Loop Condition Not Working

### ❌ Problem

Loop does not execute or exits unexpectedly.

### 📌 Cause

Incorrect comparison operator or spacing.

Incorrect:

```
while[$count -le 5]
```

Correct:

```
while [ $count -le 5 ]
```

✔ Always maintain spaces inside `[ ]`.

---

## 🔎 4️⃣ Wildcard Not Expanding in for Loop

### ❌ Problem

```
for file in *.txt
```

Outputs literal `*.txt`.

### 📌 Cause

No matching `.txt` files exist.

### ✅ Solution

Ensure files exist before running loop:

```
ls *.txt
```

Or handle safely:

```
for file in *.txt; do
    [ -e "$file" ] || continue
done
```

---

## 🔎 5️⃣ Arithmetic Increment Not Working

### ❌ Problem

```
count++
```

Produces syntax error.

### 📌 Cause

Incorrect Bash arithmetic syntax.

### ✅ Correct Usage

```
((count++))
```

or

```
count=$((count+1))
```

---

## 🔎 6️⃣ break Not Exiting Loop

### 📌 Cause

`break` placed outside loop block.

### ✅ Correct Structure

```
for num in {1..10}; do
    if [ $num -eq 5 ]; then
        break
    fi
done
```

`break` must be inside the loop.

---

## 🔎 7️⃣ Script Fails with sh but Works with bash

### 📌 Cause

Using Bash-specific syntax (e.g., `{1..10}`, `((count++))`).

### ✅ Best Practice

Always include:

```
#!/bin/bash
```

Run with:

```
./script.sh
```

---

## 🔎 8️⃣ Syntax Check Without Execution

To validate syntax without running script:

```
bash -n script.sh
```

No output = syntax is valid.

---

# 🔐 Best Practices for Loop-Based Scripts

✔ Always validate loop conditions  
✔ Use proper spacing inside `[ ]`  
✔ Prevent infinite loops  
✔ Use `break` wisely  
✔ Quote variables when handling filenames  
✔ Test scripts with small datasets first  

---

# 🏁 Final Status

All loop execution, control flow, and arithmetic issues identified and resolved.

🔁 Bash Looping & Execution Control Troubleshooting Verified
