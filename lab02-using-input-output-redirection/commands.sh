#!/bin/bash
# Lab 02 – Using Input-Output Redirection
# Commands Executed During Lab
# Sequential execution log (no explanations)

uname -a
podman --version

echo "Hello, Red Hat OpenShift!" > greeting.txt
cat greeting.txt

echo "New content replaces old" > greeting.txt
cat greeting.txt

echo "Additional line" >> greeting.txt
cat greeting.txt

echo "Line 3" >> greeting.txt
echo "Line 4" >> greeting.txt
cat greeting.txt

ls -l | grep "greeting"

cat greeting.txt | wc -l

ps aux | grep podman | wc -l

cat greeting.txt | sort

cat greeting.txt | sort > sorted_greeting.txt
cat sorted_greeting.txt

podman images | grep -v "<none>"

ls /nonexistent 2> error.log
cat error.log

ls /nonexistent /etc/passwd > output.log 2> error.log
cat output.log
cat error.log

ls /nonexistent /etc/passwd &> combined.log
cat combined.log

ls /nonexistent 2> /dev/null

podman run --name testcontainer alpine /bin/false 2> container_error.log
cat container_error.log

(ls /etc/passwd /nonexistent | wc -l > success.log) 2> fail.log
cat success.log
cat fail.log

{
echo "=== System Report ==="
date
echo "=== Memory ==="
free -h
echo "=== Disk Usage ==="
df -h
} > system_report.txt 2> system_errors.log

cat system_report.txt

{
echo "=== Container Images ==="
podman images
echo "=== Running Containers ==="
podman ps
} > container_report.txt 2> container_errors.log

cat container_report.txt

(echo "Lab Verification"; ls /etc/passwd | wc -l; podman images 2>/dev/null | wc -l) > verification.txt
cat verification.txt
