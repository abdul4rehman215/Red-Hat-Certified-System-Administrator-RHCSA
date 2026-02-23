# 🛠 Troubleshooting Guide — Lab 33: Understanding and Managing SELinux (RHCSA)

This document covers real-world SELinux issues, how to diagnose them properly, and how to fix them using best practices — without disabling SELinux.

---

# 🔎 Issue 1: Application Shows "Permission Denied" but File Permissions Look Correct

## ❌ Problem

- `curl` returns **403 Forbidden**
- Application logs show permission errors
- `ls -l` shows correct file ownership and permissions

Example:

```bash
curl http://localhost/test/moved-page.html
````

Output:

```text
403 Forbidden
```

## 🔍 Root Cause

The file has incorrect SELinux context.

Example:

```bash
ls -Z /var/www/html/test/moved-page.html
```

Output:

```text
unconfined_u:object_r:user_tmp_t:s0
```

`httpd_t` domain is not allowed to access `user_tmp_t`.

## ✅ Proper Fix

Restore correct labeling:

```bash
restorecon -Rv /var/www/html/test/
```

Verify:

```bash
ls -Z /var/www/html/test/
```

Expected:

```text
httpd_sys_content_t
```

---

# 🔎 Issue 2: SELinux Denials Not Visible

## ❌ Problem

Application fails but no visible SELinux errors.

## 🔍 Diagnosis

Check audit logs:

```bash
ausearch -m AVC -ts recent
```

Or filter for service:

```bash
ausearch -m AVC -c httpd
```

If nothing appears:

* Confirm `auditd` is running

```bash
systemctl status auditd
```

## ✅ Fix

Start audit service if needed:

```bash
systemctl start auditd
systemctl enable auditd
```

---

# 🔎 Issue 3: semanage Command Not Found

## ❌ Problem

```bash
semanage: command not found
```

## 🔍 Cause

Minimal RHEL installations do not include policy tools.

## ✅ Fix

Install required package:

```bash
yum install -y policycoreutils-python-utils
```

Verify:

```bash
semanage fcontext -l
```

---

# 🔎 Issue 4: Switching to Permissive Fixes the Issue

## ❌ Scenario

Application works when:

```bash
setenforce 0
```

But fails when:

```bash
setenforce 1
```

## 🔍 Meaning

This confirms SELinux policy enforcement is blocking access.

## ✅ Correct Troubleshooting Flow

1. Switch temporarily to permissive (for diagnosis only)
2. Generate denial report:

```bash
ausearch -m AVC -ts recent
```

3. Analyze:

```bash
ausearch -m AVC -c service_name | audit2allow -w
```

4. Fix labeling instead of disabling SELinux

Return to enforcing:

```bash
setenforce 1
```

---

# 🔎 Issue 5: Incorrect Custom Application Context

## ❌ Problem

Custom app under `/opt/myapp` labeled as:

```text
default_t
```

Which may cause restrictions.

## 🔍 Diagnosis

```bash
ls -Z /opt/myapp/
```

## ✅ Permanent Fix

Add file context rules:

```bash
semanage fcontext -a -t bin_t "/opt/myapp/bin(/.*)?"
semanage fcontext -a -t var_t "/opt/myapp/data(/.*)?"
```

Apply:

```bash
restorecon -Rv /opt/myapp/
```

Verify:

```bash
ls -Z /opt/myapp/
```

---

# 🔎 Issue 6: Port Access Denied Even Though Service is Running

## ❌ Problem

Service listens on custom port but SELinux blocks it.

## 🔍 Diagnosis

Check allowed ports:

```bash
semanage port -l | grep http
```

## ✅ Fix

Add custom port type:

```bash
semanage port -a -t http_port_t -p tcp 8081
```

Verify:

```bash
semanage port -l | grep 8081
```

---

# 🔎 Issue 7: Boolean Restriction Preventing Network Access

## ❌ Problem

Web server cannot connect to external services (database, API).

## 🔍 Diagnosis

Check boolean:

```bash
getsebool httpd_can_network_connect
```

Output:

```text
off
```

## ✅ Fix

Temporarily:

```bash
setsebool httpd_can_network_connect on
```

Permanent:

```bash
setsebool -P httpd_can_network_connect on
```

---

# 🔎 Issue 8: Administrator Disables SELinux Instead of Fixing It

## ❌ Incorrect Approach

Editing:

```bash
/etc/selinux/config
```

Setting:

```text
SELINUX=disabled
```

## ⚠ Why This Is Wrong

* Removes mandatory access control
* Reduces system hardening
* Fails compliance standards
* Not acceptable in enterprise environments

## ✅ Recommended Approach

* Diagnose AVC
* Fix context
* Adjust boolean
* Modify port labeling
* Only generate custom policy if absolutely required

---

# 🔎 Issue 9: audit2allow Suggests Rule — Should You Always Apply It?

## ❌ Misconception

Automatically installing generated module:

```bash
semodule -i mymodule.pp
```

## 🔍 Reality

Many denials are caused by incorrect labeling — not missing policy.

## ✅ Best Practice

1. Check file context
2. Use `restorecon`
3. Only create custom module if:

   * Behavior is intended
   * Policy does not support it by design

---

# 🔎 Issue 10: No AVCs After Fix — How to Confirm System Is Clean?

## ✅ Verification

Check mode:

```bash
getenforce
```

Check for recent denials:

```bash
ausearch -m AVC -ts today
```

Expected:

```text
<no matches>
```

---

# 🧠 Enterprise SELinux Troubleshooting Strategy

When facing permission problems:

1️⃣ Check SELinux mode
2️⃣ Look for AVC denials
3️⃣ Identify source and target context
4️⃣ Determine if labeling is wrong
5️⃣ Use restorecon or semanage
6️⃣ Adjust booleans if required
7️⃣ Only then consider policy module

---

# 🔐 Security Best Practices

✔ Keep SELinux in **Enforcing** mode
✔ Avoid disabling SELinux for convenience
✔ Prefer relabeling over policy modification
✔ Monitor audit logs regularly
✔ Document any custom modules
✔ Test changes in staging before production

---

# 🎯 RHCSA Exam Tip

In RHCSA:

* Most SELinux questions are labeling-based
* You will likely need:

  * `restorecon`
  * `semanage fcontext`
  * `semanage port`
  * `setsebool -P`
* Avoid disabling SELinux unless explicitly instructed

---

# ✅ Lab 13 Troubleshooting Completed

This troubleshooting guide covers:

* Denial identification
* Log analysis
* Context correction
* Boolean adjustments
* Port labeling
* Best practices
* Security reasoning

System state verified:

* SELinux enabled
* Mode: Enforcing
* No active denials

---
