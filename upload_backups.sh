#!/bin/bash
now=$(date +'%Y-%m-%d')

echo 'Upload backups'
#/usr/bin/scp -P2222 -l24576 -r /DATA/backup/"$now"/ user@server.info:/remote_path/backups/
