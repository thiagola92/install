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
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true;

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

# create usb boot (gnome version)
sudo nala install -y usb-creator-gtk;

# interactive process viewer
sudo snap install htop;

# disk usage
sudo nala install -y duf;

# disk analyzer
sudo flatpak install -y flathub org.gnome.baobab;

# command line information tool
sudo nala install -y neofetch;

# transfering network data
sudo nala install -y curl;

# text editor
sudo snap install micro --classic;
sudo nala install -y xclip;

# customize gnome
sudo flatpak install -y flathub ca.desrt.dconf-editor;

# process viewer
sudo snap install bottom;
sudo snap connect bottom:mount-observe;
sudo snap connect bottom:hardware-observe;
sudo snap connect bottom:system-observe;
sudo snap connect bottom:process-control;

######################################################
# BASIC TOOLS
######################################################

# browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg;
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list;
sudo nala update;
sudo nala install -y brave-browser;

# discord
sudo flatpak install -y flathub com.discordapp.Discord;

# weather forecast
sudo flatpak install -y flathub org.gnome.Weather;

# torrent download
sudo flatpak install -y flathub de.haeckerfelix.Fragments;

# game platform
sudo snap install steam;

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
sudo add-apt-repository -y ppa:inkscape.dev/stable;
sudo nala update;
sudo nala install -y inkscape;

# image draw [2]
#sudo nala install -y krita;

# upscale image
sudo flatpak install -y flathub io.gitlab.theevilskeleton.Upscaler;

# gnome icons
sudo flatpak install -y flathub org.gnome.design.IconLibrary;

# color palette
sudo flatpak install -y flathub org.gnome.design.Palette;

######################################################
# VIDEO TOOLS
######################################################

# video player
sudo flatpak install -y flathub org.gnome.Totem;
sudo nala install -y gstreamer1.0-libav;

# video editor
sudo flatpak install -y flathub org.shotcut.Shotcut;

# stream/record
sudo flatpak install -y flathub com.obsproject.Studio;

# video download
sudo flatpak install -y flathub org.nickvision.tubeconverter;

######################################################
# REMOTE ACCESS
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

# remote control
sudo flatpak install -y flathub org.gnome.Connections;

# create a network
sudo snap install zerotier;

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
sudo flatpak install -y flathub dev.lapce.lapce;

# containers
sudo nala install -y podman;
sudo flatpak install -y flathub io.podman_desktop.PodmanDesktop;

# dev toolbox
sudo flatpak install -y flathub me.iepure.devtoolbox;

######################################################
# DATABASES
######################################################

# sql database
sudo snap install beekeeper-studio;

# redis database
sudo snap install redisinsight;

######################################################
# PROGRAMMING LANGUAGES - PYTHON
######################################################

# pyenv
sudo nala install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev;
curl https://pyenv.run | bash;
echo "
# pyenv
export PYENV_ROOT=\"\$HOME/.pyenv\"
[[ -d \$PYENV_ROOT/bin ]] && export PATH=\"\$PYENV_ROOT/bin:\$PATH\"
eval \"\$(pyenv init -)\"
eval \"\$(pyenv virtualenv-init -)\"" | tee -a ~/.bash_profile ~/.bashrc;
source ~/.bashrc;

# uv (maybe in the future if receive more functionality, right doesn't even create pyproject.toml)
# curl -LsSf https://astral.sh/uv/install.sh | sh;

# pdm
sudo nala install -y python3-venv;
curl -sSL https://pdm-project.org/install-pdm.py | python3 -;
echo "
# pdm
export PATH=~/.local/bin:\$PATH" | tee -a ~/.bash_profile ~/.bashrc;
source ~/.bashrc;
pdm completion bash | sudo tee /etc/bash_completion.d/pdm.bash-completion;

######################################################
# PROGRAMMING LANGUAGES - JAVASCRIPT
######################################################

# deno
curl -fsSL https://deno.land/x/install/install.sh | sh;
echo "
# deno
export DENO_INSTALL=\"~/.deno\"
export PATH=\"\$DENO_INSTALL/bin:\$PATH\"" | tee -a ~/.bash_profile ~/.bashrc;
source ~/.bashrc;

# nodejs
sudo nala install -y nodejs npm;

######################################################
# PROGRAMMING LANGUAGES - RUST
######################################################

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y;

######################################################
# MENTIONS
######################################################

# gamer mouse
# sudo nala install -y piper;

# fake mouse/keyboard inputs
# sudo nala install -y xdotool;

# virtual machine
# sudo flatpak install -y flathub org.gnome.Boxes;

# mirror phone screen
# sudo nala install -y ffmpeg libsdl2-2.0-0 adb wget gcc git pkg-config meson ninja-build libsdl2-dev libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev libswresample-dev libusb-1.0-0 libusb-1.0-0-dev;
# git clone https://github.com/Genymobile/scrcpy;
# cd scrcpy;
# ./install_release.sh;

######################################################
# OS SETTINGS 2
######################################################

# dock favorites
gsettings set org.gnome.shell favorite-apps "['nautilus.desktop', 'brave-browser.desktop']";

######################################################
# ENDING
######################################################

# cleaning
sudo nala autoremove -y;
sudo apt autoremove -y;

######################################################
# NOTES
######################################################
# If you are going to a new release, there is big chance that some package be missing in the PPA.
# Go to "Software & Updates > Other Software > Add...", copy the example and change the codename to the previous release. Example:
#   'deb http://archive.ubuntu.com/ubuntu mantic main'
#   'deb http://archive.ubuntu.com/ubuntu lunar main'
# You can find the codenames here: https://wiki.ubuntu.com/Releases
