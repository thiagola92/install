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

# don't restore terminal session
gsettings set org.gnome.Ptyxis restore-session false;

# sort directories first
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true;

# disable mousing over left-top of screen activating activities overview
gsettings set org.gnome.desktop.interface enable-hot-corners false;

# turn on/off night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false;

# keyboard layout as "Portuguese (Brazil)"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'br')]";

# turn on/off gnome automatic updates
gsettings set org.gnome.software allow-updates false;

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
git config --global user.email $EMAIL;
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

######################################################
# CONTAINER
######################################################

# docker
sudo dnf install -y dnf-plugins-core;
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo;
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;
sudo systemctl enable --now docker;

######################################################
# PROGRAMMING LANGUAGES - GDScript
######################################################

# godot
curl https://api.github.com/repos/godotengine/godot-builds/releases/latest -o releases.json;
curl -L -o godot.zip $(jq -r '.assets[] | select(.name? | match(".*stable_linux.x86_64.zip")) | .browser_download_url' releases.json);
unzip godot.zip;
rm godot.zip;
rm releases.json;
mv Godot_v* .local/bin/godot

# desktop entry
echo "[Desktop Entry]
Type=Application
Name=Godot
Exec=/home/thiagola92/.local/bin/godot
Terminal=false
Categories=Game;Development;" > /home/$USERNAME/.local/share/applications/godot.desktop

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

######################################################
# GENERIC TOOLS
######################################################

# customize gnome
sudo flatpak install -y flathub ca.desrt.dconf-editor;

# browser
curl -fsS https://dl.brave.com/install.sh | sh;

# discord
curl -fL "https://discord.com/api/download?platform=linux&format=rpm" -o discord.rpm;
sudo dnf install -y ./discord.rpm;
rm discord.rpm;

######################################################
# REMOTE ACCESS TOOLS
######################################################

# ssh server
sudo dnf install -y openssh-server;
sudo systemctl enable --now sshd;

# ftp server
sudo dnf install -y vsftpd;

# rdp server
sudo dnf install -y xrdp;

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
# CLEANING
######################################################

# libre office
sudo dnf remove -y libreoffice-core;

# cleaning
sudo dnf autoremove -y;