# 📝 Lab 07 – Creating and Editing Text Files  

# 🎯 Objectives

By completing this lab, I gained practical experience in:

- Creating and editing text files using `nano` and `vi`
- Performing insert, delete, save, and exit operations
- Viewing files using CLI tools (`cat`, `less`)
- Understanding LF vs CRLF newline conventions
- Validating configuration files for integrity
- Working with configuration snippets used in container environments

---

# 📋 Prerequisites

- RHEL/CentOS/Fedora system
- Terminal access
- Basic command-line knowledge

---

## 🖥️ Environment 
**Environment:** CentOS Linux 7 (Core)  
**Hostname:** ip-172-31-10-148  
**User:** centos  


---

# 📂 Repository Structure

```
lab07-creating-and-editing-text-files/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── files/
    ├── first_file.txt
    ├── second_file.txt
    └── podman_config.conf
```

---

# 🧩 Task Overview

---

## 🔹 Task 1 – Creating and Editing Files with nano

- Created `first_file.txt`
- Added content interactively
- Saved using:
  - `Ctrl + O` → Write Out
  - `Enter`
  - `Ctrl + X` → Exit

Verified file creation:

```bash
ls -l first_file.txt
```

---

## 🔹 Task 2 – Advanced Editing with vi

- Opened `second_file.txt`
- Switched between:
  - Command mode
  - Insert mode (`i`)
- Deleted a line using:
  
```bash
dd
```

- Saved and exited:

```bash
:wq
```

---

## 🔹 Task 3 – File Viewing & Encoding

### File Viewing Commands

```bash
cat first_file.txt
less second_file.txt
```

### Check Encoding

```bash
file first_file.txt
```

Output confirmed:

```
ASCII text
```

---

## 🔹 Task 4 – Handling Line Endings (LF vs CRLF)

Installed `dos2unix` utility:

```bash
sudo yum install -y dos2unix
```

Converted formats:

```bash
unix2dos first_file.txt
dos2unix first_file.txt
```

### 🔎 Key Concept

- Unix/Linux → LF (`\n`)
- Windows → CRLF (`\r\n`)

Understanding this prevents script execution issues across platforms.

---

## 🔹 Task 5 – Practical Configuration File Creation

Created `podman_config.conf` with nano:

```
[storage]
driver = "overlay"
runroot = "/var/run/containers/storage"
graphroot = "/var/lib/containers/storage"
```

Validated integrity:

```bash
grep -n '[[:space:]]$' podman_config.conf
wc -l podman_config.conf
file *
```

---

# 🔐 Security & Operational Relevance

Text editing skills are critical for:

- Editing system configuration files
- Modifying container configs
- Writing scripts
- Updating service definitions
- Managing production environments
- Fixing configuration issues during incidents

Incorrect newline formats can break:

- Shell scripts
- Container entrypoints
- CI/CD pipelines
- Kubernetes manifests

---

# 🏁 Results

✔ Created and edited text files  
✔ Used nano and vi efficiently  
✔ Performed line deletion and save operations  
✔ Verified file encoding  
✔ Converted between DOS and Unix formats  
✔ Created valid container configuration file  

---

# 🎓 What I Learned

- vi modal editing structure
- nano shortcut-based workflow
- File integrity validation techniques
- Cross-platform newline handling
- Practical configuration management basics

---

# 🚀 Why This Matters

Text editing is foundational for:

- Linux administration
- DevOps engineering
- Cloud infrastructure management
- OpenShift/Kubernetes configuration
- Security operations
- Incident response troubleshooting

Nearly every Linux task requires reliable text editing skills.

---

# 🧠 Next Practice Ideas

- Use `:%s/old/new/g` in vi for search & replace
- Practice vi visual mode
- Manage file permissions and ownership
- Create structured YAML configuration files

---

**✅ Lab Completed Successfully on CentOS 7**  
📝 Text Editing & File Management Skills Verified
