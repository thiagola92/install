#!/bin/bash

# load ssh key path
. ~/Crons/env.sh

# backup
cd /tmp
git clone https://github.com/thiagola92/bookmarks.git tmp_repo
cd tmp_repo
cp ~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks ./Bookmarks
git add -A
git commit --message="Backup"
git push

# clean up
cd ..
rm -rf tmp_repo
