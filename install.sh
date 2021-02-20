#!/bin/bash

#Hostname

#Configurando o Hostname

sudo hostnamectl set-hostname 486DX2

# Repositorios  -----------------------------------------------------------------------------

# Adicionando os repositório Rmp Fusion

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y


# Adicionando o repositório Worktation
sudo dnf install fedora-workstation-repositories -y

# Atualizando o sistema

sudo dnf upgrade --refresh -y



# Instalado os programas 

# flameshot  -----------------------------------------------------------------------------

sudo dnf install flameshot -y


# Peek  -----------------------------------------------------------------------------

# Instalando o peek

sudo dnf install peek -y

sudo dnf install ffmpeg -y

sudo dnf install gstreamer1-plugins-ugly -y




# Nmap  -----------------------------------------------------------------------------

# Instalando o nmap

sudo dnf install nmap -y




# Snmp  -----------------------------------------------------------------------------

# Instalando o nmap

sudo dnf install net-snmp net-snmp-libs net-snmp-utils -y

#Habilitando Snmp

systemctl enable snmpd.service

#Reiniciando o Serviço de Snmp

systemctl reload snmpd.service



# tilix  -----------------------------------------------------------------------------

# Instalando o tilix

sudo dnf install tilix



# gnome-tweaks ----------------------------------------------------------------------------

# Instalando o gnome-tweaks

sudo dnf install gnome-tweaks -y



# qBittorrent -----------------------------------------------------------------------------

# Instalando o qbittorrent

sudo dnf install qbittorrent -y



# Neofectch -----------------------------------------------------------------------------

# Instalando o neofetch

sudo dnf install neofetch -y

# Htop -----------------------------------------------------------------------------

sudo dnf install htop -y

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

sudo dnf install code -y



# Codecs ----------------------------------------------------------------------------

sudo dnf groupupdate sound-and-video -y
sudo dnf install -y libdvdcss
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,ugly-\*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg 
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia


 #  Multimedia  ----------------------------------------------------------------------------

 sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

sudo dnf groupupdate sound-and-video -y

# wine ----------------------------------------------------------------------------


# Instalando o wine

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/32/winehq.repo

sudo dnf -y install winehq-stable



echo "Config Done!"


sudo  neofetch




