#!/bin/bash
# Lab 08 – Managing Files and Directories
# Environment: Ubuntu 24.04.1 LTS
# Hostname: ip-172-31-10-205
# User: toor

# -------------------------------------------------
# Environment Verification
# -------------------------------------------------
cat /etc/os-release

# -------------------------------------------------
# Task 1 – Creating Directories
# -------------------------------------------------

# Create single directory
mkdir lab_files

# Verify creation
ls

# Create nested directories
mkdir -p parent/child/grandchild

# Install tree utility (if not installed)
sudo apt install tree -y

# Verify nested structure
tree parent

# -------------------------------------------------
# Task 2 – Moving, Copying, Deleting Files
# -------------------------------------------------

# Create sample file
touch sample.txt

# Move file into directory
mv sample.txt lab_files/

# Verify move
ls lab_files/

# Copy file
cp lab_files/sample.txt lab_files/sample_copy.txt

# Verify copy
ls lab_files/

# Delete copied file
rm lab_files/sample_copy.txt

# Verify deletion
ls lab_files/

# -------------------------------------------------
# Task 3 – Directory Removal
# -------------------------------------------------

# Remove empty nested directory
rmdir parent/child/grandchild

# Remove entire parent directory recursively
rm -r parent

# Verify removal
ls

# -------------------------------------------------
# Task 4 – Wildcard Operations
# -------------------------------------------------

# Create multiple files
touch lab_files/file{1..5}.txt

# Verify files
ls lab_files/

# Delete all .txt files
rm lab_files/*.txt

# Verify directory is empty
ls lab_files/
