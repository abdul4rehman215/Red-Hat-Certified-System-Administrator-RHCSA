# 🔐 Lab 26: Configuring SSH for Remote Access

---

## 🎯 Objective

This lab focuses on installing, configuring, securing, and testing SSH (Secure Shell) on a CentOS/RHEL system.  
By completing this lab, you will gain hands-on experience with secure remote administration and SSH hardening techniques.

---

## 🧠 Skills Gained

- Installing and managing OpenSSH server and client packages  
- Managing the `sshd` service using systemd  
- Configuring firewall rules for SSH access  
- Testing local and remote SSH connectivity  
- Implementing key-based authentication  
- Hardening SSH configuration for production environments  
- Troubleshooting common SSH connectivity issues  

---

## 📋 Prerequisites

Before starting this lab,I should have:

- Basic Linux command-line knowledge  
- Understanding of users, groups, and file permissions  
- Familiarity with text editors (nano or vim)  
- Basic networking knowledge (IP addresses and ports)  
- Sudo or root access  

---

## 🖥 Lab Environment

- CentOS / RHEL 8 or 9 virtual machines  
- Two systems for remote testing (recommended)  
- firewalld enabled  
- Network connectivity between machines  

---

## 🛠 Tasks Overview

This lab covers the following major areas:

### 1️⃣ Installing and Managing OpenSSH
- Verifying SSH components
- Installing server and client packages
- Starting and enabling the SSH service

### 2️⃣ Configuring Firewall Access
- Allowing SSH through firewalld
- Verifying listening ports

### 3️⃣ Testing SSH Connectivity
- Local SSH login testing
- Remote SSH login testing
- Using verbose mode for debugging

### 4️⃣ Implementing Key-Based Authentication
- Generating SSH key pairs
- Configuring authorized_keys
- Verifying passwordless login

### 5️⃣ Applying SSH Security Best Practices
- Disabling password authentication
- Disabling root login
- Restricting user access
- Changing default SSH port (optional)
- Applying connection limits and idle timeouts

### 6️⃣ Troubleshooting SSH Issues
- Diagnosing connection refused errors
- Fixing permission problems
- Validating SSH configuration safely

---

## 🔐 Why This Lab Matters

SSH is the foundation of Linux system administration.  
It enables secure remote server management, automation, and secure communication.

Understanding SSH configuration is essential for:

- Cloud server management  
- DevOps workflows  
- Production server security  
- CI/CD pipelines  
- Enterprise Linux environments  

---

## 🌍 Real-World Applications

- Managing cloud infrastructure (AWS, Azure, GCP)
- Secure remote server administration
- Automated deployments using SSH keys
- Secure file transfers (SCP/SFTP)
- Establishing encrypted tunnels for services

---

## 📊 Result

After completing this lab, I:

- Successfully configure SSH for secure remote access  
- Implement key-based authentication  
- Harden SSH configuration for security  
- Diagnose and resolve SSH connectivity issues  
- Be prepared for RHCSA-level SSH configuration tasks  

---

## 📁 Repository Structure

```

lab26-configuring-ssh/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

## ✅ Conclusion

This lab builds a strong foundation in secure remote system administration using SSH.

Mastering SSH configuration is critical for Linux administrators and is directly aligned with RHCSA certification objectives.

SSH is not just a remote login tool — it is a core security component of every Linux server environment.
