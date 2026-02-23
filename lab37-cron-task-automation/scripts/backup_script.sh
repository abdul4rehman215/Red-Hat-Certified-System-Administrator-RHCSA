#!/bin/bash
# ======================================================
# Backup Script for Important Files
# Lab 37 - Cron Automation
# ======================================================

BACKUP_DIR="/home/$(whoami)/backups"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backup_$DATE.tar.gz"

# Create backup of home directory (excluding backups folder)
tar -czf "$BACKUP_DIR/$BACKUP_FILE" \
  --exclude="$BACKUP_DIR" \
  /home/$(whoami)/ 2>/dev/null

# Keep only the last 5 backups
cd "$BACKUP_DIR" || exit
ls -t backup_*.tar.gz 2>/dev/null | tail -n +6 | xargs -r rm

echo "$(date): Backup completed - $BACKUP_FILE" >> /home/$(whoami)/backup_log.txt
