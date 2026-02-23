# 🎤 Interview Q&A - Lab 06: Archiving, Compressing, and Unpacking Files (Ubuntu 24.04)

---

## 1️⃣ What is the difference between archiving and compression?

- **Archiving** combines multiple files into a single file (e.g., `.tar`).
- **Compression** reduces file size (e.g., `.gz`, `.bz2`).

`tar` archives files, while `gzip` and `bzip2` compress them.

---

## 2️⃣ What does the command `tar -cvf archive.tar files` do?

Breakdown:

- `-c` → Create archive  
- `-v` → Verbose (show files processed)  
- `-f` → Specify filename  

It creates a tar archive containing the specified files.

---

## 3️⃣ How do you view contents of a tar archive without extracting?

```bash
tar -tvf archive.tar
````

This lists archive contents safely without unpacking.

---

## 4️⃣ How do you create a compressed archive in one step?

For gzip:

```bash
tar -czvf archive.tar.gz files
```

For bzip2:

```bash
tar -cjvf archive.tar.bz2 files
```

This both archives and compresses simultaneously.

---

## 5️⃣ What is the difference between gzip and bzip2?

| Feature           | gzip     | bzip2  |
| ----------------- | -------- | ------ |
| Speed             | Faster   | Slower |
| Compression Ratio | Moderate | Better |
| File Extension    | .gz      | .bz2   |

gzip is commonly used for logs and fast compression, while bzip2 is better when higher compression is needed.

---

## 6️⃣ How do you extract a `.tar.gz` file?

```bash
tar -xzvf archive.tar.gz
```

Or manually:

```bash
gunzip archive.tar.gz
tar -xvf archive.tar
```

---

## 7️⃣ How do you extract a `.tar.bz2` file?

```bash
tar -xjvf archive.tar.bz2
```

Or manually:

```bash
bunzip2 archive.tar.bz2
tar -xvf archive.tar
```

---

## 8️⃣ Why is tar widely used in Linux environments?

Because:

* It preserves file permissions
* Maintains ownership metadata
* Keeps directory structures intact
* Is compatible across Linux distributions

It is heavily used in:

* Package management
* Backups
* Container layers
* Log archival

---

## 9️⃣ How can you exclude files when archiving?

```bash
tar --exclude='*.log' -czvf backup.tar.gz directory/
```

Useful for excluding temporary or large files.

---

## 🔟 What happens if you extract files that already exist?

They may be overwritten.

To prevent overwriting:

```bash
tar -xkvf archive.tar
```

`-k` keeps existing files.

---

## 1️⃣1️⃣ Why is compression important in DevOps and Cloud environments?

Because it:

* Reduces storage costs
* Speeds up file transfers
* Optimizes backup performance
* Reduces bandwidth usage
* Improves container image efficiency

---

## 1️⃣2️⃣ How can you test archive integrity?

List contents:

```bash
tar -tvf archive.tar.gz
```

Or test compressed file:

```bash
gzip -t archive.tar.gz
```

---

# ✅ Lab Knowledge Summary

After completing this lab, I can confidently:

* Create tar archives
* Compress with gzip and bzip2
* Extract compressed archives
* Combine archive + compression
* Understand storage optimization principles

---
