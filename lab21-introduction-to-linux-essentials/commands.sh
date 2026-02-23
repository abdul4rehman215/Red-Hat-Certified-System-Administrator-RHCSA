#!/bin/bash
# Lab 02 – Introduction to Linux Essentials
# Commands Executed During Lab (Sequential)

cat /etc/os-release

pwd

ls
ls -l
ls -la
ls -lh

cd /
pwd
ls

cd ~
pwd

cd ..
ls
pwd

cd
pwd

cd /
ls -l

ls /bin | head -10
ls /etc | head -10
ls /home
ls /var
ls /usr

ls /tmp
ls /dev | head -5
ls /proc | head -5

cd /usr/bin
pwd
ls | head -5

cd ../share
pwd

cd ../../home
pwd

cd
pwd

man ls

man pwd
man cd
help cd

man find

whatis ls
whatis pwd
whatis cp
whatis mv

man man
man 1 passwd
man 5 passwd

apropos file | head -10
apropos directory | head -5
apropos text | head -5

cd /
pwd
ls -la | head -10

cd /usr/bin
ls | wc -l

cd
pwd

whoami
hostname
date
uptime

ls -la
file .bashrc
file .bash_profile
