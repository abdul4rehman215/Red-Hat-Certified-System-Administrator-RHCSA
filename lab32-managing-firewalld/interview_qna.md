# 🎤 Interview Q&A — Lab 32: Managing Firewall with firewalld (RHCSA)

---

## 1️⃣ What is firewalld and how is it different from iptables?

**Answer:**

`firewalld` is a dynamic firewall management tool used in RHEL-based systems.  
It acts as a frontend for `iptables` or `nftables` and allows runtime changes without restarting the firewall service.

Key differences:
- Supports dynamic rule changes (no service restart required)
- Uses **zones** for network segmentation
- Separates runtime and permanent configurations
- Easier management using `firewall-cmd`

---

## 2️⃣ What are firewall zones in firewalld?

**Answer:**

Zones define trust levels for network connections.  
Each zone has its own set of allowed services, ports, and rules.

Common zones:
- `public` – Default, minimal trust
- `internal` – Trusted internal networks
- `dmz` – Public-facing services
- `trusted` – All traffic allowed
- `drop` – Drops all incoming traffic

---

## 3️⃣ How do you check the current firewall state?

**Answer:**

```bash
sudo firewall-cmd --state
````

If running, output will be:

```
running
```

---

## 4️⃣ What is the difference between runtime and permanent rules?

**Answer:**

* **Runtime rules**: Active immediately but lost after reboot
* **Permanent rules**: Saved to configuration files but require `--reload` to apply

Example:

```bash
sudo firewall-cmd --add-service=http
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload
```

---

## 5️⃣ How do you open a specific port in firewalld?

**Answer:**

```bash
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```

To verify:

```bash
sudo firewall-cmd --list-ports
```

---

## 6️⃣ How do you assign an interface to a specific zone?

**Answer:**

```bash
sudo firewall-cmd --zone=public --change-interface=eth0 --permanent
sudo firewall-cmd --reload
```

Verify:

```bash
sudo firewall-cmd --get-zone-of-interface=eth0
```

---

## 7️⃣ How can you create a custom service in firewalld?

**Answer:**

```bash
sudo firewall-cmd --permanent --new-service=myapp
sudo firewall-cmd --permanent --service=myapp --add-port=9090/tcp
sudo firewall-cmd --zone=public --add-service=myapp --permanent
sudo firewall-cmd --reload
```

Custom services help maintain consistent configuration across deployments.

---

## 8️⃣ What is a rich rule in firewalld?

**Answer:**

A rich rule provides advanced filtering capabilities such as:

* Source-based filtering
* Logging
* Specific protocol control

Example:

```bash
sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.100" service name="ssh" accept' --permanent
sudo firewall-cmd --reload
```

---

## 9️⃣ How do you enable firewall logging for denied packets?

**Answer:**

```bash
sudo firewall-cmd --set-log-denied=all
```

Check current setting:

```bash
sudo firewall-cmd --get-log-denied
```

---

## 🔟 How do you verify which ports are open on your system?

**Answer:**

Using firewalld:

```bash
sudo firewall-cmd --list-ports
```

Using nmap:

```bash
nmap -p 8080 <server-ip>
```

---

## 1️⃣1️⃣ What is panic mode in firewalld?

**Answer:**

Panic mode blocks all incoming and outgoing traffic immediately.

Enable:

```bash
sudo firewall-cmd --panic-on
```

Disable:

```bash
sudo firewall-cmd --panic-off
```

Used during emergency security situations.

---

## 1️⃣2️⃣ How do you troubleshoot when firewall rules don’t apply?

**Answer:**

1. Check if firewalld is running:

   ```bash
   sudo firewall-cmd --state
   ```
2. Ensure permanent changes were reloaded:

   ```bash
   sudo firewall-cmd --reload
   ```
3. Verify runtime vs permanent config:

   ```bash
   sudo firewall-cmd --list-all
   sudo firewall-cmd --list-all --permanent
   ```

---

## 1️⃣3️⃣ How do zones improve security?

**Answer:**

Zones allow separation of network traffic by trust level.

Example:

* Public servers → `public` zone
* Internal LAN → `internal` zone
* DMZ services → `dmz` zone

This minimizes exposure and enforces least privilege networking.

---

## 1️⃣4️⃣ Why is firewalld important for RHCSA?

**Answer:**

firewalld is directly tested in RHCSA objectives:

* Opening/closing ports
* Managing services
* Configuring zones
* Troubleshooting connectivity
* Securing Linux servers

Understanding firewalld is essential for both exam success and real-world system administration.

---

## 1️⃣5️⃣ What are best practices for firewall management?

**Answer:**

* Apply **least privilege principle**
* Open only required services/ports
* Use zones properly
* Regularly audit rules
* Enable logging for denied traffic
* Backup `/etc/firewalld` configurations
* Test exposure using `nmap`

---

# ✅ Interview Section Complete

This lab demonstrates strong understanding of:

* firewalld architecture
* Runtime vs permanent configs
* Zone-based firewall design
* Service and port management
* Rich rules
* Logging and troubleshooting

Ready for RHCSA-level questioning.
