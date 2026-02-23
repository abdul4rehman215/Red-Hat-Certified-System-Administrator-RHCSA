#!/bin/bash
# Capture multi-line output
disk_info=$(df -h)

echo "Disk Usage Information:"
echo "$disk_info" | grep -v "tmpfs"
