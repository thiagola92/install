#!/bin/bash

######################################################
# OS SETTINGS 1
######################################################

# fix time (partitions problem)
timedatectl set-local-rtc 1;

# template files
echo "" > ~/Templates/text;
echo "" > ~/Templates/c.c;
echo "" > ~/Templates/cpp.cpp;
echo "" > ~/Templates/h.h;
echo "" > ~/Templates/py.py;
echo "" > ~/Templates/md.md;
echo "" > ~/Templates/sh.sh;
echo "" > ~/Templates/html.html;
echo "" > ~/Templates/css.css;
echo "" > ~/Templates/js.js;
echo "" > ~/Templates/yaml.yaml;
echo "" > ~/Templates/java.java;
echo "" > ~/Templates/json.json;
echo "" > ~/Templates/tf.tf;
echo "" > ~/Templates/rs.rs;

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

# snap
sudo apt install -y snapd;
sudo snap refresh;

# flatpak
sudo apt install -y flatpak;
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
sudo flatpak update -y;

######################################################
# ESSENTIALS TOOLS
######################################################

# gnome console
sudo apt install -y gnome-console;

# disk partitions
sudo apt install -y gparted;

# create usb boot (gnome version)
sudo apt install -y usb-creator-gtk;

# interactive process viewer
sudo snap install htop;

# disk usage
sudo apt install duf;

# command line information tool
sudo apt install -y neofetch;

# transfering network data
sudo apt install -y curl;

# text editor
sudo snap install micro --classic;
sudo apt install -y xclip;

######################################################
# BASIC TOOLS
######################################################

# browser
sudo apt install -y apt-transport-https curl gnupg;
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -;
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list;
sudo apt update;
sudo apt install -y brave-browser;

# discord
curl -L --output /tmp/discord.deb "https://discord.com/api/download?platform=linux&format=deb";
sudo apt install -y /tmp/discord.deb;
rm /tmp/discord.deb;

# customize ubuntu
sudo apt install -y dconf-editor;

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
sudo apt install -y steam;

######################################################
# MEDIA TOOLS
######################################################

# music player
sudo snap install spotify;

# image editor
sudo apt install -y gimp;

# video player
sudo apt install -y totem;
sudo flatpak install -y flathub org.videolan.VLC;

# video editor
sudo flatpak install -y flathub org.pitivi.Pitivi;

# stream/record
sudo apt install -y ffmpeg;
sudo add-apt-repository -y ppa:obsproject/obs-studio;
sudo apt install -y obs-studio;

######################################################
# PROGRAMMING TOOLS
######################################################

# version control
sudo apt install -y git;
git config --global user.email "thiagola92@gmail.com"
git config --global user.name "thiagola92";
git config --global core.editor micro;
git config --global credential.helper store;
git config --global pull.rebase false;

# text editor
sudo snap install code --classic;

# containers
sudo apt install -y ca-certificates curl gnupg lsb-release;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg;
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;
sudo apt update;
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin;
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
sudo apt install -y openssh-server;

# ftp server
sudo apt install -y vsftpd;

# rdp server
sudo apt install -y xrdp;

# add screen sharing to ubuntu
sudo apt install -y vino;
sudo apt install -y gnome-remote-desktop;

# create a network
curl -s https://install.zerotier.com | sudo bash;

# remote control
sudo apt install -y gnome-connections;

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
# sudo apt install -y jq;

# apt package manager
# sudo apt install -y muon;

# customize gnome desktop
# sudo apt install -y gnome-tweaks;

# sound recorder
# sudo apt install -y gnome-sound-recorder;

# control multiple terminals
# sudo apt install -y tmux;

# mirror phone screen
# sudo apt install -y scrcpy;

# gamer mouse
# sudo apt install -y piper;

# fake mouse/keyboard inputs
# sudo apt install -y xdotool;

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
sudo apt autoremove -y;
