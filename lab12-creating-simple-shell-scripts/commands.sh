# Lab 12 - Creating Simple Shell Scripts
# Environment: Ubuntu 24.04.1 LTS

# Verify Environment
cat /etc/os-release

# Create scripts directory
mkdir ~/shell_scripts
cd ~/shell_scripts

# Create hello_world.sh
nano hello_world.sh
chmod +x hello_world.sh
./hello_world.sh

# Permission troubleshooting demonstration
chmod -x hello_world.sh
./hello_world.sh
chmod +x hello_world.sh

# Create system_info.sh
nano system_info.sh
chmod +x system_info.sh
./system_info.sh

# Create variables.sh
nano variables.sh
chmod +x variables.sh
./variables.sh

# Create check_user.sh
nano check_user.sh
chmod +x check_user.sh
./check_user.sh

# Create loop.sh
nano loop.sh
chmod +x loop.sh
./loop.sh

# Debugging demonstration
bash -x hello_world.sh

# Final verification
ls -l ~/shell_scripts
