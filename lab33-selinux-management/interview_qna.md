# 🎤 Interview Q&A — Lab 33: Understanding and Managing SELinux (RHCSA)

> This section contains RHCSA-aligned interview questions focused on practical SELinux administration and troubleshooting.

---

## 1️⃣ What is SELinux and why is it important?

**Answer:**

SELinux (Security-Enhanced Linux) is a Mandatory Access Control (MAC) system that enforces security policies on top of traditional Linux Discretionary Access Control (DAC).

It is important because:
- It restricts what processes can access, even if traditional file permissions allow it.
- It limits damage from compromised services.
- It enforces least-privilege at the kernel level.

---

## 2️⃣ What are the three SELinux modes?

**Answer:**

1. **Enforcing** – SELinux actively blocks actions that violate policy.
2. **Permissive** – SELinux logs violations but does not block them.
3. **Disabled** – SELinux is turned off completely.

Check mode:

```bash
getenforce
````

---

## 3️⃣ How do you temporarily change SELinux mode?

**Answer:**

```bash
setenforce 0   # Switch to Permissive
setenforce 1   # Switch to Enforcing
```

This change is temporary and does not survive reboot.

---

## 4️⃣ How do you permanently change SELinux mode?

**Answer:**

Edit the configuration file:

```bash
/etc/selinux/config
```

Modify:

```bash
SELINUX=enforcing
```

Options:

* enforcing
* permissive
* disabled

Reboot is required for permanent change.

---

## 5️⃣ How can you check SELinux status in detail?

**Answer:**

```bash
sestatus
```

It shows:

* Current mode
* Config file mode
* Policy type
* Policy version
* MLS status

---

## 6️⃣ What is an SELinux context?

**Answer:**

An SELinux context has four components:

```
user:role:type:level
```

Example:

```
system_u:object_r:httpd_sys_content_t:s0
```

The **type** field is most important in policy enforcement.

---

## 7️⃣ How do you check file SELinux context?

**Answer:**

```bash
ls -Z filename
```

Example:

```bash
ls -Z /etc/passwd
```

---

## 8️⃣ How do you check process SELinux context?

**Answer:**

```bash
ps -eZ
```

This shows process security labels.

---

## 9️⃣ How do you find SELinux denials?

**Answer:**

Use `ausearch` to look for AVC messages:

```bash
ausearch -m AVC -ts recent
```

For specific service:

```bash
ausearch -m AVC -c httpd
```

---

## 🔟 What is audit2allow used for?

**Answer:**

`audit2allow` analyzes SELinux denial logs and suggests policy rules.

Example:

```bash
ausearch -m AVC -c httpd | audit2allow
```

It can also generate a module:

```bash
ausearch -m AVC -c httpd | audit2allow -M mymodule
```

---

## 1️⃣1️⃣ What is the correct way to fix most SELinux file access issues?

**Answer:**

Usually by correcting file context using:

```bash
restorecon -Rv /path
```

Instead of:

* Disabling SELinux
* Generating unnecessary allow rules

---

## 1️⃣2️⃣ What is semanage used for?

**Answer:**

`semanage` manages persistent SELinux policy settings.

Examples:

Add file context rule:

```bash
semanage fcontext -a -t httpd_sys_content_t "/data/web(/.*)?"
```

Add port to http_port_t:

```bash
semanage port -a -t http_port_t -p tcp 8081
```

---

## 1️⃣3️⃣ What are SELinux booleans?

**Answer:**

Booleans are runtime switches that enable or disable specific policy behaviors.

List all:

```bash
getsebool -a
```

Example:

```bash
setsebool httpd_can_network_connect on
```

Permanent:

```bash
setsebool -P httpd_can_network_connect on
```

---

## 1️⃣4️⃣ Why is SELinux better than just file permissions?

**Answer:**

Because:

* File permissions rely on user/group ownership.
* SELinux enforces policy at the process level.
* Even root processes can be restricted.
* Prevents privilege escalation and lateral movement.

---

## 1️⃣5️⃣ In troubleshooting, what should you check first when an application fails?

**Answer:**

1. Check SELinux mode:

   ```bash
   getenforce
   ```
2. Look for AVC denials:

   ```bash
   ausearch -m AVC -ts recent
   ```
3. Fix labeling using:

   ```bash
   restorecon
   ```
4. Only generate custom policy if absolutely necessary.

---

# ✅ Summary for Interview Readiness

This lab prepares you to:

* Explain SELinux architecture clearly
* Diagnose AVC denials
* Correct labeling issues properly
* Avoid disabling SELinux in production
* Handle RHCSA SELinux objectives confidently

---
