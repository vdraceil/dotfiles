#! /usr/bin/env fish

function create-symlink
  set -l src $argv[1]
  set -l dest $argv[2]
  set -l force $argv[3]

  echo -n "[SYMLINK] $dest -> $src ... "
  if not test -e $src
    echo 'FAILED! Source missing'
    return 1
  else if test -e $dest
    if test -n "$force"
      # delete dest file/dir in force mode
      rm -rf $dest
    else
      echo 'FAILED! Destination exists'
      return 1
    end
  end

  ln -sf $src $dest
  echo 'SUCCESS'
end

# parse args
argparse 'f/force' -- $argv

# make config dir
mkdir -p $HOME/.config

# collect relevant config files/dirs
set source_files '.gitconfig' '.gitignore' '.dircolors'
set source_files $source_files '.config/neofetch' '.config/scripts' '.config/nvim' '.config/fish' '.config/starship.toml'

# create symlinks in $HOME
for file in $source_files
  create-symlink "$PWD/$file" "$HOME/$file" $_flag_force
end

