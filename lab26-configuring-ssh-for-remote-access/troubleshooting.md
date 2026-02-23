# 🛠 Troubleshooting Guide - Lab 26: Configuring SSH for Remote Access

---

## 🔎 Issue 1: Connection Refused

### ❌ Error
```

ssh: connect to host <IP> port 22: Connection refused

````

### 🔍 Possible Causes
- SSH service not running
- Wrong port configured
- Firewall blocking connection
- SSH listening on different interface

### ✅ Troubleshooting Steps

```bash
sudo systemctl status sshd
sudo ss -tlnp | grep sshd
sudo firewall-cmd --list-all
````

### 🔧 Fix

```bash
sudo systemctl start sshd
sudo systemctl enable sshd
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

---

## 🔎 Issue 2: Connection Timeout / No Route to Host

### ❌ Error

```
No route to host
Connection timed out
```

### 🔍 Possible Causes

* Incorrect IP address
* Network connectivity issue
* Firewall or cloud security group blocking port

### ✅ Troubleshooting Steps

```bash
ping -c 3 <IP_ADDRESS>
ip addr
ip route
sudo firewall-cmd --list-all
```

### 🔧 Fix

* Verify correct IP
* Ensure both machines are on same network
* Allow SSH port in firewall or cloud security group

---

## 🔎 Issue 3: Permission Denied (publickey,password)

### ❌ Error

```
Permission denied (publickey,password)
```

### 🔍 Possible Causes

* Incorrect key permissions
* Public key not in authorized_keys
* PasswordAuthentication disabled without keys
* Wrong username

### ✅ Troubleshooting Steps

```bash
ssh -vvv user@host
sudo journalctl -u sshd --no-pager | tail -50
cat ~/.ssh/authorized_keys
```

### 🔧 Fix Permissions

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
```

---

## 🔎 Issue 4: sshd Fails to Restart After Config Change

### ❌ Symptom

`systemctl restart sshd` fails

### 🔍 Cause

Syntax error in `/etc/ssh/sshd_config`

### ✅ Troubleshooting

```bash
sudo sshd -t
sudo systemctl status sshd --no-pager
```

### 🔧 Fix

Restore backup:

```bash
sudo cp /etc/ssh/sshd_config.backup /etc/ssh/sshd_config
sudo systemctl restart sshd
```

---

## 🔎 Issue 5: Locked Out After Changing SSH Port

### ❌ Problem

SSH stopped working after port change

### ✅ Troubleshooting

```bash
sudo ss -tlnp | grep sshd
sudo firewall-cmd --list-all
```

### 🔧 Fix

```bash
sudo firewall-cmd --permanent --add-port=2222/tcp
sudo firewall-cmd --reload
ssh -p 2222 user@host
```

---

## 🔎 Issue 6: SELinux Blocking SSH Port (RHEL/CentOS)

### 🔍 Check SELinux Mode

```bash
getenforce
```

### 🔍 Check for AVC Denials

```bash
sudo ausearch -m AVC -ts recent | tail
```

### 🔧 Fix (Allow New SSH Port)

```bash
sudo dnf install -y policycoreutils-python-utils
sudo semanage port -a -t ssh_port_t -p tcp 2222 2>/dev/null || \
sudo semanage port -m -t ssh_port_t -p tcp 2222
sudo systemctl restart sshd
```

---

## 🔎 Issue 7: Key Authentication Not Working

### ✅ Verify Authorized Keys

```bash
cat ~/.ssh/authorized_keys
```

### ✅ Verify SSH Server Logs

```bash
sudo journalctl -u sshd -f
```

### ✅ Test Verbose Client Mode

```bash
ssh -vvv user@host
```

Look for:

* `Offering public key`
* `Authentication succeeded (publickey)`

---

## 🔐 Security Reminders

* Always test key login before disabling passwords
* Always validate config with `sshd -t`
* Always keep a backup of sshd_config
* Never close active SSH session before confirming new config works
* Be careful when changing SSH port remotely

---

# ✅ End of Troubleshooting Guide
