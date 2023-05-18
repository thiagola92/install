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

# ctrl+alt+backspace terminate session
gsettings set org.gnome.desktop.input-sources xkb-options "['terminate:ctrl_alt_bksp']";

# sort directories first
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true;

# left-top do not activate activities overview
gsettings set org.gnome.desktop.interface enable-hot-corners false;

# dock favorites
gsettings set org.gnome.shell favorite-apps "['nautilus.desktop', 'epiphany.desktop']";

######################################################
# OS UPDATE
######################################################

# apx
apx update;
apx upgrade;

# dnf
apx enter --dnf;
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;
exit;

# flatpak
flatpak update -y;

######################################################
# ESSENTIALS TOOLS
######################################################

# interactive process viewer
apx install -y htop;

# disk usage
apx install -y duf;

# command line information tool
apx install -y neofetch;

# text editor
apx install -y micro;
apx install -y xclip;

# customize gnome
apx install -y dconf-editor;

######################################################
# BASIC TOOLS
######################################################

# browser
apx enter --dnf;
sudo dnf install -y dnf-plugins-core;
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo;
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc;
exit;
apx install --dnf -y brave-browser;

# discord
flatpak install -y flathub com.discordapp.Discord;

# game platform
apx install --dnf -y steam;

# torrent
flatpak install -y flathub de.haeckerfelix.Fragments;

######################################################
# AUDIO TOOLS
######################################################

# music player
flatpak install -y flathub com.spotify.Client;

######################################################
# IMAGE TOOLS
######################################################

# image editor
apx install -y gimp;

# image draw
flatpak install -y flathub org.kde.krita;

# vector image draw
flatpak install -y flathub org.inkscape.Inkscape;

# upscale image
flatpak install -y flathub io.gitlab.theevilskeleton.Upscaler;

# gnome icons
flatpak install -y flathub org.gnome.design.IconLibrary;

######################################################
# VIDEO TOOLS
######################################################

# video editor
flatpak install -y flathub org.pitivi.Pitivi;

# stream/record
flatpak install -y flathub com.obsproject.Studio;

# video downloader
flatpak install -y flathub org.nickvision.tubeconverter;

######################################################
# PROGRAMMING TOOLS
######################################################

# version control
apx install -y git;
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
apx enter --dnf;
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc;
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo';
sudo dnf check-update;
exit;
apx install --dnf -y code;

# sql database
flatpak install -y flathub io.beekeeperstudio.Studio;

# redis database
flatpak install -y flathub com.redis.RedisInsight;

######################################################
# REMOTE CONTROL TOOLS
######################################################

# ftp server
apx install --dnf -y vsftpd;

# rdp server
apx install --dnf -y xrdp;

# create a network
# their script would detect your OS and install this package
apx install --dnf zerotier-one;

######################################################
# ENDING
######################################################

# cleaning
apx autoremove -y;
