# 🛠️ Troubleshooting Guide - Lab 16: Processing Output of Shell Commands (Ubuntu 24.04)

---

## 🔎 1️⃣ Output Formatting Broken

### ❌ Problem
Multi-line output prints in one line or formatting is lost.

### 📌 Cause
Variable not quoted.

### ❌ Incorrect
```
echo $disk_info
```

### ✅ Correct
```
echo "$disk_info"
```

Always quote variables containing command output.

---

## 🔎 2️⃣ Numeric Comparison Fails

### ❌ Problem
```
[: 20G: integer expression expected
```

### 📌 Cause
Unit suffix (G) not removed before numeric comparison.

### ✅ Fix
```
avail_space=$(df -BG / | awk 'NR==2 {print $4}' | tr -d 'G')
```

Remove non-numeric characters before comparison.

---

## 🔎 3️⃣ Script Fails Due to Spaces in Filenames

### ❌ Problem
```
du: cannot access '/var/log/sys log': No such file
```

### 📌 Cause
Unquoted variable expansion.

### ❌ Incorrect
```
du -ch $large_files
```

### ✅ Better Practice
Use safe loop handling:

```
while IFS= read -r file; do
  du -h "$file"
done <<< "$large_files"
```

Avoid unquoted multi-value expansions.

---

## 🔎 4️⃣ Array Not Populating

### ❌ Problem
Array loop prints nothing.

### 📌 Cause
Empty capture variable.

### ✅ Debug
```
echo "$ip_lines"
```

Ensure command actually returns data.

---

## 🔎 5️⃣ Command Substitution Not Working

### ❌ Problem
Backticks behave unexpectedly.

### 📌 Cause
Nested backticks or quoting confusion.

### ✅ Solution
Use modern syntax:
```
$(command)
```

---

## 🔎 6️⃣ Permission Denied When Executing Script

### ❌ Problem
```
./script.sh: Permission denied
```

### ✅ Fix
```
chmod +x script.sh
```

---

## 🔎 7️⃣ Script Crashes on Empty Output

### ❌ Problem
Numeric comparison on empty variable.

### 📌 Example
```
if [ "$count" -gt 0 ]
```

If `$count` is empty → error.

### ✅ Safe Guard
```
count=${count:-0}
```

Provides default value.

---

## 🔎 8️⃣ Too Many Processes Counted

### 📌 Cause
Header line included in `wc -l`.

### ✅ Fix
Exclude header:

```
ps aux | tail -n +2 | wc -l
```

---

# 🔐 Best Practices for Output Processing

✔ Always quote variables  
✔ Strip non-numeric characters before math  
✔ Use modern `$()` substitution  
✔ Validate values before comparisons  
✔ Avoid unsafe unquoted expansions  
✔ Test scripts in controlled environment  

---

# 🏁 Final Status

All command substitution, filtering, parsing, and automation scenarios verified successfully.

📊 Shell Output Processing Troubleshooting Verified
