# 🎯 Interview Q&A - Lab 11: Linux System Documentation (man, info, apropos, /usr/share/doc)

---

## 1️⃣ What is the purpose of the `man` command?

The `man` command displays the manual page for a command, configuration file, or system call. It provides detailed documentation including usage, options, and descriptions.

Example:

```bash
man ls
```

---

## 2️⃣ What do the numbers in `man 5 passwd` represent?

Manual pages are divided into sections:

| Section | Description |
|----------|-------------|
| 1 | User commands |
| 2 | System calls |
| 3 | Library functions |
| 4 | Special files |
| 5 | File formats |
| 6 | Games |
| 7 | Miscellaneous |
| 8 | System administration |

`man 5 passwd` refers to the file format documentation of `/etc/passwd`.

---

## 3️⃣ How do you search for a keyword inside a man page?

Inside `man`:

```
/keyword
```

Press:

```
n
```

to move to the next match.

---

## 4️⃣ What does `man -k` do?

Searches the manual page descriptions for a keyword.

Example:

```bash
man -k network
```

Equivalent to:

```bash
apropos network
```

---

## 5️⃣ What is the difference between `man` and `info`?

| man | info |
|-----|------|
| Traditional manual pages | Structured GNU documentation |
| Linear text | Hyperlinked structure |
| Simpler navigation | Menu-based navigation |

---

## 6️⃣ How do you update the manual page database?

```bash
sudo mandb
```

This rebuilds the manual page index.

---

## 7️⃣ What does the `--help` flag provide?

A quick summary of command usage and options.

Example:

```bash
grep --help
```

It provides concise documentation without opening the full manual.

---

## 8️⃣ Where is package documentation stored?

Most package documentation is located in:

```
/usr/share/doc/
```

Each installed package typically has its own directory.

---

## 9️⃣ How do you view documentation for a specific package?

Example:

```bash
ls /usr/share/doc/bash-4.2.46
less /usr/share/doc/bash-4.2.46/README
```

---

## 🔟 What is `apropos` used for?

`apropos` searches the man page database for commands related to a keyword.

Example:

```bash
apropos passwd
```

---

## 1️⃣1️⃣ How do you install additional documentation?

On CentOS:

```bash
sudo yum install package-name-doc
```

Example:

```bash
sudo yum install httpd-manual
```

---

## 1️⃣2️⃣ Why is knowing system documentation important for Linux administrators?

- Troubleshooting production systems  
- Understanding configuration formats  
- Exam preparation (RHCSA/RHCE)  
- Working without internet access  
- Debugging service failures  

---

## 1️⃣3️⃣ How can you determine which manual section to use?

Use:

```bash
man -f command
```

This shows available sections.

---

## 1️⃣4️⃣ What is the benefit of using documentation instead of internet searches?

- Works offline  
- Official and accurate  
- Version-specific  
- Faster troubleshooting in restricted environments  

---

## 1️⃣5️⃣ How does documentation knowledge improve security?

- Understanding configuration parameters  
- Avoiding misconfigurations  
- Proper service hardening  
- Knowing secure command options  

---

# 🏁 Interview Summary

Mastering system documentation demonstrates:

- Self-sufficiency
- Strong troubleshooting skills
- Deep understanding of Linux internals
- Readiness for enterprise environments
- RHCSA-level competence

---

📚 System Documentation Skills Successfully Validated  
CentOS Linux 7 – EC2 Environment
