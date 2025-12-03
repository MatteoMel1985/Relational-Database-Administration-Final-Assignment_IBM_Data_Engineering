#!/bin/bash

# ============================================
# Automated MySQL Backup Script
# Backs up ALL databases using mysqldump
# Stores dump as: all-databases-backup.sql
# Moves it to: /tmp/mysqldumps/YYYYMMDD/
# ============================================

# --- 1. MySQL credentials ---
MYSQL_USER="root"
MYSQL_PASSWORD="nxXww2G0E4axmmc3ujmxW8TX"
MYSQL_HOST="172.21.95.131"
MYSQL_PORT="3306"

# --- 2. Backup filename ---
BACKUP_FILE="all-databases-backup.sql"

# --- 3. Dump ALL databases ---
mysqldump --host=$MYSQL_HOST --port=$MYSQL_PORT \
    --user=$MYSQL_USER --password=$MYSQL_PASSWORD \
    --all-databases > $BACKUP_FILE

# --- 4. Create date-based directory ---
TODAY=$(date +"%Y%m%d")
TARGET_DIR="/tmp/mysqldumps/$TODAY"
mkdir -p "$TARGET_DIR"

# --- 5. Move backup file to the target directory ---
mv "$BACKUP_FILE" "$TARGET_DIR/"

# --- 6. Print success message ---
echo "Backup completed successfully!"
echo "Backup stored in: $TARGET_DIR/$BACKUP_FILE"
