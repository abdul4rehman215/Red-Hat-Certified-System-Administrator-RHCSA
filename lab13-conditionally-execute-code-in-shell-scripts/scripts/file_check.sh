#!/bin/bash
if [ -f "/etc/passwd" ]; then
 echo "File /etc/passwd exists."
else
 echo "File not found."
fi
