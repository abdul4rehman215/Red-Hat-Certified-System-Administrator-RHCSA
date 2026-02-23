#!/bin/bash
# Lab 23 – Managing Users and Groups
# Commands Executed During Lab (Sequential)

sudo -i

useradd john
grep john /etc/passwd

useradd -c "Jane Smith, Marketing Department" -s /bin/bash -m -d /home/jsmith jsmith
grep jsmith /etc/passwd
ls -la /home/jsmith

useradd -r -s /sbin/nologin -c "Web Server User" webuser
grep webuser /etc/passwd
id webuser

mkdir /home/john_new
usermod -d /home/john_new -m john
grep john /etc/passwd
ls -la /home/john_new

usermod -s /bin/zsh jsmith

yum install -y zsh
usermod -s /bin/zsh jsmith
grep jsmith /etc/passwd

usermod -L john
grep john /etc/shadow
usermod -U john

groupadd marketing
groupadd -g 2000 developers
groupadd -r services
grep -E "(marketing|developers|services)" /etc/group

usermod -g marketing jsmith
usermod -G developers,marketing john
usermod -a -G services john

groups john
groups jsmith
id john
id jsmith

useradd -g developers -G marketing -c "Bob Developer" -m bdev
id bdev
groups bdev

passwd john
passwd jsmith
passwd bdev

chage -M 90 john
chage -m 7 john
chage -W 7 john
chage -l john

chage -d 0 jsmith
chage -l jsmith

grep -E "(john|jsmith|bdev|webuser)" /etc/passwd
grep -E "(marketing|developers|services)" /etc/group

su - john
whoami
groups
exit

ls -la /home/

su - john -c "touch /home/john_new/john_file.txt"
su - jsmith -c "touch /home/jsmith/jsmith_file.txt"

ls -la /home/john_new/john_file.txt
ls -la /home/jsmith/jsmith_file.txt

mkdir /shared/marketing
chgrp marketing /shared/marketing
chmod 770 /shared/marketing
chmod g+s /shared/marketing

ls -la /shared/

cat /etc/default/useradd
cat /etc/login.defs | grep -E "(UID_MIN|GID_MIN|PASS_MAX_DAYS)"

id john
whoami

ls -ld /home/bdev

groups john
id john

usermod -L username
usermod -s /sbin/nologin username

last | head -5
who
w

userdel -r john
userdel -r jsmith
userdel -r bdev
userdel webuser

groupdel marketing
groupdel developers
groupdel services

rm -rf /shared
