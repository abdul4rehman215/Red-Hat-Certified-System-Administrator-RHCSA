# 🧠 Interview Q&A – Lab 02: Using Input-Output Redirection

---

## 1️⃣ What is standard output (stdout) in Linux?

Standard output (stdout) is the default output stream where command results are displayed. By default, stdout is directed to the terminal.

---

## 2️⃣ What is standard error (stderr)?

Standard error (stderr) is a separate output stream used specifically for error messages. It allows errors to be handled independently from normal command output.

---

## 3️⃣ What does the `>` operator do?

The `>` operator redirects standard output to a file.  
If the file exists, it overwrites the content.  
If the file does not exist, it creates it.

Example:
```

echo "data" > file.txt

```

---

## 4️⃣ What does `>>` do?

`>>` appends output to a file instead of overwriting it.

Example:
```

echo "new line" >> file.txt

```

This preserves existing content.

---

## 5️⃣ What is a pipe (`|`) in Linux?

A pipe takes the standard output of one command and passes it as standard input to another command.

Example:
```

ls -l | grep ".txt"

```

This filters the output of `ls`.

---

## 6️⃣ Why would you use `wc -l` in combination with a pipe?

`wc -l` counts lines.  
It is commonly used with pipes to count:

- Number of files
- Number of processes
- Number of log entries

Example:
```

ps aux | grep podman | wc -l

```

---

## 7️⃣ How do you redirect only error messages?

Use `2>` to redirect stderr.

Example:
```

ls /invalid 2> error.log

```

Errors are stored in `error.log`.

---

## 8️⃣ How do you redirect stdout and stderr separately?

```

command > output.log 2> error.log

```

This keeps normal output and errors in different files.

---

## 9️⃣ How do you combine stdout and stderr into one file?

Use `&>`:

```

command &> combined.log

```

This redirects both streams into one file.

---

## 🔟 What is `/dev/null` used for?

`/dev/null` is a special device file that discards all data written to it.

Example:
```

ls /invalid 2> /dev/null

```

The error is suppressed.

---

## 1️⃣1️⃣ Why is redirection important in automation?

Redirection allows:

- Logging command output
- Capturing errors for debugging
- Building structured reports
- Creating reproducible system audits

It is fundamental in shell scripting and DevOps workflows.

---

## 1️⃣2️⃣ What is the purpose of grouping commands with `{ }`?

Grouping allows multiple commands to be executed together and redirected as one unit.

Example:
```

{
date
free -h
df -h
} > report.txt

```

This generates a structured report.

---

## 1️⃣3️⃣ Why separate stdout and stderr in production systems?

Separating them allows:

- Cleaner logging
- Better debugging
- Easier monitoring
- Reduced noise in reports

It is especially useful in container environments and automation pipelines.

---

## 1️⃣4️⃣ How does redirection relate to RHCSA certification?

RHCSA tasks are command-line based. You must:

- Capture logs
- Redirect output
- Debug errors
- Write scripts

Understanding redirection is essential for passing performance-based exams.

---

## 1️⃣5️⃣ How is redirection useful in container environments like Podman?

Redirection helps:

- Capture container failure logs
- Debug image issues
- Record runtime errors
- Generate container inventory reports

This is critical in OpenShift and enterprise container platforms.

---
which are essential for RHCSA and enterprise Linux roles.

---
