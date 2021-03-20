# Things to do after installing my Fedora Workstation 30/31/32/33 ...  (Apps, Settings, and Tweaks)

# Wayland or Xorg
By Default Wayland is enabled. If you have a Nvidia card this is not working well, so you would have to disable it.

I disable it by uncommenting `WaylandEnable=false` and adding `DefaultSession=gnome-xorg.desktop` to the [daemon] section of /etc/gdm/custom.conf:
```shell

sudo nano /etc/gdm/custom.conf
# [daemon]
# WaylandEnable=false
# DefaultSession=gnome-xorg.desktop

```
Next time you reboot the system it will boot into an Xorg Gnome session.

### Set hostname

By default my machine is called localhost; hence, I rename it for better accessability on the network:

```shell

hostnamectl set-hostname fedora

```

### Additional repositories

I enable third party repositories by going into Software -> Software Repositories -> Third Party Repositories -> Enable All. I go through the list and enable all the repositories I think I need such as RPM Fusion NVIDIA Driver. Then I run

```shell

sudo dnf -y install  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

```
o enable the RPM Fusion free and nonfree repositories. Afterwards I run


```shell

sudo dnf -y upgrade --refresh
sudo dnf -y groupupdate core
sudo dnf -y install rpmfusion-free-release-tainted
sudo dnf -y install  dnf-plugins-core

```
Checkout `sudo dnf grouplist -v` to see available groups you might be interested in.

### Additional repositories Worktation

```shell

sudo dnf -y install fedora-workstation-repositories

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
### Tilix

Tilix may be preferable to the default Gnome terminal:

```shell

sudo dnf -y install tilix

```

### Flameshot

```shell

sudo dnf -y install flameshot

```

### Optional: Create Shortcut for screenshot

1. Navigate to Settings > Keyboard > Costumize Shortcuts
2. Click on Custom Shortcuts > Add Shortcut
3. Insert in"Name" `Flameshot`
4. Insert in"Command" `flameshot gui`
5. In "Set Shortcut"`place a key combination of your choice`,`Add` and done

### Google Chrome

If I ever need Google Chrome, then I enable the repo in the software manager and install it via the software shop.


### The most used network programs in everyday life 

```shell

sudo dnf -y install nmap

sudo dnf -y install netdiscover

sudo dnf -y install fping

```
### Wine

You will probably need to use some Windows software daily for this, we will install wine in the latest version.


```shell

sudo dnf -y install dnf-plugins-core

sudo dnf -y config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/32/winehq.repo

sudo dnf -y install winehq-stable

```
### Multimedia Codecs

The basics that work

```shell

sudo dnf -y groupupdate sound-and-video
sudo dnf -y install libdvdcss
sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,ugly-\*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg 
sudo dnf -y install lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia

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



### My Wallpaper

![Wallpaper](https://github.com/Deyrick/pop-os-setup/blob/main/Dual%20Monitor%20Wallpaper%20-%20Imgur.jpg)
