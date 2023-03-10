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

# allow volume above 100 percent
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true;

# show hidden files
gsettings set org.gtk.Settings.FileChooser show-hidden true;

# dock position
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM';

# dock on all monitors
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true;

# dock can hide
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false;

# dock doesn't show on mouse over
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false;

# dock doesn't show even when there is space for it
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false;

# don't show mount volumes on dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false;

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

######################################################
# OS UPDATE
######################################################

# Change to US servers
OS_CODENAME=$(lsb_release -sc)
sudo sh -c "echo '
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME main restricted
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-updates main restricted
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME universe
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-updates universe
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME multiverse
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-updates multiverse
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-backports main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-security main restricted
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-security universe
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-security multiverse
' > /etc/apt/sources.list"

# apt
sudo apt update;
sudo apt upgrade -y;

# nala
sudo apt install -y nala;
sudo nala update;
sudo nala upgrade -y;

# snap
sudo nala install -y snapd;
sudo snap refresh;

# flatpak
sudo nala install -y flatpak;
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
sudo flatpak update -y;

######################################################
# ESSENTIALS TOOLS
######################################################

# gnome console
sudo nala install -y gnome-console;

# disk partitions
sudo nala install -y gparted;

# create usb boot (gnome version)
sudo nala install -y usb-creator-gtk;

# interactive process viewer
sudo snap install htop;

# disk usage
sudo nala install -y duf;

# command line information tool
sudo nala install -y neofetch;

# transfering network data
sudo nala install -y curl;

# text editor
sudo snap install micro --classic;
sudo nala install -y xclip;

######################################################
# BASIC TOOLS
######################################################

# browser
sudo nala install -y curl;
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg;
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list;
sudo nala update;
sudo nala install -y brave-browser;

# discord
curl -L --output /tmp/discord.deb "https://discord.com/api/download?platform=linux&format=deb";
sudo nala install -y /tmp/discord.deb;
rm /tmp/discord.deb;

# customize ubuntu
sudo nala install -y dconf-editor;

# weather forecast
sudo flatpak install -y flathub org.gnome.Weather;

# clock
sudo flatpak install -y flathub org.gnome.clocks;

# map
sudo flatpak install -y flathub org.gnome.Maps;

# translator
sudo flatpak install -y flathub app.drey.Dialect;

# torrent downloader
sudo flatpak install -y flathub de.haeckerfelix.Fragments;

# upscale image
sudo flatpak install -y flathub io.gitlab.theevilskeleton.Upscaler;

# game platform
sudo nala install -y steam;

######################################################
# MEDIA TOOLS
######################################################

# music player
sudo snap install spotify;

# image editor
sudo nala install -y gimp;

# image draw
sudo snap install inkscape --classic;

# video player
sudo nala install -y totem;
sudo nala install -y gstreamer1.0-libav;

# video editor
sudo flatpak install -y flathub org.pitivi.Pitivi;

# stream/record
sudo nala install -y ffmpeg;
sudo add-apt-repository -y ppa:obsproject/obs-studio;
sudo nala install --update -y obs-studio;

######################################################
# PROGRAMMING TOOLS
######################################################

# version control
sudo add-apt-repository -y ppa:git-core/ppa;
sudo nala install --update -y git;
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
sudo snap install code --classic;

# containers
sudo nala install -y ca-certificates curl gnupg lsb-release;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg;
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;
sudo nala update;
sudo nala install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin;
sudo groupadd docker;
sudo usermod -aG docker $USER;

# sql database
sudo snap install beekeeper-studio;

# redis database
sudo snap install redis-desktop-manager;

######################################################
# REMOTE CONTROL TOOLS
######################################################

# ssh server
sudo nala install -y openssh-server;

# ftp server
sudo nala install -y vsftpd;

# rdp server
sudo nala install -y xrdp;

# add screen sharing to ubuntu
sudo nala install -y vino;
sudo nala install -y gnome-remote-desktop;

# create a network
curl -s https://install.zerotier.com | sudo bash;

# remote control
sudo nala install -y gnome-connections;

######################################################
# MENTIONS
######################################################

# process monitor
# sudo snap install bottom
# sudo snap connect bottom:mount-observe
# sudo snap connect bottom:hardware-observe
# sudo snap connect bottom:system-observe
# sudo snap connect bottom:process-control

# process json on command line
# sudo nala install -y jq;

# apt package manager
# sudo nala install -y muon;

# customize gnome desktop
# sudo nala install -y gnome-tweaks;

# sound recorder
# sudo nala install -y gnome-sound-recorder;

# control multiple terminals
# sudo nala install -y tmux;

# mirror phone screen
# sudo nala install -y scrcpy;

# gamer mouse
# sudo nala install -y piper;

# fake mouse/keyboard inputs
# sudo nala install -y xdotool;

######################################################
# OS SETTINGS 2
######################################################

# dock favorites
gsettings set org.gnome.shell favorite-apps "['nautilus.desktop', 'brave-browser.desktop']";

# gnome-console as default terminal
gsettings set org.gnome.desktop.default-applications.terminal exec kgx;

# change terminal theme
gsettings set org.gnome.Console theme 'day';

######################################################
# ENDING
######################################################

# cleaning
sudo nala autoremove -y;
sudo apt autoremove -y;
