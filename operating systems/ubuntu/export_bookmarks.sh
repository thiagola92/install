#!/bin/bash

cd /tmp
git clone https://github.com/thiagola92/bookmarks.git tmp_repo
cd tmp_repo
cp ~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks Bookmarks
git commit -am "Backup"
git push
cd ..
rm -rf tmp_repo
