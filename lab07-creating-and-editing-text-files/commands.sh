#!/bin/bash
# Lab 07 – Creating and Editing Text Files
# Environment: CentOS Linux 7 (Core)
# Hostname: ip-172-31-10-148
# User: centos

# -------------------------------------------------
# Environment Verification
# -------------------------------------------------
cat /etc/os-release

# -------------------------------------------------
# Task 1 – Create and Edit File Using nano
# -------------------------------------------------
nano first_file.txt
# (Inside nano: add text, Ctrl+O, Enter, Ctrl+X)

ls -l first_file.txt

# -------------------------------------------------
# Task 2 – Edit File Using vi
# -------------------------------------------------
vi second_file.txt
# (Inside vi:)
# i  -> insert mode
# Add content
# Esc -> command mode
# dd  -> delete line
# :wq -> save and quit

cat second_file.txt

# -------------------------------------------------
# Task 3 – File Viewing Commands
# -------------------------------------------------
cat first_file.txt

less second_file.txt
# Press q to quit

# -------------------------------------------------
# Task 3 – File Encoding
# -------------------------------------------------
file first_file.txt

sudo yum install -y dos2unix

unix2dos first_file.txt

dos2unix first_file.txt

# -------------------------------------------------
# Task 4 – Create Configuration File
# -------------------------------------------------
nano podman_config.conf
# (Add configuration content)

grep -n '[[:space:]]$' podman_config.conf

wc -l podman_config.conf

ls -l *.txt *.conf

file *
