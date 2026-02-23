#!/bin/bash
# Lab 03 – Using grep and Regular Expressions
# Commands Executed During Lab

echo -e "apple\nbanana\ncherry\ndate\nelderberry\nfig\ngrape" > sample.txt

cat sample.txt

grep "banana" sample.txt

grep -i "Apple" sample.txt

grep -c "a" sample.txt

grep "^a" sample.txt

grep "e$" sample.txt

grep "[aeiou]p" sample.txt

grep -E "[aeiou]{2,}" sample.txt

sudo cp /var/log/syslog /tmp/syslog_sample

grep -i "error" /tmp/syslog_sample

grep -E "^[A-Za-z]{3} [0-9]{2}" /tmp/syslog_sample

grep --help

man grepxc
