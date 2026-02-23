# 📚 Lab 11 – Using System Documentation  

# 🎯 Objectives

By completing this lab, I was able to:

- Use `man` pages to access system documentation
- Navigate documentation sections effectively
- Use `info` for structured GNU documentation
- Search documentation using `apropos` / `man -k`
- Access package documentation in `/usr/share/doc`
- Install additional documentation packages

---

# 📋 Prerequisites

- RHEL/CentOS/Fedora system
- Basic CLI familiarity
- Internet access (optional for installing docs)

---

# 📂 Repository Structure

```
lab11-using-system-documentation/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🖥️ Environment 

**Environment:** CentOS Linux 7 (Core)  
**User:** centos  
**Hostname:** ip-172-31-10-176  

---

# 🧩 Task 1 – Using man and info

## 🔹 View Manual Page for ls

```bash
man ls
```

Key navigation:

- Arrow keys → Scroll
- `/keyword` → Search
- `q` → Quit

---

## 🔹 View Section 5 of passwd

```bash
man 5 passwd
```

Displays file format documentation:

```
name:password:UID:GID:GECOS:directory:shell
```

---

## 🔹 List All Sections of passwd

```bash
man -f passwd
```

Shows:

```
passwd (1)
passwd (5)
```

Section (1) → User command  
Section (5) → File format  

---

## 🔹 Using info Pages

```bash
info coreutils
```

Navigate with:

- Arrow keys
- Enter to follow link
- `q` to quit

Direct access example:

```bash
info coreutils ls invocation
```

---

# 🔎 Task 2 – Searching Documentation

## 🔹 Search Man Database

```bash
man -k network
```

Or:

```bash
apropos network
```

---

## 🔹 Update Man Database

```bash
sudo mandb
```

---

## 🔹 Quick Help Flags

```bash
grep --help
```

Displays concise usage instructions.

---

# 📂 Task 3 – Package Documentation

## 🔹 Explore /usr/share/doc

```bash
ls /usr/share/doc | head
```

---

## 🔹 View bash Documentation

```bash
ls /usr/share/doc/bash-4.2.46
less /usr/share/doc/bash-4.2.46/README
```

---

## 🔹 Install Additional Documentation

```bash
sudo yum install -y httpd-manual
```

Verify:

```bash
ls /usr/share/doc/httpd-manual
```

---

# 📘 Key Documentation Tools

| Tool | Purpose |
|------|---------|
| man | Manual pages |
| info | Structured GNU docs |
| apropos | Search man database |
| --help | Quick usage |
| /usr/share/doc | Package documentation |

---

# 🌍 Real-World Relevance

Strong documentation skills are critical for:

- Troubleshooting production systems
- Understanding configuration files
- Exam preparation (RHCSA/RHCE)
- Working in air-gapped environments
- Red Hat / OpenShift administration

---

# 🏁 Conclusion

In this lab, I successfully:

- Accessed system documentation using man & info
- Searched documentation efficiently
- Navigated file-format manuals
- Installed and verified package-specific documentation

Mastering documentation is foundational for advanced Linux administration.

---

# ✅ Result

📚 System Documentation Skills Successfully Verified  
CentOS Linux 7 – EC2 Environment
