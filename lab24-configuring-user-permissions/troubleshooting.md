# 🛠️ Troubleshooting Guide - Lab 04: Configuring User Permissions

---

## Issue 1: Permission Denied Error

### Problem
```bash
./script.sh
-bash: ./script.sh: Permission denied
````

### Cause

Execute permission is not set.

### Fix

```bash
chmod u+x script.sh
```

Verify:

```bash
ls -l script.sh
```

---

## Issue 2: Cannot Access Directory Even With Read Permission

### Problem

```bash
ls directory/
Permission denied
```

### Cause

Directory does not have execute (x) permission.

### Explanation

For directories:

* r → list files
* x → enter directory
* w → create/delete files

Without execute permission, access fails.

### Fix

```bash
chmod 755 directory/
```

---

## Issue 3: Ownership Change Fails

### Problem

```bash
chown root file.txt
Operation not permitted
```

### Cause

You are not root or using sudo.

### Fix

```bash
sudo chown root file.txt
```

Verify:

```bash
ls -l file.txt
```

---

## Issue 4: Group Does Not Exist

### Problem

```bash
chown :developers file.txt
chown: invalid group: 'developers'
```

### Cause

The group has not been created.

### Fix

```bash
sudo groupadd developers
sudo chown :developers file.txt
```

Verify:

```bash
getent group developers
```

---

## Issue 5: Recursive chmod Breaks Directory Access

### Problem

```bash
chmod -R 644 folder/
ls folder/subdir
Permission denied
```

### Cause

Directories lost execute permission.

### Fix Properly

```bash
find folder/ -type d -exec chmod 755 {} \;
find folder/ -type f -exec chmod 644 {} \;
```

---

## Issue 6: ACL Not Appearing

### Problem

ACL commands executed but no effect seen.

### Check ACL Tools

```bash
which setfacl
which getfacl
```

If missing:

```bash
sudo yum install -y acl
```

---

## Issue 7: Filesystem ACL Support Question

### Check Filesystem

```bash
mount | grep acl
```

On XFS (CentOS default), ACL is enabled by default even if not shown explicitly.

---

## Issue 8: ACL Permissions Not Working As Expected

### Cause

Mask may be restricting permissions.

Check:

```bash
getfacl filename
```

Look for:

```
mask::r--
```

### Fix

```bash
setfacl -m m:rwx filename
```

---

## Issue 9: Remove All ACLs

### Problem

Need to revert to standard permissions.

### Fix

```bash
setfacl -b filename
```

Verify:

```bash
getfacl filename
```

---

## Issue 10: Shared Directory Not Inheriting Group

### Cause

SGID bit not set.

### Fix

```bash
chmod 2775 shared_folder
```

Verify:

```bash
ls -ld shared_folder
```

Look for:

```
drwxrwsr-x
```

---

## Issue 11: Cannot Modify File Even With ACL Set

### Check:

1. File ownership
2. Parent directory permissions
3. Effective mask
4. User group membership

Commands:

```bash
whoami
groups
ls -l filename
getfacl filename
ls -ld parent_directory
```

---

## Best Practice Reminders

* Never use 777 in production
* Always apply directory and file permissions separately
* Use SGID for shared team folders
* Use ACLs for complex multi-user scenarios
* Verify effective permissions with getfacl
* Regularly audit file ownership and permissions

---

