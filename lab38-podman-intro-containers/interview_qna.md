# Interview Q&A — Lab 38: Introduction to Containers with Podman

## 1) Core Concepts

### Q1. What is a container, and how is it different from a VM?
**Answer:**  
A container packages an application and its dependencies but shares the host OS kernel. A VM includes a full guest OS on virtual hardware. Containers start faster, use fewer resources, and are easier to ship across environments.

### Q2. What problem does containerization solve?
**Answer:**  
It solves “works on my machine” by standardizing runtime dependencies and improving portability, repeatability, and deployment speed.

### Q3. What is an image vs a container?
**Answer:**  
An **image** is a read-only template (layers + metadata). A **container** is a running (or stopped) instance created from an image with a writable layer.

---

## 2) Podman Basics

### Q4. What is Podman, and why is it popular on RHEL-based systems?
**Answer:**  
Podman is a daemonless OCI container engine compatible with Docker CLI style. It integrates well with systemd, SELinux, and rootless containers, making it common in enterprise Linux environments.

### Q5. What does “daemonless” mean in Podman?
**Answer:**  
Podman does not require a long-running background daemon like Docker. Commands interact directly with the container runtime per execution.

### Q6. What is “rootless Podman” and why is it important?
**Answer:**  
Rootless Podman allows running containers as a normal user without root privileges. This reduces attack surface and aligns with least privilege.

### Q7. Why does Podman support Docker Hub images even though it isn’t Docker?
**Answer:**  
Because images follow OCI standards and registries like Docker Hub store OCI-compatible images. The container message text may still say “Docker” inside the image (like hello-world), which is normal.

---

## 3) Running and Managing Containers

### Q8. Explain this command: `podman run -d --name my-nginx -p 8080:80 nginx`
**Answer:**  
- `run`: create + start a container  
- `-d`: detached mode  
- `--name`: assigns a readable name  
- `-p 8080:80`: maps host port 8080 → container port 80  
- `nginx`: image name/tag

### Q9. How do you list running containers vs all containers?
**Answer:**  
- Running only: `podman ps`  
- All including stopped: `podman ps -a`

### Q10. How do you stop, start, and restart containers?
**Answer:**  
- `podman stop <name>`  
- `podman start <name>`  
- `podman restart <name>`

### Q11. What is the difference between pause/unpause vs stop/start?
**Answer:**  
Pause freezes container processes (SIGSTOP-like behavior) without stopping the container. Stop terminates processes and changes state to exited.

---

## 4) Inspecting and Troubleshooting

### Q12. How do you view container logs?
**Answer:**  
- `podman logs <container>`  
- Follow live: `podman logs -f <container>`

### Q13. How do you inspect container configuration?
**Answer:**  
Use `podman inspect <container>` to view JSON details like mounts, networks, ports, env vars, and state.

### Q14. How do you check container resource usage?
**Answer:**  
Use `podman stats <container>` for CPU/memory/network/block IO metrics.

### Q15. A container starts and immediately exits. What do you check first?
**Answer:**  
1) `podman logs <name>`  
2) `podman inspect <name>` (exit code, command)  
3) Confirm entrypoint/command is correct  
4) Try running interactively: `podman run -it --rm <image> /bin/sh`

---

## 5) Images and Registries

### Q16. How do you list images and remove an image?
**Answer:**  
- List: `podman images`  
- Remove: `podman rmi <image>`

### Q17. Why might `podman rmi` fail?
**Answer:**  
If the image is in use by a container (running or sometimes stopped), it cannot be removed until the container is removed.

### Q18. How do you search for images in a registry?
**Answer:**  
Use `podman search <keyword>` (e.g., `podman search httpd`).

### Q19. What is an image tag?
**Answer:**  
A tag is a label for a specific image version, like `nginx:latest` or `python:3.9-slim`.

---

## 6) Executing Commands and Copying Files

### Q20. How do you run commands inside a running container?
**Answer:**  
Use `podman exec <container> <command>`  
Example: `podman exec my-nginx ls -la /usr/share/nginx/html`

### Q21. How do you copy files into or out of a container?
**Answer:**  
`podman cp <src> <container>:<dest>` or reverse.  
Example: `podman cp test.txt my-nginx:/usr/share/nginx/html/`

---

## 7) Volumes and Persistence

### Q22. Why do we need volumes?
**Answer:**  
Container filesystem is ephemeral; volumes persist data outside container lifecycle and survive container removal.

### Q23. How do you create and use a named volume?
**Answer:**  
- Create: `podman volume create my-data`  
- Use: `podman run -v my-data:/data ...`

---

## 8) Networking

### Q24. What does `-p 8080:80` do?
**Answer:**  
Exposes container port 80 to host port 8080 via port forwarding/NAT.

### Q25. How do containers communicate on a custom Podman network?
**Answer:**  
Containers attached to the same custom network can resolve each other by container name and communicate via internal IP.

---

## 9) Cleanup and Maintenance

### Q26. How do you remove a container?
**Answer:**  
`podman rm <container>` (must be stopped first unless using force)

### Q27. How do you stop all running containers quickly?
**Answer:**  
`podman stop $(podman ps -q)`

### Q28. What do `podman container prune` and `podman image prune` do?
**Answer:**  
- `container prune`: removes stopped containers  
- `image prune`: removes dangling unused images (not all images)

### Q29. What does `podman system df` show?
**Answer:**  
Disk usage summary for images, containers, and volumes + reclaimable space.

---

## 10) Security and Enterprise Relevance

### Q30. Why is Podman often preferred in secure environments?
**Answer:**  
Rootless support, SELinux integration, no daemon exposure, and better alignment with least privilege + systemd practices.

### Q31. What’s the risk of running containers as root?
**Answer:**  
Privilege escalation and larger blast radius if container breaks isolation. Rootless reduces impact.

---

## Quick Practical Questions (Rapid Fire)

- **Command to verify Podman installed?** → `podman --version`  
- **Show running containers?** → `podman ps`  
- **Show all containers?** → `podman ps -a`  
- **Show container logs?** → `podman logs <name>`  
- **Inspect container config?** → `podman inspect <name>`  
- **Remove container?** → `podman rm <name>`  
- **Remove image?** → `podman rmi <image>`  
- **Create volume?** → `podman volume create <vol>`  
- **Check disk usage?** → `podman system df`  

---
