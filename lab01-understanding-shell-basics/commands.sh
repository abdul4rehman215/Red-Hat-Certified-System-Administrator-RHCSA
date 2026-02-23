#!/bin/bash
# Lab 01 – Understanding Shell Basics
# Commands Executed During Lab

cat /etc/os-release

ls -l /home

ls
ls -l
ls -a

pwd

cd ~
pwd

cd /tmp
pwd

cd ..
pwd

ls -l > file_list.txt
cat file_list.txt

date >> file_list.txt
cat file_list.txt

echo -e "Alice\nBob\nCharlie" > names.txt
sort < names.txt

ls -l | grep ".txt"

ls -lh
