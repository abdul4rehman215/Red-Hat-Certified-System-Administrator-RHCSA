#!/bin/bash
# Lab 11 – Using System Documentation
# Environment: CentOS Linux 7 (Core)
# Hostname: ip-172-31-10-176
# User: centos

# Verify OS
cat /etc/os-release

# View manual page for ls
man ls

# View passwd file format documentation (section 5)
man 5 passwd

# List available sections for passwd
man -f passwd

# Open info documentation for coreutils
info coreutils

# Directly access ls documentation within coreutils
info coreutils ls invocation

# Search documentation using man -k
man -k network

# Equivalent search using apropos
apropos network

# Update man database
sudo mandb

# Use quick help flag
grep --help

# List documentation directory
ls /usr/share/doc | head

# View bash documentation directory
ls /usr/share/doc/bash-4.2.46

# Read bash README file
less /usr/share/doc/bash-4.2.46/README

# Install Apache manual documentation
sudo yum install -y httpd-manual

# Verify Apache documentation installed
ls /usr/share/doc/httpd-manual
