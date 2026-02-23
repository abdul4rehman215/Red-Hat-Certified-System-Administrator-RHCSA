# 🎤 Interview Q&A: Lab 03: Using grep and Regular Expressions

---

## 1️⃣ What is `grep` used for in Linux?

`grep` is a command-line utility used to search for specific patterns or text within files.  
It prints lines that match the given pattern and is widely used in system administration, log analysis, and scripting.

---

## 2️⃣ What is the basic syntax of the `grep` command?

```bash
grep [options] "pattern" filename
````

Example:

```bash
grep "error" syslog.txt
```

---

## 3️⃣ What does the `-i` option do in grep?

The `-i` flag enables **case-insensitive searching**.

Example:

```bash
grep -i "error" logfile.txt
```

This will match `error`, `ERROR`, `Error`, etc.

---

## 4️⃣ What is the difference between `grep` and `grep -E`?

* `grep` → Uses basic regular expressions (BRE).
* `grep -E` → Enables extended regular expressions (ERE), allowing advanced patterns like:

  * `{}` quantifiers
  * `+`
  * `?`
  * `|`

Example:

```bash
grep -E "[0-9]{2}" file.txt
```

---

## 5️⃣ What does the `^` symbol mean in regex?

`^` matches the **beginning of a line**.

Example:

```bash
grep "^Feb" syslog.txt
```

Matches lines starting with `Feb`.

---

## 6️⃣ What does the `$` symbol represent?

`$` matches the **end of a line**.

Example:

```bash
grep "error$" logfile.txt
```

Matches lines ending with `error`.

---

## 7️⃣ What does the `-c` option do?

The `-c` flag counts the number of matching lines instead of displaying them.

Example:

```bash
grep -c "failed" syslog.txt
```

---

## 8️⃣ How can you search for multiple patterns?

Using extended regex with `|`:

```bash
grep -E "error|failed" syslog.txt
```

Or using multiple `-e` options:

```bash
grep -e "error" -e "failed" syslog.txt
```

---

## 9️⃣ How is grep used in log analysis?

`grep` is heavily used in cybersecurity and system administration to:

* Detect failed login attempts
* Search for error messages
* Extract timestamps
* Identify suspicious activity
* Filter security events

Example:

```bash
grep -i "denied" /var/log/syslog
```

---

## 🔟 What are character classes in regex?

Character classes define a set of characters to match.

Examples:

* `[aeiou]` → Matches any vowel
* `[0-9]` → Matches any digit
* `[A-Za-z]` → Matches any letter

Example:

```bash
grep "[0-9]{4}" file.txt
```

---

## 1️⃣1️⃣ Why is grep important for Red Hat certification and Linux administration?

Because it enables:

* Efficient log filtering
* Fast incident investigation
* Automation in shell scripts
* Pattern-based configuration validation
* Security auditing

It is one of the most frequently used tools in real-world Linux environments.

---

# ✅ Lab Knowledge Summary

After completing this lab, you should confidently:

* Use `grep` for basic text searching
* Apply regex patterns for advanced matching
* Analyze system logs efficiently
* Use grep as part of security investigations

---
