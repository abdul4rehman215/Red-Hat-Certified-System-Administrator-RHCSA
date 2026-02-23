# 🔥 Lab 32: Managing Firewall with firewalld (RHCSA)

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand the fundamentals of **firewalld** and its architecture (zones, runtime vs permanent)
- Configure firewall rules using `firewall-cmd`
- Manage firewall zones and assign network interfaces to zones
- Configure services and ports for different zones
- Create and apply custom service definitions
- Test and validate firewall configurations using common tools
- Troubleshoot common firewalld issues and apply security best practices

---

## ✅ Prerequisites

- Basic Linux command-line skills
- Networking concepts (IP addresses, ports, protocols)
- Familiarity with systemd services
- Basic security concepts
- Sudo access on a CentOS/RHEL machine

---

## 🧰 Lab Environment

This lab was performed on a cloud-hosted CentOS/RHEL 8/9 system with:

- `firewalld` pre-installed
- Sudo privileges for the `centos` user
- Network connectivity for service testing
- Standard tools (and additional utilities installed during lab)

**Environment:** CentOS/RHEL 8/9 (Cloud Lab Environment)  
**User:** `centos` (sudo access)  
**Shell Prompt:** `-bash-4.2$`

---

## 📁 Repository Structure

```text
lab32-managing-firewalld/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── scripts/
    ├── firewall-test.sh
````

> Note: A temporary Python HTTP server was used for testing port accessibility.
> firewalld configuration changes were validated with `curl`, `nmap`, and `telnet`.

---

## 🧩 Lab Tasks Overview

### ✅ Task 1: Configure Firewall Rules Using firewalld

**What was performed:**

* Verified `firewalld` service status via systemd
* Started and enabled the service (for persistence)
* Verified runtime state (`running`)
* Inspected default zone configuration and allowed services

**Key commands used:**

* `systemctl status firewalld`
* `systemctl start/enable firewalld`
* `firewall-cmd --state`
* `firewall-cmd --list-all`

---

### ✅ Task 1.2: Basic Rules (Services)

**What was performed:**

* Checked default zone (`public`)
* Listed all zones
* Added `http` service as a runtime rule
* Confirmed service list updated
* Made `http` rule permanent
* Reloaded firewall to apply permanent configuration

**Key concepts:**

* **Runtime vs Permanent rules**
* `--reload` is required after permanent changes

---

### ✅ Task 1.3: Ports and Protocols

**What was performed:**

* Added port `8080/tcp` (runtime + permanent)
* Added port range `3000-3005/tcp` then removed it (permanent)
* Added UDP port `53/udp` permanently
* Reloaded and verified open ports

---

## 🧩 Task 2: Manage Zones and Services

### ✅ Task 2.1: Zones Review and Defaults

**What was performed:**

* Enumerated all zones and their configs
* Inspected `dmz`, `internal`, and `trusted` zones
* Verified active zone and interface assignment (`eth0`)
* Changed default zone to `internal` and verified

---

### ✅ Task 2.2: Assigning Interfaces and Sources

**What was performed:**

* Verified network interfaces and IP addressing
* Assigned `eth0` to `public` zone permanently
* Verified zone-of-interface mapping
* Added then removed a trusted source range (`192.168.1.0/24`) as a permanent test

---

### ✅ Task 2.3: Services by Zone + Custom Service

**What was performed:**

* Listed firewalld known services
* Added zone-specific services:

  * `public`: `ssh`, `https`
  * `internal`: `samba`
* Removed `dhcpv6-client` from public zone
* Created a **custom service** `myapp`
* Added port `9090/tcp` to the custom service
* Enabled `myapp` in the `public` zone and verified service list

---

## 🧩 Task 3: Test Firewall Configurations

### ✅ Task 3.1: Port Accessibility Testing

**What was performed:**

* Installed testing tools (`nmap`, `telnet`, `nmap-ncat`)

  * Confirmed `nc` package name differs on RHEL (`nmap-ncat`)
* Started a local test web server on port **8080**
* Validated local reachability via `curl`
* Verified port visibility via `nmap -p 8080`
* Verified closed port behavior via `nmap -p 9999`
* Stopped the test web server cleanly

---

### ✅ Task 3.2: Zone Configuration Testing

**What was performed:**

* Configured different rules in different zones:

  * `public`: http
  * `internal`: ssh
  * `dmz`: 8443/tcp
* Reloaded firewall and verified zone rule differences
* Simulated zone switching by changing default zone to `dmz` and validating active configuration
* Switched default zone back to `public`

---

### ✅ Task 3.3: Logging + Rich Rules

**What was performed:**

* Enabled denied logging: `--set-log-denied=all`
* Followed firewall-related logs in `/var/log/messages` (as lab used)
* Tested blocked-port behavior using `telnet`
* Verified direct rules (none configured)
* Created a permanent rich rule allowing SSH from a single source IP
* Verified the rich rule list
* Removed the rich rule after testing

> Note on command execution: rich rule commands were executed as valid single-line shell commands (quotes preserved) to match real terminal syntax.

---

## ✅ Result

* firewalld verified running and enabled for persistence
* Services and port rules added and validated (runtime and permanent)
* Zones evaluated, default zone modified, interface zone assignment verified
* Custom service `myapp` created and enabled with port `9090/tcp`
* Testing performed using `curl`, `nmap`, and `telnet`
* Logging enabled and behavior reviewed
* Rich rules created, verified, and cleaned up after validation
* Created a verification script: `scripts/firewall-test.sh`

---

## 🧠 What I Learned

* firewalld is **zone-based**, and zone selection impacts which services/ports are allowed
* Permanent changes require `--permanent` and then `--reload`
* Services simplify configuration (mapped to known port definitions), while ports allow explicit control
* `nmap` is a fast way to validate accessible ports
* Rich rules provide fine-grained filtering (source-based access control)
* Logging denied traffic helps visibility during troubleshooting and security monitoring

---

## 🔐 Why This Matters (Security + Admin Relevance)

Firewall configuration is one of the most important controls for Linux host security:

* Reduces attack surface by allowing only required inbound services/ports
* Supports network segmentation through zones
* Provides auditability and visibility with denied logging
* Enables policy-based control (rich rules) without complex iptables syntax

This lab directly supports RHCSA objectives around:

* Security controls
* Services exposure
* Troubleshooting connectivity issues safely

---

## 🌍 Real-World Applications

* Hardening Linux servers by restricting unnecessary ports and services
* Segmenting environments (public vs internal vs dmz)
* Creating application-specific firewall services for consistent deployments
* Validating exposure using scanning and testing tools
* Enabling logging for incident investigations and operational monitoring

---

## ✅ Conclusion

This lab covered the complete workflow for managing host firewall policy using firewalld:

* Service management with runtime/permanent rules
* Zone and interface mapping
* Custom service creation
* Validation with live network tools
* Troubleshooting and best-practice alignment

✅ Lab completed successfully in a CentOS/RHEL cloud environment
