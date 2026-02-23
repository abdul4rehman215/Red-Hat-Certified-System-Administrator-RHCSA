# 🛠️ Troubleshooting Guide - Lab 07: Creating and Editing Text Files (CentOS 7)

---

## 📝 1️⃣ File Not Saved in nano

### Problem

After editing and exiting nano, file appears empty.

### Cause

User exited without saving.

### Correct Save Procedure

Inside nano:

- `Ctrl + O` → Write Out  
- Press `Enter`  
- `Ctrl + X` → Exit  

Verify file:

```bash
ls -l filename.txt
cat filename.txt
````

---

## ⌨️ 2️⃣ Stuck Inside vi

### Problem

User cannot exit vi.

### Solution

Press:

```text
Esc
```

Then type:

```bash
:q
```

If changes need to be discarded:

```bash
:q!
```

To save and exit:

```bash
:wq
```

---

## ❌ 3️⃣ Command Not Found (nano or dos2unix)

### Problem

```bash
nano: command not found
```

### Solution

Install package:

```bash
sudo yum install nano -y
```

For dos2unix:

```bash
sudo yum install dos2unix -y
```

---

## 🔄 4️⃣ Script Fails Due to CRLF Line Endings

### Problem

Shell script returns:

```text
-bash: ./script.sh: /bin/bash^M: bad interpreter
```

### Cause

File created in Windows (CRLF format).

### Solution

Convert to Unix format:

```bash
dos2unix script.sh
```

---

## 🔍 5️⃣ Trailing Whitespace Issues in Config Files

### Problem

Configuration fails validation.

### Detection

```bash
grep -n '[[:space:]]$' filename
```

### Fix Using vi

In vi:

```bash
:%s/[[:space:]]\+$//
:wq
```

Removes trailing whitespace from all lines.

---

## 📄 6️⃣ File Encoding Appears Incorrect

### Verify Encoding

```bash
file filename
```

If not ASCII or UTF-8, recreate file in proper format.

---

## 🔐 7️⃣ Permission Denied When Editing

### Problem

```bash
nano /etc/someconfig.conf
```

Returns:

```text
Permission denied
```

### Solution

Use sudo:

```bash
sudo nano /etc/someconfig.conf
```

Or check permissions:

```bash
ls -l /etc/someconfig.conf
```

---

## 📚 8️⃣ File Appears Empty in less

### Possible Causes

* File actually empty
* Viewing wrong file path
* File not saved

Verify:

```bash
wc -l filename
pwd
```

---

## 🧹 9️⃣ Accidental File Overwrite

If overwritten accidentally:

* Check backups
* Use version control
* Check editor swap files:

```bash
ls -a
```

For vi recovery:

```bash
vi -r filename
```

---

## 🔒 Security Best Practices

✔ Avoid editing critical system files without backup
✔ Always validate configuration syntax
✔ Use minimal sudo access
✔ Keep consistent line endings
✔ Maintain clean formatting

---

# ✅ Lab Verification Checklist

✔ Created text files using nano
✔ Edited file using vi
✔ Deleted lines successfully
✔ Saved and exited properly
✔ Verified encoding type
✔ Converted CRLF ↔ LF
✔ Created clean configuration file
✔ Validated file integrity

---

**📝 Text Editing & File Manipulation Successfully Verified**

End of Troubleshooting Guide – Lab 07
