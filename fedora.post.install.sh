#!/bin/sh

## fix touchpad rightclick and middle click
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'areas'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
 
## Update all enabled extensions

sudo dnf -y --refresh upgrade

sudo dnf -y autoremove

##gnome extensions and manage of extensions

sudo dnf install -y gnome-extensions-app gnome-tweaks

## set dark theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
## add minimize window button
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'
## adjust screensaver time
gsettings set org.gnome.desktop.session idle-delay 900
## directories in file structure first
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
## show hidden files
gsettings set org.gtk.Settings.FileChooser show-hidden true
## change to list view
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

sudo dnf install -y fedora-workstation-repositories

sudo dnf -y update

## enable rpmfusion repos
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## How to Setup an L2TP/IPsec VPN Client
sudo dnf -y install xl2tpd

sudo dnf -y install NetworkManager-l2tp

sudo dnf -y install NetworkManager-l2tp-gnome

sudo service NetworkManager restart

#Multimedia Codecs

sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf -y install lame\* --exclude=lame-devel

sudo dnf -y group upgrade --with-optional Multimedia

##For OpenH264 in Firefox I run:

sudo dnf -y config-manager --set-enabled fedora-cisco-openh264

sudo dnf -y install gstreamer1-plugin-openh264 mozilla-openh264

#my necessary programs

sudo dnf -y install qbittorrent 
sudo dnf -y install neofetch

#### and 
