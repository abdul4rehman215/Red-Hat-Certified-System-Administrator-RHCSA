#!/bin/bash
# Lab 40: Managing and Troubleshooting Services
# Environment: CentOS / RHEL 9

############################################
# Task 1: Service Management & Troubleshooting
############################################

# List all active services
systemctl list-units --type=service

# List failed services
systemctl list-units --type=service --state=failed

# Check SSH service status
systemctl status sshd

# Show detailed SSH service configuration
systemctl show sshd | grep -E "Id=|Restart=|ExecStart="

############################################
# Create Failing Service
############################################

mkdir -p /opt/lab-scripts

cat << 'EOF' > /opt/lab-scripts/failing-service.sh
#!/bin/bash
echo "Service starting..."
sleep 5
echo "Service attempting to access non-existent file..."
cat /nonexistent/file.txt
echo "This line will never execute"
EOF

chmod +x /opt/lab-scripts/failing-service.sh

cat << 'EOF' > /etc/systemd/system/lab-failing.service
[Unit]
Description=Lab Failing Service for Troubleshooting Practice
After=network.target

[Service]
Type=simple
ExecStart=/opt/lab-scripts/failing-service.sh
Restart=no
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable lab-failing.service
systemctl start lab-failing.service

# Check failing status
systemctl status lab-failing.service

# View logs
journalctl -u lab-failing.service
journalctl -u lab-failing.service -f
journalctl -u lab-failing.service --since "10 minutes ago"
journalctl -u lab-failing.service -o verbose | head -15

############################################
# Fix the Service
############################################

cat << 'EOF' > /opt/lab-scripts/failing-service.sh
#!/bin/bash
echo "Service starting..."
sleep 5
echo "Service running successfully..."
echo "Current date: $(date)"
echo "Service completed successfully"
EOF

systemctl restart lab-failing.service
systemctl status lab-failing.service
journalctl -u lab-failing.service --since "5 minutes ago"

############################################
# Task 2: Network Diagnostics
############################################

ip addr show
ip route show
cat /etc/resolv.conf
ping -c 4 8.8.8.8
ping -c 4 google.com

############################################
# Simulate DNS Failure
############################################

cp /etc/resolv.conf /etc/resolv.conf.backup

cat << 'EOF' > /etc/resolv.conf
nameserver 192.168.999.999
nameserver 10.0.0.999
EOF

nslookup google.com

############################################
# Restore DNS
############################################

cp /etc/resolv.conf.backup /etc/resolv.conf
nslookup google.com

############################################
# System-Wide Status Checks
############################################

systemctl --failed
systemctl status firewalld
journalctl -u sshd --since today | tail -5

############################################
# Advanced Log Analysis
############################################

journalctl -b | head -10
journalctl -p err | tail -5
journalctl --disk-usage

############################################
# Service Health Check Script
############################################

cat << 'EOF' > /opt/lab-scripts/service-health-check.sh
#!/bin/bash
echo "=== System Service Health Check ==="
echo "Date: $(date)"
echo

CRITICAL_SERVICES=("sshd" "NetworkManager" "firewalld" "rsyslog")

echo "=== Critical Services Status ==="
for service in "${CRITICAL_SERVICES[@]}"; do
 if systemctl is-active --quiet "$service"; then
  echo "✓ $service: ACTIVE"
 else
  echo "✗ $service: INACTIVE"
 fi
done

echo
echo "=== Failed Services ==="
failed_services=$(systemctl --failed --no-legend | wc -l)
if [ "$failed_services" -eq 0 ]; then
 echo "✓ No failed services"
else
 echo "✗ $failed_services failed services found:"
 systemctl --failed --no-legend
fi

echo
echo "=== Network Connectivity ==="
if ping -c 1 8.8.8.8 &> /dev/null; then
 echo "✓ Internet connectivity: OK"
else
 echo "✗ Internet connectivity: FAILED"
fi

if nslookup google.com &> /dev/null; then
 echo "✓ DNS resolution: OK"
else
 echo "✗ DNS resolution: FAILED"
fi

echo
df -h / | tail -1 | awk '{print "Root filesystem: " $5 " used"}'
echo
echo "Health check completed."
EOF

chmod +x /opt/lab-scripts/service-health-check.sh
/opt/lab-scripts/service-health-check.sh

############################################
# Lab Validation
############################################

systemctl status lab-failing.service
ping -c 2 google.com

echo "Lab 20 Completed Successfully."
