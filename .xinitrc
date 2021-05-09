# variables
WALLPAPERS_DIR=/home/vdraceil/local/wallpapers

# load the resource file and merge it with the current urxvt settings
[[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

# mute the PC Speaker beep
xset -b

# set random wallpaper
feh --bg-scale --randomize $WALLPAPERS_DIR

# auto detect & mount USB drives
udiskie &

# hack: for Upwork app to properly capture screenshots
export XDG_SESSION_TYPE="x11"

# start i3wm
exec /usr/bin/i3
