#!/bin/bash
set -e

[ -z "$1" ] && read -p "Enter a number: " num || num=$1

echo "Result: $((num * 2))"
