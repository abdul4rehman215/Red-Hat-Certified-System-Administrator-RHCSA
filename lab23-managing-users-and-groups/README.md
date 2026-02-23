# 👥 Lab 23 – Managing Users and Groups (RHCSA Track)

## 🎯 Objectives

By completing this lab, I was able to:

- Create standard and system users using `useradd`
- Modify existing accounts using `usermod`
- Create and manage groups using `groupadd`
- Assign primary and secondary group memberships
- Manage and enforce password policies using `passwd` and `chage`
- Lock and unlock user accounts
- Understand Linux user/group configuration files
- Apply security best practices for account management

---

## 🖥️ Lab Environment

| Component | Details |
|------------|----------|
| OS | CentOS Linux 7 (Core) |
| Shell | bash 4.2 |
| Privilege Level | Root (sudo -i) |
| Environment Type | Cloud-based Linux Lab |
| User Database Files | `/etc/passwd`, `/etc/shadow`, `/etc/group` |

---

## 📁 Repository Structure

```

lab23-managing-users-and-groups/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── scripts/
└── password_policy_notes.txt

````

> 📌 This lab primarily focuses on administrative commands.  
> No custom shell scripts were developed, but password policy and security notes are documented.

---

# ✅ Task Overview & Execution Summary

---

## 🔹 Task 1 – Creating Users

### ✔ Created Standard Users

- `john`
- `jsmith`
- `bdev`

Verified using:

```bash
grep username /etc/passwd
id username
groups username
````

### ✔ Created User with Custom Options

```bash
useradd -c "Jane Smith, Marketing Department" -s /bin/bash -m -d /home/jsmith jsmith
```

Verified:

* Home directory created
* Skeleton files copied
* Correct shell assigned

---

### ✔ Created System User

```bash
useradd -r -s /sbin/nologin -c "Web Server User" webuser
```

System users:

* UID below 1000
* No interactive login
* Used for services

---

## 🔹 Task 2 – Modifying Users

### ✔ Changed Home Directory

```bash
usermod -d /home/john_new -m john
```

Verified via:

* `/etc/passwd`
* Directory ownership

---

### ✔ Changed Login Shell

Attempted:

```bash
usermod -s /bin/zsh jsmith
```

Installed missing package:

```bash
yum install -y zsh
```

Successfully updated shell.

---

### ✔ Locked and Unlocked Accounts

```bash
usermod -L john
usermod -U john
```

Verified lock via `/etc/shadow`.

---

## 🔹 Task 3 – Managing Groups

### ✔ Created Groups

* `marketing`
* `developers` (GID 2000)
* `services` (system group)

Verified via:

```bash
grep groupname /etc/group
```

---

### ✔ Assigned Users to Groups

Primary group change:

```bash
usermod -g marketing jsmith
```

Secondary group assignment:

```bash
usermod -G developers,marketing john
usermod -a -G services john
```

Verified via:

```bash
groups john
id john
```

---

### ✔ Created User with Group Assignment

```bash
useradd -g developers -G marketing -c "Bob Developer" -m bdev
```

---

## 🔹 Task 4 – Password Management

### ✔ Set Passwords

```bash
passwd username
```

Successfully updated authentication tokens.

---

### ✔ Configured Password Policies

```bash
chage -M 90 john
chage -m 7 john
chage -W 7 john
```

Verified with:

```bash
chage -l john
```

---

### ✔ Forced Password Change

```bash
chage -d 0 jsmith
```

---

## 🔹 Advanced Configuration

### ✔ Created Shared Group Directory

```bash
mkdir /shared/marketing
chgrp marketing /shared/marketing
chmod 770 /shared/marketing
chmod g+s /shared/marketing
```

Setgid ensures new files inherit group ownership.

---

### ✔ Verified Defaults

Reviewed:

* `/etc/default/useradd`
* `/etc/login.defs`

---

## 🔐 Security Concepts Reinforced

* Principle of Least Privilege
* Separation of service accounts
* Group-based access control
* Password aging policies
* Account locking for inactive users
* Restricted shells for system users

---

## 🧠 What I Learned

* Every user has:

  * UID
  * Primary group (GID)
  * Optional secondary groups
* `/etc/passwd` stores user metadata
* `/etc/shadow` stores encrypted password info
* `/etc/group` manages group definitions
* `usermod -a -G` prevents accidental group removal
* Password aging is critical for compliance
* Setgid on directories improves collaboration security

---

## 🔥 Why This Matters (RHCSA & Real-World)

User and group management is central to:

* Linux security architecture
* Multi-user server environments
* Enterprise access control policies
* Service isolation
* Compliance requirements (PCI-DSS, ISO, SOC2)

RHCSA exam heavily tests:

* Creating users
* Managing groups
* Locking accounts
* Modifying shells
* Setting password policies

Mistakes in this area can cause:

* Security breaches
* Privilege escalation
* Unauthorized access

---

## 📊 Result

✔ Created and modified multiple users
✔ Created and assigned groups
✔ Configured password expiration policies
✔ Implemented shared directory permissions
✔ Verified ownership and permissions
✔ Tested user switching and file ownership
✔ Applied security best practices

---

## 🏁 Conclusion

This lab provided hands-on experience with:

* Linux account lifecycle management
* Access control via groups
* Secure password management
* Administrative troubleshooting

User and group management is foundational to Linux system administration and forms a major component of the RHCSA certification.

---

✅ Lab 23 Completed Successfully
📍 Environment: CentOS 7 Cloud Lab
🎓 RHCSA Preparation Track
