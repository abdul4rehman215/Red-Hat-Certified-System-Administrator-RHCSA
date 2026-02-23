# 🧪 Lab 40: Managing and Troubleshooting Services

## 📌 Overview

This lab focuses on **real-world Linux service management and troubleshooting** using:

- `systemctl` (service control)
- `journalctl` (log analysis)
- Network diagnostics tools
- DNS troubleshooting
- System-wide health checks

Environment:
- CentOS / RHEL 9
- Root access
- systemd-based system

---

# 🎯 Objectives

By completing this lab, I was able to:

- Manage services using `systemctl`
- Diagnose failures using `journalctl`
- Interpret service states and exit codes
- Simulate and fix DNS/network issues
- Apply structured troubleshooting methodology
- Create automated service health monitoring scripts

---

# 🧩 Lab Structure

## Task 1 — Service Troubleshooting

- View active and failed services
- Analyze SSH service configuration
- Create a failing custom systemd service
- Investigate failure logs
- Repair the service
- Validate recovery

---

## Task 2 — Network Troubleshooting

- Inspect IP configuration
- Validate routing table
- Analyze DNS resolution
- Simulate DNS failure
- Restore network functionality

---

## Task 3 — Log & System Analysis

- Use `journalctl` filters
- Inspect boot logs
- Filter errors by priority
- Measure journal disk usage
- Build service health check automation script

---

# 🛠 Key Commands Covered

### Service Management
```

systemctl status
systemctl list-units
systemctl --failed
systemctl daemon-reload
systemctl enable
systemctl restart

```

### Log Analysis
```

journalctl -u service
journalctl -f
journalctl -b
journalctl -p err
journalctl --since
journalctl --disk-usage

```

### Network Diagnostics
```

ip addr
ip route
ping
nslookup
cat /etc/resolv.conf

```

---

# 🔍 Troubleshooting Workflow Practiced

1. Identify failing service
2. Inspect systemctl status output
3. Analyze journal logs
4. Isolate root cause
5. Implement fix
6. Restart service
7. Validate resolution

---

# 🧠 Skills Developed

- Service lifecycle management
- Reading systemd unit files
- Diagnosing exit codes
- DNS resolution debugging
- Log filtering and prioritization
- Automation scripting for health monitoring

---

# 📂 Repository Files

| File | Purpose |
|------|----------|
| README.md | Lab overview |
| commands.sh | All executed commands |
| output.txt | Command outputs |
| interview_qna.md | Interview prep |
| troubleshooting.md | Failure scenarios & fixes |

---

# 🚀 Real-World Relevance

These skills are essential for:

- RHCSA / RHCE certification
- Production Linux administration
- Incident response & troubleshooting
- DevOps and SRE roles
- Infrastructure reliability engineering

---

# 🏁 Lab Status

✔ Service failure simulated and resolved  
✔ DNS failure simulated and resolved  
✔ Logs analyzed and interpreted  
✔ Health check automation created  

---

Linux service troubleshooting mastery achieved.
