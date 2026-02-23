#!/bin/bash
if [ "$USER" == "root" ]; then
  echo "Running as root. Be cautious!"
else
  echo "Running as $USER."
fi
