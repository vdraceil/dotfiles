#!/bin/bash

# get the dir of this script - to avoid having to clone the git repo to $HOME directly
sourceDir=$( cd "$( dirname "$0" )" && pwd )

# define the files for which we need symlinks in the $HOME dir
sourceFiles=".bashrc .vim .vimrc"

# this function creates symlinks in $HOME dir
# if a to-be-symlinked dir already exists, try to symlink its children recursively
function create_symlink_if_missing() {
    src=$1
    dest=$2
    indentLevel=$3

    echo -ne "$( printf %${indentLevel}s | tr " " "\t" )"
    echo -n "Create symlink: $dest -> $src ... "

    if [ -d $src -a -d $dest ]; then
        echo "PARTIAL FAILURE! Directory already exists"
        indentLevel=$[$indentLevel + 1]

        for file in "$src"/*; do
            newSrc=$file
            newDest=$2/$( basename "$file" )
            create_symlink_if_missing $newSrc $newDest $indentLevel
        done
    elif [ -e $dest ]; then
        echo "FAILURE! File already exists: $src"
    else
        ln -s $src $dest
        echo "SUCCESS!"
    fi
}

for file in $sourceFiles; do
    src=$sourceDir/$file
    dest=$HOME/$file

    create_symlink_if_missing $src $dest 0
done
