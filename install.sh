#!/bin/bash

# get the dir of this script - to avoid having to clone the git repo to $HOME directly
sourceDir=$( cd "$( dirname "$0" )" && pwd )

# make required directories
mkdir $HOME/.config

# define the files/dirs for which we need symlinks in the $HOME dir
sourceFiles=".bashrc .bash_profile .vimrc .gitconfig .gitignore .xinitrc
.Xresources .ncmpcpp .config/polybar .config/ranger .config/mpd .config/i3
.config/dunst .config/neofetch .config/htop"

# this function creates symlinks in $HOME dir
# existing symlinks won"t be overridden unless the "--force" option is passed
function create_symlink() {
    src=$1
    dest=$2
    force=$3

    echo -n "[SYMLINK] $dest -> $src ... "
    if [ -e $dest -a $force -eq 0 ]; then
        echo "FAILURE! File already exists: $src"
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
