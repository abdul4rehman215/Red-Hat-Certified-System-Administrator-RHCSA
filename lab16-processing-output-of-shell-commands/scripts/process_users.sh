#!/bin/bash
# Get logged-in users
users=$(who | awk '{print $1}')
user_count=$(echo "$users" | wc -l)

echo "Current Users:"
echo "$users"
echo "Total users logged in: $user_count"
