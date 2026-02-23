# 🎓 Interview Q&A – Lab 21: Introduction to Linux Essentials

---

## 1️⃣ What is the purpose of the `pwd` command?

`pwd` (Print Working Directory) displays the absolute path of the current working directory. It helps administrators understand their current location within the filesystem hierarchy.

---

## 2️⃣ What is the difference between `ls`, `ls -l`, and `ls -la`?

- `ls` → Lists visible files and directories.
- `ls -l` → Displays detailed information including permissions, ownership, size, and timestamps.
- `ls -la` → Shows all files, including hidden files (starting with `.`), in long format.

---

## 3️⃣ What are hidden files in Linux?

Hidden files begin with a dot (`.`), such as `.bashrc`. These files typically store configuration settings for applications and the shell.

They are displayed using:

```bash
ls -a
````

---

## 4️⃣ What is the difference between absolute and relative paths?

* **Absolute path**: Starts from root (`/`) and defines the complete location.
  Example: `/usr/bin`

* **Relative path**: Defined relative to the current directory.
  Example: `../share`

Absolute paths are location-independent, while relative paths depend on the current directory.

---

## 5️⃣ What does the root directory (`/`) represent in Linux?

The root directory (`/`) is the top-level directory in Linux. All files and directories branch from it.

It contains essential system directories such as:

* `/bin`
* `/etc`
* `/home`
* `/usr`
* `/var`

---

## 6️⃣ Why does `man cd` return "No manual entry for cd"?

`cd` is a shell built-in command, not a standalone binary.

To view its documentation, use:

```bash
help cd
```

---

## 7️⃣ What is the purpose of the `/etc` directory?

`/etc` contains system-wide configuration files.
Examples:

* `/etc/passwd`
* `/etc/fstab`
* `/etc/ssh/sshd_config`

It is critical for system configuration management.

---

## 8️⃣ What is the difference between `/bin` and `/usr/bin`?

* `/bin` → Essential system binaries required for boot and basic system operation.
* `/usr/bin` → User-level command binaries and additional utilities.

Both contain executable programs, but `/bin` is more critical for system recovery scenarios.

---

## 9️⃣ What does the `whatis` command do?

`whatis` provides a short description of a command from the manual database.

Example:

```bash
whatis ls
```

Output:

```
ls (1) - list directory contents
```

---

## 🔟 What is the purpose of `apropos`?

`apropos` searches manual page descriptions for keywords.

Example:

```bash
apropos directory
```

This helps find commands related to a specific topic.

---

## 1️⃣1️⃣ What does the `file` command do?

The `file` command determines the type of a file by analyzing its content.

Example:

```bash
file .bashrc
```

Output:

```
.bashrc: ASCII text
```

---

## 1️⃣2️⃣ Why is terminal navigation important for RHCSA?

The RHCSA exam is entirely command-line based.

Candidates must:

* Navigate directories quickly
* Manage files efficiently
* Access documentation without internet access
* Understand system hierarchy

Terminal fluency is essential for success in RHCSA practical exams.

---

## 📌 Summary

This lab builds the foundation required for:

* System administration
* File management
* Documentation lookup
* Efficient command-line workflow

Mastery of these basics is critical before advancing to user management, permissions, and service configuration tasks.

---

🎯 RHCSA Focus: Terminal Proficiency & Filesystem Understanding
