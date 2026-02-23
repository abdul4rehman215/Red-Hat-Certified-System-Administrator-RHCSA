# 🎤 Interview Q&A - Lab 04: Configuring User Permissions

---

### 1. What are the three permission classes in Linux?

Linux permissions are divided into:

- **User (u)** – The file owner
- **Group (g)** – The group associated with the file
- **Other (o)** – All other users

Each class can have:
- Read (r)
- Write (w)
- Execute (x)

---

### 2. What is the difference between `chown` and `chmod`?

- `chown` changes **ownership** (user and/or group).
- `chmod` changes **permission bits** (r, w, x).

Example:
```bash
chown root:developers file.txt
chmod 755 file.txt
````

---

### 3. Explain numeric permission 755.

755 = rwxr-xr-x

* User: 7 → 4+2+1 → rwx
* Group: 5 → 4+1 → r-x
* Other: 5 → 4+1 → r-x

Commonly used for executable files and directories.

---

### 4. Why must directories have execute (x) permission?

For directories:

* Read (r) → list contents
* Execute (x) → enter/access directory
* Write (w) → create/delete files inside

Without execute permission, you cannot access the directory even if you can see it.

---

### 5. What does the `+` symbol mean in `ls -l` output?

Example:

```
-rw-rw-r--+ file.txt
```

The `+` indicates that **ACLs are applied** to the file.

---

### 6. What are ACLs and why are they used?

ACL (Access Control List) allows assigning permissions to:

* Specific users
* Specific groups

Beyond the traditional owner/group/other model.

Useful in:

* Shared project environments
* Multi-team collaboration
* Fine-grained security control

---

### 7. How do you set default ACLs on a directory?

```bash
setfacl -d -m u:username:rw directory/
```

Default ACLs apply to:

* New files
* New subdirectories created inside

---

### 8. What is the SGID bit on a directory?

When set on a directory:

```bash
chmod 2775 directory/
```

It ensures:

* New files inherit the directory’s group
* Useful for shared team folders

---

### 9. How do you recursively fix permissions properly?

Incorrect:

```bash
chmod -R 644 folder/
```

Correct:

```bash
find folder/ -type d -exec chmod 755 {} \;
find folder/ -type f -exec chmod 644 {} \;
```

---

### 10. What is the mask entry in ACL?

The mask defines the **maximum effective permission** for:

* Named users
* Named groups

Even if ACL shows rwx, mask may limit it.

---

### 11. How do you remove all ACL entries from a file?

```bash
setfacl -b filename
```

---

### 12. How do you copy ACLs from one file to another?

```bash
getfacl source.txt | setfacl --set-file=- target.txt
```

---

### 13. Why is 777 dangerous?

`777 = rwxrwxrwx`

It allows:

* Anyone to modify
* Anyone to execute
* Anyone to delete

Security risk in production environments.

---

### 14. What permission should configuration files usually have?

Typically:

```
600
```

Only owner can read/write.

Example:

```bash
chmod 600 config.conf
```

---

### 15. When would you use ACL instead of traditional permissions?

Use ACL when:

* Multiple users need different permissions
* Access cannot be solved using group membership alone
* Complex collaboration scenarios exist
