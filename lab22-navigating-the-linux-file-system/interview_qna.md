# 🎓 Interview Q&A – Lab 22: Navigating the Linux File System

---

## 1️⃣ What is the Linux filesystem hierarchy?

Linux follows a hierarchical tree structure starting from the root directory `/`.

All directories branch from `/`, such as:

- `/etc` → configuration files  
- `/var` → variable data (logs, spool files)  
- `/usr` → user binaries and libraries  
- `/home` → user directories  
- `/bin` → essential system binaries  

---

## 2️⃣ What is the difference between absolute and relative paths?

| Absolute Path | Relative Path |
|--------------|--------------|
| Starts with `/` | Does not start with `/` |
| Works from anywhere | Works relative to current directory |
| Example: `/home/centos/file.txt` | Example: `../documents/file.txt` |

Absolute paths are safer for scripting.  
Relative paths are shorter and faster for manual navigation.

---

## 3️⃣ What does the `find` command do?

`find` searches the filesystem in real-time.

Example:

```bash
find ~/lab2 -name "*.txt"
````

It supports:

* name-based search
* time-based search
* size-based search
* permission filters
* execution of commands using `-exec`

---

## 4️⃣ What is the difference between `find` and `locate`?

| find                 | locate                    |
| -------------------- | ------------------------- |
| Real-time search     | Uses a pre-built database |
| Slower               | Very fast                 |
| No database required | Requires `updatedb`       |

`locate` is faster but may not show very recent files unless the database is updated.

---

## 5️⃣ Why did `sudo` initially fail in the lab?

The minimal CentOS image did not have `sudo` installed.

Resolution:

```bash
su -
yum install -y mlocate sudo
```

This demonstrates real-world troubleshooting in minimal installations.

---

## 6️⃣ What is the purpose of `which`?

`which` shows the full path of an executable based on the PATH variable.

Example:

```bash
which bash
```

Output:

```
/usr/bin/bash
```

This helps verify which binary will execute.

---

## 7️⃣ What is the PATH environment variable?

PATH is a list of directories where the shell searches for executables.

Display it using:

```bash
echo $PATH
```

You can temporarily modify it:

```bash
export PATH=$PATH:~/lab2/scripts
```

---

## 8️⃣ What does `cd -` do?

`cd -` switches to the previous directory.

It is extremely useful when toggling between two working directories during administrative tasks.

---

## 9️⃣ How can you suppress permission errors while using find?

Use output redirection:

```bash
find /etc -name "*.conf" 2>/dev/null
```

`2>/dev/null` redirects error messages (stderr) to null.

---

## 🔟 How do you find executable files in a directory?

```bash
find ~/lab2 -type f -executable
```

This filters only executable regular files.

---

## 1️⃣1️⃣ How do you find files modified recently?

Example (last day):

```bash
find ~/lab2 -mtime -1
```

`-mtime -1` means modified within the last 24 hours.

---

## 1️⃣2️⃣ What is the purpose of `readlink -f`?

`readlink -f` prints the absolute canonical path of a file.

Used in combination with find:

```bash
find ~/lab2 -name "*.txt" -exec readlink -f {} \;
```

---

## 1️⃣3️⃣ Why is understanding filesystem navigation important for RHCSA?

The RHCSA exam is fully command-line based.

Candidates must:

* Locate configuration files quickly
* Navigate efficiently
* Use absolute paths in scripting
* Troubleshoot path-related errors

Navigation errors during the exam can cause major time loss.

---

## 📌 Summary

This lab strengthens:

* Filesystem structure understanding
* Efficient navigation
* File discovery skills
* PATH and executable resolution knowledge
* Troubleshooting capabilities in minimal installations

These skills are foundational for system administration, security operations, and RHCSA certification success.

---

🎯 RHCSA Focus: Filesystem Navigation & File Discovery Tools
