# 🛠 Troubleshooting Guide – Lab 02: Using Input-Output Redirection

---

## 📌 Overview

This guide documents common issues encountered while working with:

- Output redirection (`>`, `>>`)
- Pipes (`|`)
- Error redirection (`2>`)
- Combined streams (`&>`)
- Grouped commands (`{ }`)
- Podman container execution errors

Each issue includes:

- ❌ Problem  
- 🔎 Possible Cause  
- ✅ Resolution  

---

## 1️⃣ File Not Created After Using `>`

### ❌ Problem
```

echo "Hello" > greeting.txt

```
But file does not appear.

### 🔎 Cause
- Current directory is not writable.
- User lacks permission.
- Wrong directory context.

### ✅ Resolution
Check directory:
```

pwd
ls -ld .

```

If permissions are restricted:
```

sudo echo "Hello" > greeting.txt

```

Or move to writable directory:
```

cd ~

```

---

## 2️⃣ File Content Accidentally Overwritten

### ❌ Problem
Old content lost after:
```

echo "New content" > greeting.txt

```

### 🔎 Cause
`>` overwrites existing file content.

### ✅ Resolution
Use append operator:
```

echo "Additional line" >> greeting.txt

```

Prevent overwrite:
```

set -o noclobber

```

---

## 3️⃣ Pipe Produces Unexpected Results

### ❌ Problem
```

ps aux | grep podman | wc -l

```
Returns `2` when only one process exists.

### 🔎 Cause
The `grep` command itself is counted.

### ✅ Resolution
Use refined filtering:
```

ps aux | grep podman | grep -v grep | wc -l

```

Or:
```

pgrep podman | wc -l

```

---

## 4️⃣ `grep` Returns No Output

### ❌ Problem
```

ls -l | grep greeting

```
Returns nothing.

### 🔎 Cause
- File name does not match.
- Case sensitivity issue.

### ✅ Resolution
Check file list:
```

ls -l

```

Use case-insensitive search:
```

ls -l | grep -i greeting

```

---

## 5️⃣ Error Redirection Not Capturing Errors

### ❌ Problem
```

ls /invalid > error.log

```
Error still shows on screen.

### 🔎 Cause
Only stdout is redirected. Errors go to stderr.

### ✅ Resolution
Redirect stderr explicitly:
```

ls /invalid 2> error.log

```

---

## 6️⃣ Combined Redirection Not Working

### ❌ Problem
```

ls /invalid &> combined.log

```
Does not behave as expected in older shells.

### 🔎 Cause
`&>` is Bash-specific.

### ✅ Resolution
Use portable alternative:
```

ls /invalid > combined.log 2>&1

```

---

## 7️⃣ Output and Error Mixed Unexpectedly

### ❌ Problem
Combined output file has unexpected order.

### 🔎 Cause
Command execution order and buffering.

### ✅ Resolution
Use explicit ordering:
```

command > file 2>&1

```

Ensure redirection is in correct sequence.

---

## 8️⃣ `/dev/null` Not Discarding Output

### ❌ Problem
Errors still visible after:
```

ls /invalid 2> /dev/null

```

### 🔎 Cause
Only stderr discarded; stdout still active.

### ✅ Resolution
Discard both streams:
```

ls /invalid > /dev/null 2>&1

```

---

## 9️⃣ Podman Container Exits with Code 1

### ❌ Problem
```

podman run --name testcontainer alpine /bin/false

```
Returns exit code 1.

### 🔎 Cause
`/bin/false` intentionally exits with status 1.

### ✅ Resolution
Verify exit status:
```

echo $?

```

Check logs:
```

podman logs testcontainer

```

---

## 🔟 Grouped Command Redirection Fails

### ❌ Problem
```

{
echo "Report"
date
} > report.txt

```
Syntax error occurs.

### 🔎 Cause
Missing space or improper brace usage.

### ✅ Resolution
Correct syntax:
```

{
echo "Report"
date
} > report.txt

```

Ensure:
- Space after `{`
- Space before `}`

---

## 1️⃣1️⃣ `wc -l` Gives Incorrect Count

### ❌ Problem
Line count differs from expected.

### 🔎 Cause
Trailing newline behavior.

### ✅ Resolution
Verify file content:
```

cat -n file.txt

```

Ensure newline formatting is correct.

---

## 1️⃣2️⃣ Podman Image Filtering Not Working

### ❌ Problem
```

podman images | grep -v "<none>"

```
Returns nothing.

### 🔎 Cause
No images available.

### ✅ Resolution
Pull image:
```

podman pull alpine

```

Then retry command.

---

# 📘 Best Practices Learned

- Always separate stdout and stderr in scripts.
- Use append (`>>`) for logs.
- Use `/dev/null` carefully.
- Group commands for structured reports.
- Validate exit codes using `echo $?`.
- Always verify output files using `cat`.

---

# 🏁 Lab 02 Troubleshooting Summary

All commands executed successfully.

This lab reinforced:

- Stream handling awareness
- Error logging discipline
- Container error debugging
- Structured command grouping
- Production-level redirection practices

These concepts are critical for:

- RHCSA exam success
- Containerized environments
- OpenShift deployments
- DevOps automation pipelines

---
