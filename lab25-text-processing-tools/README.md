# 📝 Lab 25: Working with Text Processing Tools (grep, sed, awk)

> **RHCSA Focus:** This lab builds practical command-line text processing skills used daily for log review, config validation, and quick reporting.

---

## 📌 Lab Overview

In this lab, I practiced **three core Linux text-processing tools**:

- **grep** → pattern searching (logs, configs, user data)
- **sed** → stream editing (search/replace, delete/insert lines, in-place edits)
- **awk** → field-based processing + reporting (structured data like `/etc/passwd`-style files)
- **Pipelines** → combining them to solve real admin problems efficiently

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Search for patterns and text using **grep**
- Perform edits and transformations using **sed**
- Build basic reports using **awk**
- Combine tools via pipes to solve real-world administration scenarios
- Build muscle memory for RHCSA-style troubleshooting and log parsing

---

## ✅ Prerequisites

- Comfortable with Linux terminal navigation (`pwd`, `cd`, `ls`)
- Basic file editing / creation
- Familiar with I/O redirection (`>`, `>>`, `|`)
- Basic file permissions knowledge

---

## 🧪 Lab Tasks Performed

### ✅ Task 1: grep (Search & Filtering)
- Built sample files: `system.log`, `users.txt`, `config.conf`
- Ran:
  - exact match searches
  - case-insensitive searches (`-i`)
  - counts (`-c`)
  - line numbers (`-n`)
  - exclude matches (`-v`)
  - recursive search (`-r`)
  - extended regex (`-E`)
  - anchored patterns (`^`, `$`)

### ✅ Task 2: sed (Transform & Edit Streams)
- Printed line ranges (`-n '1,3p'`)
- Deleted lines (`2d`, `/^#/d`)
- Replaced text:
  - single replacement
  - global replacement (`g`)
- In-place edits (`-i`) with backup approach
- Inserted lines (`a`, `i`)
- Used regex-based replacements and extraction patterns

### ✅ Task 3: awk (Field Processing & Reporting)
- Parsed colon-separated data with `-F:`
- Used conditions (`$3 >= 1000`)
- Used `BEGIN/END`
- Counted records and matches
- Used built-ins: `NR`, `NF`, `length()`, `substr()`
- Created reusable awk report scripts:
  - `loganalysis.awk`
  - `usersummary.awk`

### ✅ Task 4: Combining Tools (Pipelines + Scripted Report)
- Built pipelines like:
  - grep → awk → sort → uniq
  - grep → sed → awk
- Built a full combined reporting script:
  - `textprocessor.sh`
- Performed a real-world mini-analysis using `access.log`

---

## 📂 Repository Structure

```text
lab25-text-processing-tools/
├── README.md
├── commands.sh
├── output.txt
└── scripts/
    ├── loganalysis.awk
    ├── usersummary.awk
    └── textprocessor.sh
````

---

## ▶️ How to Run (Quick)

```bash
# 1) Go to lab folder
cd lab-05-text-processing-tools/

# 2) Re-run commands manually (from commands_used.txt)
cat commands_used.txt

# 3) Run scripts (if you recreated the lab files)
chmod +x scripts/textprocessor.sh
./scripts/textprocessor.sh
```

> Note: This lab intentionally uses small datasets so outputs are clear and RHCSA-aligned.

---

## ✅ Results

* Successfully parsed ssh/http logs to identify:

  * successful and failed SSH login attempts
  * repeated attacker IPs
  * most requested pages and status codes
* Demonstrated safe config transformations with backup + in-place editing
* Generated structured summary output using awk scripts and pipelines

---

## 🌍 Why This Matters (Real-World Use)

These tools are essential for:

* **Log analysis** (auth failures, http errors, kernel events)
* **Config validation** and quick edits across files
* **Incident response triage** (filtering and summarizing suspicious events)
* **Automation** (reporting without needing full scripts or dashboards)

---

## ✅ Conclusion

This lab strengthened the core Linux skill of **extracting signal from text quickly**.
With `grep`, `sed`, and `awk`, I can efficiently search, transform, and summarize system data—skills that directly support **RHCSA exam tasks** and real production troubleshooting.
