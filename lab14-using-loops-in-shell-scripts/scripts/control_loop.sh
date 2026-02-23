#!/bin/bash
for num in {1..10}; do
 if [ $num -eq 5 ]; then
  break
 fi
 echo "Number: $num"
done
echo "Loop exited at 5"
