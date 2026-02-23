# 🛠️ Troubleshooting Guide - Lab 19: CPU & Memory Intensive Processes

---

## 🔎 1️⃣ High CPU Usage but No Obvious Process

### ❌ Problem
System load is high, but no single process shows extreme CPU.

### 📌 Possible Causes
- Multiple moderate-load processes
- Kernel-level activity
- I/O wait

### ✅ Diagnose

Check load average:

```
uptime
```

Check CPU breakdown:

```
top
```

Look at:
- us (user)
- sy (system)
- wa (I/O wait)

---

## 🔎 2️⃣ kill Does Not Stop Process

### ❌ Problem
Process still running after `kill <PID>`

### 📌 Cause
Process ignoring SIGTERM.

### ✅ Solution

Force termination:

```
kill -9 <PID>
```

If still persists:
- Check if kernel thread
- Verify permissions

---

## 🔎 3️⃣ Permission Denied When Killing Process

### ❌ Error
```
Operation not permitted
```

### 📌 Cause
Process owned by root or another user.

### ✅ Fix

```
sudo kill <PID>
```

---

## 🔎 4️⃣ nice Command Has No Effect

### 📌 Cause
CPU scheduling depends on system load and scheduler.

### ✅ Verify Nice Value

Inside top:
- Check NI column

Or:

```
ps -o pid,ni,comm -p <PID>
```

---

## 🔎 5️⃣ renice Fails

### ❌ Error
```
Permission denied
```

### 📌 Cause
Only root can decrease nice value (increase priority).

### ✅ Use sudo

```
sudo renice -n -5 -p <PID>
```

---

## 🔎 6️⃣ killall Terminates Wrong Process

### 📌 Cause
Common process name matched unintentionally.

### ✅ Safer Approach

Preview first:

```
pgrep -l processname
```

Then terminate specific PID.

---

## 🔎 7️⃣ System Becomes Unresponsive

### 📌 Immediate Action

Switch TTY:

```
Ctrl + Alt + F3
```

Kill heavy process from alternate session.

If remote:
- Use SSH
- Restart if required

---

## 🔎 8️⃣ Zombie Processes Detected

Check for zombies:

```
ps aux | grep Z
```

Zombie processes:
- Already terminated
- Waiting for parent to collect exit status

Restart parent process if necessary.

---

# 🔐 Best Practices

✔ Always attempt SIGTERM before SIGKILL  
✔ Verify PID before killing  
✔ Avoid killing system-critical processes  
✔ Monitor before acting  
✔ Adjust priority instead of killing when appropriate  
✔ Investigate root cause of repeated high CPU  

---

# 🏁 Final Status

CPU monitoring, safe termination, and priority tuning validated successfully.

⚙️ Process Resource Troubleshooting Verified
