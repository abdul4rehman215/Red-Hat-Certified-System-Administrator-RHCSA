# 🛠 Troubleshooting Guide — Lab 38: Podman Containers

> This guide covers common issues encountered while working with Podman on CentOS Stream / RHEL9-like systems.

---

# 🔎 Issue 1: Podman Command Not Found

## ❌ Error
```

podman: command not found

````

## ✅ Solution

Check installation:

```bash
dnf list installed podman
````

If not installed:

```bash
sudo dnf install -y podman
```

Verify:

```bash
podman --version
```

---

# 🔎 Issue 2: Permission Denied (Rootless Problems)

## ❌ Symptoms

* Permission denied when accessing container storage
* Error related to `/run/user/UID`

## ✅ Check Rootless Setup

```bash
podman info | grep rootless
```

Ensure:

* Running as normal user (not root unless intended)
* User has a valid home directory
* `/etc/subuid` and `/etc/subgid` entries exist

Check:

```bash
grep centos /etc/subuid
grep centos /etc/subgid
```

---

# 🔎 Issue 3: Port Already in Use

## ❌ Error

```
Error: bind: address already in use
```

## ✅ Check Which Process Is Using the Port

```bash
ss -tulnp | grep 8080
```

or

```bash
lsof -i :8080
```

## ✅ Fix Options

* Stop conflicting container:

  ```bash
  podman stop <container>
  ```
* Use a different host port:

  ```bash
  podman run -p 8082:80 nginx
  ```

---

# 🔎 Issue 4: Image Pull Fails

## ❌ Error

```
Error: unable to pull image
```

## ✅ Verify Internet Connectivity

```bash
ping -c 3 docker.io
```

## ✅ Check Registry Configuration

```bash
cat /etc/containers/registries.conf
```

## ✅ Try Explicit Registry Path

```bash
podman pull docker.io/library/nginx:latest
```

---

# 🔎 Issue 5: Container Exits Immediately

## ❌ Symptoms

Container starts then shows `Exited` state.

## ✅ Check Container Logs

```bash
podman logs <container>
```

## ✅ Inspect Exit Code

```bash
podman inspect <container> | grep ExitCode
```

Common causes:

* Incorrect command
* Application crash
* Missing entrypoint

---

# 🔎 Issue 6: Cannot Remove Image

## ❌ Error

```
image is in use by a container
```

## ✅ Fix

List containers using the image:

```bash
podman ps -a
```

Stop + remove containers:

```bash
podman stop <container>
podman rm <container>
```

Then remove image:

```bash
podman rmi <image>
```

---

# 🔎 Issue 7: SELinux Blocking Container Access

On RHEL-based systems, SELinux may block volume access.

## ❌ Symptoms

Permission denied when mounting host directory.

## ✅ Solution: Use :Z or :z Label

Example:

```bash
podman run -v /host/data:/data:Z alpine
```

Check SELinux status:

```bash
getenforce
```

---

# 🔎 Issue 8: Container Cannot Access Another Container

## ❌ Symptoms

Ping or service unreachable between containers.

## ✅ Verify Network

```bash
podman network ls
```

## ✅ Ensure Both Containers Are On Same Network

```bash
podman inspect web1 | grep Network
podman inspect web2 | grep Network
```

If needed:

```bash
podman network create my-network
podman run --network my-network ...
```

---

# 🔎 Issue 9: podman exec Fails

## ❌ Error

```
container not running
```

## ✅ Verify Container Status

```bash
podman ps -a
```

Start if stopped:

```bash
podman start <container>
```

---

# 🔎 Issue 10: Disk Space Usage Growing

Containers and images consume disk space.

## ✅ Check Usage

```bash
podman system df
```

## ✅ Clean Up

Remove stopped containers:

```bash
podman container prune
```

Remove dangling images:

```bash
podman image prune
```

---

# 🔎 Issue 11: Network Port Works on Host But Not Externally

## Possible Causes

* Cloud firewall rules
* Security group rules
* SELinux policy
* Incorrect host binding

Verify binding:

```bash
podman ps
```

Should show:

```
0.0.0.0:8080->80/tcp
```

---

# 🔎 Issue 12: Rootless Container Networking Limitations

Rootless mode uses `slirp4netns`.

Check:

```bash
podman info | grep slirp
```

If advanced networking required:

* Use rootful container (with sudo)
* Or configure CNI networks properly

---

# 🔎 Issue 13: Container Performance Issues

Check resource usage:

```bash
podman stats
```

If high CPU/memory:

* Limit resources:

```bash
podman run --memory 512m --cpus 1 nginx
```

---

# 🔎 Issue 14: Volume Data Not Persisting

## Check Mount

```bash
podman inspect <container> | grep Mounts -A 5
```

Ensure:

* Correct volume name
* Correct path mapping
* Container not recreated without volume

---

# 🔎 Issue 15: podman system reset Warning

This command removes EVERYTHING:

```bash
podman system reset
```

Removes:

* Containers
* Images
* Volumes
* Networks

⚠ Use only in lab/testing environments.

---

# 🧠 Best Practices

✔ Use specific image tags (avoid `latest` in production)
✔ Prefer rootless containers
✔ Use volumes for persistent data
✔ Monitor logs regularly
✔ Limit container resources
✔ Clean unused images periodically
✔ Use SELinux labels properly

---

# 🔐 Security Considerations

* Avoid running containers as privileged
* Minimize exposed ports
* Use trusted registries
* Regularly update images
* Inspect images before deployment
* Avoid embedding secrets inside images

---

# 🎯 RHCSA-Relevant Skills Covered

* Installing Podman
* Running containers
* Managing lifecycle
* Inspecting and troubleshooting
* Working with volumes and networking
* Cleaning up container resources

---

# 🏁 Lab 38 Completed

You now understand:

* Container fundamentals
* Podman architecture
* Image and container management
* Rootless execution model
* Enterprise container troubleshooting

End of Troubleshooting Guide
