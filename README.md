# Things to do after installing my Fedora Workstation 33 (Apps, Settings, and Tweaks)
# 
# Wayland or Xorg
By Default Wayland is enabled. If you have a Nvidia card this is not working well, so you would have to disable it.

disable it by uncommenting `WaylandEnable=false` and adding `DefaultSession=gnome-xorg.desktop` to the [daemon] section of /etc/gdm/custom.conf:
```shell

sudo nano /etc/gdm/custom.conf
# [daemon]
 WaylandEnable=false
 DefaultSession=gnome-xorg.desktop

```
add some flags to the dnf conf file to speed it up:

Next time you reboot the system it will boot into an Xorg Gnome session.

### Set hostname

By default my machine is called localhost; hence, I rename it for better accessability on the network:

```shell

hostnamectl set-hostname fedora

```

### Update the OS and install common tools

### Install updates and reboot:

```shell

sudo dnf -y upgrade --refresh

sudo dnf -y autoremove

sudo reboot now

```


### Improve Font Rendering
The default font rendering in Fedora may appear blurry on LCD monitors. Gnome's OS settings application lacks the ability to change font rendering. You must install the Gnome Tweak Tool to adjust these settings. Gnome Tweak Tool can be installed from the Fedora or from a terminal as shown below:

   1. Run `sudo dnf install gnome-tweak-tool`
   2. Run `gnome-tweaks`
   3. Fonts > Hinting > Set to "Full"
   4. Fonts > Antialiasing > Set to "Subpixel (for LCD screens)"


### Google Chrome

If I ever need Google Chrome, then I enable the repo in the software manager and install it via the software shop.


### The most used network programs in everyday life 

```shell

sudo dnf -y install nmap

sudo dnf -y install netdiscover

sudo dnf -y install fping

```
### How to Setup an L2TP/IPsec VPN Client


```shell

sudo dnf -y install xl2tpd

sudo dnf -y install NetworkManager-l2tp

sudo dnf -y install NetworkManager-l2tp-gnome

sudo service NetworkManager restart

```

### Wine

You will probably need to use some Windows software daily for this, we will install wine in the latest version.


```shell

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/33/winehq.repo

sudo dnf -y install winehq-stable

```
### Multimedia Codecs

The basics that work

```shell

sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf install lame\* --exclude=lame-devel

sudo dnf group upgrade --with-optional Multimedia

```
For OpenH264 in Firefox I run:

```shell

sudo dnf -y config-manager --set-enabled fedora-cisco-openh264

sudo dnf -y install gstreamer1-plugin-openh264 mozilla-openh264

```
Afterwards you need to open Firefox, go to menu → Add-ons → Plugins and enable OpenH264 plugin. You can do a simple test whether your H.264 works in RTC on this page (check Require H.264 video).

### Optional: "Software that you will need sometime"

1. Qbittorrent
2. Neofectch

```shell

sudo dnf -y install qbittorrent 

sudo dnf -y install neofetch

```

### Firefox

### Optional: Force GPU rendering to smooth out page scrolling

Firefox in Gnome can experience screen tearing and other performance-inhibiting behavior. This may be adjustable by forcing GPU rendering, though it may impact power usage and stability. This has only been tested using NVIDIA GPUs.


1. Navigate to`about:config` in the Firefox URL bar
2. Select Accept the Risk and Continue
3. Copy and paste`layers.acceleration.force-enabled` into the search box and Enable it
4. Copy and paste`layers.force-active` into the search box and Enable it
5. Restart Firefox and observe smoother scrolling behavior


### Optional: Automating the process:

 Run the fedora-setup script: `fedora-setup`

### Gnome Settings


    1. Set up Wifi, Ethernet and VPN
    2. Turn off bluetooth
    3. Change wallpaper
    4. Automatically delete recent files and trash
    5. Turn of screen after never
    6. Deactivate system sounds, mute mic
    7. Turn of suspend, shutdown for power button
    8. Turn on natural scrolling for mouse touchpad
    9. Go through keyboard shortcuts and adapt, I also add custom ones:
      1. xkill on CTRL+ALT+X
      2. gnome-terminal` on CTRL+ALT+T
    10. Change clock to 24h format
    11. Display battery as percentage
    12. Check your default programs

### Optional

### Improving the performance of Fedora Workstation

### Attention! This is a usage report, not a tutorial

I said a lot, come on. Reducing swap access (Fedora defaults to 60. The lower the number, the less access): 

```shell

 sudo sysctl vm.swappiness=5
 
 sudo sysctl vm.vfs_cache_pressure=50
  
```
 Making changes permanent by editing the /etc/sysctl.d/99-sysctl.conf file
```shell

 sudo nano /etc/sysctl.d/99-sysctl.conf
    
```
 Add:

```shell

vm.swappiness=5
vm.vfs_cache_pressure=50

```
 In real life, I don't use GNOME Software or Anaconda:
 
 
```shell

 sudo dnf remove gnome-software

 sudo dnf remove anaconda
 
```

Disabling Bluetooth and printing services :

```shell

sudo systemctl mask bluetooth.service bluetooth.target cups-browsed.service cups.path cups.service cups.socket

```

Removing things I don't use in GNOME :

```shell

sudo dnf remove cheese \
evolution \
evolution-ews \
evolution-help \
gfbgraph \
gnome-boxes \
gnome-calendar \
gnome-contacts \
gnome-dictionary \
gnome-documents \
gnome-getting-started-docs \
gnome-initial-setup \
gnome-maps \
gnome-online-miners \
gnome-photos \
gnome-software \
gnome-user-docs \
gnome-user-share \
gnome-video-effects \
gnome-weather \
simple-scan \
totem \
tracker-miners \
yelp

```
Ensuring that the programs I use are installed


```shell

sudo dnf install eog \
evince \
evolution-data-server \
flatpak \
gdm \
gnome-keyring \
gnome-menus \
gnome-screenshot \
gnome-shell \
gnome-terminal \
gnome-tweaks \
nautilus \
redhat-menus

```

Considerations :

None of the above is necessary if "you are a normal person". If you are going to reproduce something, do it carefully, this is not a manual.
I decided to show it here, but I know where I'm going and the reasons too, and there are more things that I disable than the ones I showed. If you don't know what you're doing, please (reinforcement), don't do it.

Until next time, guys.



