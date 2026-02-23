# Lab 14 - Using Loops in Shell Scripts
# Environment: Ubuntu 24.04.1 LTS

# Verify environment
cat /etc/os-release

# Create for_script.sh
nano for_script.sh
chmod +x for_script.sh
./for_script.sh

# Create sample .txt files
touch notes.txt todo.txt report.txt

# Create file_loop.sh
nano file_loop.sh
chmod +x file_loop.sh
./file_loop.sh

# Create while_script.sh
nano while_script.sh
chmod +x while_script.sh
./while_script.sh

# Create until_script.sh
nano until_script.sh
chmod +x until_script.sh
./until_script.sh

# Create filter_files.sh
nano filter_files.sh
chmod +x filter_files.sh
./filter_files.sh

# Create control_loop.sh
nano control_loop.sh
chmod +x control_loop.sh
./control_loop.sh

# Syntax validation example
bash -n control_loop.sh
