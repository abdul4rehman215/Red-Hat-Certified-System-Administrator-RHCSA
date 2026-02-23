# 🔐 Lab 24: Configuring User Permissions (RHCSA)

This lab focuses on **Linux permission management fundamentals** required for the RHCSA exam: ownership, chmod permissions (symbolic + numeric), and **ACLs** for fine-grained access control.

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand Linux **file ownership** (user/group) and access model
- Change ownership with `chown` (user, group, user:group, recursive)
- Modify permissions with `chmod` (symbolic + numeric, recursive safely)
- Implement **Access Control Lists (ACLs)** using `setfacl` and `getfacl`
- Apply real-world permission setups (web content, shared project folders)
- Troubleshoot permission errors confidently

---

## ✅ Prerequisites

- Basic terminal navigation (`cd`, `ls`, `pwd`)
- Familiarity with creating files/directories (`mkdir`, `touch`, `echo`)
- Basic understanding of users & groups
- Access to a CentOS/RHEL system with sudo/root privileges

---

## 🧪 Lab Environment

- CentOS/RHEL-based Linux (CentOS 7 style shell shown)
- `sudo` access
- ACL utilities installed (`getfacl`, `setfacl`)
- Filesystem with ACL support (XFS typically supports ACLs by default)

---

## 🗂️ Repository Structure

```text
lab24-configuring-user-permissions/
├── README.md
├── commands_used.txt
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── scripts/
    └── (none - command-line focused lab)
````

> This lab is primarily terminal-based. Any created scripts/files are captured in `commands_used.txt` and `output.txt`.

---

## 🧭 What I Did in This Lab (Task Overview)

### ✅ Task 1: Ownership Management with `chown`

* Created a working directory (`~/permissions_lab`) with files and directories
* Inspected ownership with `ls -l`
* Changed ownership:

  * User ownership (`sudo chown root file1.txt`)
  * Group ownership (`sudo chown :users file2.txt`)
  * User + group (`sudo chown root:root file3.txt`)
  * Recursive ownership changes (`sudo chown -R ... testdir/`)

### ✅ Task 2: Permission Management with `chmod`

* Verified default permissions and attempted executing a non-executable script
* Used **symbolic** mode:

  * `chmod u+x test_script.sh`
  * `chmod go-w file1.txt`
  * `chmod o-rwx file3.txt`
  * `chmod u=rw,g=r,o= file1.txt`
* Used **numeric** mode:

  * `755`, `644`, `600`, `777`
* Practiced recursive permissions safely:

  * Demonstrated how `chmod -R 644` breaks directory traversal
  * Fixed properly using:

    * `find ... -type d -exec chmod 755 {} \;`
    * `find ... -type f -exec chmod 644 {} \;`

### ✅ Task 3: Advanced Access Control with ACLs (`setfacl` / `getfacl`)

* Verified tools and filesystem behavior
* Created ACL test files and inspected baseline ACL output
* Added user-specific ACL rules:

  * `setfacl -m u:testuser1:rw sensitive_file.txt`
  * `setfacl -m u:testuser2:r sensitive_file.txt`
* Added group-specific ACL rules:

  * `setfacl -m g:developers:rwx shared_document.txt`
  * `setfacl -m g:managers:r shared_document.txt`
* Implemented **default ACLs** on directories (`setfacl -d ...`) and verified inheritance
* Modified and removed ACL entries:

  * Remove one entry: `setfacl -x u:testuser2 file`
  * Remove all ACLs: `setfacl -b file`
* Copied ACLs between files and backed up ACLs:

  * `getfacl -R . > acl_backup.txt`

---

## 🧾 Key Commands Practiced

* Ownership:

  * `chown`, `chown -R`
* Permissions:

  * `chmod` (symbolic + numeric), `chmod -R`
  * `find ... -type d|f -exec chmod ...`
* ACLs:

  * `getfacl`, `setfacl`, `setfacl -m`, `setfacl -x`, `setfacl -b`
  * `setfacl -d` (default ACL)
  * ACL backup: `getfacl -R`

---

## 🔍 Verification Highlights

* Confirmed ownership and permissions with:

  * `ls -l`, `ls -ld`, `ls -lR`
* Confirmed ACL presence via `+` indicator:

  * Example: `-rw-rw-r--+ ... sensitive_file.txt`
* Confirmed ACL inheritance for newly created files inside ACL-enabled directories

---

## 🔐 Why This Matters (Security Relevance)

Linux permissions are the **first line of defense** for:

* Preventing unauthorized file reads/writes/execution
* Reducing lateral movement opportunities via misconfigured shared folders
* Protecting sensitive configurations (e.g., secrets, SSH keys, app configs)
* Enabling safe collaboration via **SGID + ACLs** instead of over-permissive `777`

Common real-world failures this lab helps prevent:

* Accidentally giving execute permissions to sensitive files
* Breaking access by removing directory execute bits
* Using `chmod -R` without distinguishing files vs directories
* Forgetting that ACLs can override “simple” UNIX expectations

---

## ✅ Result

I can now confidently:

* Control access using standard UNIX permissions (owner/group/other)
* Apply permissions safely at scale (recursive fixes using `find`)
* Use ACLs when traditional permissions are not sufficient
* Validate and troubleshoot permission/ACL issues using system tools

---

## 🧹 Cleanup Notes

This lab includes cleanup steps such as removing:

* `~/permissions_lab`, `acl_test`
* test users/groups (optional)
* `/tmp/webserver`, `/tmp/shared_project`

All cleanup commands are preserved in `commands_used.txt` and outputs in `output.txt`.

---
