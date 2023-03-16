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

######################################################
# BASIC TOOLS
######################################################

# browser
sudo dnf install -y dnf-plugins-core;
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo;
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc;
sudo dnf install -y brave-browser;

# discord
sudo flatpak install -y flathub com.discordapp.Discord;

# customize gnome
sudo dnf install -y dconf-editor;

# torrent downloader
sudo flatpak install -y flathub de.haeckerfelix.Fragments;

# upscale image
sudo flatpak install -y flathub io.gitlab.theevilskeleton.Upscaler;

# game platform
sudo dnf install -y steam;

######################################################
# MEDIA TOOLS
######################################################

# music player
sudo flatpak install -y flathub com.spotify.Client;

# image editor
sudo dnf install -y gimp;

# image draw
sudo flatpak install -y flathub org.inkscape.Inkscape;

# video player
sudo dnf install -y gstreamer1-plugin-libav;

# video editor
sudo flatpak install -y flathub org.pitivi.Pitivi;

# stream/record
sudo flatpak install -y flathub com.obsproject.Studio;
