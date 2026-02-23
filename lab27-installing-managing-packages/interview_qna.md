# 🎤 interview Q&A — Lab 27: Installing & Managing Software Packages

## 1) Core Concepts (RHCSA-style)

### Q1. What is the difference between `dnf`, `yum`, and `rpm`?

* **dnf**: High-level package manager (resolves dependencies, installs/removes/updates from repos).
* **yum**: Legacy CLI (on RHEL8/9 it usually points to `dnf`).
* **rpm**: Low-level package tool (queries/verifies/installs local `.rpm` files, does **not** resolve deps automatically).

---

### Q2. What is a repository?

A repository is a remote/local source of packages + metadata used by `dnf` to search and resolve dependencies.

---

### Q3. What does `dnf makecache` do?

Downloads and refreshes repository metadata locally to speed up searches/installs.

---

### Q4. What does `dnf update` do?

Updates installed packages to the newest available versions from enabled repos (dependency-aware).

---

## 2) Commands You Must Know

### Q5. How do you search and get info about a package?

```bash
dnf search <name>
dnf info <name>
```

### Q6. How do you install packages?

```bash
sudo dnf install -y <pkg1> <pkg2>
```

### Q7. How do you remove packages safely?

```bash
sudo dnf remove -y <pkg>
sudo dnf autoremove -y
```

### Q8. How do you list installed packages?

```bash
dnf list installed
dnf list installed | grep <pkg>
```

---

## 3) RPM Query + Verification

### Q9. How do you check if a package is installed?

```bash
rpm -q <pkg>
```

### Q10. How do you show details of an installed package?

```bash
rpm -qi <pkg>
```

### Q11. How do you list files installed by a package?

```bash
rpm -ql <pkg>
```

### Q12. How do you find which package owns a file?

```bash
rpm -qf /path/to/file
```

### Q13. How do you verify package integrity?

```bash
rpm -V <pkg>
```

* **No output** usually means nothing modified from vendor baseline.

---

## 4) Groups + Real-World Use

### Q14. What is a package group in `dnf`?

A collection of related packages (e.g., **Development Tools**) that can be installed together.

Commands:

```bash
dnf group list
dnf group install "Development Tools" -y
```

---

## 5) Scenarios (What interviewers ask)

### Q15. You need `wget` quickly. What do you do?

```bash
sudo dnf install -y wget
which wget
rpm -q wget
```

### Q16. You suspect `/usr/bin/wget` is tampered. How to validate?

```bash
rpm -V wget
rpm -qf /usr/bin/wget
```

### Q17. Your disk is filling up after many installs/removes. What maintenance helps?

```bash
sudo dnf autoremove -y
sudo dnf clean all
```

---

## 6) Security + Best Practices

### Q18. Why should you avoid random repositories?

Untrusted repos can introduce malicious packages, weaken supply-chain security, and break system stability.

### Q19. What’s a good safe workflow before big installs?

```bash
sudo dnf update -y
sudo dnf makecache
sudo dnf install -y <packages>
```

---

## 7) Quick Rapid-Fire

* `dnf repolist` → list enabled repositories
* `dnf check-update` → show available updates
* `rpm -qc <pkg>` → list config files installed by a package
* `rpm -Va` → verify **all** installed packages (noisy; use carefully)
