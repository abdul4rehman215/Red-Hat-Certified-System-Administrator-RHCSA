# 🎤 Interview Questions - Lab 19: Identifying & Killing CPU/Memory Intensive Processes

---

## 🔹 1️⃣ What is the difference between top and ps?

- **top** → Real-time dynamic monitoring tool
- **ps** → Static snapshot of current processes

top is interactive, while ps is script-friendly.

---

## 🔹 2️⃣ How do you find the highest CPU-consuming processes?

```
ps aux --sort=-%cpu | head
```

Or inside `top`:
- Press `P` to sort by CPU.

---

## 🔹 3️⃣ How do you find the highest memory-consuming processes?

```
ps aux --sort=-%mem | head
```

Or inside `top`:
- Press `M` to sort by memory.

---

## 🔹 4️⃣ What is the difference between kill and kill -9?

- `kill` → Sends SIGTERM (15) – graceful shutdown
- `kill -9` → Sends SIGKILL (9) – immediate termination

Best practice: Always try SIGTERM first.

---

## 🔹 5️⃣ What does killall do?

`killall` terminates all processes with a given name.

Example:
```
killall stress
```

---

## 🔹 6️⃣ What is a nice value?

Nice value controls process priority:

- Range: **-20 (highest priority)** to **19 (lowest priority)**
- Default: 0

Higher nice value → Lower CPU priority.

---

## 🔹 7️⃣ How do you start a process with low priority?

```
nice -n 19 command
```

---

## 🔹 8️⃣ How do you change priority of a running process?

```
sudo renice -n 10 -p <PID>
```

---

## 🔹 9️⃣ What does the NI column mean in top?

NI = Nice value  
It shows scheduling priority adjustment.

---

## 🔹 🔟 What would you do if a server is slow due to high CPU usage?

Expected approach:

1. Check load average using:
   ```
   uptime
   ```
2. Identify heavy processes using:
   ```
   top
   ```
3. Attempt graceful termination
4. Adjust priority if necessary
5. Investigate root cause

---

# 💡 Real-World Scenario Question

**Scenario:**  
A production server CPU usage suddenly spikes to 100%. What steps would you take?

Expected Answer Structure:
- Check top
- Identify PID
- Verify process legitimacy
- Attempt SIGTERM
- Escalate to SIGKILL if needed
- Check logs for root cause

---

# 🏁 Interview Readiness

After this lab, I can confidently explain:

- Linux process scheduling
- CPU and memory diagnostics
- Safe process termination strategies
- Production troubleshooting methodology

⚙️ Linux Process Management – Interview Ready
