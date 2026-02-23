# 📦 Lab 06 – Archiving, Compressing, and Unpacking Files  

# 🎯 Objectives

By completing this lab, I gained hands-on experience in:

- Creating archives using `tar`
- Compressing files using `gzip` and `bzip2`
- Extracting compressed archives
- Creating combined compressed archives directly
- Managing file storage for efficient transfer and backup

---

# 📋 Prerequisites

- Linux system (Ubuntu 24.04 used)
- Basic command-line knowledge
- `tar`, `gzip`, `bzip2` installed

---

## 🖥️ Environment

**Environment:** Ubuntu 24.04.1 LTS  
**Hostname:** ip-172-31-10-167  
**User:** toor  

---

# 📂 Repository Structure

```
lab06-archiving-compressing-and-unpacking-files/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── lab_files/
    ├── file1.txt
    ├── file2.txt
    ├── file3.txt
    ├── archive.tar
    ├── archive.tar.gz
    ├── archive.tar.bz2
    ├── combined.tar.gz
    └── combined.tar.bz2
```

---

# 🔎 Tool Verification

```bash
tar --version
gzip --version
bzip2 --version
```

Verified installed versions:
- GNU tar 1.35
- gzip 1.12
- bzip2 1.0.8

---

# 🧩 Task Overview

---

## 🔹 Task 1 – Create Basic Archive with tar

- Created directory and sample files
- Archived files using:
  
```bash
tar -cvf archive.tar file1.txt file2.txt file3.txt
```

- Verified contents using:

```bash
tar -tvf archive.tar
```

---

## 🔹 Task 2 – Compress Using gzip & bzip2

### gzip

```bash
gzip archive.tar
```

Created:
```
archive.tar.gz
```

### bzip2

```bash
bzip2 archive.tar
```

Created:
```
archive.tar.bz2
```

---

## 🔹 Task 3 – Extract Archives

### Extract .tar.gz

```bash
gunzip archive.tar.gz
tar -xvf archive.tar
```

### Extract .tar.bz2

```bash
bunzip2 archive.tar.bz2
tar -xvf archive.tar
```

---

## 🔹 Task 4 – Create Compressed Archives Directly

Create compressed archive in one step:

```bash
tar -czvf combined.tar.gz file1.txt file2.txt file3.txt
tar -cjvf combined.tar.bz2 file1.txt file2.txt file3.txt
```

---

# 🔐 Security & Operational Relevance

Archiving and compression are critical for:

- System backups
- Log archival
- Container image exports
- Deployment packaging
- Secure data transfer
- Disaster recovery processes

In enterprise Linux environments and OpenShift workflows, tar-based archives are heavily used for configuration export, image layers, and system snapshots.

---

# 🏁 Results

✔ Archive created successfully  
✔ gzip compression verified  
✔ bzip2 compression verified  
✔ Archive contents inspected  
✔ Files restored successfully  
✔ Combined compressed archives created  

---

# 🎓 What I Learned

- Difference between archiving and compression
- How to inspect archive contents before extraction
- Efficient methods to combine and compress multiple files
- Practical storage optimization techniques
- Linux-based backup fundamentals

---

# 🚀 Why This Matters

Archiving and compression are foundational skills in:

- Linux system administration
- DevOps pipelines
- Cloud backup workflows
- Container management
- Enterprise server maintenance

Efficient data packaging reduces storage usage and improves transfer performance.

---

# 🧠 Next Practice Ideas

- Archive entire directories
- Use `--exclude` to skip files
- Compare gzip vs bzip2 compression ratios
- Explore `zip`/`unzip` for cross-platform compatibility

---

**✅ Lab Completed Successfully on Ubuntu 24.04.1 LTS**  
📦 Archiving and Compression Skills Verified
