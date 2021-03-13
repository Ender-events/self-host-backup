#!/bin/sh -e

echo "do a backup"
restic snapshots
have_repo=$?

if [ $have_repo -ne 0 ]; then
    restic init
fi


pg_dump > /tmp/nextcloud_pgsql.bak

restic backup /mnt/nextcloud/
restic backup /tmp/nextcloud_pgsql.bak

restic forget --keep-daily 7 --keep-weekly 4

echo "backup done"
