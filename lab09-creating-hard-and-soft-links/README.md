# 🔗 Lab 09 – Creating Hard and Soft Links  

# 🎯 Objectives

By the end of this lab, I was able to:

- Understand the difference between **hard links** and **symbolic (soft) links**
- Create and manage hard links using `ln`
- Create and manage symbolic links using `ln -s`
- Identify filesystem limitations of hard links
- Verify link integrity using inode inspection
- Test link behavior during file modification and deletion

---

# 📋 Prerequisites

- Ubuntu/Linux system
- Basic CLI knowledge
- `sudo` privileges available
- Non-root user account

---

# 🧩 Lab Tasks Overview

This lab covers:

1. Creating and testing **hard links**
2. Creating and testing **symbolic links**
3. Observing link behavior during deletion
4. Testing cross-filesystem link limitations
5. Verifying inode-level relationships

---

# 📂 Repository Structure

```
lab09-creating-hard-and-soft-links/
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
**User:** toor  
**Hostname:** ip-172-31-10-233  

---

# 🧩 Task 1 – Hard Links

### ✔ Create Working Directory

```bash
mkdir link_lab && cd link_lab
```

### ✔ Create Original File

```bash
echo "This is the original file." > original.txt
```

### ✔ Create Hard Link

```bash
ln original.txt hardlink.txt
```

### ✔ Verify Inodes

```bash
ls -li
```

Both files share the **same inode**, confirming they reference the same data block.

---

### ✔ Modify via Hard Link

```bash
echo "Appended via hard link." >> hardlink.txt
```

Both `original.txt` and `hardlink.txt` reflect identical content.

---

### ✔ Delete Hard Link

```bash
rm hardlink.txt
```

The original file remains intact because hard links point directly to the inode.

---

# 🧩 Task 2 – Symbolic Links

### ✔ Create Symlink

```bash
ln -s original.txt symlink.txt
```

Verify:

```bash
ls -l
```

`l` at the beginning confirms symbolic link.

---

### ✔ Delete Original File

```bash
rm original.txt
```

Now:

```bash
cat symlink.txt
```

Symlink becomes broken because it references the filename path.

---

### ✔ Recreate File

```bash
echo "New content." > original.txt
```

Symlink works again if filename restored.

---

# 🧩 Task 3 – Cross-Filesystem Behavior

### ✔ Check Filesystem

```bash
df -h /tmp
```

`/tmp` is `tmpfs`, different from home filesystem.

---

### ❌ Hard Link Across Filesystems

```bash
ln original.txt /tmp/hardlink_fail.txt
```

Result:

```
Invalid cross-device link
```

Hard links cannot span filesystems.

---

### ✔ Symbolic Link Across Filesystems

```bash
ln -s $(pwd)/original.txt /tmp/symlink_success.txt
```

Symlink works correctly.

---

# 🔑 Key Differences

| Feature | Hard Link | Symbolic Link |
|----------|------------|---------------|
| Points To | Inode | File path |
| Inode Shared | Yes | No |
| Cross Filesystem | ❌ No | ✅ Yes |
| Survives Original Deletion | ✅ Yes | ❌ No |
| File Type Indicator | Normal file | `l` |

---

# 🏁 Conclusion

In this lab, I:

- Created and verified hard links
- Created and verified symbolic links
- Tested modification and deletion behaviors
- Observed inode-level relationships
- Validated filesystem limitations

These concepts are essential for:

- Linux filesystem management
- System administration
- DevOps workflows
- Container volume mapping
- Backup and storage strategies

---

# 🌍 Real-World Relevance

Understanding links is critical when:

- Managing log rotation systems
- Configuring shared resources
- Creating persistent storage in containerized environments
- Handling system-level configuration files

---

# ✅ Result

🔗 Hard & Symbolic Link Management Successfully Verified  
Ubuntu 24.04.1 LTS – EC2 Environment  

---
