#!/bin/bash

#Hostname

#Configurando o Hostname

sudo hostnamectl set-hostname fedora

# Repositorios  -----------------------------------------------------------------------------

# Adicionando os repositório Rmp Fusion

sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Adicionando o repositório Worktation
sudo dnf -y install fedora-workstation-repositories

# Atualizando o sistema

sudo dnf -y upgrade --refresh 


# Instalado os programas 

# flameshot  -----------------------------------------------------------------------------

sudo dnf -y install flameshot 


# Peek  -----------------------------------------------------------------------------

# Instalando o peek

sudo dnf -y install peek 

sudo dnf -y install ffmpeg 

sudo dnf -y install gstreamer1-plugins-ugly


# Nmap  -----------------------------------------------------------------------------

# Instalando o nmap

sudo dnf -y install nmap 


# Snmp  -----------------------------------------------------------------------------

# Instalando o nmap

sudo dnf -y install net-snmp net-snmp-libs net-snmp-utils 

#Habilitando Snmp

systemctl enable snmpd.service

#Reiniciando o Serviço de Snmp

systemctl reload snmpd.service


# tilix  -----------------------------------------------------------------------------

# Instalando o tilix

sudo dnf -y install tilix

# gnome-tweaks ----------------------------------------------------------------------------

# Instalando o gnome-tweaks

sudo dnf -y install gnome-tweaks


# qBittorrent -----------------------------------------------------------------------------

# Instalando o qbittorrent

sudo dnf -y install qbittorrent 


# Neofectch -----------------------------------------------------------------------------

# Instalando o neofetch

sudo dnf -y install neofetch

# Htop -----------------------------------------------------------------------------

sudo dnf -y install htop 

# Google Chrome -----------------------------------------------------------------------------

# Adicionadno a chave

sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

# Adicionando o repositório
sudo tee /etc/yum.repos.d/google-chrome.repo <<RPMREPO
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
RPMREPO

# Instalando 
#sudo dnf install google-chrome-stable

#echo "Instalacao concluida do google chrome"


# Visual Studio Code ----------------------------------------------------------------------------

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf check-update

sudo dnf -y install code 



# Codecs ----------------------------------------------------------------------------

sudo dnf -y groupupdate sound-and-video 
sudo dnf -y install  libdvdcss
sudo dnf -y install  gstreamer1-plugins-{bad-\*,good-\*,ugly-\*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg 
sudo dnf -y install  lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia


 #  Multimedia  ----------------------------------------------------------------------------

sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

sudo dnf -y groupupdate sound-and-video 

# wine ----------------------------------------------------------------------------


# Instalando o wine

sudo dnf -y install dnf-plugins-core

sudo dnf -y config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/32/winehq.repo

sudo dnf -y install winehq-stable



echo "Config Done!"


sudo  neofetch




