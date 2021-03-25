#! /usr/bin/env bash

# get the dir of this script - to avoid having to clone the git repo to $HOME directly
sourceDir=$( cd "$( dirname "$0" )" && pwd )

# make required directories
mkdir -p $HOME/.config

# define the files/dirs for which we need symlinks in the $HOME dir
sourceFiles=".bashrc .bash_profile .asoundrc .vimrc .gitconfig .gitignore
.xinitrc .Xresources .ncmpcpp .config/polybar .config/ranger .config/mpd
.config/i3 .config/dunst .config/neofetch .config/htop .config/rofi
.config/systemd .config/scripts .vim/quick-snippets"

# this function creates symlinks in $HOME dir
# existing symlinks won"t be overridden unless the "--force" option is passed
function create_symlink() {
    src=$1
    dest=$2
    force=$3

    echo -n "[SYMLINK] $dest -> $src ... "
    if [ -e $dest -a $force -eq 0 ]; then
        echo "FAILED! Destination already exists"
    else
        if [ -d $dest -a $force -eq 1 ]; then
            rm -rf $dest
        fi
        ln -sf $src $dest
        echo "SUCCESS!"
    fi
}

for file in $sourceFiles; do
    src=$sourceDir/$file
    dest=$HOME/$file
    force=0

    if [ "$1" = "-f" -o "$1" = "--force" ]; then
        force=1
    fi

    create_symlink $src $dest $force
done

# special symlink for systemctl service to show lockscreen on suspend
if [ "$1" = "-s" -o "$1" = "--sudo" -o "$2" = "-s" -o "$2" = "--sudo" ]; then
  sudo ln -sf "$HOME/.config/systemd/etc/suspend@vdraceil.service" \
    "/etc/systemd/system/suspend@vdraceil.service"
fi
