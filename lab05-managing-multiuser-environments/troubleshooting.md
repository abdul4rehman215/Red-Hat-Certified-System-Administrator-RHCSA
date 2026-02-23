# 🛠️ Troubleshooting Guide -  Lab 05: Managing Multiuser Environments (CentOS 7)

---

## 🔐 1️⃣ Permission Denied When Switching Users

### Problem

```bash
su - user1
````

Returns:

```
Authentication failure
```

### Possible Causes

* Incorrect password
* User account locked
* Password not set

### Solution

Reset password as root or sudo user:

```bash
sudo passwd user1
```

Verify user exists:

```bash
id user1
```

---

## 🚫 2️⃣ Permission Denied Accessing Another User’s File

### Problem

```bash
cat /home/user1/user1_file.txt
```

Returns:

```
Permission denied
```

### Cause

File permissions restrict access.

Check permissions:

```bash
ls -l /home/user1/user1_file.txt
```

Example:

```
-rw------- 1 user1 user1 ...
```

Only owner has access.

### Solution

Change permissions:

```bash
chmod 644 /home/user1/user1_file.txt
```

Or change ownership if required:

```bash
sudo chown user2:user2 filename
```

---

## 🧑‍💻 3️⃣ sudo Not Working

### Problem

```bash
sudo cat /etc/shadow
```

Returns:

```
centos is not in the sudoers file.
```

### Solution

Add user to wheel group (CentOS/RHEL):

```bash
sudo usermod -aG wheel centos
```

Verify:

```bash
groups centos
```

---

## 🖥️ 4️⃣ System Does Not Switch Targets

### Problem

```bash
sudo systemctl isolate multi-user.target
```

System does not change mode.

### Possible Causes

* Already in that target
* systemd not functioning correctly
* Running inside container/VM without full systemd support

### Verify Current Target

```bash
systemctl get-default
```

### Restart systemd (if needed)

```bash
sudo systemctl daemon-reexec
```

---

## 🐳 5️⃣ Podman Container Fails to Run as UID

### Problem

```bash
podman run --user 1000 -it fedora /bin/bash
```

Returns:

```
Error: container not found
```

### Solutions

Pull image first:

```bash
podman pull fedora
```

Verify podman version:

```bash
podman --version
```

---

## 🔄 6️⃣ Unable to Delete User

### Problem

```bash
sudo userdel -r user1
```

Returns:

```
user user1 is currently used by process
```

### Solution

Check active processes:

```bash
ps -u user1
```

Kill processes if safe:

```bash
sudo pkill -u user1
```

Then retry deletion.

---

## 🔎 7️⃣ sudo -l Does Not Show Expected Permissions

### Solution

Edit sudoers safely:

```bash
sudo visudo
```

Check for:

```
%wheel  ALL=(ALL)  ALL
```

---

## 🔒 Security Best Practices

✔ Enforce strong passwords
✔ Limit sudo access
✔ Use group-based permissions
✔ Avoid direct root login
✔ Monitor `/var/log/secure` for suspicious activity

---

## 📜 Log Monitoring

To investigate authentication issues:

```bash
sudo tail -f /var/log/secure
```

For systemd logs:

```bash
journalctl -xe
```

---

# ✅ Lab Verification Checklist

✔ Users created and deleted successfully
✔ su and sudo functioning correctly
✔ File permissions tested and modified
✔ System targets switched
✔ Container user isolation validated

---

**🔐 Multiuser Environment Management Successfully Verified**

End of Troubleshooting Guide – Lab 05
