#!/usr/bin/env bash
# Lab 05: Working with Text Processing Tools (Commands Executed Only)
# Note: This file contains ONLY commands (no outputs).

mkdir ~/textlab
cd ~/textlab

cat > system.log << 'EOF'
Jan 15 10:30:15 server1 sshd[1234]: Accepted password for admin from 192.168.1.100
Jan 15 10:31:22 server1 httpd[5678]: GET /index.html 200 OK
Jan 15 10:32:45 server1 sshd[1235]: Failed password for root from 192.168.1.200
Jan 15 10:33:10 server1 httpd[5679]: POST /login.php 404 Not Found
Jan 15 10:34:55 server1 sshd[1236]: Accepted password for user1 from 192.168.1.150
Jan 15 10:35:20 server1 kernel: Out of memory: Kill process 9876
Jan 15 10:36:30 server1 httpd[5680]: GET /admin.php 403 Forbidden
Jan 15 10:37:45 server1 sshd[1237]: Failed password for admin from 192.168.1.200
EOF

cat > users.txt << 'EOF'
john:x:1001:1001:John Smith:/home/john:/bin/bash
mary:x:1002:1002:Mary Johnson:/home/mary:/bin/bash
admin:x:1003:1003:System Admin:/home/admin:/bin/bash
guest:x:1004:1004:Guest User:/home/guest:/bin/false
root:x:0:0:Root User:/root:/bin/bash
EOF

cat > config.conf << 'EOF'
# Web Server Configuration
ServerName example.com
DocumentRoot /var/www/html
Port 80
Port 443
MaxClients 150
# Database Configuration
DBHost localhost
DBPort 3306
DBUser webapp
DBPassword secret123
# Security Settings
AllowOverride None
Options Indexes
EOF

ls -l

grep "sshd" system.log
grep -i "failed" system.log
grep -c "httpd" system.log
grep -n "admin" system.log

grep -v "httpd" system.log

mkdir logs
cp system.log logs/
grep -r "Failed" .

grep -w "admin" users.txt
grep -E "sshd|httpd" system.log
grep "^Jan 15 10:3[0-5]" system.log

grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" system.log
grep "bash$" users.txt
grep "[0-9]" config.conf
grep "[A-Z]" config.conf

sed -n '1,3p' users.txt
sed '2d' users.txt
sed 's/admin/administrator/' users.txt
sed 's/:/|/g' users.txt

cp config.conf config.conf.backup
sed -i 's/Port 80/Port 8080/' config.conf
grep "Port" config.conf
sed -i -e 's/localhost/127.0.0.1/' -e 's/secret123/newpassword/' config.conf
cat config.conf

sed -i '/^#/d' config.conf
sed -i '/ServerName/a ServerAlias www.example.com' config.conf
sed -i '/DocumentRoot/i # Document root configuration' config.conf
sed -i '5s/150/200/' config.conf
cat config.conf

cat > addresses.txt << 'EOF'
John Smith, 123 Main St, New York, NY 10001
Mary Johnson, 456 Oak Ave, Los Angeles, CA 90210
Bob Wilson, 789 Pine Rd, Chicago, IL 60601
Alice Brown, 321 Elm St, Houston, TX 77001
EOF

sed -i 's/NY/New York/g; s/CA/California/g; s/IL/Illinois/g; s/TX/Texas/g' addresses.txt
sed 's/[0-9]//g' addresses.txt
sed 's/,.*$//' addresses.txt

awk -F: '{print $1, $5}' users.txt
awk -F: '{print "User: " $1 ", Home: " $6}' users.txt
awk -F: '$3 >= 1000 {print $1}' users.txt
awk -F: '{print NF, $0}' users.txt

awk '/bash/ {print $1}' users.txt
awk -F: '$7 == "/bin/bash" {print $1, $5}' users.txt
awk -F: 'BEGIN {print "=== User Report ==="} {print $1, $5} END {print "=== End Report ==="}' users.txt
awk -F: '$7 == "/bin/bash" {count++} END {print "Bash users:", count}' users.txt

awk -F: '{print "Line " NR ": " $1 " has " NF " fields"}' users.txt
awk -F: '{print $1, length($1)}' users.txt
awk -F: '{print substr($5, 1, 10)}' users.txt
awk '{print $3, $4, $6}' system.log

cat > loganalysis.awk << 'EOF'
BEGIN {
 print "=== Log Analysis Report ==="
 ssh_success = 0
 ssh_failed = 0
 http_requests = 0
}
/sshd.*Accepted/ {
 ssh_success++
}
/sshd.*Failed/ {
 ssh_failed++
}
/httpd/ {
 http_requests++
}
END {
 print "SSH Successful logins:", ssh_success
 print "SSH Failed logins:", ssh_failed
 print "HTTP Requests:", http_requests
 print "=== End Report ==="
}
EOF

awk -f loganalysis.awk system.log

cat > usersummary.awk << 'EOF'
BEGIN {
 FS = ":"
 print "=== User Summary ==="
 bash_users = 0
 system_users = 0
}
$3 < 1000 {
 system_users++
}
$3 >= 1000 && $7 == "/bin/bash" {
 bash_users++
 print "Regular user:", $1, "(" $5 ")"
}
END {
 print "System users:", system_users
 print "Regular bash users:", bash_users
}
EOF

awk -f usersummary.awk users.txt

grep "Failed password" system.log | awk '{print $9, $11}' | sort | uniq -c
grep "bash" users.txt | sed 's/:/ /g' | awk '{print $1, $5, $6}'
grep -v "^#" config.conf | sed '/^$/d' | awk -F' ' '{print $1 ": " $2}'

cat > textprocessor.sh << 'EOF'
#!/bin/bash
echo "=== System Log Analysis ==="
echo
# Analyze SSH activities
echo "SSH Login Analysis:"
echo "Successful logins:"
grep "sshd.*Accepted" system.log | awk '{print $9, $11}' | sort | uniq -c | sed 's/^[ ]*/ /'
echo
echo "Failed login attempts:"
grep "sshd.*Failed" system.log | awk '{print $9, $11}' | sort | uniq -c | sed 's/^[ ]*/ /'
echo
echo "=== HTTP Request Analysis ==="
grep "httpd" system.log | awk '{print $7, $8}' | sort | uniq -c | sed 's/^[ ]*/ /'
echo
echo "=== User Account Summary ==="
echo "Regular users with bash access:"
awk -F: '$3 >= 1000 && $7 ~ /bash/ {print " " $1 " (" $5 ")"}' users.txt
echo
echo "System accounts:"
awk -F: '$3 < 1000 {count++} END {print " Total system accounts: " count}' users.txt
EOF

chmod +x textprocessor.sh
./textprocessor.sh

cat > access.log << 'EOF'
192.168.1.100 - - [15/Jan/2024:10:30:15 +0000] "GET /index.html HTTP/1.1" 200 1234
192.168.1.200 - - [15/Jan/2024:10:31:22 +0000] "POST /login.php HTTP/1.1" 404 567
192.168.1.100 - - [15/Jan/2024:10:32:45 +0000] "GET /admin.php HTTP/1.1" 403 890
192.168.1.150 - - [15/Jan/2024:10:33:10 +0000] "GET /index.html HTTP/1.1" 200 1234
192.168.1.200 - - [15/Jan/2024:10:34:55 +0000] "GET /login.php HTTP/1.1" 200 2345
EOF

echo "Top IP addresses:"
awk '{print $1}' access.log | sort | uniq -c | sort -nr

echo
echo "HTTP status codes:"
awk '{print $9}' access.log | sort | uniq -c

echo
echo "Most requested pages:"
awk '{print $7}' access.log | sort | uniq -c | sort -nr

echo
echo "Security Analysis:"
echo "403 Forbidden attempts:"
grep " 403 " access.log | awk '{print $1, $7}'

echo
echo "404 Not Found errors:"
grep " 404 " access.log | awk '{print $1, $7}'
