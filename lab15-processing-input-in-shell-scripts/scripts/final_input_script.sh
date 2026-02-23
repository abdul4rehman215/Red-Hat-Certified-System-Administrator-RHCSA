#!/bin/bash

if [ $# -eq 0 ]; then
  read -p "Enter a directory path: " path
else
  path=$1
fi

if [ ! -d "$path" ]; then
  echo "Error: $path is not a valid directory." >&2
  exit 1
fi

ls -l "$path"
