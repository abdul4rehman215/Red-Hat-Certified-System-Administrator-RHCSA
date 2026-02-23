# 🎓 Interview Q&A — Lab 11: Configuring Networking (RHCSA)

---

## 1️⃣ What is NetworkManager and why is it important in RHEL systems?

**Answer:**  
NetworkManager is a system service that manages network interfaces and connections dynamically.  
In RHEL 8/9, it is the standard and recommended tool for configuring networking.  
It simplifies static and dynamic IP configuration, DNS management, and connection profiles.

---

## 2️⃣ What is `nmcli`?

**Answer:**  
`nmcli` is the command-line interface for NetworkManager.  
It allows administrators to:
- Create and modify network connections
- Assign static IP addresses
- Configure DNS servers
- Activate or deactivate network profiles
- Check connection status

It is the RHCSA-preferred method for network configuration.

---

## 3️⃣ How do you assign a static IP using nmcli?

**Answer:**  

Example:

```bash
sudo nmcli connection add \
 type ethernet \
 con-name "static-conn" \
 ifname eth0 \
 ip4 192.168.1.100/24 \
 gw4 192.168.1.1
````

Then:

```bash
sudo nmcli connection modify "static-conn" ipv4.method manual
sudo nmcli connection up "static-conn"
```

---

## 4️⃣ What is the difference between dynamic and static IP configuration?

**Answer:**

| Dynamic (DHCP)          | Static                        |
| ----------------------- | ----------------------------- |
| Assigned automatically  | Manually configured           |
| May change              | Remains fixed                 |
| Used for client systems | Used for servers              |
| Easier setup            | More controlled configuration |

Servers typically require static IP addresses for consistent accessibility.

---

## 5️⃣ Why are `ifconfig` and `route` considered legacy tools?

**Answer:**
`ifconfig` and `route` belong to the `net-tools` package, which is deprecated in modern Linux distributions.
They:

* Do not integrate with NetworkManager
* Provide temporary configuration
* Lose changes after reboot

Modern alternatives:

* `nmcli`
* `ip`
* `ss`

---

## 6️⃣ How do you check current IP configuration?

**Answer:**

```bash
ip addr show
```

Or:

```bash
nmcli device show
```

---

## 7️⃣ What is the purpose of `hostnamectl`?

**Answer:**
`hostnamectl` manages the system hostname and related metadata.
It allows:

* Setting static hostname
* Setting pretty hostname
* Viewing OS and kernel information
* Managing deployment and location metadata

---

## 8️⃣ Where is the hostname stored in Linux?

**Answer:**
The static hostname is stored in:

```bash
/etc/hostname
```

Local hostname resolution may also require updating:

```bash
/etc/hosts
```

---

## 9️⃣ How do you test basic network connectivity?

**Answer:**
Using `ping`:

```bash
ping -c 4 192.168.1.1
ping -c 4 8.8.8.8
ping -c 4 google.com
```

Test flow:

1. Gateway IP
2. External IP
3. Domain name (DNS verification)

---

## 🔟 What is traceroute used for?

**Answer:**
`traceroute` shows the path packets take from source to destination.
It helps identify:

* Routing problems
* Packet loss
* Delays
* ISP routing hops

Example:

```bash
traceroute google.com
```

---

## 1️⃣1️⃣ What is the difference between pinging an IP vs a domain?

**Answer:**

| Ping IP                         | Ping Domain                       |
| ------------------------------- | --------------------------------- |
| Tests network connectivity only | Tests network + DNS resolution    |
| Bypasses DNS                    | Requires DNS server               |
| Helps isolate DNS issues        | Validates full connectivity stack |

---

## 1️⃣2️⃣ How do you verify DNS configuration?

**Answer:**

Check:

```bash
cat /etc/resolv.conf
```

Test:

```bash
nslookup google.com
dig google.com
```

---

## 1️⃣3️⃣ What command shows listening ports?

**Answer:**

Modern method:

```bash
ss -tuln
```

Legacy method:

```bash
netstat -tuln
```

---

## 1️⃣4️⃣ How do you ensure a network connection persists after reboot?

**Answer:**

Enable autoconnect:

```bash
sudo nmcli connection modify "connection-name" connection.autoconnect yes
```

Verify:

```bash
nmcli connection show "connection-name" | grep autoconnect
```

---

## 1️⃣5️⃣ Why is networking critical for RHCSA?

**Answer:**
Because system administrators must:

* Configure server IP addresses
* Troubleshoot connectivity
* Manage DNS configuration
* Maintain host identity
* Ensure services remain reachable

Networking is one of the most tested and fundamental RHCSA objectives.

---

✅ Interview section completed.
