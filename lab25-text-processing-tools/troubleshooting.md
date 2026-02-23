# 🛠 Troubleshooting Guide - Lab 05: Working with grep, sed, awk

---

## 🔎 1️⃣ grep Issues

### ❌ Problem: grep returns no results (but you expect matches)

**Possible Causes:**
- Case mismatch
- Wrong file path
- Incorrect pattern
- Regex misinterpretation

**Solutions:**

```bash
# Use case-insensitive search
grep -i "error" logfile.txt

# Verify file exists
ls -l logfile.txt

# Test simple pattern first
grep "error" logfile.txt
````

---

### ❌ Problem: Special characters not matching properly

**Cause:** Regex characters like `.`, `*`, `[`, `]` need escaping.

**Example:**

```bash
# Wrong (dot matches any character)
grep "192.168.1.1" file.txt

# Correct
grep "192\.168\.1\.1" file.txt
```

---

### ❌ Problem: Recursive search not working

**Solution:**

```bash
grep -r "Failed" /var/log
```

Make sure:

* You have read permissions
* You're searching the correct directory

---

## ✏️ 2️⃣ sed Issues

### ❌ Problem: sed changes not saved

**Cause:** Missing `-i` flag.

**Solution:**

```bash
sed -i 's/old/new/g' file.txt
```

---

### ❌ Problem: sed broke configuration file

**Cause:** In-place editing without backup.

**Best Practice:**

```bash
cp config.conf config.conf.backup
sed -i 's/Port 80/Port 8080/' config.conf
```

---

### ❌ Problem: Pattern replaced only once

**Cause:** Missing `g` flag (global).

**Solution:**

```bash
# Replace all occurrences
sed 's/foo/bar/g' file.txt
```

---

### ❌ Problem: sed deletes too many lines

If using:

```bash
sed '/pattern/d' file.txt
```

Verify the pattern carefully before running with `-i`.

Test first without `-i`.

---

## 📊 3️⃣ awk Issues

### ❌ Problem: Fields not splitting correctly

**Cause:** Wrong field separator.

Default separator = whitespace.

**Solution:**

```bash
awk -F: '{print $1}' users.txt
```

---

### ❌ Problem: Condition not working

Check:

* Correct field number
* Proper comparison operator
* Quotes around string comparisons

```bash
awk -F: '$7 == "/bin/bash"' users.txt
```

---

### ❌ Problem: awk returns entire line instead of field

This happens if `-F` is missing and fields are not whitespace-separated.

Fix:

```bash
awk -F: '{print $1}' users.txt
```

---

## 🔗 4️⃣ Pipeline Troubleshooting

### ❌ Problem: Output not what you expect in chained commands

**Debugging Strategy:**

Break pipeline into parts:

```bash
grep "Failed" system.log
```

Then:

```bash
grep "Failed" system.log | awk '{print $9}'
```

Then:

```bash
grep "Failed" system.log | awk '{print $9}' | sort
```

Build step by step.

---

### ❌ Problem: Wrong field numbers in awk after grep

Sometimes log format changes.

Use:

```bash
awk '{print NF, $0}' file.log
```

To inspect number of fields.

---

## 🔐 5️⃣ Permission Issues

### ❌ Problem: Permission denied when searching logs

System logs often require root:

```bash
sudo grep "error" /var/log/secure
```

---

## ⚠️ 6️⃣ Regex Mistakes

### Common Errors:

| Mistake                               | Why It Fails          |                         |
| ------------------------------------- | --------------------- | ----------------------- |
| `*` without preceding character       | Invalid regex         |                         |
| `.` not escaped                       | Matches any character |                         |
| Forgetting quotes                     | Shell expands pattern |                         |
| Using basic regex instead of extended | `                     | `won’t work without`-E` |

Correct usage:

```bash
grep -E "error|fail" file.txt
```

---

## 🧠 7️⃣ Best Debugging Approach

1. Test on small sample file first
2. Avoid `sed -i` until confirmed
3. Break pipelines into stages
4. Use `head` and `tail` on large logs
5. Print intermediate output
6. Always backup config files

---

## 🚨 8️⃣ Real-World Production Safety Rules

* Never edit production config without backup
* Avoid blind global replacements
* Validate file after modification
* Log changes if modifying system configs
* Test regex before applying recursively

---

# ✅ Final Reminder

Text processing tools are powerful but dangerous if misused.

✔ Always test first
✔ Always backup
✔ Build pipelines step by step
✔ Verify outputs carefully

Mastering troubleshooting for grep, sed, and awk makes you significantly stronger in:

* Incident response
* Log forensics
* Configuration management
* RHCSA exam performance
