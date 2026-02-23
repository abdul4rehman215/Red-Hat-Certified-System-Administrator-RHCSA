# 🛠️ Troubleshooting Guide - Lab 09: Hard & Symbolic Link Management (Ubuntu 24.04)

---

# 🔎 1️⃣ Invalid Cross-Device Link Error

## ❌ Problem

```bash
ln original.txt /tmp/hardlink_fail.txt
```

Output:

```
ln: failed to create hard link '/tmp/hardlink_fail.txt' => 'original.txt': Invalid cross-device link
```

## 📌 Cause

Hard links cannot span across different filesystems.

`/home` and `/tmp` are on different filesystems (`ext4` vs `tmpfs`).

## ✅ Solution

Use a symbolic link instead:

```bash
ln -s $(pwd)/original.txt /tmp/symlink_success.txt
```

---

# 🔎 2️⃣ Broken Symbolic Link

## ❌ Problem

```bash
cat symlink.txt
```

Output:

```
cat: symlink.txt: No such file or directory
```

## 📌 Cause

The target file was deleted.  
Symbolic links store file paths, not inodes.

## ✅ Solution

Recreate the original file:

```bash
echo "New content." > original.txt
```

Or recreate the symlink:

```bash
ln -s original.txt symlink.txt
```

---

# 🔎 3️⃣ Permission Denied Error

## ❌ Problem

```
Permission denied
```

## 📌 Cause

- Directory lacks write permission
- File ownership mismatch

## ✅ Solution

Check permissions:

```bash
ls -l
```

Fix permissions if needed:

```bash
chmod 644 filename
```

Or use sudo (if appropriate):

```bash
sudo ln source target
```

---

# 🔎 4️⃣ Hard Link Not Updating

## ❌ Problem

Changes made to one file do not reflect in another.

## 📌 Cause

Files are not hard links (different inodes).

## ✅ Verification

Check inode numbers:

```bash
ls -li
```

If inode numbers differ → not a hard link.

---

# 🔎 5️⃣ Symlink Points to Wrong Path

## ❌ Problem

Symlink exists but points to incorrect location.

## 📌 Cause

Relative path confusion.

Example:

```bash
ln -s original.txt symlink.txt
```

If moved to another directory, link may break.

## ✅ Solution

Use absolute paths:

```bash
ln -s /home/toor/link_lab/original.txt symlink.txt
```

---

# 🔎 6️⃣ Accidental Removal of Both Links

## ❌ Problem

Deleted both hard link and original file accidentally.

## 📌 Cause

All inode references removed.

## ⚠️ Result

Data permanently deleted unless backup exists.

## ✅ Best Practice

- Use version control
- Maintain backups
- Avoid careless `rm -rf`

---

# 🔎 7️⃣ Cannot Create Hard Link to Directory

## ❌ Problem

```
Operation not permitted
```

## 📌 Cause

Linux restricts hard links for directories to prevent loops.

## ✅ Solution

Use symbolic links instead:

```bash
ln -s directory_name link_name
```

---

# 🔎 8️⃣ Symlink Appears but Doesn't Open

## ❌ Problem

```
Too many levels of symbolic links
```

## 📌 Cause

Circular symlink reference.

Example:

```
file1 -> file2
file2 -> file1
```

## ✅ Fix

Remove circular references:

```bash
rm file1 file2
```

Recreate correctly.

---

# 🔎 9️⃣ Inode Verification Confusion

## 📌 Remember

- Hard links share inode
- Symbolic links have their own inode

Check with:

```bash
stat filename
```

---

# 🔐 Security Considerations

- Be cautious with symlinks in shared directories
- Prevent symlink attacks in scripts
- Avoid following untrusted symlinks in automation
- Use `-P` or `-L` flags carefully with commands like `cp`, `rm`, or `tar`

---

# 📌 Lab Verification Checklist

✔ Hard link created  
✔ Inode numbers matched  
✔ Hard link survived deletion of original filename  
✔ Symbolic link created  
✔ Broken symlink behavior observed  
✔ Cross-filesystem limitation verified  
✔ Cross-filesystem symlink verified  

---

# 🏁 Final Result

Hard & Symbolic Link Management Successfully Implemented  
Ubuntu 24.04.1 LTS – EC2 Cloud Environment  

🔗 Filesystem Link Behavior Fully Understood & Validated
