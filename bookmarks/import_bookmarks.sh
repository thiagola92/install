#!/bin/bash

cd /tmp
git clone https://gist.github.com/d5e13230686ade1a598fa65b2dee9668.git tmp_repo
cp repo/Bookmarks ~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks
rm -rf tmp_repo
