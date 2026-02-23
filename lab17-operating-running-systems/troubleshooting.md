# 🛠️ Troubleshooting Guide - Lab 17: Operating Running Systems (Ubuntu 24.04)

---

## 🔎 1️⃣ System Not Rebooting

### ❌ Problem
`sudo reboot` does not respond.

### 📌 Possible Causes
- Insufficient privileges
- SSH session issue
- System service failure

### ✅ Solutions

Check sudo access:

```
sudo -l
```

Force reboot (use cautiously):

```
sudo systemctl reboot
```

---

## 🔎 2️⃣ Scheduled Shutdown Not Cancelling

### ❌ Problem
System still shuts down after running `shutdown -c`.

### 📌 Cause
Shutdown not properly cancelled.

### ✅ Verify

Check pending shutdown:

```
who -r
```

Cancel again:

```
sudo shutdown -c
```

---

## 🔎 3️⃣ top Showing High CPU Usage

### 📌 Cause
A process consuming CPU.

### ✅ Identify

In `top`:
- Press `P` to sort by CPU
- Note PID

Terminate if necessary:

```
kill -15 <PID>
```

Only use:

```
kill -9 <PID>
```

If process does not respond.

---

## 🔎 4️⃣ Cannot Kill a Process

### ❌ Problem
```
Operation not permitted
```

### 📌 Cause
Process owned by another user (e.g., root).

### ✅ Solution

```
sudo kill -15 <PID>
```

---

## 🔎 5️⃣ Zombie Process Appears

### 📌 Cause
Child process terminated but parent has not collected exit status.

### ✅ Check

```
ps aux | grep Z
```

Usually resolved by restarting parent process.

---

## 🔎 6️⃣ htop Not Installed

### ❌ Problem
```
htop: command not found
```

### ✅ Install

```
sudo apt update
sudo apt install -y htop
```

---

## 🔎 7️⃣ pkill Terminates Wrong Processes

### 📌 Cause
Broad process name matching.

### ✅ Safer Usage

Preview first:

```
pgrep -l sleep
```

Then:

```
pkill sleep
```

Avoid `-9` unless necessary.

---

## 🔎 8️⃣ System Load Very High

### 📌 Check Load Average

```
uptime
```

If load > number of CPU cores:

- Identify heavy processes
- Check memory usage
- Investigate disk I/O

---

# 🔐 Best Practices for Running Systems

✔ Use SIGTERM before SIGKILL  
✔ Avoid killing system-critical processes  
✔ Monitor before acting  
✔ Use htop for safe interactive management  
✔ Schedule shutdowns carefully in production  
✔ Always confirm PID before termination  

---

# 🏁 Final Status

System power operations, monitoring, and process control validated successfully.

🖥️ Running System Troubleshooting Verified
