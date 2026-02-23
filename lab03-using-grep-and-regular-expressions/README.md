# 🔎 Lab 03 – Using grep and Regular Expressions (RHCSA Series)

# 🎯 Objectives

By completing this lab, I was able to:

- Use `grep` to search for specific patterns in files.
- Apply basic regular expressions.
- Use extended regular expressions with `-E`.
- Filter and analyze system log files.
- Extract structured data using regex anchors and quantifiers.
- Refine search results using common `grep` options.

These skills are essential for Linux system administration, log analysis, and RHCSA exam readiness.

---

# 📋 Prerequisites

- Linux-based system
- Terminal access
- Basic command-line familiarity
- Access to system logs
- Basic understanding of text files

---

---

## 📁 Repository Structure

```

lab03-using-grep-and-regular-expressions/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md

````

---

## 🖥 Lab Environment

| Component | Details |
|-----------|----------|
| OS | Ubuntu 24.04.1 LTS |
| Platform | Cloud Lab (EC2-based environment) |
| User | toor |
| Tool Used | grep (GNU grep) |

---


# 🧩 Task Overview

This lab was divided into three major sections:

1. Basic `grep` usage
2. Regular expressions with `grep`
3. Searching and filtering system log files

Each section progressively built toward practical log analysis skills required in enterprise Linux environments.

---

# 🧩 Task 1 – Basic grep Usage

## 🔹 Creating a Sample File

Created a test file containing multiple fruit names for pattern testing.

```bash
echo -e "apple\nbanana\ncherry\ndate\nelderberry\nfig\ngrape" > sample.txt
````

Verified content using:

```bash
cat sample.txt
```

---

## 🔹 Simple Text Search

```bash
grep "banana" sample.txt
```

This confirmed direct string matching.

---

## 🔹 Case-Insensitive Search

```bash
grep -i "Apple" sample.txt
```

Key concept:

* `-i` ignores case differences.

---

## 🔹 Count Matching Lines

```bash
grep -c "a" sample.txt
```

Confirmed:

* `-c` counts matching lines.
* Useful for quick log statistics.

---

# 🧪 Task 2 – Regular Expressions with grep

## 🔹 Anchors

### Lines starting with a specific character:

```bash
grep "^a" sample.txt
```

* `^` anchors to beginning of line.

### Lines ending with a specific character:

```bash
grep "e$" sample.txt
```

* `$` anchors to end of line.

---

## 🔹 Character Classes

```bash
grep "[aeiou]p" sample.txt
```

* `[aeiou]` matches any vowel.
* Used for flexible pattern matching.

---

## 🔹 Quantifiers (Extended Regex)

```bash
grep -E "[aeiou]{2,}" sample.txt
```

Key concepts:

* `-E` enables extended regex.
* `{2,}` matches two or more occurrences.

---

# 📜 Task 3 – Searching Log Files

## 🔹 Filtering Error Messages

Copied system log:

```bash
sudo cp /var/log/syslog /tmp/syslog_sample
```

Searched for errors:

```bash
grep -i "error" /tmp/syslog_sample
```

Used for identifying:

* Service failures
* Kernel audit denials
* Systemd unit failures

---

## 🔹 Extracting Timestamps Using Regex

```bash
grep -E "^[A-Za-z]{3} [0-9]{2}" /tmp/syslog_sample
```

Regex Breakdown:

* `^` → Beginning of line
* `[A-Za-z]{3}` → Three-letter month
* `[0-9]{2}` → Two-digit day
* Anchored pattern ensures structured match

This technique is widely used in log parsing and SIEM preprocessing.

---

# 🧠 What I Learned

* How to use `grep` for precise pattern matching.
* Difference between basic and extended regex.
* Importance of anchors (`^`, `$`) in structured data.
* How to use character classes for flexible searches.
* Using quantifiers to match repeated patterns.
* Filtering real system logs for operational insights.
* Counting and extracting structured log entries.

---

# 🌍 Real-World Relevance

These grep and regex techniques are critical for:

* Log analysis
* Security monitoring
* Incident response
* SIEM rule creation
* DevOps debugging
* Red Hat/OpenShift environments
* Performance troubleshooting

System administrators constantly rely on `grep` for log triage and diagnostics.

---

# 📌 Why This Matters

In RHCSA and enterprise environments:

* Servers produce large log files.
* Rapid filtering is required.
* Regex enables precise data extraction.
* Automation scripts depend heavily on pattern matching.

Without strong regex skills, log analysis becomes inefficient.

---

# 🏁 Result

✔ Basic pattern matching completed
✔ Case-insensitive filtering verified
✔ Line counting performed
✔ Extended regex implemented
✔ Log filtering executed successfully
✔ Structured timestamp extraction demonstrated

Lab 03 completed successfully as part of RHCSA preparation.
