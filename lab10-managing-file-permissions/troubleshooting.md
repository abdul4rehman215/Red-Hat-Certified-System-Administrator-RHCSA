# 🛠️ Troubleshooting Guide - Lab 10: Managing File Permissions (ugo/rwx) – Ubuntu 24.04

---

# 🔎 1️⃣ Permission Denied When Accessing File

## ❌ Problem

```bash
cat example.txt
```

Output:

```
Permission denied
```

## 📌 Cause

- File permissions restrict read access
- User is not owner or part of group
- File ownership mismatch

## ✅ Solution

Check permissions:

```bash
ls -l example.txt
```

Modify if needed:

```bash
chmod u+r example.txt
```

Or adjust group:

```bash
sudo chgrp groupname example.txt
```

---

# 🔎 2️⃣ Cannot Execute File

## ❌ Problem

```bash
./script.sh
```

Output:

```
Permission denied
```

## 📌 Cause

Execute bit not set.

## ✅ Solution

```bash
chmod +x script.sh
```

Verify:

```bash
ls -l script.sh
```

---

# 🔎 3️⃣ chown: Operation Not Permitted

## ❌ Problem

```bash
chown newuser file.txt
```

Output:

```
Operation not permitted
```

## 📌 Cause

Only root (or sudo user) can change ownership.

## ✅ Solution

```bash
sudo chown newuser file.txt
```

---

# 🔎 4️⃣ Incorrect Numeric Permission Applied

## ❌ Problem

File becomes inaccessible after:

```bash
chmod 000 file.txt
```

## 📌 Cause

All permissions removed.

## ✅ Solution

Restore appropriate permissions:

```bash
chmod 644 file.txt
```

If locked out, use sudo:

```bash
sudo chmod 644 file.txt
```

---

# 🔎 5️⃣ Directory Accessible but Cannot Create Files

## ❌ Problem

User can enter directory but cannot create files.

## 📌 Cause

Directory missing write permission.

Check:

```bash
ls -ld directory
```

## ✅ Solution

```bash
chmod u+w directory
```

---

# 🔎 6️⃣ Recursive Permission Change Caused Issues

## ❌ Problem

```bash
chmod -R 777 /
```

⚠ Extremely dangerous — system compromise risk.

## 📌 Cause

Recursive permissions applied incorrectly.

## ✅ Prevention

- Never use recursive chmod on root directory.
- Always specify exact path.
- Test with `ls` before applying changes.

---

# 🔎 7️⃣ Group Permission Not Working

## ❌ Problem

User in group cannot access file.

## 📌 Cause

User not added to group properly.

Verify group membership:

```bash
groups username
```

Add user to group:

```bash
sudo usermod -aG groupname username
```

Log out and log back in to apply changes.

---

# 🔎 8️⃣ Sticky Bit / Special Permission Confusion

If permissions look like:

```
-rwsr-xr-x
```

Or:

```
drwxrwxrwt
```

These represent special bits:

- **s** → setuid/setgid
- **t** → sticky bit

Check with:

```bash
stat filename
```

---

# 🔐 Security Best Practices

✔ Avoid chmod 777  
✔ Use 600 for private keys  
✔ Use groups for shared access  
✔ Apply recursive changes carefully  
✔ Always verify with `ls -l`  

---

# 📋 Verification Checklist

✔ Permissions interpreted correctly  
✔ chmod symbolic mode tested  
✔ chmod numeric mode tested  
✔ chown executed successfully  
✔ chgrp executed successfully  
✔ Ownership verified  
✔ Cleanup completed  

---

# 🏁 Final Result

Linux File Permission Management Successfully Implemented  
Ubuntu 24.04.1 LTS – EC2 Environment  

🔐 Secure File Access Control Fully Validated
