#Version: a

SRC="/root"              # Symlink to /mmc/root
DEST="/usb/pager"
LOG="/var/log/pager_backup.log"

# Check if destination exists
if [ ! -d "$DEST" ]; then
    echo "$(date) - ERROR: Destination $DEST does not exist" >> "$LOG"
LOG "USB device not mounted"
    exit 1
fi

# Create a timestamp
DATE=$(date +"%Y%m%d_%H%M%S")

# Name of the backup file
BACKUP_FILE="$DEST/root_backup_$DATE.tar.gz"

LOG "Running..."
# Create a compressed tarball
# -h : follows symlinks (backup actual files instead of just the link)
tar -czhf "$BACKUP_FILE" -C / root >> "$LOG" 2>&1

# Log success or failure
if [ $? -eq 0 ]; then
    echo "$(date) - SUCCESS: Backup created at $BACKUP_FILE" >> "$LOG"
LOG "Backup Complete"
else
    echo "$(date) - ERROR: Failed to create backup" >> "$LOG"
LOG "Backup failed"
fi

exit 0