# 📁 Lab 08 – Managing Files and Directories  

# 🎯 Objectives

By completing this lab, I gained practical experience in:

- Creating directories using `mkdir`
- Creating nested directory structures
- Moving files using `mv`
- Copying files using `cp`
- Deleting files using `rm`
- Removing directories using `rmdir` and `rm -r`
- Using wildcards for bulk file operations
- Understanding recursive and interactive operations

---

# 📋 Prerequisites

- Ubuntu 24.04.1 LTS
- Terminal access
- Basic Linux CLI knowledge
- Optional: `tree` utility for visualization

---

## 🖥️ Environment 
**Environment:** Ubuntu 24.04.1 LTS  
**Hostname:** ip-172-31-10-205  
**User:** toor  

---

# 📂 Repository Structure

```
lab08-managing-files-and-directories/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── workspace/
    ├── lab_files/
    ├── parent/
    └── sample_files/
```

---

# 🧩 Task Overview

---

## 🔹 Task 1 – Creating Directories

### Create Single Directory

```bash
mkdir lab_files
```

### Create Nested Directory Structure

```bash
mkdir -p parent/child/grandchild
```

Verified using:

```bash
tree parent
```

---

## 🔹 Task 2 – Moving, Copying & Deleting Files

### Move File

```bash
mv sample.txt lab_files/
```

### Copy File

```bash
cp lab_files/sample.txt lab_files/sample_copy.txt
```

### Delete File

```bash
rm lab_files/sample_copy.txt
```

---

## 🔹 Task 3 – Directory Deletion

### Remove Empty Directory

```bash
rmdir parent/child/grandchild
```

### Remove Non-Empty Directory Recursively

```bash
rm -r parent
```

---

## 🔹 Task 4 – Wildcard Operations

### Create Multiple Files

```bash
touch lab_files/file{1..5}.txt
```

### Delete All `.txt` Files

```bash
rm lab_files/*.txt
```

---

# 🔐 Security & Operational Relevance

File and directory management is critical in:

- System administration
- Log management
- Backup operations
- Container storage handling
- Deployment directory structuring
- CI/CD artifact management

Improper file management can lead to:

- Data loss
- Permission issues
- Broken services
- Security exposure

---

# 🏁 Results

✔ Directories created successfully  
✔ Nested structures verified  
✔ Files moved and copied  
✔ Files deleted safely  
✔ Recursive deletion tested  
✔ Wildcard operations performed  
✔ Directory cleaned successfully  

---

# 🎓 What I Learned

- Practical file system navigation
- Safe deletion techniques
- Recursive operations
- Bulk file management using wildcards
- Efficient Linux file organization methods

---

# 🚀 Why This Matters

These skills are foundational for:

- Linux server management
- DevOps pipelines
- Container storage organization
- OpenShift deployments
- Cloud infrastructure maintenance
- Security and compliance workflows

Every Linux-based environment depends heavily on correct file and directory management.

---

# 🧠 Next Practice Ideas

- Use `mv -i` for interactive confirmation
- Use `cp -r` to copy directories
- Explore `find` with wildcards
- Practice permission management with `chmod` and `chown`

---

**✅ Lab Completed Successfully on Ubuntu 24.04.1 LTS**  
📁 File & Directory Management Skills Verified
