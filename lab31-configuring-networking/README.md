
# 🌐 Lab 31: Configuring Networking (RHCSA)

## 🎯 Objectives

By the end of this lab, I was able to:

- Configure network interfaces using modern Linux networking tools
- Assign static and dynamic IP addresses using **nmcli**
- Modify system hostname using **hostnamectl** for proper identification
- Test network connectivity using essential diagnostic tools (`ping`, `traceroute`, `nslookup`)
- Understand how network configuration supports system administration workflows
- Troubleshoot basic network connectivity issues in Linux environments

---

## ✅ Prerequisites

- Basic Linux command-line skills
- Familiarity with text editors (`nano`, `vim`, or `gedit`)
- Understanding of IP addresses, subnetting, and DNS concepts
- Knowledge of sudo privileges and file permissions
- Completion of earlier Linux administration labs

---

## 🧰 Lab Environment

This lab was completed on a cloud-hosted CentOS/RHEL 8/9 machine with:

- **NetworkManager** installed and enabled
- Sudo access for network configuration
- Internet connectivity for external testing
- Common diagnostic utilities available (or installed during the lab)


**Environment:** CentOS/RHEL 8/9 (Cloud Lab Environment)  
**User:** `centos` (sudo access)  
**Shell Prompt:** `-bash-4.2$`

---

## 📁 Repository Structure

```text
lab31-configuring-networking/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── scripts/
    └── network_lab.sh
````

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Assign IP Addresses Using `nmcli`

**What was performed:**

* Identified active connections and device status
* Verified current IP configuration using `ip addr`
* Created a **new static** NetworkManager connection profile
* Applied DNS servers and manual IPv4 method
* Activated and validated the new profile on `eth0`

**Tools used:**

* `nmcli connection show`
* `nmcli device status`
* `ip addr show`
* `nmcli connection add/modify/up`

---

### ✅ Task 1 (Legacy): Configure Using `ifconfig` / `route` (Temporary)

**What was performed:**

* Installed `net-tools` package (to access `ifconfig`, `route`, `netstat`)
* Applied a temporary IP using `ifconfig`
* Attempted to add default route (already existed from nmcli profile)
* Verified IP and routing table using `ifconfig` + `route -n`

**Important note:** These changes are **not persistent** after reboot.

---

### ✅ Task 2: Modify Hostname with `hostnamectl`

**What was performed:**

* Verified current hostname via `hostnamectl`, `hostname`, `/etc/hostname`
* Set a new hostname (`lab-server-01`)
* Ensured persistence via `/etc/hostname`
* Updated `/etc/hosts` for local resolution
* Validated hostname resolution via `nslookup`
* Set additional metadata: pretty hostname, deployment, location

---

### ✅ Task 3: Test Network Connectivity

**Connectivity validation included:**

* `ping` to gateway (local)
* `ping` to external IP (8.8.8.8)
* `ping` to domain name (`google.com`)
* `traceroute` to domain and IP (including UDP mode)
* `nslookup` (A record, MX record, reverse lookup, interactive mode)

---

### ✅ Additional Diagnostics

Installed and used:

* `bind-utils` (for `dig`)
* `wget`
* `curl`

Diagnostics executed:

* `dig google.com`
* `curl -I http://google.com`
* `wget --spider http://google.com`
* `ss -tuln` (listening ports)
* `netstat -i` (interface stats)

---

## ✅ Result

* Successfully configured a **static IPv4** connection using `nmcli`
* DNS servers configured and verified
* Hostname updated and confirmed persistent
* Verified gateway, external IP, and domain connectivity
* Confirmed routing path visibility with traceroute
* Confirmed DNS resolution using nslookup and dig
* Packaged the workflow into an executable script (`scripts/network_lab.sh`)

---

## 🧠 What I Learned

* `nmcli` is the RHCSA-standard method for managing network connections on RHEL systems
* Static addressing is essential for consistent server identity and service reliability
* Hostname configuration affects DNS behavior, logs, and service-level identification
* Network troubleshooting starts with:

  * IP reachability (ping IP)
  * DNS validation (nslookup/dig)
  * Path visibility (traceroute)
* Legacy tools can still be useful for quick inspection, but NetworkManager is preferred

---

## 🔐 Why This Matters (RHCSA + Admin Relevance)

Networking is a core Linux administration skill. In real environments, this is required for:

* Server provisioning with static IP addressing
* Troubleshooting outages tied to routing/DNS issues
* Maintaining stable host identity for services, monitoring, and automation
* Verifying external connectivity for package installs and system updates

---

## 🌍 Real-World Applications

* Configuring production servers (static addressing + DNS)
* Debugging DNS misconfiguration impacting applications
* Validating connectivity paths and routing issues
* Ensuring host identity consistency for logging, monitoring, and CM tools

---

## ✅ Conclusion

This lab demonstrated complete host networking setup and validation on a CentOS/RHEL system:

* `nmcli` network profile creation + activation
* Hostname configuration with `hostnamectl`
* Connectivity testing using essential diagnostic tools
* Structured troubleshooting steps for common failures

✅ Lab completed successfully in a CentOS/RHEL cloud environment
✅ Repository structured and ready for GitHub upload
