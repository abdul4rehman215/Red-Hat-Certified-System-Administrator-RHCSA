#!/bin/bash
for file in *; do
 if [ -r "$file" ]; then
  echo "Readable file: $file"
 fi
done
