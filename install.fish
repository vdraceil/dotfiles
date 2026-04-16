#!/usr/bin/env fish

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
      rm -rf $dest
    else
      echo 'FAILED! Destination exists'
      return 1
    end
  end

  ln -sf $src $dest
  echo 'SUCCESS'
end

function install-common
  set -l force $argv[1]
  set -l source_files '.gitconfig' '.gitignore' '.dircolors' '.config/wezterm' '.config/fish' \
    '.config/nvim' '.config/starship.toml' '.config/neofetch' '.config/scripts'

  mkdir -p $HOME/.config
  for file in $source_files
    create-symlink "$PWD/$file" "$HOME/$file" $force
  end
end

function install-mac
  echo '== macOS detected =='
  install-common $argv

  echo '== Installing Homebrew packages =='
  brew bundle --file="$PWD/Brewfile"

  echo '== Setting up Homebrew autoupdate =='
  # 604800 seconds = 1 week
  brew autoupdate start --upgrade --cleanup 604800
end

function install-linux
  echo '== Linux detected =='
  set -l linux_files '.bashrc' '.bash_profile' '.xinitrc' '.Xresources' '.config/polybar' \
    '.config/ranger' '.config/i3' '.config/dunst' '.config/rofi' '.config/systemd'

  install-common $argv
  for file in $linux_files
    create-symlink "$PWD/$file" "$HOME/$file" $_flag_force
  end

  if set -q _flag_sudo
    echo '== Setting up systemd services =='
    sudo ln -sf "$HOME/.config/systemd/user/betterlockscreen@.service" /usr/lib/systemd/system/betterlockscreen@.service
    sudo systemctl enable "betterlockscreen@$USER"

    sudo ln -sf "$HOME/.config/systemd/user/check_battery.service" /usr/lib/systemd/system/check_battery.service
    sudo ln -sf "$HOME/.config/systemd/user/check_battery.timer" /usr/lib/systemd/system/check_battery.timer
    sudo systemctl enable check_battery.timer
  end
end

# parse args
argparse 'f/force' 's/sudo' -- $argv

switch (uname -s)
  case Darwin
    install-mac $_flag_force
  case Linux
    install-linux $_flag_force
  case '*'
    echo "what OS is this?? I'm not angry, just disappointed."
    exit 1
end
