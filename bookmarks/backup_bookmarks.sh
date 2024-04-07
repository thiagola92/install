#!/bin/bash

git clone https://gist.github.com/d5e13230686ade1a598fa65b2dee9668.git repo
cd repo
cp ~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks Bookmarks
git commit -am "Backup"
git push
cd ..
rm -rf repo
