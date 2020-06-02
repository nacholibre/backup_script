#!/bin/bash

# Include configuration
. $(dirname "$0")/_config.sh

CURRENT_DIR=$(dirname "$0")

mkdir -p $BACKUP_DIR_CURDATE/mysql

echo 'Start backing up databases..'

databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`

for db in $databases; do
    echo "Start database: ${db}"
    $MYSQLDUMP --force --opt --user=$MYSQL_USER --databases $db | pv -L $MYSQL_BACKUP_SPEED | gzip > "$BACKUP_DIR_CURDATE/mysql/$db.gz"
done

echo "Finished"

/bin/bash $CURRENT_DIR/upload_backups.sh
/bin/bash $CURRENT_DIR/backup_cleanup.sh
