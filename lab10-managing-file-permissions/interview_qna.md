# 🎯 Interview Q&A - Lab 10: Linux File Permissions (ugo/rwx, chmod, chown)

---

## 1️⃣ What do the permission characters in `-rw-r--r--` represent?

Breakdown:

- `-` → File type (regular file)
- `rw-` → Owner permissions
- `r--` → Group permissions
- `r--` → Others permissions

---

## 2️⃣ What do u, g, and o stand for?

- **u** → User (Owner)
- **g** → Group
- **o** → Others

---

## 3️⃣ What are the numeric values of r, w, and x?

| Permission | Value |
|------------|--------|
| r (read)   | 4      |
| w (write)  | 2      |
| x (execute)| 1      |

Example:

```
chmod 640 file
```

6 = 4+2 (rw)  
4 = r  
0 = none  

---

## 4️⃣ How do you grant execute permission to the owner?

```bash
chmod u+x filename
```

---

## 5️⃣ How do you remove write permission from group?

```bash
chmod g-w filename
```

---

## 6️⃣ What does chmod 777 do and why is it dangerous?

It gives:

- Owner → rwx
- Group → rwx
- Others → rwx

⚠ Security risk because anyone can modify the file.

---

## 7️⃣ How do you change file ownership?

```bash
sudo chown username filename
```

---

## 8️⃣ How do you change group ownership?

```bash
sudo chgrp groupname filename
```

---

## 9️⃣ How do you change both owner and group at once?

```bash
sudo chown user:group filename
```

---

## 🔟 What permission is recommended for sensitive files?

```
chmod 600 filename
```

Owner can read/write, no access for others.

---

## 1️⃣1️⃣ What does the execute bit mean for directories?

For directories:

- `x` → Allows entering the directory
- `r` → Allows listing contents
- `w` → Allows creating/deleting files

---

## 1️⃣2️⃣ What happens if a directory does not have execute permission?

You cannot access files inside it, even if you have read permission.

---

## 1️⃣3️⃣ What does chmod -R do?

Applies permission changes recursively to all files and subdirectories.

⚠ Use carefully in production systems.

---

## 1️⃣4️⃣ What is the principle of least privilege?

Grant only the minimum permissions required for users to perform their tasks.

---

## 1️⃣5️⃣ How are file permissions relevant in containerized environments?

- Protect configuration files
- Secure mounted volumes
- Control container user access
- Prevent privilege escalation
- Maintain isolation between services

---

# 🏁 Interview Summary

This lab demonstrates understanding of:

- Linux file permission model
- Ownership management
- Security best practices
- Multi-user environment control
- Production system hardening

---

🔐 File Permission Concepts Successfully Validated  
Ubuntu 24.04.1 LTS – EC2 Environment
