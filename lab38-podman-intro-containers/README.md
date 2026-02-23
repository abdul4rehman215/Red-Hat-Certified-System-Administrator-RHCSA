# 🧪 Lab 38: Introduction to Containers with Podman

> This lab introduces **container fundamentals** using **Podman** on a CentOS Stream 9 / RHEL9-like system.  
> I'll install Podman, run containers from public registries, inspect images/containers, and practice the **container lifecycle** (start/stop/logs/exec/copy/cleanup).

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand **core containerization concepts** (images, containers, registries, ports)
- Install and validate **Podman**
- Run containers (NGINX + Python HTTP server)
- Manage images (list/inspect/history/search/pull/remove)
- Perform lifecycle operations (start/stop/restart/pause/logs/stats)
- Execute commands inside containers and copy files to/from containers
- Understand key differences: **Podman vs Docker** (daemonless, rootless, pods support)

---

## ✅ Prerequisites

- Comfortable with Linux CLI (files, permissions, basic networking)
- Familiarity with package management (`dnf`)
- Basic understanding of ports and services (localhost, HTTP)

---

## 🧰 Lab Environment

- OS: **CentOS Stream 9 / RHEL9-like**
- Container runtime: **Podman (rootless supported)**
- Internet access for pulling images
- SELinux enabled (typical on RHEL-family systems)

---

## 📌 What I Built

### Task 1 — Install Podman + Run Containers
- Verified Podman installation and runtime details using:
  - `podman --version`
  - `podman system info`
- Ran:
  - **NGINX** container mapped to host port `8080`
  - **Python** HTTP server container mapped to host port `8081`
- Confirmed service availability using `curl`

### Task 2 — Image Management
- Listed and inspected images (`podman images`, `podman inspect`)
- Viewed image history (`podman history`)
- Searched and pulled images (`podman search`, `podman pull`)
- Observed safe behavior: images used by running containers cannot be removed

### Task 3 — Container Lifecycle + Inspection
- Container operations:
  - `start`, `stop`, `restart`, `pause`, `unpause`
- Observability:
  - `podman logs`, `podman stats`, `podman inspect`
- Inside-container actions:
  - `podman exec` for commands/shell access
  - `podman cp` to copy files into a running web container
- Cleanup:
  - `podman rm`, `podman container prune`, `podman image prune`

---

## 📂 Repository Structure

```text
lab38-podman-intro-containers/
├── README.md
├── commands.sh
├── scripts/
│   ├── (optional) demo-webfiles/
│   └── (optional) helper-checks.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
````

**Notes**

* `commands.sh` contains only the commands used (in order).
* `output.txt` contains selected key outputs (proof of work).
* `troubleshooting.md` captures real-world failure cases (ports, SELinux, pulls, rootless).

---

## 🧠 Key Concepts (Quick Reference)

* **Image**: blueprint/template (immutable layers)
* **Container**: running instance of an image
* **Registry**: remote store for images (Docker Hub, Quay)
* **Port mapping**: expose container service to host (`-p host:container`)
* **Rootless Podman**: containers run without root daemon (safer default)

---

## 🧩 Podman vs Docker (Practical Differences)

* **Podman is daemonless** (no always-running root daemon like Docker)
* **Rootless by default** is common and safer
* Podman supports **pods** natively (Kubernetes-style grouping)
* CLI is largely Docker-compatible, making migration easier

---

## ✅ What You Learned

* Installed and validated Podman on RHEL-family Linux
* Pulled and ran containers from registries
* Managed containers through their lifecycle
* Inspected logs, state, ports, resource usage
* Worked with containers interactively using `exec` and `cp`
* Cleaned up containers/images safely

---

## 🌍 Why This Matters

Containers are a foundation for:

* Cloud-native deployment (microservices)
* CI/CD pipelines (repeatable builds)
* Portable dev/test environments
* Scalable service hosting

Podman is especially relevant in **RHEL environments** and aligns well with modern enterprise security defaults (rootless + SELinux).

---

## 🧪 Verification Checklist

* [ ] `podman --version` returns a valid version
* [ ] Able to pull and run public images (nginx/python)
* [ ] Can map ports and validate with `curl`
* [ ] Can inspect logs and container config
* [ ] Can exec into containers and copy files
* [ ] Can stop/remove containers and prune safely

---
