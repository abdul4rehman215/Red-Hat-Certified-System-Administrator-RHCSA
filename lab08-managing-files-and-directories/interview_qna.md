# 🎤 Interview Q&A - Lab 08: Managing Files and Directories (Ubuntu 24.04)

---

## 1️⃣ What does the `mkdir` command do?

`mkdir` creates directories.

Example:

```bash
mkdir lab_files
````

To create nested directories:

```bash
mkdir -p parent/child/grandchild
```

The `-p` option creates parent directories if they do not exist.

---

## 2️⃣ What is the difference between `rmdir` and `rm -r`?

| Command | Use Case                                            |
| ------- | --------------------------------------------------- |
| `rmdir` | Removes empty directories only                      |
| `rm -r` | Removes directories recursively (even if not empty) |

Example:

```bash
rmdir empty_dir
rm -r non_empty_dir
```

---

## 3️⃣ How does the `mv` command work?

`mv` is used to move or rename files and directories.

Move file:

```bash
mv file.txt /destination/
```

Rename file:

```bash
mv oldname.txt newname.txt
```

---

## 4️⃣ What does the `cp` command do?

`cp` copies files or directories.

Copy file:

```bash
cp file1.txt file2.txt
```

Copy directory recursively:

```bash
cp -r folder1 folder2
```

---

## 5️⃣ What is the purpose of wildcards?

Wildcards allow bulk file operations.

Examples:

```bash
rm *.txt
```

Deletes all `.txt` files.

```bash
touch file{1..5}.txt
```

Creates multiple files at once.

---

## 6️⃣ What is the difference between `rm` and `rm -r`?

* `rm` → Deletes files
* `rm -r` → Deletes directories and their contents

Use caution when using `-r`.

---

## 7️⃣ What is the difference between `rm -r` and `rm -rf`?

* `-r` → Recursive deletion
* `-f` → Force deletion (no prompts, ignores errors)

`rm -rf` is powerful and dangerous.
It should be used carefully in production environments.

---

## 8️⃣ How can you prevent accidental file deletion?

Use interactive mode:

```bash
rm -i filename
```

Or:

```bash
mv -i file destination
```

This prompts before overwriting or deleting.

---

## 9️⃣ Why is recursive deletion risky?

Because it:

* Removes entire directory structures
* Cannot be undone
* May cause service outages
* May delete system-critical files if misused

Always verify path before running `rm -r`.

---

## 🔟 What command helps visualize directory structures?

`tree`

```bash
tree directory_name
```

Useful for verifying nested structures.

---

## 1️⃣1️⃣ How does Linux treat file paths?

Linux paths are:

* Case-sensitive
* Structured hierarchically
* Rooted at `/`

Example:

```bash
/home/toor/lab_files
```

---

## 1️⃣2️⃣ Why are file management skills important in DevOps?

Because DevOps workflows require:

* Managing deployment directories
* Organizing container volumes
* Handling log rotation
* Managing build artifacts
* Maintaining backup structures

Improper file management can cause:

* Data loss
* Deployment failures
* Security exposure

---

# ✅ Lab Knowledge Summary

After completing this lab, I can confidently:

* Create nested directory structures
* Move and rename files
* Copy files and directories
* Safely delete files and directories
* Use wildcards for bulk operations
* Understand recursive operations and risks

---

**📁 File & Directory Management Mastered**

End of Interview Q&A – Lab 08
