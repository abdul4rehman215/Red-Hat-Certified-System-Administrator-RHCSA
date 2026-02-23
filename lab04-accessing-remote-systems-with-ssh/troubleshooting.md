# 🛠️ Troubleshooting Guide - Lab 04: Accessing Remote Systems with SSH

---

## 🔌 1️⃣ Connection Refused

### Problem

```bash
ssh student@172.31.10.200
````

Returns:

```
ssh: connect to host 172.31.10.200 port 22: Connection refused
```

### Possible Causes

* SSH server is not running.
* Firewall blocking port 22.
* Incorrect IP address.
* SSH service crashed.

### Solutions

✅ Check SSH service on remote:

```bash
sudo systemctl status ssh
```

If stopped:

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

✅ Verify firewall rules:

```bash
sudo ufw status
sudo ufw allow 22/tcp
```

---

## 🔑 2️⃣ Permission Denied (Publickey)

### Problem

```bash
Permission denied (publickey).
```

### Possible Causes

* Public key not copied properly.
* Incorrect permissions on `.ssh` directory.
* Wrong private key being used.
* SSH server disallows key authentication.

### Solutions

✅ Re-copy key:

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub student@172.31.10.200
```

✅ Fix permissions:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

✅ Verify server config:

```bash
sudo nano /etc/ssh/sshd_config
```

Ensure:

```
PubkeyAuthentication yes
PasswordAuthentication yes
```

Restart SSH:

```bash
sudo systemctl restart ssh
```

---

## 🌐 3️⃣ Host Key Verification Failed

### Problem

```
WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
```

### Cause

Host fingerprint changed (possible:

* Reinstalled server
* New server instance
* IP reused
* Potential MITM attack)

### Solution

Remove old key:

```bash
ssh-keygen -R 172.31.10.200
```

Then reconnect.

---

## 📂 4️⃣ SCP File Transfer Fails

### Problem

```
scp: /home/student/file.txt: Permission denied
```

### Solution

* Ensure correct remote path.
* Verify user permissions.
* Confirm file exists.

Check on remote:

```bash
ls -l /home/student/
```

---

## 🔒 5️⃣ Key Authentication Still Prompts for Password

### Possible Causes

* SSH agent not loaded.
* Wrong key file used.
* Key not added to `authorized_keys`.

### Solutions

Check SSH agent:

```bash
ssh-add -l
```

Manually specify key:

```bash
ssh -i ~/.ssh/id_ed25519 student@172.31.10.200
```

---

## 🚫 6️⃣ Timeout / Network Unreachable

### Problem

```
Connection timed out
```

### Solutions

* Verify remote IP:

```bash
ping 172.31.10.200
```

* Check security group rules (Cloud environment)
* Ensure port 22 is open
* Confirm instance is running

---

## 🔐 Security Hardening Tips

For production environments:

* Disable root login:

```bash
PermitRootLogin no
```

* Disable password authentication:

```bash
PasswordAuthentication no
```

* Use Fail2Ban
* Restrict users:

```bash
AllowUsers student
```

---

# 🚀 Professional Insight

SSH troubleshooting is a daily activity for:

* Cloud Engineers
* DevOps Engineers
* Security Analysts
* System Administrators
* SOC Teams

Understanding logs and service behavior:

```bash
journalctl -u ssh
```

Is critical for diagnosing remote access issues.

---

# ✅ Lab Verification Checklist

✔ SSH service active
✔ Key-based authentication working
✔ SCP transfers successful
✔ Permissions properly configured
✔ Remote login secured

---

**End of Troubleshooting Guide – Lab 04**

🔐 Secure Remote Access Successfully Implemented
