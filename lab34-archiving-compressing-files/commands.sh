#!/bin/bash
# Lab 34: Archiving and Compressing Files - Commands Executed
# Environment prompt in lab: toor@ip-172-31-10-219:~$

# ----------------------------
# Lab Environment Setup
# ----------------------------
pwd
which tar gzip bzip2
mkdir ~/lab14-archive
cd ~/lab14-archive

# ----------------------------
# Task 1: Create Archives with tar
# Subtask 1.1: Create Sample Files and Directories
# ----------------------------
mkdir -p documents/reports documents/presentations data/logs data/backups

echo "This is a sample document about Linux administration." > documents/linux_guide.txt
echo "Network configuration best practices." > documents/network_config.txt
echo "Security policies and procedures." > documents/security_policy.txt

echo "Monthly server performance report." > documents/reports/monthly_report.txt
echo "Quarterly system analysis." > documents/reports/quarterly_analysis.txt

echo "Linux fundamentals presentation slides." > documents/presentations/linux_basics.txt
echo "System administration workshop materials." > documents/presentations/sysadmin_workshop.txt

echo "System log entries from $(date)" > data/logs/system.log
echo "Application log entries from $(date)" > data/logs/application.log

echo "Database backup metadata" > data/backups/db_backup.txt
echo "Configuration backup information" > data/backups/config_backup.txt

tree . || find . -type f

# ----------------------------
# Subtask 1.2: Create Basic tar Archives
# ----------------------------
tar -cf documents_archive.tar documents/
ls -lh documents_archive.tar
tar -tf documents_archive.tar

tar -cvf data_archive.tar data/

tar -cf selected_files.tar documents/linux_guide.txt documents/network_config.txt data/logs/system.log

# ----------------------------
# Subtask 1.3: Extract tar Archives
# ----------------------------
mkdir extraction_test
cd extraction_test
tar -xf ../documents_archive.tar
ls -la
tree documents/ || find documents/ -type f

cd ..
mkdir verbose_extraction
cd verbose_extraction
tar -xvf ../data_archive.tar
cd ..

# ----------------------------
# Subtask 1.4: Advanced tar Operations
# ----------------------------
tar -cpf permissions_archive.tar documents/

tar -cf filtered_archive.tar --exclude="*.log" data/

tar -cf absolute_archive.tar -P /home/$(whoami)/lab14-archive/documents/

echo "Additional content for archive" > new_file.txt
tar -rf documents_archive.tar new_file.txt
tar -tf documents_archive.tar | grep new_file.txt

# ----------------------------
# Task 2: Compress and Decompress using gzip and bzip2
# Subtask 2.1: gzip
# ----------------------------
dd if=/dev/zero of=large_file.txt bs=1M count=10
echo "This file contains sample data for compression testing." >> large_file.txt

ls -lh large_file.txt
gzip large_file.txt
ls -lh large_file.txt.gz
gunzip large_file.txt.gz

gzip -c large_file.txt > large_file_copy.txt.gz
ls -lh large_file*

gzip -1 -c large_file.txt > large_file_fast.txt.gz
gzip -9 -c large_file.txt > large_file_best.txt.gz
ls -lh large_file*.gz

# ----------------------------
# Subtask 2.2: bzip2
# ----------------------------
bzip2 -c large_file.txt > large_file.txt.bz2
ls -lh large_file.txt.bz2

bunzip2 -c large_file.txt.bz2 > large_file_restored.txt
diff large_file.txt large_file_restored.txt

echo "Compression Comparison:"
echo "Original file: $(ls -lh large_file.txt | awk '{print $5}')"
echo "gzip compressed: $(ls -lh large_file_copy.txt.gz | awk '{print $5}')"
echo "bzip2 compressed: $(ls -lh large_file.txt.bz2 | awk '{print $5}')"

# ----------------------------
# Subtask 2.3: Combine tar with compression
# ----------------------------
tar -czf documents_compressed.tar.gz documents/
tar -cjf documents_compressed.tar.bz2 documents/

echo "Archive Size Comparison:"
ls -lh documents_archive.tar documents_compressed.tar.gz documents_compressed.tar.bz2

mkdir gzip_extraction bzip2_extraction
tar -xzf documents_compressed.tar.gz -C gzip_extraction/
tar -xjf documents_compressed.tar.bz2 -C bzip2_extraction/

ls -la gzip_extraction/
ls -la bzip2_extraction/

# ----------------------------
# Subtask 2.4: Multiple files compression workflow
# ----------------------------
for i in {1..5}; do
 echo "Sample content for file $i - $(date)" > sample_file_$i.txt
done

gzip sample_file_*.txt
ls -lh sample_file_*.gz
gunzip sample_file_*.gz

tar -czf sample_files.tar.gz sample_file_*.txt
rm sample_file_*.txt
tar -xzf sample_files.tar.gz
ls -la sample_file_*.txt

# ----------------------------
# Task 3: Test the Restoration of Archived Data
# Subtask 3.1: Create test archives + checksums
# ----------------------------
cd ~/lab14-archive

find . -type f -exec md5sum {} \; > original_checksums.txt

tar -czf complete_backup.tar.gz documents/ data/ sample_file_*.txt
tar -cjf complete_backup.tar.bz2 documents/ data/ sample_file_*.txt

tar -czf verified_backup.tar.gz --verify documents/ data/

# ----------------------------
# Subtask 3.2: Test archive integrity
# ----------------------------
gzip -t complete_backup.tar.gz
echo "Gzip archive test result: $?"

bzip2 -t complete_backup.tar.bz2
echo "Bzip2 archive test result: $?"

tar -tzf complete_backup.tar.gz > /dev/null
echo "Tar gzip archive test result: $?"

tar -tjf complete_backup.tar.bz2 > /dev/null
echo "Tar bzip2 archive test result: $?"

echo "Archive contents verification:"
tar -tzf complete_backup.tar.gz | head -10

# ----------------------------
# Subtask 3.3: Full restoration test
# ----------------------------
mkdir ~/restoration_test
cd ~/restoration_test

cp ~/lab14-archive/complete_backup.tar.gz .
cp ~/lab14-archive/complete_backup.tar.bz2 .
cp ~/lab14-archive/original_checksums.txt .

mkdir gzip_restore
tar -xzf complete_backup.tar.gz -C gzip_restore/

mkdir bzip2_restore
tar -xjf complete_backup.tar.bz2 -C bzip2_restore/

cd gzip_restore
find . -type f -exec md5sum {} \; > restored_checksums.txt

echo "Comparing original and restored checksums:"
diff ../original_checksums.txt restored_checksums.txt

if [ $? -eq 0 ]; then
 echo "SUCCESS: All files restored correctly!"
else
 echo "WARNING: Some files may have differences"
fi

# ----------------------------
# Subtask 3.4: Selective restoration + wildcards
# ----------------------------
cd ~/restoration_test
mkdir selective_restore

tar -xzf complete_backup.tar.gz -C selective_restore/ documents/linux_guide.txt
tar -xzf complete_backup.tar.gz -C selective_restore/ data/logs/

echo "Selectively restored files:"
find selective_restore/ -type f

mkdir pattern_restore
tar -xzf complete_backup.tar.gz -C pattern_restore/ --wildcards "*/reports/*"

echo "Pattern-based restored files:"
find pattern_restore/ -type f

# ----------------------------
# Subtask 3.5: Archive maintenance + report generation
# (script creation itself goes in scripts/verify_archive.sh)
# ----------------------------
chmod +x verify_archive.sh
./verify_archive.sh complete_backup.tar.gz
./verify_archive.sh complete_backup.tar.bz2

echo "Archive Summary Report" > archive_report.txt
echo "======================" >> archive_report.txt
echo "Date: $(date)" >> archive_report.txt
echo "" >> archive_report.txt

for archive in complete_backup.tar.gz complete_backup.tar.bz2; do
 echo "Archive: $archive" >> archive_report.txt
 echo "Size: $(ls -lh $archive | awk '{print $5}')" >> archive_report.txt
 echo "Files: $(tar -tf $archive | wc -l)" >> archive_report.txt
 echo "Created: $(ls -l $archive | awk '{print $6, $7, $8}')" >> archive_report.txt
 echo "" >> archive_report.txt
done

cat archive_report.txt

# ----------------------------
# Troubleshooting demo commands (placeholders as in lab text)
# ----------------------------
tar -xzf archive.tar.gz
sudo chown -R $(whoami):$(whoami) extracted_directory/

tar -tzf complete_backup.tar.gz > /dev/null && echo "Archive OK" || echo "Archive corrupted"
tar -tjf complete_backup.tar.bz2 > /dev/null && echo "Archive OK" || echo "Archive corrupted"

df -h .
du -sh complete_backup.tar.gz
