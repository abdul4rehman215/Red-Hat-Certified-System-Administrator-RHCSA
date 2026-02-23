#!/bin/bash
read -p "Enter 'yes' or 'no': " answer
if [ "$answer" = "yes" ]; then
 echo "You agreed."
elif [ "$answer" = "no" ]; then
 echo "You disagreed."
else
 echo "Invalid input."
fi
