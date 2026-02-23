#!/bin/bash
# Lab 19 - Identifying and Killing CPU/Memory Intensive Processes
# Ubuntu 24.04.1 LTS

# -------------------------------
# Monitor Processes (Real-Time)
# -------------------------------
top

# -------------------------------
# Snapshot Process Analysis
# -------------------------------
ps aux | head

# Top CPU-consuming processes
ps aux --sort=-%cpu | head -6

# Top Memory-consuming processes
ps aux --sort=-%mem | head -6

# -------------------------------
# Simulate CPU Load
# -------------------------------
stress --cpu 1 &

# Find stress process
pgrep -l stress

# -------------------------------
# Graceful Termination (SIGTERM)
# -------------------------------
kill <PID>

# Verify process stopped
ps -p <PID>

# -------------------------------
# Forceful Termination (SIGKILL)
# -------------------------------
kill -9 <PID>

# -------------------------------
# Kill All Instances by Name
# -------------------------------
killall stress

# Verify
pgrep stress

# -------------------------------
# Launch Process with Low Priority
# -------------------------------
nice -n 19 yes > /dev/null &

# Check in top (NI column)

# -------------------------------
# Modify Priority of Running Process
# -------------------------------
pgrep yes

sudo renice -n 10 -p <PID>

# Verify priority change
top

# -------------------------------
# Cleanup
# -------------------------------
killall yes
