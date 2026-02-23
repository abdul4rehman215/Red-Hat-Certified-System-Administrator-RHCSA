# ================================
# Lab 24: Configuring User Permissions
# Commands Executed (in order)
# ================================

# ----------------
# Task 1: Ownership with chown
# ----------------

# Create working directory and test files
mkdir ~/permissions_lab
cd ~/permissions_lab
touch file1.txt file2.txt file3.txt
mkdir testdir
echo "This is file 1" > file1.txt
echo "This is file 2" > file2.txt
echo "This is file 3" > file3.txt

# Examine ownership
ls -l

# Attempt readable ownership table (column tool check)
ls -l | awk '{print $3, $4, $9}' | column -t

# Fix: install/check column utility (util-linux provides column)
sudo yum install -y util-linux
which column

# Re-run ownership table
ls -l | awk '{print $3, $4, $9}' | column -t

# Change file owner to root
sudo chown root file1.txt
ls -l file1.txt

# Change owner back to current user
sudo chown $USER file1.txt
ls -l file1.txt

# View groups
groups
cat /etc/group | head -10

# Group ownership: ensure 'users' group exists
getent group users
sudo groupadd users

# Change group ownership to users
sudo chown :users file2.txt
ls -l file2.txt

# Change both user and group ownership
sudo chown root:root file3.txt
ls -l file3.txt

# Change back to original
sudo chown $USER:$USER file3.txt
ls -l file3.txt

# Recursive ownership changes
mkdir -p testdir/subdir1/subdir2
touch testdir/nested_file.txt
touch testdir/subdir1/another_file.txt
touch testdir/subdir1/subdir2/deep_file.txt

sudo chown -R root:root testdir/
ls -lR testdir/

sudo chown -R $USER:$USER testdir/
ls -lR testdir/

# ----------------
# Task 2: Permissions with chmod
# ----------------

# Check current permissions
ls -l

# Create a script file for testing execution permissions
echo '#!/bin/bash' > test_script.sh
echo 'echo "Hello from script!"' >> test_script.sh
ls -l test_script.sh

# Attempt to execute (expected permission denied)
./test_script.sh

# Add execute permission for owner and run
chmod u+x test_script.sh
ls -l test_script.sh
./test_script.sh

# Modify permissions using symbolic notation
chmod go-w file1.txt
chmod a+r file2.txt
chmod o-rwx file3.txt
ls -l file*.txt

# Set specific permission combinations
chmod u=rw,g=r,o= file1.txt
chmod u=rwx,go=rx testdir/
ls -l file1.txt
ls -ld testdir/

# Numeric permission examples
touch numeric_test.txt
chmod 755 numeric_test.txt
chmod 644 file1.txt
chmod 600 file2.txt
chmod 777 file3.txt
ls -l *test*.txt file*.txt

# Common permission patterns
touch readme.txt config.conf executable.sh
chmod 644 readme.txt
chmod 600 config.conf
chmod 755 executable.sh
ls -l readme.txt config.conf executable.sh

# Recursive permissions (demonstrate breakage)
chmod -R 755 testdir/
ls -lR testdir/

chmod -R 644 testdir/
ls -lR testdir/

# Fix permissions correctly (directories executable, files not)
find testdir/ -type d -exec chmod 755 {} \;
find testdir/ -type f -exec chmod 644 {} \;
ls -lR testdir/

# ----------------
# Task 3: ACLs (getfacl / setfacl)
# ----------------

# Verify filesystem behavior and ACL tools availability
mount | grep acl
which getfacl setfacl
sudo yum install -y acl

# Create ACL test files
mkdir acl_test
cd acl_test
touch sensitive_file.txt shared_document.txt
echo "Sensitive information" > sensitive_file.txt
echo "Shared document content" > shared_document.txt

# View current ACLs
getfacl sensitive_file.txt
getfacl shared_document.txt
getfacl --omit-header sensitive_file.txt

# Create test users and grant ACL permissions
sudo useradd testuser1 2>/dev/null || echo "User testuser1 already exists"
setfacl -m u:testuser1:rw sensitive_file.txt
getfacl sensitive_file.txt
ls -l sensitive_file.txt

sudo useradd testuser2 2>/dev/null || echo "User testuser2 already exists"
setfacl -m u:testuser2:r sensitive_file.txt
getfacl sensitive_file.txt

# Group ACLs (create groups if needed)
sudo groupadd developers 2>/dev/null || echo "Group developers already exists"
sudo groupadd managers 2>/dev/null || echo "Group managers already exists"

setfacl -m g:developers:rwx shared_document.txt
setfacl -m g:managers:r shared_document.txt
getfacl shared_document.txt

# Default ACLs on directory + inheritance check
mkdir project_dir
setfacl -d -m u:testuser1:rw project_dir/
setfacl -d -m g:developers:rwx project_dir/
setfacl -d -m other::r project_dir/
getfacl project_dir/

touch project_dir/new_file.txt
getfacl project_dir/new_file.txt

mkdir project_dir/subdir
getfacl project_dir/subdir/

# Modify and remove ACL entries
setfacl -m u:testuser1:rwx sensitive_file.txt
getfacl sensitive_file.txt

setfacl -x u:testuser2 sensitive_file.txt
setfacl -x g:developers shared_document.txt
getfacl sensitive_file.txt
getfacl shared_document.txt

# Remove all ACLs from file
setfacl -b sensitive_file.txt
getfacl sensitive_file.txt
ls -l sensitive_file.txt

# Copy ACLs between files
setfacl -m u:testuser1:rwx shared_document.txt
setfacl -m g:developers:rw shared_document.txt
setfacl -m g:managers:r shared_document.txt

touch target_file.txt
getfacl shared_document.txt | setfacl --set-file=- target_file.txt
getfacl target_file.txt

# Backup ACLs
getfacl -R . > acl_backup.txt
cat acl_backup.txt

# ----------------
# Practical Scenario 1: Web server permissions
# ----------------
mkdir -p /tmp/webserver/{html,logs,config}
touch /tmp/webserver/html/index.html
touch /tmp/webserver/logs/access.log /tmp/webserver/logs/error.log
touch /tmp/webserver/config/httpd.conf

sudo chmod 755 /tmp/webserver/html
sudo chmod 644 /tmp/webserver/html/*
sudo chmod 600 /tmp/webserver/config/*
sudo chmod 755 /tmp/webserver/logs
sudo chmod 644 /tmp/webserver/logs/*
ls -lR /tmp/webserver

# ----------------
# Practical Scenario 2: Shared project directory
# ----------------
mkdir /tmp/shared_project
sudo chown :developers /tmp/shared_project
sudo chmod 2775 /tmp/shared_project
sudo setfacl -d -m g:developers:rwx /tmp/shared_project/
sudo setfacl -d -m other::r /tmp/shared_project/
ls -ld /tmp/shared_project

# ----------------
# Troubleshooting Checks
# ----------------
whoami
groups
ls -l acl_test/sensitive_file.txt
getfacl acl_test/sensitive_file.txt
ls -ld acl_test

rpm -qa | grep acl
sudo mount -o remount,acl /

# Recursive permission fix example (applied to lab folder)
find ~/permissions_lab/testdir -type f -exec chmod 644 {} \;
find ~/permissions_lab/testdir -type d -exec chmod 755 {} \;

# ----------------
# Cleanup
# ----------------
cd ~
rm -rf permissions_lab acl_test
sudo userdel testuser1 2>/dev/null
sudo userdel testuser2 2>/dev/null
sudo groupdel developers 2>/dev/null
sudo groupdel managers 2>/dev/null
sudo rm -rf /tmp/webserver /tmp/shared_project
