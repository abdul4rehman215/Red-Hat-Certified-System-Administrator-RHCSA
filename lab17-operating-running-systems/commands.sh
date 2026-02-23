# 💻 Lab 17 – Commands Reference  
## Operating Running Systems

# 📁 Environment Verification
#Check OS version:
cat /etc/os-release

#Check system uptime:
uptime

# 🧩 Task 1 – Managing System Power States
### Reboot System
sudo reboot

### Shutdown Immediately
sudo shutdown -h now

#Alternative:
sudo poweroff

### Schedule Shutdown (10 Minutes)
sudo shutdown -h +10 "System will shut down in 10 minutes"

#Cancel scheduled shutdown:
sudo shutdown -c


# 🧩 Task 2 – Monitoring Processes
### Real-Time Monitoring
top

#Exit with:
q

### Snapshot of Running Processes
ps aux

#Show first few lines:
ps aux | head

### Install and Use htop (If Not Installed)
sudo apt update
sudo apt install -y htop
htop

#Exit with:
F10


# 🧩 Task 3 – Managing Processes

### Start Background Test Process
sleep 300 &

### Find Process by Name
pgrep -l sleep

### Kill Process by PID
kill -9 <PID>

@Example:
kill -9 1042

### Kill All Processes by Name
pkill -9 sleep

### Verify Process Termination
pgrep sleep

(No output means process stopped.)


# 🔎 Optional Monitoring Commands
#Check system load:
uptime

#Check memory usage:
free -h

#Check disk usage:
df -h

# 🧹 Verify Running Background Jobs
jobs

#✅ All system operations validated on Ubuntu 24.04.1 LTS
