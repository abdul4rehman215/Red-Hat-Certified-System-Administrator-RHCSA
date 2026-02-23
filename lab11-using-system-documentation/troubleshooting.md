# 🛠️ Troubleshooting Guide - Lab 11: Using System Documentation – CentOS 7

---

# 🔎 1️⃣ man Command Not Found

## ❌ Problem

```bash
man ls
```

Output:

```
bash: man: command not found
```

## 📌 Cause

The `man-db` package is not installed.

## ✅ Solution

Install manual pages:

```bash
sudo yum install -y man-db
```

Verify:

```bash
man ls
```

---

# 🔎 2️⃣ info Command Not Found

## ❌ Problem

```bash
info coreutils
```

Output:

```
bash: info: command not found
```

## 📌 Cause

The `info` package is not installed.

## ✅ Solution

```bash
sudo yum install -y info
```

---

# 🔎 3️⃣ man -k Returns No Results

## ❌ Problem

```bash
man -k network
```

Output:

```
nothing appropriate.
```

## 📌 Cause

Man page database not updated.

## ✅ Solution

Rebuild the database:

```bash
sudo mandb
```

Then retry:

```bash
man -k network
```

---

# 🔎 4️⃣ Section Not Found Error

## ❌ Problem

```bash
man 5 passwd
```

Output:

```
No manual entry for passwd in section 5
```

## 📌 Cause

Section-specific documentation missing.

## ✅ Solution

Install required package:

```bash
sudo yum reinstall shadow-utils
```

Or verify available sections:

```bash
man -f passwd
```

---

# 🔎 5️⃣ /usr/share/doc is Empty

## ❌ Problem

```bash
ls /usr/share/doc
```

Returns few or no entries.

## 📌 Cause

Documentation packages not installed.

## ✅ Solution

Install documentation package:

```bash
sudo yum install package-name-doc
```

Example:

```bash
sudo yum install httpd-manual
```

---

# 🔎 6️⃣ Cannot Open Documentation with less

## ❌ Problem

```bash
less file.txt
```

Output:

```
bash: less: command not found
```

## 📌 Cause

`less` utility missing.

## ✅ Solution

```bash
sudo yum install -y less
```

---

# 🔎 7️⃣ Permission Denied Accessing Documentation

## ❌ Problem

```bash
less /usr/share/doc/package/README
```

Output:

```
Permission denied
```

## 📌 Cause

Insufficient user privileges.

## ✅ Solution

Use sudo if required:

```bash
sudo less /usr/share/doc/package/README
```

---

# 🔎 8️⃣ Unable to Install Documentation Package

## ❌ Problem

```bash
sudo yum install httpd-manual
```

Fails due to network issues.

## 📌 Cause

- No internet access
- Repository misconfigured

## ✅ Solution

Check repository configuration:

```bash
yum repolist
```

Verify network:

```bash
ping google.com
```

Or configure local repository.

---

# 🔐 Best Practices for Documentation Usage

✔ Use `--help` for quick syntax  
✔ Use `man` for detailed explanation  
✔ Use `info` for structured GNU docs  
✔ Use `apropos` when unsure of command name  
✔ Install package-specific documentation for deeper learning  

---

# 📋 Verification Checklist

✔ man command accessible  
✔ info command functional  
✔ man database updated  
✔ Documentation searched successfully  
✔ Package documentation accessed  
✔ Additional documentation installed  

---

# 🏁 Final Result

System Documentation Successfully Accessed & Utilized  
CentOS Linux 7 – EC2 Environment  

📚 Linux Documentation Mastery Verified
