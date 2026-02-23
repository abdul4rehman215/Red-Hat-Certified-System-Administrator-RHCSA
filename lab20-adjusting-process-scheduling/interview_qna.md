# 🎤 Interview Q&A - Lab 20: Adjusting Process Scheduling

---

## 🔹 1️⃣ What is process scheduling in Linux?

Process scheduling is the mechanism by which the Linux kernel decides which process gets CPU time and for how long.

The scheduler ensures fair CPU distribution and system responsiveness.

---

## 🔹 2️⃣ What is a nice value?

The nice value determines process priority.

- Range: **-20 (highest priority)** to **19 (lowest priority)**
- Default value: 0
- Higher nice value → Lower CPU priority

---

## 🔹 3️⃣ How do you start a process with a custom priority?

```
nice -n 10 command
```

---

## 🔹 4️⃣ How do you change priority of a running process?

```
sudo renice -n 5 -p <PID>
```

---

## 🔹 5️⃣ What is the difference between PRI and NI in top?

- **NI** → Nice value (user-controlled priority adjustment)
- **PRI** → Kernel-calculated scheduling priority

PRI is dynamically calculated based on NI and scheduler behavior.

---

## 🔹 6️⃣ What are common Linux process states?

| State | Meaning |
|-------|---------|
| R     | Running |
| S     | Sleeping |
| D     | Uninterruptible sleep |
| Z     | Zombie |

---

## 🔹 7️⃣ What is SCHED_FIFO?

SCHED_FIFO is a real-time scheduling policy.

- First-In, First-Out execution
- No time slicing
- Higher priority real-time tasks run before normal tasks
- Requires root privileges

---

## 🔹 8️⃣ What is the command used to modify scheduling policy?

```
chrt
```

Example:

```
sudo chrt -f -p 99 <PID>
```

---

## 🔹 9️⃣ When should real-time scheduling be used?

Real-time scheduling is appropriate for:

- Audio/video processing
- Industrial control systems
- Real-time data acquisition
- Critical infrastructure applications

It should NOT be used casually on production servers.

---

## 🔹 🔟 What would you do if one process is starving others?

Expected approach:

1. Identify process using `top`
2. Check nice value
3. Lower priority using `renice`
4. If necessary, terminate process
5. Investigate root cause

---

# 💡 Real-World Scenario Question

**Scenario:**  
A CI/CD runner machine becomes slow during builds. CPU is 100%. What do you do?

Expected approach:
- Check process list
- Identify build process
- Adjust nice value instead of killing
- Limit CPU usage using cgroups or systemd CPUQuota
- Monitor impact

---

# 🏁 Interview Readiness

After this lab, you can confidently explain:

- Linux scheduling fundamentals
- Nice value mechanics
- Real-time vs normal scheduling
- Performance tuning strategy
- Production stability considerations

⚙️ Linux Scheduling & Priority Management – Interview Ready
