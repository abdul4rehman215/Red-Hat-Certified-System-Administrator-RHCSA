#!/bin/bash
large_files=$(find /var/log -type f -size +1M 2>/dev/null)
count=$(echo "$large_files" | grep -c .)

if [ "$count" -gt 0 ]; then
 total_size=$(du -ch $large_files 2>/dev/null | grep total | awk '{print $1}')
 echo "Found $count large log files"
 echo "Total size: $total_size"
else
 echo "No large log files found"
fi
