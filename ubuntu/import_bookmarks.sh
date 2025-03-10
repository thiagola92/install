#!/bin/bash

cd /tmp
git clone https://github.com/thiagola92/bookmarks.git tmp_repo
cp tmp_repo/Bookmarks ~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks
rm -rf tmp_repo
