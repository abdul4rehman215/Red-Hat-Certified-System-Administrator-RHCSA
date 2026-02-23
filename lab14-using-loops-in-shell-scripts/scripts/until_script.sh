#!/bin/bash
count=3
until [ $count -eq 0 ]; do
 echo "Countdown: $count"
 ((count--))
done
echo "Done!"
