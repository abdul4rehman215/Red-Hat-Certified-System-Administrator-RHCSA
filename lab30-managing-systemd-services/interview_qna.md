# 🎯 Interview Q&A — Lab 30: Managing Systemd Services

---

## 1️⃣ What is systemd?

**systemd** is the init system and service manager used in modern Linux distributions.

It is responsible for:
- System boot process
- Managing services
- Handling dependencies
- Logging via journald
- Managing targets (runlevels)

---

## 2️⃣ What is a systemd unit?

A **unit** is a configuration file that systemd uses to manage resources.

Common unit types:

| Unit Type | Description |
|------------|------------|
| `.service` | Service unit |
| `.target` | Group of units (like runlevels) |
| `.socket` | Socket activation |
| `.mount` | Mount point |
| `.timer` | Scheduled tasks |

---

## 3️⃣ How do you start and stop a service?

```bash
systemctl start servicename
systemctl stop servicename
````

Example:

```bash
systemctl start sshd
systemctl stop httpd
```

---

## 4️⃣ What is the difference between restart and reload?

| Command   | Behavior                                   |
| --------- | ------------------------------------------ |
| `restart` | Stops and starts the service again         |
| `reload`  | Reloads configuration without full restart |

Example:

```bash
systemctl restart sshd
systemctl reload httpd
```

---

## 5️⃣ How do you check service status?

```bash
systemctl status servicename
```

This shows:

* Active state
* Loaded state
* PID
* Recent logs

---

## 6️⃣ How do you enable a service at boot?

```bash
systemctl enable servicename
```

To enable and start immediately:

```bash
systemctl enable --now servicename
```

---

## 7️⃣ What is a target in systemd?

A **target** is a group of units that defines system state (similar to runlevels).

Common targets:

| Target            | Purpose                   |
| ----------------- | ------------------------- |
| multi-user.target | CLI-based multi-user mode |
| graphical.target  | GUI mode                  |
| rescue.target     | Single-user mode          |

---

## 8️⃣ How do you check the default boot target?

```bash
systemctl get-default
```

Change default:

```bash
systemctl set-default multi-user.target
```

---

## 9️⃣ How do you view service logs?

Using journalctl:

```bash
journalctl -u servicename
```

Example:

```bash
journalctl -u sshd
journalctl -u httpd
```

---

## 🔟 How do you troubleshoot a failed service?

Steps:

1. Check status:

```bash
systemctl status servicename
```

2. Check logs:

```bash
journalctl -u servicename
```

3. Verify unit file configuration
4. Reload daemon if modified:

```bash
systemctl daemon-reload
```

---

## 1️⃣1️⃣ What does `daemon-reload` do?

```bash
systemctl daemon-reload
```

It reloads systemd unit files after changes are made.

Required when:

* Creating new service files
* Editing unit files

---

## 1️⃣2️⃣ What does this error mean?

```
status=203/EXEC
```

It indicates:

* Executable not found
* Incorrect ExecStart path
* Missing permissions

---

## 1️⃣3️⃣ What is journalctl -b?

```bash
journalctl -b
```

Shows logs from:

* Current boot

Useful for:

* Diagnosing boot issues
* Startup failures

---

## 1️⃣4️⃣ How do you check if a service is active?

```bash
systemctl is-active servicename
```

Possible outputs:

* active
* inactive
* failed

---

## 1️⃣5️⃣ Real-World Importance of systemd

System administrators use systemd daily to:

* Manage production web servers
* Troubleshoot outages
* Ensure services start automatically
* Configure boot modes
* Diagnose failures quickly

Without systemd knowledge:

* You cannot manage Linux servers effectively.
* Troubleshooting becomes difficult.
* Production reliability suffers.

---

## 🎓 RHCSA Exam Relevance

RHCSA exam commonly tests:

* Starting/stopping services
* Enabling services
* Checking service status
* Working with targets
* Troubleshooting service failures

Time efficiency and command accuracy are critical.

---

## 🏁 Final Takeaway

systemd is:

* The backbone of modern Linux systems
* Central to service management
* Essential for troubleshooting
* Required knowledge for RHCSA

Mastering systemctl and journalctl
means mastering Linux service administration.
