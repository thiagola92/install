#!/bin/bash

# Not a secret
USERNAME=thiagola92
EMAIL=thiagola92@gmail.com

######################################################
# OS SETTINGS 1
######################################################

# fix time (partitions problem)
timedatectl set-local-rtc 1;

# template files
echo "" > ~/Templates/file;
echo "" > ~/Templates/file.c;
echo "" > ~/Templates/file.cpp;
echo "" > ~/Templates/file.css;
echo "" > ~/Templates/file.csv;
echo "" > ~/Templates/file.go;
echo "" > ~/Templates/file.h;
echo "" > ~/Templates/file.html;
echo "" > ~/Templates/file.java;
echo "" > ~/Templates/file.js;
echo "" > ~/Templates/file.json;
echo "" > ~/Templates/file.md;
echo "" > ~/Templates/file.py;
echo "" > ~/Templates/file.rs;
echo "" > ~/Templates/file.sh;
echo "" > ~/Templates/file.toml;
echo "" > ~/Templates/file.yaml;

# mouse speed
gsettings set org.gnome.desktop.peripherals.mouse speed -1;

# don't lock the screen automatically
gsettings set org.gnome.desktop.screensaver lock-enabled false;

# never go idle
gsettings set org.gnome.desktop.session idle-delay 0;
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type "nothing";
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type "nothing";

# allow volume above 100 percent
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true;

# show hidden files
gsettings set org.gtk.gtk4.Settings.FileChooser show-hidden true;

# icon size
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'medium';

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

# sort directories first
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true;

# left-top do not activate activities overview
gsettings set org.gnome.desktop.interface enable-hot-corners false;

# make screen color warmer to prevent sleeplessness
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false;

######################################################
# SOFTWARE INSTALLER
######################################################

# Change to US servers
OS_CODENAME=$(lsb_release -sc)
sudo sh -c "echo '
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-updates main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-backports main restricted universe multiverse
deb http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-security main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-updates main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-backports main restricted universe multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ $OS_CODENAME-security main restricted universe multiverse
' > /etc/apt/sources.list"

# apt
sudo apt update;
sudo apt upgrade -y;

# nala
sudo apt install -y nala;

# snap
sudo apt install -y snapd;
sudo snap refresh;

# flatpak
sudo apt install -y flatpak;
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
sudo flatpak update -y;

# transfering network data (for indirectly installs)
sudo apt install -y curl;

######################################################
# PROGRAMMING TOOLS
######################################################

# version control
sudo add-apt-repository -y ppa:git-core/ppa;
sudo apt install --update -y git;
git config --global init.defaultBranch main;
git config --global user.name $USERNAME;
git config --global user.email $EMAIL
git config --global user.signingkey ~/.ssh/key.pub;
git config --global core.editor micro;
git config --global credential.helper store;
git config --global pull.rebase false;
git config --global alias.graph 'log --graph';
git config --global alias.clone-all 'clone --recurse-submodules';
git config --global alias.pull-all 'pull --recurse-submodules';
git config --global alias.clone-blobless 'clone --filter=blob:none';
git config --global alias.clone-blobless-all 'clone --filter=blob:none --recurse-submodules';
git config --global gpg.format ssh;
git config --global commit.gpgsign true;

# text editor
sudo snap install code --classic;

# dev toolbox
sudo flatpak install -y flathub me.iepure.devtoolbox;

# sql database
sudo snap install beekeeper-studio;

# web api client
sudo flatpak install -y com.usebruno.Bruno

# docker
sudo apt install -y ca-certificates curl;
sudo install -m 0755 -d /etc/apt/keyrings;
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc;
sudo chmod a+r /etc/apt/keyrings/docker.asc;
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update;
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;

######################################################
# PROGRAMMING LANGUAGES - PYTHON
######################################################

# application installer
sudo apt install -y pipx;
pipx ensurepath;
sudo pipx ensurepath --global;

# package manager
sudo curl -LsSf https://astral.sh/uv/install.sh | sh;
source $HOME/.local/bin/env;

######################################################
# PROGRAMMING LANGUAGES - JAVASCRIPT
######################################################

# all-in-one
sudo curl -fsSL https://deno.land/install.sh | sh -s -- -y;
source $HOME/.deno/env;

# all-in-one
sudo apt install -y nodejs npm;

######################################################
# PROGRAMMING LANGUAGES - RUST
######################################################

# all-in-one
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y;
source $HOME/.cargo/env;

######################################################
# PROGRAMMING LANGUAGES - BEND
######################################################

# runtime
cargo install hvm;
cargo install bend-lang;

######################################################
# PROGRAMMING LANGUAGES - GO
######################################################

# all-in-one
sudo apt install -y golang;

######################################################
# PROGRAMMING LANGUAGES - VALA
######################################################

# compiler
sudo apt install -y valac;

######################################################
# PROGRAMMING LANGUAGES - C
######################################################

# build tool
sudo apt install -y meson ninja-build;

# build tool
sudo apt install -y scons;

# compiler
sudo apt install -y clang;

# debugger
sudo apt install -y clangd;

# formatter
sudo apt install -y clang-format;

######################################################
# TERMINAL TOOLS
######################################################

# interactive process viewer
sudo snap install htop;

# command line information tool
sudo apt-add-repository -y ppa:zhangsongcui3371/fastfetch;
sudo apt update;
sudo apt install -y fastfetch;

# open/close modem ports through upnp
sudo apt install -y miniupnpc;

# text editor
sudo snap install micro --classic;
sudo apt install -y xclip;
mkdir ~/.config/micro;
cp micro/settings.json ~/.config/micro/settings.json;

# shell
mkdir $HOME/.config/nushell;
cp nushell/config.nu $HOME/.config/nushell/config.nu;
sudo curl -fsSL https://apt.fury.io/nushell/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/fury-nushell.gpg;
echo "deb https://apt.fury.io/nushell/ /" | sudo tee /etc/apt/sources.list.d/fury.list;
sudo apt update;
sudo apt install -y nushell;
sudo chsh -s /usr/bin/nu $USERNAME;

######################################################
# GENERIC TOOLS
######################################################

# create usb boot (gnome version)
sudo apt install -y usb-creator-gtk;

# customize gnome
sudo flatpak install -y flathub ca.desrt.dconf-editor;

# discord
sudo flatpak install -y flathub com.discordapp.Discord;

# disk analyzer
sudo flatpak install -y flathub org.gnome.baobab;

# torrent download
sudo flatpak install -y flathub de.haeckerfelix.Fragments;

# game platform
sudo snap install steam;

# office suite tools
sudo flatpak install -y flathub org.libreoffice.LibreOffice;

######################################################
# AUDIO TOOLS
######################################################

# music player
sudo snap install spotify;

# sound recorder
sudo flatpak install -y flathub org.gnome.SoundRecorder;

######################################################
# IMAGE TOOLS
######################################################

# image editor
sudo flatpak install -y flathub org.gimp.GIMP;

# image draw
sudo apt install -y inkscape;
mkdir ~/.config/inkscape;
mkdir ~/.config/inkscape/templates;
cp inkscape/default.svg ~/.config/inkscape/templates/default.svg;
cp inkscape/preferences.xml ~/.config/inkscape/preferences.xml;

# gnome icons
sudo flatpak install -y flathub org.gnome.design.IconLibrary;

# color palette
sudo flatpak install -y flathub org.gnome.design.Palette;

######################################################
# VIDEO TOOLS
######################################################

# video player
sudo flatpak install -y flathub org.gnome.Showtime;

# video editor
sudo flatpak install -y flathub org.shotcut.Shotcut;

# stream/record
sudo flatpak install -y flathub com.obsproject.Studio;

# video downloader
sudo flatpak install -y flathub org.nickvision.tubeconverter;

######################################################
# REMOTE ACCESS TOOLS
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

# remote control
sudo flatpak install -y flathub org.gnome.Connections;

######################################################
# STYLE
######################################################

# fonts
curl -fL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip -o FiraCode.zip;
unzip FiraCode.zip -d FiraCode;
rm FiraCode.zip;
sudo mv FiraCode /usr/share/fonts;

# shell prompt
sudo curl -sS https://starship.rs/install.sh | sh -s -- -y;
cp starship/starship.toml ~/.config/starship.toml;

######################################################
# OS SETTINGS 2
######################################################

# dock favorites
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'firefox_firefox.desktop']";

######################################################
# MENTIONS
######################################################

# gamer mouse
# sudo apt install -y piper;

# fake mouse/keyboard inputs
# sudo apt install -y xdotool;

# virtual machine
# sudo flatpak install -y flathub org.gnome.Boxes;

# upscale image
# sudo flatpak install -y flathub io.gitlab.theevilskeleton.Upscaler;

# mirror phone screen
# sudo apt install -y ffmpeg libsdl2-2.0-0 adb wget gcc git pkg-config meson ninja-build libsdl2-dev libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev libswresample-dev libusb-1.0-0 libusb-1.0-0-dev;
# git clone https://github.com/Genymobile/scrcpy;
# cd scrcpy;
# ./install_release.sh;
# cd ..;
# rm -rf scrcpy;

# create a network
# sudo snap install zerotier;
# crontab <<EOF
# # remove ports from zerotier
# 0 0 * * * eval upnpc -l | grep ZeroTier/ | sed -e 's/.* \(.*\)->.*/\1 udp/' | xargs -L 1 upnpc -d
# EOF

######################################################
# ENDING
######################################################

# cleaning
sudo apt autoremove -y;

######################################################
# NOTES
######################################################
# It's good to understand the file "/etc/apt/sources.list"
# which apt use to look for packages for you.
# Each line follows the pattern:
#
# [archive type] [repository url] [os name] [components1] [components2] [components3] ...
#
# archive type: Type of package to search for in the server. Examples:
#				        - "deb" for debians distributions
#				        - "rpm" for fedora distributions
#				        - "deb-src" when you want source files to compile for debian
# repository url: URL to request packages. Examples:
#               - "http://us.archive.ubuntu.com/ubuntu/" for Ubuntu US repository
#               - "http://br.archive.ubuntu.com/ubuntu/" for Ubuntu BR repository
# os name: Normally it's the first part of the code name. Examples:
#               - "noble" is for Ubuntu 24.04
#               - "jammy" is for Ubuntu 22.04
#               - "focal" is for Ubuntu 20.04
# component: Any internal division from your repository. Examples for Ubuntu:
#               - "main" free softwares that can be freely redistributed and
#                        Ubuntu gives support for it.
#               - "restricted" proprietary free softwares that
#                        Ubuntu has limited support/access.
#               - "universe" open-source softwares community-maintained but
#                        Ubuntu can later move it to "main" if it meets their standards.
#               - "multiverse" not free softwares which you should check license and
#                        Ubuntu gives zero support to it.
#
# TIP: If you are going to a new release, there is big chance that some package be missing in the PPA.
# Go to "Software & Updates > Other Software > Add...", copy the example and change the codename to a previous release. Example:
#    'deb http://archive.ubuntu.com/ubuntu mantic main'
#    'deb http://archive.ubuntu.com/ubuntu lunar main'
#
# References:
# - Code names: https://wiki.ubuntu.com/Releases
# - About sources.list: https://wiki.debian.org/SourcesList
# - About sources.list ubuntu: https://help.ubuntu.com/community/Repositories?action=show&redirect=AddingRepositoriesHowto
# - Search packages: https://packages.ubuntu.com/
