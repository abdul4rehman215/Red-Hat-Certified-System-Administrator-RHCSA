# 💻 Lab 16 – Commands Reference  
## Processing Output of Shell Commands

## 📁 Environment Verification
#Check OS version:
cat /etc/os-release

# 🧩 Task 1 – Command Substitution
### Using Backticks (Legacy)
#Terminal example:
echo "Today is `date`"

#Create script:
nano backtick_example.sh
chmod +x backtick_example.sh
./backtick_example.sh

### Using $() (Recommended)
#Terminal example:
echo "Current user: $(whoami)"

#Create script:
nano dollar_parenthesis.sh
chmod +x dollar_parenthesis.sh
./dollar_parenthesis.sh

# 🧩 Task 2 – Store Command Output in Variables
#Assign output in terminal:
current_dir=$(pwd)
echo "$current_dir"

#Create system info script:
nano system_info.sh
chmod +x system_info.sh
./system_info.sh

# 🧩 Task 3 – Multi-line Output Handling
#Create script:

nano multi_line.sh
chmod +x multi_line.sh
./multi_line.sh

# 🧩 Task 4 – Filtering & Processing Output
#Create users processing script:
nano process_users.sh
chmod +x process_users.sh
./process_users.sh

#Create disk monitoring script:
nano disk_check.sh
chmod +x disk_check.sh
./disk_check.sh

# 🧩 Task 5 – Working with Arrays
#Create array processing script:
nano array_ips.sh
chmod +x array_ips.sh
./array_ips.sh


# 🧩 Task 6 – Real-World Log Monitoring
#Create script:
nano large_logs.sh
chmod +x large_logs.sh
./large_logs.sh

# 🔎 Optional Validation Commands

#Check running processes:
ps aux | wc -l

#Check disk usage:
df -h

#List logged-in users:
who

#Check IP addresses:
ip a

#Find large files:
find /var/log -type f -size +1M

# 🧹 Verify Script Permissions
ls -l *.sh

# ✅ All commands validated on Ubuntu 24.04.1 LTS
