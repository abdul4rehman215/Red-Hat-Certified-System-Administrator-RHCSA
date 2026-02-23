# 🧪 Lab 34: Archiving and Compressing Files (tar, gzip, bzip2)

> **Environment:** Linux Cloud Lab  
> **User:** `toor` (sudo access)  
> **Prompt Style:** `toor@ip-172-31-10-219:~$`

---

## 📌 Lab Overview

This lab focuses on **backup-friendly file packaging and compression** using standard Linux tools:

- `tar` for creating/extracting archives
- `gzip` for fast compression
- `bzip2` for higher compression ratio
- `tar + gzip/bzip2` for real-world backup workflows
- Integrity testing (`gzip -t`, `bzip2 -t`, `tar -t`) and **restore verification** (checksum compare)

> ✅ Core sysadmin skill: creating reliable backups, moving data safely, and verifying restores.

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Create and extract archives using the `tar` command
- Compress and decompress files using `gzip`
- Compress and decompress files using `bzip2`
- Combine `tar` with compression tools for efficient file management
- Test and verify the integrity of archived data
- Understand differences between compression methods
- Restore archived data and verify backup integrity

---

## ✅ Prerequisites

- Basic Linux navigation: `pwd`, `ls`, `cd`
- File operations: `mkdir`, `cp`, `mv`, `rm`
- Permissions and ownership basics
- Working in a terminal-based Linux environment

---

## 🧰 Lab Setup Summary

Key setup steps performed:

- Verified tool availability:
  - `tar`, `gzip`, `bzip2`
- Created a dedicated lab workspace:
  - `~/lab14-archive`
- Built a sample directory structure to simulate real backup targets:
  - `documents/`, `data/`, nested `reports/`, `logs/`, `backups/`

---

## 🧩 Tasks Performed

### ✅ Task 1: Create Archives with `tar`

- Created sample directories/files for archiving practice
- Created archives:
  - Full directory archive: `documents_archive.tar`
  - Verbose archive: `data_archive.tar`
  - Specific files archive: `selected_files.tar`
- Verified archive contents without extraction (`tar -tf`)
- Extracted archives into controlled test directories
- Practiced advanced tar operations:
  - Preserve permissions (`-p`)
  - Exclude patterns (`--exclude`)
  - Absolute paths (`-P`) and observed tar warning behavior
  - Append files to existing archives (`-r`)

---

### ✅ Task 2: Compress & Decompress Using `gzip` and `bzip2`

- Created a test “large” file using `dd` to measure compression results
- Compressed using:
  - `gzip` (default + level tuning `-1`, `-9`)
  - `bzip2` (via `bzip2 -c`)
- Compared compression ratios and file sizes
- Restored and validated decompressed content (`diff`)

---

### ✅ Task 3: Verify Backup Integrity & Restoration

- Generated baseline checksums (`md5sum`) for original data
- Created compressed tar backups:
  - `complete_backup.tar.gz`
  - `complete_backup.tar.bz2`
- Tested integrity:
  - `gzip -t`
  - `bzip2 -t`
  - `tar -tzf`, `tar -tjf`
- Performed full restore tests into clean directories
- Verified restore accuracy by comparing checksums (`diff`)
- Performed selective restores:
  - Single files
  - Specific directories
  - Wildcard/pattern restores (`--wildcards`)
- Built a reusable archive validation script:
  - `verify_archive.sh`
- Generated a small archive report:
  - `archive_report.txt`

---

## 📂 Repository Structure

```text
lab34-archiving-compressing-files/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── scripts/
    └── verify_archive.sh
````

> Notes:
>
> * `commands.sh` contains only the commands executed (in order).
> * `output.txt` contains all terminal outputs captured for this lab.
> * Scripts created during the lab go in `scripts/`.

---

## ✅ Results

* Successfully created multiple archive types using `tar`
* Demonstrated compression differences between `gzip` and `bzip2`
* Verified archive integrity using built-in test mechanisms
* Proved restore reliability using checksum comparison (backup validation)
* Produced a reusable verification script for future admin workflows

---

## 🌍 Why This Matters (Real-World Admin Use)

Archiving and compression are foundational for:

* **Backups and disaster recovery**
* **Log and data retention**
* **Safe data migration**
* **Storage optimization**
* **Reliable restore verification (integrity testing)**

In enterprise environments, the difference between “I made a backup” and “I can restore a backup” is **verification**.

---

## 🧾 Conclusion

In this lab, I practiced **end-to-end backup handling**:

* building archives (`tar`)
* compressing efficiently (`gzip`, `bzip2`)
* validating integrity (tests + checksums)
* restoring and verifying correctness (restore test)

These workflows directly support real Linux administration responsibilities and align strongly with RHCSA-level expectations.

---
