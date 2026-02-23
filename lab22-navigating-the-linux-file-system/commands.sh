#!/bin/bash
# Lab 22 – Navigating the Linux File System
# Commands Executed During Lab (Sequential)

pwd

cd /
ls -la

ls /bin
ls /home
ls /etc
ls /var

ls /bin
ls /home
ls /etc
ls /var

cd /home/$(whoami)

mkdir -p /home/$(whoami)/lab2/documents/projects
mkdir -p /home/$(whoami)/lab2/downloads
mkdir -p /home/$(whoami)/lab2/scripts

cd /home/$(whoami)/lab2/documents/projects
pwd

cd /home/$(whoami)/lab2/downloads
pwd

cd ~

cd lab2
cd documents
cd ..
cd scripts
cd ../..

ls .
ls ..

cd ..
pwd

cd -

touch ~/lab2/documents/report.txt
touch ~/lab2/documents/projects/project1.txt
touch ~/lab2/downloads/software.tar.gz
touch ~/lab2/scripts/backup.sh

echo '#!/bin/bash' > ~/lab2/scripts/hello.sh
echo 'echo "Hello, World!"' >> ~/lab2/scripts/hello.sh
chmod +x ~/lab2/scripts/hello.sh

find ~/lab2 -type f

find ~/lab2 -type f
find ~/lab2 -type d
find ~/lab2 -name "*.txt"
find ~/lab2 -iname "*.TXT"

find ~/lab2 -mtime -10
find ~/lab2 -type f -executable
find ~/lab2 -type f -size +0c
find ~/lab2 -name "*.sh" -exec ls -la {} \;

find /etc -name "*.conf" 2>/dev/null | head -10
find /var/log -name "*.log" 2>/dev/null | head -5

sudo updatedb

su -
yum install -y mlocate sudo
exit

sudo updatedb
sudo updatedb

locate report.txt
locate "*.conf" | head -10
locate -i REPORT.TXT
locate -c "*.log"

time locate passwd
time find / -name "passwd" 2>/dev/null

which ls
which find
which bash
which python3
which ls find grep awk

echo $PATH
which -a python

export PATH=$PATH:~/lab2/scripts
which hello.sh
hello.sh

mkdir -p ~/lab2/company/{hr,finance,it}/{reports,archives}
mkdir -p ~/lab2/company/it/{servers,workstations}

cd ~
cd ~/lab2/company/it
pwd

cd servers
pwd

cd ..
pwd

cd ../hr/reports
pwd

cd ~/lab2/company/finance/archives
pwd

cd ../../it/workstations
pwd

echo "HR Report 2024" > ~/lab2/company/hr/reports/annual.txt
echo "Server Config" > ~/lab2/company/it/servers/config.txt

cp ~/lab2/company/hr/reports/annual.txt ~/lab2/company/finance/reports/

cd ~/lab2/company/it/servers
cp config.txt ../workstations/

ls -la ~/lab2/company/finance/reports/
ls -la ~/lab2/company/it/workstations/

cd ~/lab2/company/hr
mv reports/annual.txt archives/
ls archives/
ls reports/

cd ~/lab2/company/finance/archives
pwd

cd ../../../it/servers
pwd

cd ~/lab2/documents/projects
pwd

cd ~/lab2/company/hr/reports
pwd

cd -
cd -

find ~/lab2 -name "*.txt" -exec readlink -f {} \;

mkdir ~/lab2/all_txt_files
find ~/lab2 -name "*.txt" -exec cp {} ~/lab2/all_txt_files/ \;

ls -la ~/lab2/all_txt_files

find /etc -name "*.conf" -type f 2>/dev/null | head -10
find /var/log -name "*.log" -type f 2>/dev/null | head -5
find /var/log -mtime -1 -type f 2>/dev/null

mkdir -p ~/development/{projects,tools,documentation}
mkdir -p ~/development/projects/{web,mobile,desktop}

cd ~/development/projects/web
pwd

cd ../mobile
pwd

cd ../../tools
pwd

find /etc -name "*.conf" 2>/dev/null | head -5

sudo updatedb

pwd

cd ~
cd lab2/company/it/servers
pwd

cd ~/lab2/documents
pwd

find ~/lab2 -name "*.sh"
which bash
find ~/lab2 -mtime -1
