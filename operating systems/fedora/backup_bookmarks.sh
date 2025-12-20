#!/bin/bash

. ~/Crons/env.sh

cd /tmp
git clone https://github.com/thiagola92/bookmarks.git tmp_repo

cd tmp_repo
cp ~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks ./Bookmarks
git add -A
git commit --message="Backup"
git push

cd ..
rm -rf tmp_repo
