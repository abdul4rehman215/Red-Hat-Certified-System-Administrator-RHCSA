# 🔐 Lab 10 – Managing File Permissions (ugo/rwx)  

# 🎯 Objectives

By completing this lab, I was able to:

- Interpret Linux file permission strings
- Modify permissions using `chmod` (symbolic & numeric modes)
- Change file ownership using `chown`
- Change group ownership using `chgrp`
- Apply secure permission management practices
- Understand multi-user file access control

---

# 📋 Prerequisites

- Linux system (Ubuntu 24.04 used)
- Basic command-line familiarity
- sudo privileges

---

# 📂 Repository Structure

```
lab10-managing-file-permissions/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🖥️ Environment

**Environment:** Ubuntu 24.04.1 LTS  
**User:** toor (sudo-enabled)  
**Hostname:** ip-172-31-10-251  

---

# 🧩 Task 1 – Viewing File Permissions

## Create Sample Resources

```bash
echo "Sample permission file" > example.txt
mkdir directory
```

## List Files

```bash
ls -l
```

**Output:**

```
-rw-r--r-- 1 toor toor   23 Feb 23 16:10 example.txt
drwxr-xr-x 2 toor toor 4096 Feb 23 16:10 directory
```

---

## 🔎 Permission Breakdown

Example:

```
-rw-r--r-- 1 toor toor 23 Feb 23 16:10 example.txt
```

| Segment | Meaning |
|----------|----------|
| `-` | Regular file |
| `rw-` | Owner permissions |
| `r--` | Group permissions |
| `r--` | Others permissions |

### Permission Components

- **u** → User (Owner)
- **g** → Group
- **o** → Others
- **r** → Read (4)
- **w** → Write (2)
- **x** → Execute (1)

---

# 🧩 Task 2 – Changing Permissions with chmod

## 🔹 Symbolic Mode

Grant execute permission to owner:

```bash
chmod u+x example.txt
```

Verify:

```bash
ls -l example.txt
```

Result:

```
-rwxr--r-- 1 toor toor 23 Feb 23 16:10 example.txt
```

---

## 🔹 Numeric Mode

Set permissions to `rw-r-----` (640):

```bash
chmod 640 example.txt
```

Verify:

```bash
ls -l example.txt
```

Result:

```
-rw-r----- 1 toor toor 23 Feb 23 16:10 example.txt
```

### Numeric Breakdown

| Value | Meaning |
|--------|----------|
| 6 | 4+2 → Read + Write |
| 4 | Read |
| 0 | No permission |

---

# 🧩 Task 3 – Changing Ownership

## 🔹 Create Test User & Group

```bash
sudo useradd newuser
sudo groupadd newgroup
```

---

## 🔹 Change Owner

```bash
sudo chown newuser example.txt
```

Verify:

```bash
ls -l example.txt
```

Result:

```
-rw-r----- 1 newuser toor 23 Feb 23 16:10 example.txt
```

---

## 🔹 Change Group

```bash
sudo chgrp newgroup example.txt
```

Verify:

```
-rw-r----- 1 newuser newgroup 23 Feb 23 16:10 example.txt
```

---

## 🔹 Change Owner & Group Together

```bash
sudo chown newuser:newgroup example.txt
```

---

# 🔐 Security Best Practices

✔ Use `chmod 600` for sensitive files  
✔ Avoid `chmod 777`  
✔ Use groups for collaborative access  
✔ Apply recursive permissions carefully (`chmod -R`)  
✔ Follow least privilege principle  

---

# 🌍 Real-World Relevance

Understanding permissions is essential for:

- Multi-user Linux systems
- Secure DevOps pipelines
- Container security (OpenShift)
- Production server hardening
- Protecting configuration files and credentials

---

# 🏁 Conclusion

In this lab, I successfully:

- Interpreted permission strings
- Modified file permissions using symbolic and numeric modes
- Changed ownership and group settings
- Applied secure Linux file management principles

---

# 🧹 Cleanup

```bash
sudo userdel newuser
sudo groupdel newgroup
```

---

# ✅ Result

🔐 File Permission Management Successfully Verified  
Ubuntu 24.04.1 LTS – EC2 Environment
