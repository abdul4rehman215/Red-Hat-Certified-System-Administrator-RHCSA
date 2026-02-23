# 🎤 Interview Q&A — Lab 40: Managing and Troubleshooting Services (systemctl + journalctl)

## 1) What is `systemd` and what does `systemctl` do?
**Answer:** `systemd` is the init system and service manager on many Linux distributions. `systemctl` is the CLI used to manage units (services, sockets, timers, mounts), check status, start/stop/restart services, and enable/disable them at boot.

---

## 2) What’s the difference between `systemctl start` and `systemctl enable`?
**Answer:**
- `systemctl start <service>` starts the service **right now** (current boot session).
- `systemctl enable <service>` configures the service to start **automatically on boot** (creates symlinks under systemd targets).

---

## 3) How do you find only failed services on a system?
**Answer:**
- `systemctl --failed`
- or `systemctl list-units --type=service --state=failed`

---

## 4) When a service fails, what’s your standard troubleshooting sequence?
**Answer (structured approach):**
1. `systemctl status <service>` (quick failure summary + recent logs)
2. `journalctl -u <service> --no-pager -n 50` (service logs)
3. Validate config files (syntax checks, permissions)
4. Run the service command manually (if possible)
5. Fix root cause and `systemctl restart <service>`
6. Confirm: status + logs + functional test

---

## 5) In `systemctl status`, what does **Active: failed (Result: exit-code)** mean?
**Answer:** The unit started but the main process exited with a non-zero exit code. Systemd marks the service as failed due to that process failure.

---

## 6) What does `journalctl -u <service>` show that `systemctl status` might not?
**Answer:** `journalctl` gives full logs for that unit across time, including earlier runs, detailed error output, timestamps, and structured metadata (priority, PID, etc.).

---

## 7) How do you view logs for only the current boot?
**Answer:** `journalctl -b`

---

## 8) How do you filter logs by time for a service?
**Answer:**
- `journalctl -u <service> --since "10 minutes ago"`
- `journalctl -u <service> --since "2026-02-23 10:00:00" --until "2026-02-23 11:00:00"`

---

## 9) How do you view high-severity logs only?
**Answer:** Use priority filtering:
- `journalctl -p err`
- `journalctl -p crit`
(You can combine with time and unit filters.)

---

## 10) What’s the purpose of `systemctl daemon-reload`?
**Answer:** It reloads systemd unit definitions after creating/modifying unit files under `/etc/systemd/system/` (or drop-ins). Without it, systemd may not recognize changes.

---

## 11) What does `Restart=` do in a systemd service file?
**Answer:** It controls restart behavior when a service exits or fails (e.g., `on-failure`, `always`, `no`). Helpful for resilience but can also create restart loops if misused.

---

## 12) In your lab, why did the service fail initially?
**Answer:** The script attempted to read a non-existent file (`cat /nonexistent/file.txt`), causing a non-zero exit code and systemd marked the service as failed.

---

## 13) How would you prevent a script-based service from failing on a missing file?
**Answer (examples):**
- Add checks: `if [ -f /path ]; then ... fi`
- Use safe defaults or fallback actions
- Redirect errors properly and decide whether failure is fatal
- Consider `set -e` vs explicit handling (prefer explicit handling for services)

---

## 14) What is a DNS issue vs a network connectivity issue?
**Answer:**
- **Network connectivity issue:** you cannot reach an IP (e.g., ping fails to `8.8.8.8`)
- **DNS issue:** you can reach IPs but cannot resolve hostnames (e.g., ping `8.8.8.8` works but `ping google.com` fails)

---

## 15) How do you quickly confirm if DNS is the problem?
**Answer:**
- Test IP reachability: `ping -c 2 8.8.8.8`
- Test DNS resolution: `nslookup google.com` or `dig google.com`
If IP works but DNS fails → DNS problem.

---

## 16) Which file is commonly involved in DNS resolution configuration?
**Answer:** `/etc/resolv.conf` (nameserver entries). On many systems it may be managed by NetworkManager or systemd-resolved depending on distro.

---

## 17) What commands help diagnose network configuration quickly?
**Answer:**
- `ip addr`
- `ip route`
- `cat /etc/resolv.conf`
- `ping`, `ss`, `nmcli` (if NetworkManager), `journalctl -u NetworkManager`

---

## 18) What’s a “system health check” script and why is it useful?
**Answer:** A lightweight script that validates critical services, checks failed units, and verifies connectivity + DNS. It helps detect issues early and standardizes checks for ops handover.

---

## 19) If a critical service is inactive, what are the first two actions?
**Answer:**
1. `systemctl status <service>`
2. `journalctl -u <service> -n 50 --no-pager`
Then fix config/environment and restart.

---

## 20) What are common real-world causes of service failures?
**Answer:**
- Bad config changes
- Missing dependencies / missing files
- Permission issues (file ownership/SELinux)
- Port conflicts
- Environment variable differences (cron/systemd vs shell)
- Resource exhaustion (disk full, memory pressure)
- DNS/network outages

---

## 21) What is a port conflict and how do you detect it?
**Answer:** A service fails because another process is already using the required port.
Detect using:
- `ss -tulpen | grep :<port>`
- `lsof -i :<port>`

---

## 22) What is SELinux and how can it affect services?
**Answer:** SELinux enforces mandatory access controls. Even with correct Unix permissions, SELinux contexts can block access. Check with `getenforce`, `ausearch`, and logs; use `restorecon` or correct contexts.

---

## 23) What does “Active: active (exited)” mean for a service?
**Answer:** The unit ran and completed successfully, then exited. This is common for one-shot services or scripts that perform a task and finish.

---

## 24) Give one real-world scenario where these skills matter.
**Answer:** Production incident response: a web service stops after a deploy. You verify service status, read logs, identify a config syntax error, fix it, restart safely, and confirm DNS + upstream connectivity.

---

## 25) Bonus: What’s the difference between `journalctl` and traditional `/var/log/messages`?
**Answer:** `journalctl` reads the systemd journal (structured, indexed logs). Traditional logs are plain text files managed by syslog/rsyslog. On many RHEL9 systems, both can exist, but journald is central.
