#!/bin/sh -e

echo "do a backup"
start_time=$(date +%s%3N)

restic snapshots
have_repo=$?

if [ $have_repo -ne 0 ]; then
    restic init
fi


pg_dump > /tmp/nextcloud_pgsql.bak

restic backup /mnt/nextcloud/
restic backup /tmp/nextcloud_pgsql.bak

restic forget --keep-daily 7 --keep-weekly 4

end_time=$(date +%s%3N)
elapsed=$(( end_time - start_time ))
if [ -n "${POST_HOOK_URL:-}" ]; then
  url=$(echo "$POST_HOOK_URL" | sed s/\$\{elapsed\}/${elapsed}/)
  curl "$url"
fi
echo "backup done"
