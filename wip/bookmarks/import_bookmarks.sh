#!/bin/bash

cd /tmp
git clone https://github.com/thiagola92/bookmarks.gitt tmp_repo
cp repo/Bookmarks ~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks
rm -rf tmp_repo
