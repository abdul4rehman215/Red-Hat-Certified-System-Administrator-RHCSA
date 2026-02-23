# 🎯 Interview Q&A - Lab 06: SSH Configuration For Remote Acess

---

## 1️⃣ What is SSH and why is it important?

SSH (Secure Shell) is a cryptographic network protocol used for secure remote login and command execution over unsecured networks.

It encrypts communication between client and server, preventing:
- Credential theft
- Session hijacking
- Packet sniffing attacks

---

## 2️⃣ What is the difference between `ssh` and `sshd`?

- `ssh` → SSH client (used to connect to remote systems)
- `sshd` → SSH server daemon (runs on the remote machine)

---

## 3️⃣ Where is the SSH server configuration file located?

```

/etc/ssh/sshd_config

````

---

## 4️⃣ How do you start and enable the SSH service?

```bash
sudo systemctl start sshd
sudo systemctl enable sshd
````

---

## 5️⃣ How do you verify SSH is running?

```bash
sudo systemctl status sshd
sudo ss -tlnp | grep sshd
```

---

## 6️⃣ How do you allow SSH through the firewall?

```bash
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

---

## 7️⃣ How do you generate an SSH key pair?

```bash
ssh-keygen -t ed25519 -C "user@host"
```

Common key types:

* RSA (older, widely supported)
* ED25519 (modern, recommended)

---

## 8️⃣ Where are SSH keys stored?

User keys are stored in:

```
~/.ssh/
```

Important files:

* `id_ed25519` → private key
* `id_ed25519.pub` → public key
* `authorized_keys` → allowed public keys for login

---

## 9️⃣ What are correct permissions for SSH keys?

* `~/.ssh` → 700
* Private key → 600
* `authorized_keys` → 600

Incorrect permissions will cause authentication failure.

---

## 🔟 How do you disable root login over SSH?

Edit `/etc/ssh/sshd_config`:

```
PermitRootLogin no
```

Then restart sshd.

---

## 1️⃣1️⃣ How do you disable password authentication?

In `/etc/ssh/sshd_config`:

```
PasswordAuthentication no
PubkeyAuthentication yes
```

Always test key login before disabling passwords.

---

## 1️⃣2️⃣ How do you validate SSH configuration before restart?

```bash
sudo sshd -t
```

This prevents locking yourself out due to syntax errors.

---

## 1️⃣3️⃣ How do you change the default SSH port?

In `/etc/ssh/sshd_config`:

```
Port 2222
```

Then:

* Open new port in firewall
* Restart sshd
* Connect using `ssh -p 2222`

---

## 1️⃣4️⃣ How do you troubleshoot SSH authentication issues?

```bash
ssh -vvv user@host
sudo journalctl -u sshd -f
```

These commands show detailed authentication logs.

---

## 1️⃣5️⃣ Why is key-based authentication preferred?

Because:

* No password brute-force risk
* More secure cryptography
* Suitable for automation
* Required in production and cloud environments

---
