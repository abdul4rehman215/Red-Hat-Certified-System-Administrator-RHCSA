# 🎤 Interview Q&A - Lab 04: Accessing Remote Systems with SSH

---

## 1️⃣ What is SSH and why is it used?

SSH (Secure Shell) is a cryptographic network protocol used to securely access and manage remote systems over an unsecured network.  
It encrypts communication between client and server, preventing interception and credential theft.

---

## 2️⃣ What port does SSH use by default?

SSH uses **TCP port 22** by default.

It can be changed in the SSH server configuration file:

```bash
/etc/ssh/sshd_config
````

---

## 3️⃣ What is the difference between SSH password authentication and key-based authentication?

| Password Authentication   | Key-Based Authentication     |
| ------------------------- | ---------------------------- |
| Uses user password        | Uses public/private key pair |
| Less secure               | More secure                  |
| Vulnerable to brute force | Resistant to brute force     |
| Requires manual login     | Enables automated login      |

Key-based authentication is recommended in production environments.

---

## 4️⃣ What is Ed25519?

Ed25519 is a modern, high-security public-key signature algorithm used in SSH.

Benefits:

* Faster key generation
* Strong cryptographic security
* Smaller key size
* Resistant to certain cryptographic attacks

---

## 5️⃣ How does SSH key authentication work?

1. Client generates key pair.
2. Public key is copied to remote server (`~/.ssh/authorized_keys`).
3. During login:

   * Server verifies client owns the private key.
   * If match succeeds → access granted.

No password is required.

---

## 6️⃣ What is `ssh-copy-id` used for?

It securely copies the public key to the remote server’s `authorized_keys` file.

Example:

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@remote_host
```

---

## 7️⃣ How do you check if SSH service is running?

```bash
sudo systemctl status ssh
```

If inactive:

```bash
sudo systemctl start ssh
```

---

## 8️⃣ What is SCP?

SCP (Secure Copy Protocol) is used to transfer files securely between systems over SSH.

Example (local → remote):

```bash
scp file.txt user@remote:/path/
```

Example (remote → local):

```bash
scp user@remote:/path/file.txt ./
```

---

## 9️⃣ What permissions should `.ssh` directory have?

Proper permissions are critical:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

Incorrect permissions can cause key authentication failure.

---

## 🔟 How can SSH security be hardened?

Best practices:

* Disable root login (`PermitRootLogin no`)
* Disable password authentication (`PasswordAuthentication no`)
* Use key-based authentication only
* Change default port
* Enable firewall rules
* Use Fail2Ban
* Restrict users with `AllowUsers`

---

## 1️⃣1️⃣ Why is SSH important in cloud environments?

SSH is used to:

* Manage EC2 instances
* Administer Kubernetes nodes
* Deploy applications
* Configure servers
* Troubleshoot infrastructure
* Automate tasks via Ansible

It is foundational for DevOps, SRE, Cloud Engineering, and Cybersecurity roles.

---

# ✅ Lab Knowledge Summary

After completing this lab, I can confidently:

* Establish secure SSH connections
* Implement key-based authentication
* Securely transfer files using SCP
* Verify SSH services
* Troubleshoot authentication issues

---
