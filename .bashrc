#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1='[\t \u@\h \w]\n$ '

# alias
# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo/22043#22043
alias sudo='sudo '
alias ls='ls --color=auto'
# kitty ssh workaround
alias ssh="kitty +kitten ssh"

#wholesome computing
# silly quotes from a silly cow
alias fortuneme='fortune | cowsay'

# silly jokes from a silly cow
alias jokeme='shuf -n 1 ~/.Xresources.d/corny-jokes | cowsay'

# be polite to the machines, for when they rise, maybe they'll
# show mercy on your soul...
alias pls='sudo '
alias pretty-pls='sudo $(history -p !!)'

# set console font to terminus
alias setconsolefont='setfont /usr/share/kbd/consolefonts/ter-118n.psf.gz'

# check battery status
alias checkbattery='upower --dump | less'

# pacman
alias pls-update='sudo pacman -Syu'
alias pls-update-aur='yay -Sau'
alias pls-install='sudo pacman -S'
alias pls-search-for='pacman -Si'
alias pls-search-for-aur='yay -Sai'
alias pls-info='pacman -Qi'
alias pls-whodis='pacman -Qo'
alias pls-remove='sudo pacman -R'
alias pls-clean-my-system='sudo pacman -Rns $(pacman -Qdtq)'

# edit common files
alias pls-edit-fstab='sudo vim /etc/fstab'
alias pls-edit-pacmanconf='sudo vim /etc/pacman.conf'
alias pls-edit-env='sudo vim /etc/environment'

# i3
# edit config file
alias i3-edit-config='vim ~/.config/i3/config.d/main.conf'
alias i3-edit-config-gui='xdg-open ~/.config/i3/config.d/main.conf & disown'
# remake config and reload
alias i3-remake-config='bash ~/.config/i3/makeconfig; i3-msg restart'
# reload wallpaper
#alias i3-wallpaper-default='feh --bg-scale ~/.config/i3/config.d/wallpapers/breezeblack.png'
# set wallpaper
alias i3-wallpaper-set='feh --bg-scale'

# i3status
# edit config file
alias i3status-edit-config='vim ~/.config/i3status/config.d/main.conf'
alias i3status-edit-config-gui='xdg-open ~/.config/i3status/config.d/main.conf & disown'
# remake config and reload
alias i3status-remake-config='bash ~/.config/i3status/makeconfig; i3-msg restart'

#theme changer
alias sunset='bash ~/.config/i3/config.d/scripts/sunset/sunset'

# simple script with helpful pacman commands
alias help-pacman='bash ~/.config/i3/config.d/scripts/help-pacman'

# simple aur helper
alias packy='bash ~/.config/i3/config.d/scripts/packy/packy'

# check news from arch
alias archnews='bash ~/.config/i3/config.d/scripts/archnews/archnews'

# download playlist to mp3 from youtube
#alias youtube-dl-playlist="./home/live/Applications/yt-dlp -i --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s'"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
