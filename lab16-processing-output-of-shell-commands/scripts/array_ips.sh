#!/bin/bash
# Capture lines with IP addresses
ip_lines=$(ip a | grep 'inet ')

# Read into array
readarray -t ips <<< "$ip_lines"

echo "Network Interfaces:"
for ip in "${ips[@]}"; do
 echo "- $ip"
done
