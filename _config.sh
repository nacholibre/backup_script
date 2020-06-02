#!/bin/sh

CURRENT_DATE=$(date +'%Y-%m-%d')

# With trailing slash for $BACKUP_DIR
BACKUP_DIR=/DATA/backup/
BACKUP_DIR_CURDATE=${BACKUP_DIR}${CURRENT_DATE}

MYSQL_USER="root"
MYSQL=mysql # bin name
MYSQL_PASSWORD=""
MYSQLDUMP=mysqldump # bin name
MYSQL_BACKUP_SPEED="5m"

SITES_DIR=/www/sites
SITES_BACKUP_SPEED="5m"
