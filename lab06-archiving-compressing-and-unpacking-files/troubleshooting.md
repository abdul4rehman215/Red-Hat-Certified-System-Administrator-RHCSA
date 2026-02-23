# 🛠️ Troubleshooting Guide - Lab 06: Archiving, Compressing, and Unpacking Files (Ubuntu 24.04)

---

## 📂 1️⃣ "No such file or directory" While Creating Archive

### Problem

```bash
tar -cvf archive.tar file1.txt file2.txt
````

Returns:

```
tar: file1.txt: Cannot stat: No such file or directory
```

### Cause

* File does not exist
* Incorrect directory
* Typo in filename

### Solution

Verify files exist:

```bash
ls -lh
```

Check current directory:

```bash
pwd
```

---

## 🔒 2️⃣ Permission Denied Errors

### Problem

```bash
tar -cvf archive.tar /root/somefile
```

Returns:

```
Permission denied
```

### Solution

Use sudo if appropriate:

```bash
sudo tar -cvf archive.tar /root/somefile
```

Or adjust file permissions.

---

## 🗜️ 3️⃣ gzip or bzip2 Not Installed

### Problem

```bash
gzip: command not found
```

### Solution (Ubuntu)

```bash
sudo apt update
sudo apt install gzip bzip2 -y
```

Verify:

```bash
gzip --version
bzip2 --version
```

---

## 📦 4️⃣ Extracting Wrong File Format

### Problem

Using wrong flag:

```bash
tar -xvf archive.tar.gz
```

Error:

```
gzip: stdin: not in gzip format
```

### Cause

Incorrect extraction method.

### Correct Commands

For `.tar.gz`:

```bash
tar -xzvf archive.tar.gz
```

For `.tar.bz2`:

```bash
tar -xjvf archive.tar.bz2
```

---

## 🔄 5️⃣ Files Overwritten During Extraction

### Problem

Existing files replaced during extraction.

### Solution

Use keep-old-files flag:

```bash
tar -xkvf archive.tar
```

Or extract to different directory:

```bash
tar -xvf archive.tar -C /path/to/destination
```

---

## 📊 6️⃣ Archive Seems Too Large

### Cause

* Compression not applied
* Large uncompressed files included

### Solution

Use compression flag:

```bash
tar -czvf archive.tar.gz directory/
```

Check compression ratio:

```bash
ls -lh archive.tar archive.tar.gz
```

---

## 🔍 7️⃣ Verify Archive Integrity

Test gzip archive:

```bash
gzip -t archive.tar.gz
```

Test bzip2 archive:

```bash
bzip2 -t archive.tar.bz2
```

List contents safely:

```bash
tar -tvf archive.tar.gz
```

---

## ⚠️ 8️⃣ "Cannot open: File exists"

Occurs when creating archive with existing filename.

### Solution

Remove old archive:

```bash
rm archive.tar
```

Or overwrite intentionally.

---

## 🔐 Security Considerations

* Avoid extracting archives from untrusted sources.
* Archives may contain malicious paths (e.g., `../../etc/passwd`).
* Use extraction into controlled directory.
* Review archive contents before extracting:

```bash
tar -tvf suspicious.tar
```

---

## 📋 Best Practices

✔ Always verify archive contents before extraction
✔ Use compression to reduce storage and transfer size
✔ Use `--exclude` to skip temporary or unnecessary files
✔ Store backups in separate secure location
✔ Automate backups via cron jobs

---

# ✅ Lab Verification Checklist

✔ tar archive created
✔ gzip compression verified
✔ bzip2 compression verified
✔ Files successfully extracted
✔ Combined compressed archives created
✔ Archive integrity confirmed

---

**📦 Archiving and Compression Operations Successfully Verified**

End of Troubleshooting Guide – Lab 06
