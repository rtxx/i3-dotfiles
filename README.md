# i3-dotfiles
## My personal dotfiles for i3 (and Arch Linux)

Warning!
This is my personal dotfiles and configurations that I use with i3 and Arch Linux so stuff may not work OOTB. Please be free to check it out, but be careful, some of the settings is made for my hardware (Example: in i3status config file, it contains specific settings for my wifi and ethernet).

|  ![i3](https://cloud.ducknexus.xyz/s/eAbRyqLxT8rjKnG/download/i3.gif) | ![sunset](https://cloud.ducknexus.xyz/s/LFoZZHptbmG9zz9/download/sunset.gif)  |
|---|---|
| ![desktop](https://cloud.ducknexus.xyz/s/wmmxbydo7pDAtEo/download/ss1.png)  |  ![lightdm](https://cloud.ducknexus.xyz/s/qRBjmKbmicmB7cA/download/vm-lighdm.png) |

## Prerequisites
### Arch repositories
Careful! This will install all the packages I use when installing a Xorg server. Please check the list before install them.
```
pacman -Syu --needed nano sudo bash-completion man pacman-contrib amd-ucode intel-ucode xorg-server xorg-xinit xorg-setxkbmap xorg-xinput xorg-xbacklight xf86-video-intel xf86-video-amdgpu xf86-video-nouveau mesa lib32-mesa lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3-gaps i3status py3status i3lock xss-lock python-i3ipc dmenu jgmenu gmrun breeze breeze-gtk materia-gtk-theme materia-kde xsettingsd lxappearance capitaine-cursors papirus-icon-theme archlinux-wallpaper feh picom conky noto-fonts noto-fonts-emoji ttf-fantasque-sans-mono htop nethogs arandr unrar zip unzip neofetch git vim xclip xterm kitty volumeicon thunar tumbler ffmpegthumbnailer thunar-archive-plugin thunar-media-tags-plugin xarchiver mousepad firefox scrot udiskie nm-connection-editor ntfs-3g gvfs gvfs-smb gvfs-mtp xdg-user-dirs unclutter nano-syntax-highlighting ufw gufw dunst polkit polkit-gnome polkit-qt5 gnome-keyring seahorse network-manager-applet gpaste jq xfce4-power-manager tlp cpupower powertop cups cups-pdf avahi nss-mdns gsmartcontrol lm_sensors stress hwinfo bat playerctl graphicsmagick wmctrl
```
### AUR
```
qt5ct-kde python-schedule python-pystray python-pydbus yay-bin
```
## Setup
### Setup script
Copy the code below, save it to a file and run it with ```bash [script name]``` in a terminal. When completed, a folder named ```i3-dotfiles``` is created on the home folder of the current user. Copy the files to your home folder. Dont forget to make a backup first!
```
#!/bin/bash

RESTORE=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')

# check if dependencies are met
dependencies=("git")
for pkg in ${dependencies[@]}; do
  checkDependency=$(pacman -Q $pkg)
  exitStatus=$?
  if [ "$exitStatus" -eq 1 ]; then
    echo ${RED}"::"${RESTORE}" Error! Please install '$pkg'"
    exit 2
  fi
done

GITFOLDER=i3-dotfiles
currentDate=$(date '+%Y%m%d-%H%M%S')

if [ -d "/home/$USER/$GITFOLDER" ]; then
  echo ${RED}"::"${RESTORE}" Error! 'i3-dotfiles' dir already exists on '$USER' home folder. Please remove it."
  exit
fi

mkdir /tmp/i3-dotfiles-$currentDate
cd /tmp/i3-dotfiles-$currentDate

echo ${GREEN}"::"${RESTORE}" Getting files from git"
if ! git clone https://github.com/rtxx/i3-dotfiles.git ; then
  echo ${RED}"::"${RESTORE}" Error! Something went wrong with git. Check your connection maybe?"
  exit
fi

echo ${GREEN}"::"${RESTORE}" Fixing permissions"
chown -R $USER:$USER $GITFOLDER
find $GITFOLDER -type f -print0 | xargs -0 chmod 664
find $GITFOLDER -type d -print0 | xargs -0 chmod 775

chmod +x $GITFOLDER/.config/i3/makeconfig
chmod +x $GITFOLDER/.config/i3status/makeconfig

chmod +x $GITFOLDER/.config/i3/config.d/scripts/emojiget.py
chmod +x $GITFOLDER/.config/i3/config.d/scripts/check-updates
chmod +x $GITFOLDER/.config/i3/config.d/scripts/emojipick
chmod +x $GITFOLDER/.config/i3/config.d/scripts/feh-blur
chmod +x $GITFOLDER/.config/i3/config.d/scripts/help-pacman
chmod +x $GITFOLDER/.config/i3/config.d/scripts/i3exit
chmod +x $GITFOLDER/.config/i3/config.d/scripts/i3services

chmod +x $GITFOLDER/.config/i3/config.d/scripts/archnews/archnews
chmod +x $GITFOLDER/.config/i3/config.d/scripts/i3sounds/i3sounds
chmod +x $GITFOLDER/.config/i3/config.d/scripts/packy/packy
chmod +x $GITFOLDER/.config/i3/config.d/scripts/sunset/sunset
chmod +x $GITFOLDER/.config/i3/config.d/scripts/sunset/sunset-gui.py

echo ${GREEN}"::"${RESTORE}" Moving 'i3-dotfiles' to '$USER' home folder"
mv /tmp/i3-dotfiles-$currentDate/* "/home/$USER"
echo ${GREEN}"::"${RESTORE}" Removing temp files"
rm -rf /tmp/i3-dotfiles-$currentDate

echo ${GREEN}"::"${RESTORE}" Done. Check your home folder. It should be a folder named 'i3-dotfiles'"


```
 **Note**: If you dont see the files inside ```i3-dotfiles```, it's because they are hidden, don't forget!
### About i3 folder sctructure
```
i3
  | config.d
    | theme.conf
    | main.conf
  | config
  | makeconfig
```
This is the file sctructure for i3 and i3status. It uses ```makeconfig``` to *glue* ```main.conf``` and ```theme.conf```, replacing the main ```config```. Same for i3status. If some change is needed, change ```main.conf``` and remake the main ```config``` using ```makeconfig```.

I added to ```.bashrc``` aliases ```i3-edit-config```, ```i3-remake-config```, ```i3status-edit-config``` and ```i3status-remake-config``` for convenience.

There's also ```i3-edit-config-gui``` and ```i3status-edit-config-gui``` aliases, that launchs the default GUI application for text files using ```xdg-open```.

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