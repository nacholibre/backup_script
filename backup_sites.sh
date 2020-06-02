#!/bin/bash

# Include configuration
. $(dirname "$0")/_config.sh

CURRENT_DIR=$(dirname "$0")

mkdir -p $BACKUP_DIR_CURDATE/www

for directory in $SITES_DIR/*; do
    [ -d "${directory}" ] || continue # if not a directory, skip
    dirname="$(basename "${directory}")"

    tar -cf - $SITES_DIR/$dirname | gzip | pv -L $SITES_BACKUP_SPEED > $BACKUP_DIR_CURDATE/www/$dirname.tar.gz
done

/bin/bash $CURRENT_DIR/upload_backups.sh
/bin/bash $CURRENT_DIR/backup_cleanup.sh

