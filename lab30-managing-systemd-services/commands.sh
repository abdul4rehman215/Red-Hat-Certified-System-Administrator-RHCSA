# ========================================
# Task 1: Basic systemctl Operations
# ========================================

# Check overall systemd status
systemctl status

# List active services
systemctl list-units --type=service --state=active

# List all services (active + inactive)
systemctl list-units --type=service --all

# Check if services are enabled
systemctl is-enabled sshd
systemctl is-enabled httpd

# Check SSH service status
systemctl status sshd

# Stop SSH temporarily
sudo systemctl stop sshd

# Verify SSH stopped
systemctl status sshd

# Start SSH again
sudo systemctl start sshd

# Restart SSH
sudo systemctl restart sshd

# Reload SSH configuration
sudo systemctl reload sshd


# ========================================
# Enable / Disable Services
# ========================================

systemctl is-enabled sshd
sudo systemctl disable sshd
sudo systemctl enable --now sshd


# ========================================
# Apache HTTP Server Management
# ========================================

# Install Apache (RHEL/CentOS)
sudo yum install -y httpd

# Start Apache
sudo systemctl start httpd

# Check Apache status
systemctl status httpd

# Enable Apache at boot
sudo systemctl enable httpd


# ========================================
# Task 2: Boot Target Management
# ========================================

# Check default boot target
systemctl get-default

# List available targets
systemctl list-units --type=target

# Show dependencies of default target
systemctl list-dependencies

# Set default target
sudo systemctl set-default multi-user.target

# Verify
systemctl get-default


# ========================================
# Task 3: journalctl Troubleshooting
# ========================================

# View logs from current boot
journalctl -b | head

# View SSH logs
journalctl -u sshd -n 5

# View Apache logs
journalctl -u httpd -n 5


# ========================================
# Create Failing Test Service
# ========================================

sudo tee /etc/systemd/system/test-fail.service > /dev/null << 'EOF'
[Unit]
Description=Test Service That Fails
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/nonexistent-command
Restart=no

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start test-fail.service
systemctl status test-fail.service
journalctl -u test-fail.service -n 5

# Cleanup failing service
sudo rm /etc/systemd/system/test-fail.service
sudo systemctl daemon-reload


# ========================================
# Practical Apache Exercise
# ========================================

# Enable and start Apache
sudo systemctl enable --now httpd

# Create test webpage
sudo tee /var/www/html/index.html > /dev/null << 'EOF'
<!DOCTYPE html>
<html>
<head>
 <title>Systemd Lab Test Page</title>
</head>
<body>
 <h1>Welcome to the Systemd Management Lab!</h1>
 <p>This page is served by Apache, managed through systemd.</p>
</body>
</html>
EOF

# Test web server locally
curl http://localhost

# Generate traffic
for i in {1..3}; do curl -s http://localhost > /dev/null; sleep 1; done

# View recent Apache logs
journalctl -u httpd --since "5 minutes ago"

# Stop Apache
sudo systemctl stop httpd

# Test connection failure
curl http://localhost

# Start Apache again
sudo systemctl start httpd

# Verify again
curl http://localhost
