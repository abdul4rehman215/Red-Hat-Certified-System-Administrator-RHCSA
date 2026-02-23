#!/bin/bash
# Get available disk space in /
avail_space=$(df -BG / | awk 'NR==2 {print $4}' | tr -d 'G')

if [ "$avail_space" -lt 5 ]; then
 echo "Warning: Only ${avail_space}GB remaining in root!"
else
 echo "Disk space OK: ${avail_space}GB available"
fi
