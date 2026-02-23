# 🔐 Lab 04 – Accessing Remote Systems with SSH  

# 🎯 Objectives

By the end of this lab, I was able to:

- Understand SSH fundamentals for secure remote access.
- Establish SSH connections between two Linux systems.
- Configure key-based authentication (Ed25519).
- Transfer files securely using `scp`.
- Verify SSH service status and troubleshoot common issues.

---

# 📋 Prerequisites

- Linux-based local system (Ubuntu 24.04)
- Remote Linux server accessible over network
- OpenSSH client installed on local system
- OpenSSH server installed on remote system
- Terminal access

---

# 📂 Repository Structure

```
lab04-accessing-remote-systems-with-ssh/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── artifacts/
    ├── localfile.txt
    ├── remotefile.txt
```

---

## 🖥️ Lab Environment

- **Local Machine:** `toor@ip-172-31-10-91`
- **Remote Server:** `student@172.31.10.200`
- **Operating System:** Ubuntu 24.04.1 LTS
- **SSH Version:** OpenSSH_9.6p1

This lab was performed in a realistic cloud-based EC2 environment simulating secure remote administration between two Linux systems.

---


# 🧩 Task Overview

---

## 🔹 Task 1 – SSH Setup and Remote Connection

- Verified SSH client installation (`ssh -V`)
- Connected to remote system via password authentication
- Verified SSH service status (`systemctl status ssh`)
- Confirmed secure remote session functionality

---

## 🔹 Task 2 – SSH Key-Based Authentication

- Generated secure **Ed25519 key pair**
- Deployed public key using `ssh-copy-id`
- Verified passwordless authentication
- Confirmed secure login without password prompt

---

## 🔹 Task 3 – Secure File Transfer with SCP

- Created local file
- Transferred file to remote system
- Verified remote file presence
- Created remote file
- Retrieved file securely to local system
- Verified file integrity

---

# 🔐 Security Concepts Applied

- Public/Private key cryptography
- ED25519 secure key algorithm
- SSH host fingerprint verification
- Secure file transfer over encrypted channel
- Proper permission hardening for `.ssh` directory

---

# 🏁 Results

✔ SSH client and server verified  
✔ Secure remote login established  
✔ Key-based authentication implemented  
✔ File transfers successfully completed  
✔ Remote access validated  

---

# 🌍 Real-World Relevance

This lab reflects real-world system administration and DevOps practices:

- Cloud server management (AWS EC2)
- Secure remote infrastructure access
- Automated login setup for CI/CD pipelines
- Secure container and Kubernetes node management
- Infrastructure automation workflows

SSH is a foundational skill for:

- Red Hat certifications (RHCSA / RHCE)
- Cloud Security Engineering
- DevOps & SRE roles
- SOC & Infrastructure management

---

# 🎓 What I Learned

- How SSH handshake and host verification works
- How to securely generate and deploy SSH keys
- How to manage remote systems efficiently
- How to securely move files across systems
- Practical troubleshooting for SSH issues

---

# 🚀 Why This Matters

Secure remote access is critical in:

- Cloud infrastructure
- Container orchestration environments
- Production server management
- Cybersecurity operations
- Automation frameworks (Ansible, CI/CD)

Mastering SSH ensures secure, scalable, and efficient system management.

---

**🔐 Remote Access and Secure File Transfer Verified Successfully**
