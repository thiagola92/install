#!/bin/bash

# not a secret
USERNAME=thiagola92
EMAIL=thiagola92@gmail.com

# configuration files directory
CONFIG=../../config

######################################################
# OS SETTINGS 1
######################################################

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

# turn on/off gnome desktop animations
gsettings set org.gnome.desktop.interface enable-animations false;

# disable text editor restoring session
gsettings set org.gnome.TextEditor restore-session false;

# ctrl+alt+backspace terminate session
gsettings set org.gnome.desktop.input-sources xkb-options "['terminate:ctrl_alt_bksp']";

# change terminal theme
gsettings set org.gnome.Ptyxis interface-style 'system';

# sort directories first
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true;

# left-top do not activate activities overview
gsettings set org.gnome.desktop.interface enable-hot-corners false;

# turn on/off night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false;

######################################################
# SOFTWARE INSTALLER
######################################################

# apt
sudo dnf upgrade -y;

# flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
sudo flatpak update -y;

######################################################
# PROGRAMMING TOOLS
######################################################

# version control
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
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc;
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null;
sudo dnf check-update;
sudo dnf install -y code;

# dev toolbox
sudo flatpak install -y flathub me.iepure.devtoolbox;

# mongodb database gui
curl -fL https://downloads.mongodb.com/compass/mongodb-compass-1.48.2.x86_64.rpm -o compass.rpm;
sudo dnf install -y ./compass.rpm;
rm compass.rpm;

# web api client
sudo flatpak install -y com.usebruno.Bruno;

# docker
sudo dnf install -y dnf-plugins-core;
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo;
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;
sudo systemctl enable --now docker;

######################################################
# PROGRAMMING LANGUAGES - PYTHON
######################################################

# application installer
sudo dnf install -y pipx;
pipx ensurepath;

# package manager
sudo curl -LsSf https://astral.sh/uv/install.sh | sh;

######################################################
# PROGRAMMING LANGUAGES - JAVASCRIPT
######################################################

# all-in-one
sudo curl -fsSL https://deno.land/install.sh | sh -s -- -y;
source $HOME/.deno/env;

# all-in-one
sudo dnf install -y nodejs;

######################################################
# PROGRAMMING LANGUAGES - RUST
######################################################

# all-in-one
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y;
source $HOME/.cargo/env;

######################################################
# PROGRAMMING LANGUAGES - GO
######################################################

# all-in-one
sudo dnf install -y golang;

######################################################
# PROGRAMMING LANGUAGES - VALA
######################################################

# compiler
sudo dnf install -y valac;

######################################################
# PROGRAMMING LANGUAGES - ZIG
######################################################

# compiler
sudo dnf install -y zig;

######################################################
# PROGRAMMING LANGUAGES - C
######################################################

# build tool
sudo pipx install scons;

# compiler
sudo dnf install -y clang;

# debugger
sudo dnf install -y clang-tools-extra;

######################################################
# TERMINAL TOOLS
######################################################

# interactive process viewer
sudo dnf install -y htop;

# command line information tool
sudo dnf install -y fastfetch;

# open/close modem ports through upnp
sudo dnf install -y miniupnpc;

# text editor
curl https://getmic.ro | bash;
mv micro $HOME/.local/bin;
mkdir ~/.config/micro;
cp $CONFIG/micro/settings.json ~/.config/micro/settings.json;

# shell
cargo install nu --locked;
sudo sh -c "echo '$HOME/.cargo/bin/nu\n' >> /etc/shells"
sudo chsh -s $HOME/.cargo/bin/nu $USERNAME;
mkdir $HOME/.config/nushell;
cp $CONFIG/nushell/config.nu $HOME/.config/nushell/config.nu;

######################################################
# GENERIC TOOLS
######################################################

# customize gnome
sudo flatpak install -y flathub ca.desrt.dconf-editor;

# browser
curl -fsS https://dl.brave.com/install.sh | sh;

# discord
sudo flatpak install -y flathub com.discordapp.Discord;

# torrent download
sudo flatpak install -y flathub de.haeckerfelix.Fragments;

# office suite tools
sudo flatpak install -y flathub org.libreoffice.LibreOffice;

######################################################
# AUDIO TOOLS
######################################################

# sound recorder
sudo flatpak install -y flathub org.gnome.SoundRecorder;

######################################################
# IMAGE TOOLS
######################################################

# image editor
sudo flatpak install -y flathub org.gimp.GIMP;

# image draw
sudo flatpak install -y flathub org.inkscape.Inkscape; 
mkdir ~/.config/inkscape;
mkdir ~/.config/inkscape/templates;
cp $CONFIG/inkscape/default.svg ~/.config/inkscape/templates/default.svg;
cp $CONFIG/inkscape/preferences.xml ~/.config/inkscape/preferences.xml;

# gnome icons
sudo flatpak install -y flathub org.gnome.design.IconLibrary;

# color palette
sudo flatpak install -y flathub org.gnome.design.Palette;

######################################################
# VIDEO TOOLS
######################################################

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
sudo dnf install -y openssh-server;

# ftp server
sudo dnf install -y vsftpd;

# rdp server
sudo dnf install -y xrdp;

######################################################
# CRON JOBS
######################################################

sudo cp export_bookmarks.sh /etc/cron.d/export_bookmarks.sh;
crontab <<EOF
# backup bookmarks
0 0 * * * bash /etc/cron.d/export_bookmarks.sh
EOF

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
cp $CONFIG/starship/starship.toml ~/.config/starship.toml;

######################################################
# OS SETTINGS 2
######################################################

# dock favorites
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'brave-browser.desktop','org.gnome.Ptyxis.desktop']";

######################################################
# ENDING
######################################################

# cleaning
sudo dnf autoremove -y;

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
