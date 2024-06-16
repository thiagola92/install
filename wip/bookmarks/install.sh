#!/bin/bash

cp export_bookmarks.sh /etc/cron.d/export_bookmarks.sh
crontab <<EOF
0 * * * * bash ~/.local/export_bookmarks.sh
EOF
