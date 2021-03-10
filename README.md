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

### Update the OS and install common tools

### Install updates and reboot:

```shell

sudo dnf upgrade --refresh
sudo dnf check
sudo dnf autoremove
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update
sudo reboot now

```

### Additional repositories

I enable third party repositories by going into Software -> Software Repositories -> Third Party Repositories -> Enable All. I go through the list and enable all the repositories I think I need such as RPM Fusion NVIDIA Driver. Then I run

```shell

sudo dnf install -y  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

```
o enable the RPM Fusion free and nonfree repositories. Afterwards I run


```shell

sudo dnf upgrade --refresh
sudo dnf groupupdate core
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y dnf-plugins-core

```
Checkout `sudo dnf grouplist -v` to see available groups you might be interested in.

### Improve Font Rendering
The default font rendering in Fedora may appear blurry on LCD monitors. Gnome's OS settings application lacks the ability to change font rendering. You must install the Gnome Tweak Tool to adjust these settings. Gnome Tweak Tool can be installed from the Fedora or from a terminal as shown below:

   1. Run `sudo dnf install gnome-tweak-tool`
   2. Run `gnome-tweaks`
   3. Fonts > Hinting > Set to "Full"
   4. Fonts > Antialiasing > Set to "Subpixel (for LCD screens)"
### Tilix

Tilix may be preferable to the default Gnome terminal:

```shell

sudo dnf install tilix

```

### Flameshot

```shell

sudo dnf install flameshot

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

sudo dnf install nmap -y

sudo dnf install netdiscover -y

 sudo dnf install fping  -y

```
### Wine

You will probably need to use some Windows software daily for this, we will install wine in the latest version.


```shell

sudo dpkg --add-architecture i386 -y

wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add - -y

sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y

sudo apt update && sudo apt install --install-recommends winehq-stable -y

```
### Codecs

The basics that work

```shell

 sudo apt install ubuntu-restricted-extras -y

```
### Optional: "Software that you will need sometime"

1. Qbittorrent
2. Neofectch

```shell

sudo dnf install qbittorrent -y

sudo dnf install neofetch -y

```

### Firefox

### Optional: Force GPU rendering to smooth out page scrolling

Firefox in Gnome can experience screen tearing and other performance-inhibiting behavior. This may be adjustable by forcing GPU rendering, though it may impact power usage and stability. This has only been tested using NVIDIA GPUs.


1. Navigate to`about:config` in the Firefox URL bar
2. Select Accept the Risk and Continue
3. Copy and paste`layers.acceleration.force-enabled` into the search box and Enable it
4. Copy and paste`layers.force-active` into the search box and Enable it
5. Restart Firefox and observe smoother scrolling behavior


### My Wallpaper

![Wallpaper](https://github.com/Deyrick/pop-os-setup/blob/main/Dual%20Monitor%20Wallpaper%20-%20Imgur.jpg)
