#!/bin/bash
# Lab 20 - Adjusting Process Scheduling
# Ubuntu 24.04.1 LTS

# -------------------------------
# Launch CPU-Intensive Process
# -------------------------------
sha1sum /dev/zero &

# Capture PID
pgrep sha1sum | head -1

# -------------------------------
# Check Default Priority
# -------------------------------
ps -l -p <PID>

# -------------------------------
# Launch with Modified Nice Value
# -------------------------------
nice -n 10 sha1sum /dev/zero &

# Verify nice value
ps -l -p <NEW_PID>

# -------------------------------
# Adjust Running Process Priority
# -------------------------------
sudo renice -n 5 -p <PID>

# Verify
ps -l -p <PID>

# -------------------------------
# Monitor with top
# -------------------------------
top

# -------------------------------
# Install & Run htop (if needed)
# -------------------------------
which htop
sudo apt update
sudo apt install -y htop
htop

# -------------------------------
# Check Process State
# -------------------------------
ps aux | grep sha1sum

# -------------------------------
# Apply Real-Time Scheduling (Optional)
# -------------------------------
sha1sum /dev/zero &

sudo chrt -f -p 99 <PID>

# Verify scheduling policy
chrt -p <PID>

# -------------------------------
# Cleanup
# -------------------------------
kill $(pgrep sha1sum)
