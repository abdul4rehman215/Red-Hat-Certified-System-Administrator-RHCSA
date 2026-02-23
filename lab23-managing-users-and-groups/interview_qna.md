# 🎓 Interview Q&A – Lab 23: Managing Users and Groups

---

## 1️⃣ What is the difference between a regular user and a system user?

- **Regular User**
  - UID ≥ 1000 (on CentOS/RHEL)
  - Has a home directory
  - Can log in interactively
  - Used by humans

- **System User**
  - UID < 1000
  - Often used by services (e.g., web servers, databases)
  - Usually assigned `/sbin/nologin`
  - Not meant for interactive login

Example:
```bash
useradd -r -s /sbin/nologin webuser
````

---

## 2️⃣ What information is stored in `/etc/passwd`?

The `/etc/passwd` file contains:

* Username
* UID (User ID)
* GID (Primary Group ID)
* Comment field
* Home directory
* Login shell

Example entry:

```
john:x:1001:1001::/home/john_new:/bin/bash
```

---

## 3️⃣ What is the purpose of `/etc/shadow`?

`/etc/shadow` stores:

* Encrypted password hash
* Password aging information
* Account expiration data

Only root can read this file.

If the password field contains `!` or `!!`, the account is locked.

---

## 4️⃣ What is the difference between primary and secondary groups?

* **Primary Group**

  * Defined by GID in `/etc/passwd`
  * Used as default group for new files

* **Secondary Groups**

  * Listed in `/etc/group`
  * Provide additional permissions

Check using:

```bash
id username
```

---

## 5️⃣ What does the `usermod -a -G` option do?

* `-G` sets secondary groups
* `-a` appends to existing groups

Without `-a`, existing secondary groups are removed.

Correct usage:

```bash
usermod -a -G developers john
```

---

## 6️⃣ How do you lock and unlock a user account?

Lock:

```bash
usermod -L username
```

Unlock:

```bash
usermod -U username
```

Locking adds `!` in `/etc/shadow`.

---

## 7️⃣ How do you change a user’s login shell?

```bash
usermod -s /bin/zsh username
```

Verify:

```bash
grep username /etc/passwd
```

---

## 8️⃣ How do you force a user to change password at next login?

```bash
chage -d 0 username
```

This sets the last password change date to zero.

---

## 9️⃣ How do you configure password expiration?

Example:

```bash
chage -M 90 username
chage -m 7 username
chage -W 7 username
```

* `-M` → Maximum days
* `-m` → Minimum days
* `-W` → Warning days

---

## 🔟 How do you create a shared directory for a group?

```bash
mkdir /shared/marketing
chgrp marketing /shared/marketing
chmod 770 /shared/marketing
chmod g+s /shared/marketing
```

`g+s` (setgid bit) ensures new files inherit the group.

---

## 1️⃣1️⃣ What happens if you forget `-a` when adding groups?

If you run:

```bash
usermod -G developers john
```

It removes all previous secondary groups and sets only `developers`.

This is a common administrative mistake.

---

## 1️⃣2️⃣ What command shows all user groups?

```bash
groups username
```

or

```bash
id username
```

---

## 1️⃣3️⃣ How do you delete a user and remove their home directory?

```bash
userdel -r username
```

Without `-r`, the home directory remains.

---

## 1️⃣4️⃣ Why are user and group management critical for Linux security?

Because they:

* Control access permissions
* Prevent unauthorized access
* Isolate services
* Enforce least privilege
* Support compliance policies

Misconfigured users can lead to privilege escalation.

---

## 1️⃣5️⃣ What are best practices for user management?

✔ Use strong passwords
✔ Enforce password aging
✔ Lock unused accounts
✔ Use system users for services
✔ Avoid giving unnecessary sudo access
✔ Regularly audit `/etc/passwd` and `/etc/group`

---

## 📌 Summary

This lab strengthens understanding of:

* User lifecycle management
* Group-based access control
* Password policy enforcement
* Account security
* Linux authentication architecture

These are core RHCSA exam competencies and real-world administration skills.

---

🎯 RHCSA Focus: User & Group Administration
