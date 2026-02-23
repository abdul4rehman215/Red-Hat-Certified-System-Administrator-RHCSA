#!/usr/bin/env bash
set -euo pipefail

# Lab 38: Introduction to Containers with Podman
# Environment: CentOS Stream 9 / RHEL9-like
# NOTE: Run as a normal user where possible (rootless Podman),
# and use sudo only for package installation.

echo "[+] Task 1: Install + verify Podman"

sudo dnf update -y
sudo dnf install -y podman

podman --version
podman system info

echo
echo "[+] Task 1.2: Run first container (NGINX on 8080)"

podman run -d --name my-nginx -p 8080:80 docker.io/nginx:latest
podman ps
curl -s http://localhost:8080 | head -20

echo
echo "[+] Task 1.3: Run Python HTTP server container (8081 -> 8000)"

podman run -d --name python-server -p 8081:8000 docker.io/python:3.9-slim \
  sh -c "python -m http.server 8000"
podman ps

echo
echo "[+] Task 2.1: Images - list/inspect/history"

podman images
podman inspect docker.io/nginx:latest | head -35
podman history docker.io/nginx:latest

echo
echo "[+] Task 2.2: Search + pull images"

podman search httpd | head -12
podman pull docker.io/httpd:2.4
podman pull docker.io/alpine:3.18
podman images

echo
echo "[+] Task 2.3: Remove images (show behavior when image is in use)"

podman rmi docker.io/httpd:2.4 || true
podman rmi docker.io/alpine:3.18 docker.io/python:3.9-slim || true
podman images

echo
echo "[+] Task 3.1: Container lifecycle (start/stop/restart/pause/unpause)"

podman ps -a
podman stop my-nginx
podman start my-nginx
podman restart my-nginx
podman pause my-nginx
podman unpause my-nginx

echo
echo "[+] Task 3.2: Inspect/logs/stats"

podman inspect my-nginx | head -40
podman logs my-nginx | head -20
# podman logs -f my-nginx   # interactive follow (Ctrl+C to stop)
# podman stats my-nginx     # interactive (Ctrl+C to stop)

echo
echo "[+] Task 3.3: Exec into container + copy a file"

podman exec my-nginx ls -la /usr/share/nginx/html
# podman exec -it my-nginx /bin/bash   # interactive shell, then exit

echo "Hello from host" > test.txt
podman cp test.txt my-nginx:/usr/share/nginx/html/
curl -s http://localhost:8080/test.txt

echo
echo "[+] Task 3.4: Cleanup containers + prune"

podman stop $(podman ps -q) || true
podman rm my-nginx python-server || true
podman container prune -f
podman image prune -f

echo
echo "[+] Advanced: Volumes"

podman volume create my-data
podman volume ls
podman run -d --name data-container -v my-data:/data docker.io/alpine:latest sleep 3600
podman ps -a

echo
echo "[+] Advanced: Networking"

podman network create my-network
podman run -d --name web1 --network my-network docker.io/nginx:latest
podman run -d --name web2 --network my-network docker.io/nginx:latest
podman ps
# podman exec web1 ping web2   # may require ping inside image; Ctrl+C to stop

echo
echo "[+] Troubleshooting helpers"

podman system events --since 10m | head -10
podman system df
podman system info | head -20
# podman system reset          # destructive - do NOT run unless intended

echo
echo "[+] Verification: hello-world"

podman run --rm docker.io/hello-world
podman ps -a
podman images

echo
echo "[+] End of Lab 38 commands"
