# 🎤 Interview Q&A - Lab 05: Managing Multiuser Environments (CentOS 7)

---

## 1️⃣ What is a multiuser environment in Linux?

A multiuser environment allows multiple users to access the same Linux system while maintaining isolation between accounts. Each user has:

- Unique UID (User ID)
- Separate home directory
- Individual permissions
- Independent process space

Linux enforces security boundaries using file permissions and privilege control.

---

## 2️⃣ What is the difference between `su` and `sudo`?

| su | sudo |
|----|------|
| Switches user account | Executes command as another user |
| Requires target user password | Requires invoking user password |
| Opens full shell session | Executes single command |
| Less controlled | More granular privilege control |

Example:

```bash
su - user1
````

```bash
sudo cat /etc/shadow
```

---

## 3️⃣ Why is `/etc/shadow` restricted?

`/etc/shadow` contains encrypted password hashes and sensitive authentication data.

Only root or users with sudo privileges can access it.
This prevents credential exposure.

---

## 4️⃣ What does `sudo -l` show?

It lists the commands the current user is allowed to run with sudo privileges.

Example output:

```
User centos may run the following commands:
    (ALL) ALL
```

---

## 5️⃣ Explain Linux file permission 644.

Permission format: `rw-r--r--`

* Owner: read + write (6)
* Group: read (4)
* Others: read (4)

Numeric representation:

```
Owner: 4+2 = 6
Group: 4
Others: 4
```

---

## 6️⃣ What is the Principle of Least Privilege?

Users should only have the minimum permissions necessary to perform their tasks.

This reduces:

* Insider threats
* Accidental damage
* Security breaches

---

## 7️⃣ What is `multi-user.target`?

`multi-user.target` is a systemd target that:

* Runs system in text-only mode
* Suitable for servers
* No graphical interface
* Supports multiple concurrent users

Equivalent to traditional runlevel 3.

---

## 8️⃣ What is `graphical.target`?

`graphical.target`:

* Starts GUI environment
* Suitable for desktop systems
* Equivalent to runlevel 5 in older systems

---

## 9️⃣ Why is container user mapping important?

When running containers:

```bash
podman run --user 1000 -it fedora /bin/bash
```

It ensures:

* Process isolation
* UID namespace separation
* Reduced root-level container risks
* Secure multi-tenant container environments

Critical for OpenShift and Kubernetes security.

---

## 🔟 How can sudo be restricted to specific commands?

Edit sudoers file safely:

```bash
sudo visudo
```

Example restriction:

```
user1 ALL=(ALL) /usr/bin/systemctl
```

This limits user1 to only run `systemctl`.

---

## 1️⃣1️⃣ What happens if `.ssh` or home permissions are too open?

If permissions are too permissive:

* SSH key authentication may fail
* Security vulnerabilities increase
* Sensitive data becomes exposed

Proper permissions enforce account isolation.

---

## 1️⃣2️⃣ Why is multiuser management critical in enterprises?

Because production systems:

* Host multiple administrators
* Serve multiple services
* Run containers for different teams
* Must enforce strict security controls

Improper user management can lead to:

* Privilege escalation
* Data breaches
* Compliance violations

---

# ✅ Lab Knowledge Summary

After completing this lab, I can confidently:

* Create and manage Linux users
* Control privilege escalation
* Configure file permissions
* Manage system targets
* Understand container user isolation

---
