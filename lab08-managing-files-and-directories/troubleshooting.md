# 🛠️ Troubleshooting Guide - Lab 08: Managing Files and Directories (Ubuntu 24.04)

---

## 📂 1️⃣ "No such file or directory"

### Problem

```bash
mv sample.txt lab_files/
````

Returns:

```
mv: cannot stat 'sample.txt': No such file or directory
```

### Cause

* File does not exist
* Incorrect path
* Typo in filename
* Wrong working directory

### Solution

Check current directory:

```bash
pwd
```

List files:

```bash
ls -l
```

Verify exact filename (Linux is case-sensitive).

---

## 🔐 2️⃣ Permission Denied Error

### Problem

```bash
rm protected_file.txt
```

Returns:

```
Permission denied
```

### Cause

* Insufficient file permissions
* Not file owner
* Directory permission restriction

### Solution

Check permissions:

```bash
ls -l filename
```

Use sudo if appropriate:

```bash
sudo rm filename
```

Or modify permissions:

```bash
chmod 644 filename
```

---

## 🗂️ 3️⃣ Directory Not Empty Error

### Problem

```bash
rmdir parent
```

Returns:

```
rmdir: failed to remove 'parent': Directory not empty
```

### Cause

`rmdir` only removes empty directories.

### Solution

Use recursive removal:

```bash
rm -r parent
```

Or check contents first:

```bash
ls parent
```

---

## ⚠️ 4️⃣ Accidental Deletion Using rm -r

### Problem

Wrong directory deleted accidentally.

### Prevention

Use interactive mode:

```bash
rm -ri directory_name
```

Or test with `ls` before deletion:

```bash
ls directory_name
```

---

## 🔄 5️⃣ File Overwritten During Move or Copy

### Problem

```bash
mv file.txt destination/
```

Overwrites existing file silently.

### Prevention

Use interactive flag:

```bash
mv -i file.txt destination/
cp -i file.txt destination/
```

---

## 🧹 6️⃣ Wildcard Deletes Too Many Files

### Problem

```bash
rm *.txt
```

Deletes more files than expected.

### Prevention

Preview files first:

```bash
ls *.txt
```

Then execute deletion.

---

## 📦 7️⃣ Cannot Copy Directory

### Problem

```bash
cp folder1 folder2
```

Returns:

```
cp: -r not specified; omitting directory 'folder1'
```

### Solution

Use recursive option:

```bash
cp -r folder1 folder2
```

---

## 🖥️ 8️⃣ tree Command Not Found

### Problem

```bash
tree parent
```

Returns:

```
tree: command not found
```

### Solution

Install tree:

```bash
sudo apt install tree -y
```

---

## 📁 9️⃣ Directory Appears Empty but Files Missing

### Possible Causes

* Hidden files exist
* Wrong path
* Files moved accidentally

Check hidden files:

```bash
ls -la
```

---

## 🔍 1️⃣0️⃣ Case Sensitivity Issues

Linux paths are case-sensitive.

Example:

```
File.txt ≠ file.txt
```

Verify exact case:

```bash
ls
```

---

## 🔒 Security Best Practices

✔ Avoid using `rm -rf` in production
✔ Always verify path before deletion
✔ Use interactive flags in critical environments
✔ Maintain backups before bulk operations
✔ Apply correct ownership and permissions

---

# ✅ Lab Verification Checklist

✔ Directory created successfully
✔ Nested structure verified
✔ Files moved and copied
✔ Files deleted correctly
✔ Recursive deletion tested
✔ Wildcard operations validated
✔ Workspace cleaned safely

---

**📁 File & Directory Management Successfully Verified**

End of Troubleshooting Guide – Lab 08
