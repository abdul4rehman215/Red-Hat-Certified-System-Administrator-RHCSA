# 🎤 Interview Q&A - Lab 07: Creating and Editing Text Files (CentOS 7)

---

## 1️⃣ What is the difference between nano and vi?

| nano | vi |
|------|----|
| Beginner-friendly | Advanced editor |
| Shortcut-based interface | Modal editor |
| Easy to use | Powerful & scriptable |
| Good for quick edits | Preferred in production servers |

nano is simple and intuitive, while vi (or vim) is more powerful and widely used in enterprise Linux environments.

---

## 2️⃣ What are the different modes in vi?

vi has three primary modes:

1. **Command Mode** – Default mode for navigation and commands.
2. **Insert Mode** – Used to edit text (press `i` to enter).
3. **Last-Line Mode** – Used for save/quit operations (press `:`).

Example:

```bash
i      # Insert mode
Esc    # Back to command mode
:wq    # Save and quit
````

---

## 3️⃣ How do you delete a line in vi?

In command mode:

```bash
dd
```

This deletes the current line.

---

## 4️⃣ How do you save and exit vi?

```bash
:wq
```

Or:

```bash
:w
:q
```

---

## 5️⃣ What command shows file encoding type?

```bash
file filename.txt
```

Example output:

```
first_file.txt: ASCII text
```

---

## 6️⃣ What is the difference between LF and CRLF?

| Type          | Meaning                     | Used In    |
| ------------- | --------------------------- | ---------- |
| LF (`\n`)     | Line Feed                   | Linux/Unix |
| CRLF (`\r\n`) | Carriage Return + Line Feed | Windows    |

Incorrect line endings may cause:

* Script execution failures
* Git conflicts
* Configuration parsing errors

---

## 7️⃣ How do you convert DOS files to Unix format?

```bash
dos2unix filename.txt
```

Convert Unix to DOS:

```bash
unix2dos filename.txt
```

---

## 8️⃣ How can you detect trailing whitespace?

```bash
grep -n '[[:space:]]$' filename
```

Trailing spaces can break:

* YAML files
* Configuration files
* Automation scripts

---

## 9️⃣ What is the purpose of the `less` command?

`less` allows interactive viewing of large files.

Controls:

* `q` → Quit
* `/pattern` → Search
* `Space` → Scroll

Useful for viewing logs and large configs.

---

## 🔟 Why is text editing critical in Linux administration?

Because nearly all Linux configuration is file-based:

* `/etc/passwd`
* `/etc/ssh/sshd_config`
* Systemd service files
* Kubernetes YAML manifests
* Container configuration files

Mistakes in editing can break production systems.

---

## 1️⃣1️⃣ Why is ASCII text important?

ASCII text files:

* Are platform-independent
* Are compatible across systems
* Avoid binary corruption
* Work properly in shell scripts

---

## 1️⃣2️⃣ What are best practices when editing config files?

✔ Always backup before editing
✔ Validate syntax after editing
✔ Avoid trailing whitespace
✔ Maintain correct line endings
✔ Use version control for critical configs

---

# ✅ Lab Knowledge Summary

After completing this lab, I can confidently:

* Use nano for quick edits
* Use vi in enterprise environments
* Switch between vi modes
* Handle newline formatting
* Validate text file integrity
* Create clean configuration files

---

**📝 Text Editing & File Management Mastered**

End of Interview Q&A – Lab 07
