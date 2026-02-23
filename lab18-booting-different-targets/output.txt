#!/bin/bash
# Lab 18 - Booting Systems into Different Targets
# Ubuntu 24.04.1 LTS

# -------------------------------
# Check Current Default Target
# -------------------------------
systemctl get-default

# -------------------------------
# Isolate Multi-User Target (CLI)
# -------------------------------
sudo systemctl isolate multi-user.target

# Verify target
systemctl get-default

# -------------------------------
# Install Minimal Graphical Environment (Demo)
# -------------------------------
sudo apt update
sudo apt install -y ubuntu-desktop-minimal

# Switch to Graphical Target
sudo systemctl isolate graphical.target

# Verify Display Manager Status
systemctl status display-manager

# -------------------------------
# List Available Targets
# -------------------------------
systemctl list-units --type=target --all

# -------------------------------
# Set Default Target to Multi-User
# -------------------------------
sudo systemctl set-default multi-user.target
systemctl get-default

# -------------------------------
# Set Default Target to Graphical
# -------------------------------
sudo systemctl set-default graphical.target
systemctl get-default

# -------------------------------
# Temporary Target Switching
# -------------------------------
sudo systemctl isolate multi-user.target
systemctl list-units --type=target

sudo systemctl isolate graphical.target

# -------------------------------
# Reboot into Rescue Target
# -------------------------------
sudo systemctl reboot --boot-loader-entry=rescue.target

# -------------------------------
# Troubleshooting Commands
# -------------------------------

# View system logs
journalctl -xe

# Check dependencies of a target
systemctl list-dependencies multi-user.target

# Cancel shutdown (if scheduled)
sudo shutdown -c
