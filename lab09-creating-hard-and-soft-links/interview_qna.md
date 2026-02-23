# 🎯 Interview Q&A - Lab 09: Hard Links & Symbolic Links (Linux Filesystem Concepts)

---

## 1️⃣ What is a hard link in Linux?

A hard link is an additional directory entry that points directly to the same **inode** as another file.  
Both filenames reference the same underlying data block on disk.

---

## 2️⃣ What is a symbolic (soft) link?

A symbolic link is a special file that contains a **path reference** to another file.  
It does not share the same inode as the original file.

---

## 3️⃣ How can you verify whether two files are hard links?

Use:

```bash
ls -li
```

If both files share the same inode number, they are hard links to the same data.

---

## 4️⃣ What happens if you delete the original file when using hard links?

Nothing happens to the data as long as at least one hard link exists.  
The data remains accessible because the inode still has references.

---

## 5️⃣ What happens if you delete the original file when using symbolic links?

The symbolic link becomes **broken** because it references the file path, not the inode.

---

## 6️⃣ Can hard links span across filesystems?

❌ No.  
Hard links cannot cross filesystem boundaries.

Attempting this results in:

```
Invalid cross-device link
```

---

## 7️⃣ Can symbolic links span across filesystems?

✅ Yes.  
Symbolic links can reference files located on different filesystems.

---

## 8️⃣ Which command is used to create:

### Hard Link
```bash
ln source_file hardlink_name
```

### Symbolic Link
```bash
ln -s source_file symlink_name
```

---

## 9️⃣ How do you identify a symbolic link in `ls -l` output?

Symbolic links begin with:

```
l
```

Example:

```
lrwxrwxrwx 1 user user 12 Feb 23 15:05 symlink.txt -> original.txt
```

---

## 🔟 What is an inode?

An inode is a data structure in Linux that stores:

- File metadata
- Permissions
- Ownership
- Timestamps
- Disk block pointers

It does NOT store the filename.

---

## 1️⃣1️⃣ Why are hard links safer in some backup scenarios?

Because they reference the actual inode, data remains accessible even if one filename is removed.

---

## 1️⃣2️⃣ When are symbolic links commonly used?

- Linking configuration files
- Redirecting logs
- Creating shortcuts
- Managing versioned software directories
- Container volume mapping

---

## 1️⃣3️⃣ What command provides detailed file metadata including inode?

```bash
stat filename
```

---

## 1️⃣4️⃣ Why can’t hard links be created for directories (normally)?

To prevent filesystem loops and corruption of directory structure.

---

## 1️⃣5️⃣ How are links relevant in container environments?

- Persistent storage mapping
- Overlay filesystems
- Shared configuration
- Volume mount abstraction
- Efficient disk usage strategies

---

# 🏁 Summary for Interviews

Understanding links demonstrates knowledge of:

- Linux filesystem internals
- Inode structure
- Storage design
- Backup strategies
- Container storage behavior
- System administration fundamentals

---

🔗 Hard & Symbolic Link Concepts Fully Validated  
Ubuntu 24.04.1 LTS Environment
