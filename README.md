# Fedora Setup Forever

### Update the OS and install common tools

The first thing you should do is get the latest security updates:

```shell
sudo apt update && sudo apt dist-upgrade -y
```
### Improve Font Rendering
The default font rendering in Pop!_OS may appear blurry on LCD monitors. Gnome's OS settings application lacks the ability to change font rendering. You must install the Gnome Tweak Tool to adjust these settings. Gnome Tweak Tool can be installed from the Fedora or from a terminal as shown below:

   1. Run `sudo apt install gnome-tweak-tool`
   2. Run `gnome-tweaks`
   3. Fonts > Hinting > Set to "Full"
   4. Fonts > Antialiasing > Set to "Subpixel (for LCD screens)"
### Tilix

Tilix may be preferable to the default Gnome terminal:

```shell
sudo apt install tilix
```

### Flameshot

Tilix may be preferable to the default Gnome terminal:

```shell

sudo apt install flameshot
```

### Optional: Create Shortcut for screenshot

1. Navigate to Settings > Keyboard > Costumize Shortcuts
2. Click on Custom Shortcuts > Add Shortcut
3. Insert in"Name" `Flameshot`
4. Insert in"Command" `flameshot gui`
5. In "Set Shortcut"`place a key combination of your choice`,`Add` and done


### Peek

Recording the screen without suffering:

```shell

sudo add-apt-repository ppa:peek-developers/stable -y 

sudo apt update

sudo apt install peek -y

```
### The most used network programs in everyday life 

```shell

sudo apt install nmap -y

sudo apt install snmp -y

sudo apt install whois -y

sudo apt install netdiscover -y

 sudo apt install fping  -y

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
3. Htop
4. Visual Studio Code
5. Rar, Urar and Zip

```shell

sudo apt install qbittorrent -y

sudo apt install neofetch -y

sudo apt install code -y

sudo apt install rar unrar p7zip-full p7zip-rar -y

```


### Firefox

### Optional: Force GPU rendering to smooth out page scrolling

Firefox in Gnome can experience screen tearing and other performance-inhibiting behavior. This may be adjustable by forcing GPU rendering, though it may impact power usage and stability. This has only been tested using NVIDIA GPUs.


1. Navigate to`about:config` in the Firefox URL bar
2. Select Accept the Risk and Continue
3. Copy and paste`layers.acceleration.force-enabled` into the search box and Enable it
4. Copy and paste`layers.force-active` into the search box and Enable it
5. Restart Firefox and observe smoother scrolling behavior

### And all of that was automated in the script

`ubuntu.sh`

### My Wallpaper

![Wallpaper](https://github.com/Deyrick/pop-os-setup/blob/main/Dual%20Monitor%20Wallpaper%20-%20Imgur.jpg)
