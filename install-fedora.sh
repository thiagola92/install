#!/bin/bash

######################################################
# OS SETTINGS 1
######################################################

# fix time (partitions problem)
timedatectl set-local-rtc 1;

# template files
echo "" > ~/Templates/file;
echo "" > ~/Templates/file.c;
echo "" > ~/Templates/file.cpp;
echo "" > ~/Templates/file.h;
echo "" > ~/Templates/file.py;
echo "" > ~/Templates/file.md;
echo "" > ~/Templates/file.sh;
echo "" > ~/Templates/file.html;
echo "" > ~/Templates/file.css;
echo "" > ~/Templates/file.js;
echo "" > ~/Templates/file.yaml;
echo "" > ~/Templates/file.java;
echo "" > ~/Templates/file.json;
echo "" > ~/Templates/file.tf;
echo "" > ~/Templates/file.rs;

# mouse speed
gsettings set org.gnome.desktop.peripherals.mouse speed -1;

# don't lock the screen automatically
gsettings set org.gnome.desktop.screensaver lock-enabled false;

# never go idle
gsettings set org.gnome.desktop.session idle-delay 0;
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "nothing";

# allow volume above 100 percent
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true;

# show hidden files
gsettings set org.gtk.Settings.FileChooser show-hidden true;
gsettings set org.gtk.gtk4.Settings.FileChooser show-hidden true;

# touchpad remove natural
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true;

# turn on/off gnome desktop animations
gsettings set org.gnome.desktop.interface enable-animations true;

# disable text editor restoring session
gsettings set org.gnome.TextEditor restore-session false;

# ctrl+alt+backspace terminate session
gsettings set org.gnome.desktop.input-sources xkb-options "['terminate:ctrl_alt_bksp']";

# change gnome-terminal theme
gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'system';

# sort directories first
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true;

# power button shutdown the computer
gsettings set org.gnome.settings-daemon.plugins.power power-button-actoin "interactive";

# left-top do not activate activities overview
gsettings set org.gnome.desktop.interface enable-hot-corners false;

######################################################
# OS UPDATE
######################################################

# dnf
sudo dnf upgrade -y;

# flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
sudo flatpak update -y;

######################################################
# ESSENTIALS TOOLS
######################################################

# interactive process viewer
sudo dnf install -y htop;

# disk usage
sudo dnf install -y duf;

# command line information tool
sudo dnf install -y neofetch;

# transfering network data
sudo dnf install -y curl;

# text editor
sudo dnf install -y micro;
sudo dnf install -y xclip;

# customize gnome
sudo dnf install -y dconf-editor;

######################################################
# BASIC TOOLS
######################################################

# browser
sudo dnf install -y dnf-plugins-core;
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo;
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc;
sudo dnf install -y brave-browser;

# music player
sudo flatpak install -y flathub com.spotify.Client;

# discord
sudo flatpak install -y flathub com.discordapp.Discord;

# game platform
sudo dnf install -y steam;

# torrent
sudo flatpak install -y flathub de.haeckerfelix.Fragments;

######################################################
# IMAGE TOOLS
######################################################

# image editor
sudo dnf install -y gimp;

# image draw
sudo flatpak install -y flathub org.kde.krita;

# vector image draw
sudo flatpak install -y flathub org.inkscape.Inkscape;

# upscale image
sudo flatpak install -y flathub io.gitlab.theevilskeleton.Upscaler;

######################################################
# VIDEO TOOLS
######################################################

# video player
sudo dnf install -y gstreamer1-plugin-libav;
sudo dnf install -y gstreamer1-plugin-openh264;

# video editor
sudo flatpak install -y flathub org.pitivi.Pitivi;

# stream/record
sudo flatpak install -y flathub com.obsproject.Studio;

######################################################
# PROGRAMMING TOOLS
######################################################

# version control
sudo dnf install -y git;
git config --global init.defaultBranch main;
git config --global user.email "thiagola92@gmail.com"
git config --global user.name "thiagola92";
git config --global core.editor micro;
git config --global credential.helper store;
git config --global pull.rebase false;
git config --global alias.graph 'log --graph';
git config --global alias.clone-all 'clone --recurse-submodules';
git config --global alias.pull-all 'pull --recurse-submodules';
git config --global alias.clone-blobless 'clone --filter=blob:none';
git config --global alias.clone-blobless-all 'clone --filter=blob:none --recurse-submodules';

# text editor
curl -L --output vscode.rpm "https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64";
sudo dnf install -y ./vscode.rpm;
rm ./vscode.rpm;

# sql database
sudo flatpak install -y flathub io.beekeeperstudio.Studio;

# redis database
sudo flatpak install -y flathub com.redis.RedisInsight;

# game engine
mkdir ~/.local/bin;
curl -L --output godot.zip "https://downloads.tuxfamily.org/godotengine/4.0.1/rc2/Godot_v4.0.1-rc2_linux.x86_64.zip";
unzip -p godot.zip Godot* > godot;
chmod u+rwx,go+r godot;
mv -f godot ~/.local/bin;
rm godot.zip;

######################################################
# REMOTE CONTROL TOOLS
######################################################

# ftp server
sudo dnf install -y vsftpd;

# rdp server
sudo dnf install -y xrdp;

# create a network
curl -s https://install.zerotier.com | sudo bash;

######################################################
# OS SETTINGS 2
######################################################

# dock favorites
gsettings set org.gnome.shell favorite-apps "['nautilus.desktop', 'brave-browser.desktop', 'gnome-terminal.desktop']";

######################################################
# ENDING
######################################################

# cleaning
sudo dnf autoremove -y;
