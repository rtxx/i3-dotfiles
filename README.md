# i3-dotfiles
## My personal dotfiles for i3 (and Arch Linux)

Warning!
This is my personal dotfiles and configurations that I use with i3 and Arch Linux so stuff may not work OOTB.. Please be free to check it out, but be careful, some of the settings is made for my hardware (Example: in my i3status config it's specific for my wifi and ethernet).

## Prerequisites
### i3 wm
```
pacman -Syu --needed i3-gaps i3status py3status i3lock xss-lock python-i3ipc dmenu jgmenu gmrun lxappearance dunst
```

### Theme's and icons
```
pacman -Syu --needed breeze breeze-gtk materia-gtk-theme materia-kde capitaine-cursors papirus-icon-theme feh picom conky noto-fonts noto-fonts-emoji ttf-fantasque-sans-mono
```
AUR
```
qt5ct-kde python-schedule python-pystray python-pydbus yay-bin
```
### All packages (including the above, excluding AUR)
Careful! This will install all the packages I use when installing a Xorg server. Please check the list before install them.
```
pacman -Syu --needed nano sudo bash-completion man pacman-contrib amd-ucode intel-ucode xorg-server xorg-xinit xorg-setxkbmap xorg-xinput xorg-xbacklight xf86-video-intel xf86-video-amdgpu xf86-video-nouveau mesa lib32-mesa lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3-gaps i3status py3status i3lock xss-lock python-i3ipc dmenu jgmenu gmrun breeze breeze-gtk materia-gtk-theme materia-kde xsettingsd lxappearance capitaine-cursors papirus-icon-theme archlinux-wallpaper feh picom conky noto-fonts noto-fonts-emoji ttf-fantasque-sans-mono htop nethogs arandr unrar zip unzip neofetch git vim xclip xterm kitty volumeicon thunar tumbler ffmpegthumbnailer thunar-archive-plugin thunar-media-tags-plugin xarchiver mousepad firefox scrot udiskie nm-connection-editor ntfs-3g gvfs gvfs-smb gvfs-mtp xdg-user-dirs unclutter nano-syntax-highlighting ufw gufw dunst polkit polkit-gnome polkit-qt5 gnome-keyring seahorse network-manager-applet gpaste jq xfce4-power-manager tlp cpupower powertop cups cups-pdf avahi nss-mdns gsmartcontrol lm_sensors stress hwinfo bat
```
## Setup
### Permissions
If the permissions from the files from github are a bit honky do this:
```
chown -R $USER:$USER 'gitfolder'
find 'gitfolder' -type f -print0 | xargs -0 chmod 664
find 'gitfolder' -type d -print0 | xargs -0 chmod 775
```

### Theme
I created a script named ```sunset``` that automatically changes the theme from a bunch of programs. It's very, **very** barebones script. Check it [here](https://github.com/rtxx/scripts/tree/main/sunset).

### Terminal
Append ```TERMINAL=kitty``` to ```/etc/environment```

### Dunst
Dunst config file is automatically made everytime ```sunset``` is used, so be careful, any change is going to be erased. If a change is needed, then change at ```gendunst```, inside ```sunset``` folder.

### qt5ct
Append ```QT_QPA_PLATFORMTHEME=qt5ct``` to ```/etc/environment```

### lightdm
Copy ```lightdm-gtk-greeter.conf``` to ```/etc/lightdm/lightdm-gtk-greeter.conf```

### nano
Copy ```nanorc``` to ```/etc```