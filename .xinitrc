# variables
WALLPAPERS_DIR=$HOME/Coffee/Pictures/Wallpapers

# load the resource file and merge it with the current urxvt settings
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# mute the PC Speaker beep
xset -b

# set random wallpaper
feh --bg-max --randomize $WALLPAPERS_DIR/*

# start mpd (as the current user)
[ ! -s $HOME/.mpd/pid ] && mpd

# start i3wm
exec /usr/bin/i3
