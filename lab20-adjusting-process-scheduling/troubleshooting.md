# 🛠️ Troubleshooting Guide - Lab 20: Adjusting Process Scheduling

---

## 🔎 1️⃣ renice Fails with Permission Error

### ❌ Error
```
renice: failed to set priority: Permission denied
```

### 📌 Cause
Only root can decrease nice value (increase priority).

### ✅ Solution
Use sudo:

```
sudo renice -n -5 -p <PID>
```

---

## 🔎 2️⃣ nice Appears to Have No Effect

### 📌 Cause
- System not under heavy load
- Scheduler balancing evenly
- CPU cores sufficient for workload

### ✅ Verify Nice Value

```
ps -o pid,ni,comm -p <PID>
```

Check NI column in `top`.

---

## 🔎 3️⃣ Real-Time Scheduling Freezes System

### ❌ Problem
System becomes unresponsive after applying SCHED_FIFO.

### 📌 Cause
Real-time process monopolizing CPU.

### ✅ Fix

Switch TTY:
```
Ctrl + Alt + F3
```

Then:

```
sudo chrt -o -p 0 <PID>
```

Or kill process:

```
sudo kill -9 <PID>
```

Avoid high RT priority unless necessary.

---

## 🔎 4️⃣ htop Not Installed

### ❌ Error
```
htop: command not found
```

### ✅ Install

```
sudo apt update
sudo apt install -y htop
```

---

## 🔎 5️⃣ Cannot Increase Priority (Negative Nice Value)

### 📌 Cause
Regular users cannot assign negative nice values.

### ✅ Use sudo

```
sudo nice -n -5 command
```

---

## 🔎 6️⃣ CPU Still High After Lowering Priority

### 📌 Explanation
Nice value affects scheduling priority, not CPU usage limits.

### ✅ Alternative Solutions

- Use cgroups
- Apply CPUQuota in systemd
- Limit CPU with:
  ```
  cpulimit
  ```

---

## 🔎 7️⃣ Zombie Processes Appear

Check:

```
ps aux | grep Z
```

Zombie processes:
- Already terminated
- Waiting for parent process cleanup

Restart parent process if needed.

---

## 🔎 8️⃣ Process Won’t Stop

Try:

```
kill -15 <PID>
```

If still running:

```
kill -9 <PID>
```

If kernel thread → cannot be killed.

---

# 🔐 Best Practices

✔ Adjust priority before killing processes  
✔ Avoid unnecessary real-time scheduling  
✔ Always verify PID before modifying  
✔ Monitor impact after priority changes  
✔ Use production-safe scheduling strategies  

---

# 🏁 Final Status

Process scheduling, priority tuning, and advanced policy configuration validated successfully.

⚙️ Linux Scheduling Troubleshooting Verified
