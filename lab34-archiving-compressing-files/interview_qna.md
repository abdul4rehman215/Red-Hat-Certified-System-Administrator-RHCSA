# 🎯 Interview Q&A — Lab 34: Archiving and Compressing Files (RHCSA)

> This section contains commonly asked RHCSA and Linux System Administration interview questions related to `tar`, `gzip`, and `bzip2`.

---

## 1️⃣ What is the difference between tar and gzip?

**Answer:**

- `tar` → Archiving tool (bundles multiple files/directories into one file)
- `gzip` → Compression tool (compresses a single file)

`tar` does not compress by default. Compression happens when combined:

```bash
tar -czf archive.tar.gz folder/
````

---

## 2️⃣ What do the common tar options mean?

* `-c` → Create archive
* `-x` → Extract archive
* `-f` → Specify file name
* `-v` → Verbose
* `-t` → List contents
* `-z` → gzip compression
* `-j` → bzip2 compression
* `-p` → Preserve permissions
* `-P` → Use absolute paths

Example:

```bash
tar -czvf backup.tar.gz /data
```

---

## 3️⃣ How do you list archive contents without extracting?

```bash
tar -tf archive.tar
tar -tzf archive.tar.gz
tar -tjf archive.tar.bz2
```

This is useful to verify archive structure safely.

---

## 4️⃣ How do you extract an archive to a specific directory?

```bash
tar -xzf archive.tar.gz -C /destination/path
```

`-C` changes extraction location.

---

## 5️⃣ What is the difference between gzip and bzip2?

| Feature      | gzip          | bzip2              |
| ------------ | ------------- | ------------------ |
| Speed        | Faster        | Slower             |
| Compression  | Good          | Better             |
| CPU usage    | Lower         | Higher             |
| Common usage | Logs, backups | Long-term archives |

Use gzip for speed.
Use bzip2 for maximum compression.

---

## 6️⃣ How do you test archive integrity without extracting?

For gzip:

```bash
gzip -t file.gz
```

For bzip2:

```bash
bzip2 -t file.bz2
```

For tar:

```bash
tar -tzf archive.tar.gz > /dev/null
```

Exit code `0` means archive is valid.

---

## 7️⃣ How can you selectively extract specific files?

```bash
tar -xzf archive.tar.gz documents/file.txt
```

Or use wildcards:

```bash
tar -xzf archive.tar.gz --wildcards "*/reports/*"
```

---

## 8️⃣ How do you append files to an existing tar archive?

```bash
tar -rf archive.tar new_file.txt
```

Note:

* Works only for uncompressed `.tar`
* Cannot append directly to `.tar.gz`

---

## 9️⃣ Why is checksum verification important in backups?

Because:

* Backup ≠ Restore guarantee
* Files can become corrupted
* Storage failures may occur

Using:

```bash
md5sum
sha256sum
diff
```

Ensures restored data matches original data.

---

## 🔟 What does this warning mean?

```bash
tar: directory changed while reading it
```

It occurs when:

* Files are modified during archiving
* Timestamps or metadata change

Common in live systems.
Usually not critical but should be reviewed in production backups.

---

## 1️⃣1️⃣ How do you compress a file but keep the original?

```bash
gzip -c file.txt > file.txt.gz
bzip2 -c file.txt > file.txt.bz2
```

`-c` writes compressed output to stdout.

---

## 1️⃣2️⃣ What is the advantage of tar + compression over compressing files individually?

* Maintains directory structure
* Preserves permissions
* Keeps metadata intact
* Easier transport
* Single-file backup management

---

## 1️⃣3️⃣ How do you check available disk space before creating a large archive?

```bash
df -h
```

Check archive size:

```bash
du -sh file.tar.gz
```

Important in production systems to avoid disk exhaustion.

---

## 1️⃣4️⃣ Why can't you append files directly to a compressed tar archive?

Compressed archives are:

* Stream-compressed
* Not random-access writable

You must:

1. Extract
2. Modify
3. Recreate archive

---

## 1️⃣5️⃣ What is the recommended enterprise backup workflow?

1. Create archive with tar
2. Compress (gzip/bzip2)
3. Generate checksum
4. Test archive integrity
5. Perform restore test in clean environment
6. Store backup securely

---

# 🎯 RHCSA Exam Tips

* Know tar flags without looking them up
* Understand `-C` for extraction paths
* Practice selective extraction
* Know how to test archives
* Understand gzip vs bzip2 trade-offs

---
