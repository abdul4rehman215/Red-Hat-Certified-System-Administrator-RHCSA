#!/bin/bash
# Lab 06 – Archiving, Compressing, and Unpacking Files
# Environment: Ubuntu 24.04.1 LTS
# Hostname: ip-172-31-10-167
# User: toor

# -------------------------------------------------
# Environment Verification
# -------------------------------------------------
cat /etc/os-release

tar --version
gzip --version
bzip2 --version

# -------------------------------------------------
# Task 1 – Create Archive with tar
# -------------------------------------------------
mkdir lab_files
cd lab_files

touch file1.txt file2.txt file3.txt

echo "This is file1" > file1.txt
echo "This is file2" > file2.txt
echo "This is file3" > file3.txt

tar -cvf archive.tar file1.txt file2.txt file3.txt

ls -lh

tar -tvf archive.tar

# -------------------------------------------------
# Task 2 – Compress Using gzip
# -------------------------------------------------
gzip archive.tar

ls -lh

# -------------------------------------------------
# Task 2 – Compress Using bzip2
# -------------------------------------------------
tar -cvf archive.tar file1.txt file2.txt file3.txt

bzip2 archive.tar

ls -lh

# -------------------------------------------------
# Task 3 – Extract .tar.gz
# -------------------------------------------------
gunzip archive.tar.gz
tar -xvf archive.tar

# -------------------------------------------------
# Task 3 – Extract .tar.bz2
# -------------------------------------------------
bunzip2 archive.tar.bz2
tar -xvf archive.tar

# -------------------------------------------------
# Task 4 – Create Compressed Archives Directly
# -------------------------------------------------
tar -czvf combined.tar.gz file1.txt file2.txt file3.txt

tar -cjvf combined.tar.bz2 file1.txt file2.txt file3.txt

ls -lh combined.*

# -------------------------------------------------
# Archive Verification
# -------------------------------------------------
tar -tvf combined.tar.gz
