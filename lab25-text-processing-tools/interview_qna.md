# 🎯 Interview Q&A -  Lab 25: Working with Text Processing Tools (grep, sed, awk)

---

## 1️⃣ What is grep and when would you use it?

**Answer:**  
`grep` is a pattern-searching tool used to search text within files.  
It is commonly used for:

- Log analysis
- Searching configuration files
- Finding errors in application logs
- Filtering command output

Example:
```bash
grep "error" logfile.txt
````

---

## 2️⃣ What is the difference between `grep`, `egrep`, and `grep -E`?

**Answer:**

* `grep` → basic regular expressions
* `egrep` → extended regular expressions
* `grep -E` → same as `egrep` (modern preferred method)

Example:

```bash
grep -E "sshd|httpd" system.log
```

---

## 3️⃣ How do you search case-insensitively using grep?

**Answer:**

Use the `-i` option:

```bash
grep -i "failed" system.log
```

---

## 4️⃣ How do you count occurrences of a pattern using grep?

**Answer:**

Use the `-c` flag:

```bash
grep -c "httpd" system.log
```

---

## 5️⃣ What is sed and how is it different from grep?

**Answer:**

* `grep` → searches and filters text
* `sed` → edits and transforms text streams

`sed` can:

* Replace text
* Delete lines
* Insert lines
* Modify files in-place

Example:

```bash
sed 's/old/new/g' file.txt
```

---

## 6️⃣ How do you modify a file directly using sed?

**Answer:**

Use the `-i` option (in-place edit):

```bash
sed -i 's/Port 80/Port 8080/' config.conf
```

Best practice: Always create a backup first.

---

## 7️⃣ What is awk mainly used for?

**Answer:**

`awk` is used for:

* Field-based data processing
* Report generation
* Log parsing
* Structured data extraction (like `/etc/passwd`)

Example:

```bash
awk -F: '{print $1, $5}' users.txt
```

---

## 8️⃣ What does `-F:` mean in awk?

**Answer:**

It sets the field separator to colon `:`.

This is useful for parsing files like:

* `/etc/passwd`
* `/etc/group`

---

## 9️⃣ What are BEGIN and END blocks in awk?

**Answer:**

* `BEGIN` → runs before file processing starts
* `END` → runs after processing finishes

Example:

```bash
awk 'BEGIN {print "Start"} {print $1} END {print "Done"}' file.txt
```

---

## 🔟 How can you combine grep, sed, and awk together?

**Answer:**

Using pipes (`|`) to build powerful processing chains.

Example:

```bash
grep "Failed password" system.log | awk '{print $9, $11}' | sort | uniq -c
```

This:

* Filters failed logins
* Extracts username + IP
* Counts occurrences

---

## 1️⃣1️⃣ Why are these tools important for RHCSA?

**Answer:**

They are used for:

* Log troubleshooting
* Config editing
* User analysis
* System auditing
* Quick data extraction

RHCSA tasks often require:

* Editing files quickly
* Parsing logs
* Filtering output efficiently

---

## 1️⃣2️⃣ What is the safest approach before running sed -i?

**Answer:**

Always create a backup:

```bash
cp file.conf file.conf.backup
```

Never directly edit production files without testing.

---

## 1️⃣3️⃣ How would you detect repeated login failures?

**Answer:**

```bash
grep "Failed password" /var/log/secure | awk '{print $9}' | sort | uniq -c | sort -nr
```

This helps identify brute-force attempts.

---

## 1️⃣4️⃣ How do you print only lines that do NOT match a pattern?

**Answer:**

Use `-v` with grep:

```bash
grep -v "^#" config.conf
```

---

## 1️⃣5️⃣ What is the real power of Linux text processing tools?

**Answer:**

The power is not in individual commands,
but in combining them through pipelines to solve real-world problems efficiently.

They allow:

* Rapid log investigation
* Configuration automation
* Incident response triage
* On-the-fly reporting

---

# ✅ Summary for Interviews

If asked about text processing:

* Explain each tool clearly.
* Demonstrate understanding of regex.
* Show how to combine tools.
* Mention real-world usage (log analysis, auditing, troubleshooting).
* Emphasize safety and backups when editing files.
