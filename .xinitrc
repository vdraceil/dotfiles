# variables
WALLPAPERS_DIR=$HOME/Coffee/Pictures/Wallpapers

# load the resource file and merge it with the current urxvt settings
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

# mute the PC Speaker beep
xset -b

# set random wallpaper
feh --bg-scale --randomize $WALLPAPERS_DIR

# start mpd (as the current user)
[ ! -s $HOME/.mpd/pid ] && mpd

# start i3wm
exec /usr/bin/i3
