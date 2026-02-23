# 🎤 Interview Q&A – Lab 01: Understanding Shell Basics

---

## 1️⃣ What is a shell in Linux?

A shell is a command-line interpreter that allows users to interact with the operating system. It takes user input (commands), processes them, and communicates with the kernel to execute those commands.

---

## 2️⃣ What is the general structure of a shell command?

Shell commands follow this structure:

```

command [options] [arguments]

```

- **Command** → The program to execute  
- **Options** → Modify command behavior (e.g., `-l`)  
- **Arguments** → Target objects such as files or directories  

Example:
```

ls -l /home

```

---

## 3️⃣ What is the difference between `ls`, `ls -l`, and `ls -a`?

- `ls` → Lists files in the current directory.
- `ls -l` → Displays detailed information (permissions, owner, size, timestamp).
- `ls -a` → Shows hidden files (files starting with `.`).

---

## 4️⃣ What does the `pwd` command do?

`pwd` (Print Working Directory) displays the absolute path of the current directory.

Example output:
```

/home/toor

```

---

## 5️⃣ What is the difference between absolute and relative paths?

- **Absolute path** → Starts from root `/` (e.g., `/home/toor`)
- **Relative path** → Based on current directory (e.g., `Documents/`)

Absolute paths are independent of current location.

---

## 6️⃣ What does `cd ..` do?

`cd ..` moves one directory level up in the directory hierarchy.

Example:
```

/tmp → cd .. → /

```

---

## 7️⃣ What is output redirection in Linux?

Output redirection allows saving command output into a file.

- `>` → Overwrites file
- `>>` → Appends to file

Example:
```

ls -l > file.txt

```

---

## 8️⃣ What is input redirection?

Input redirection uses file content as input to a command.

Example:
```

sort < names.txt

```

The file content becomes the input stream for the command.

---

## 9️⃣ What is a pipe (`|`) in Linux?

A pipe passes the output of one command as input to another command.

Example:
```

ls -l | grep ".txt"

```

This filters output from `ls -l` using `grep`.

---

## 🔟 What does `ls -lh` do?

`-h` displays file sizes in human-readable format (KB, MB).

Example:
```

4.0K
384

```

Instead of raw bytes.

---

## 1️⃣1️⃣ What are hidden files in Linux?

Hidden files begin with a dot (`.`).

Examples:
```

.bashrc
.profile
.bash_history

```

They are usually configuration files.

---

## 1️⃣2️⃣ What happens if you use `>` on an existing file?

It overwrites the file content completely.

To prevent data loss, use `>>` instead.

---

## 1️⃣3️⃣ Why is understanding shell basics important for RHCSA?

Because RHCSA is entirely command-line based. Tasks such as:

- User management
- Service configuration
- Networking
- File permissions
- Storage management

All require strong shell fundamentals.

---

## 1️⃣4️⃣ What is the difference between a command and a built-in command?

- **External command** → Located in `/bin`, `/usr/bin`, etc.
- **Built-in command** → Part of the shell itself (e.g., `cd`)

You can check using:
```

type cd

```

---

## 1️⃣5️⃣ How does redirection improve automation?

Redirection enables:

- Logging output to files
- Feeding files into scripts
- Combining multiple commands
- Creating automated workflows

It is essential for scripting and system administration.

---
