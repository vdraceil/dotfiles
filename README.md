## DOT FILES

All of these dot files collectively define my working environment (fish, nvim, i3, git, etc.), which I use everyday

## How does my setup look?
![setup screenshot](static/setup_current_look.png)

## Setup

 - Get the dotfiles and execute `mac_install.sh` (or `install.sh` in linux) to create all symlinks in your $HOME dir
 - However, if you already have any existing files, they will not be replaced (unless you use the `--force` flag)
 - Use `--sudo` flag if you want to make systemd links under `/etc/`

```sh
$ git clone git@github.com:vdraceil/dotfiles.git
$ ./dotfiles/mac_install.fish
```

 - make sure flake8, autopep8, eslint, etc. are all directly accessible (executables in $PATH) or else move them over to `/usr/local/bin` manually
 - Next, open nvim. It'll take care of installing all the plugins
 - After the installation completes, dismiss the Vundle Preview Split and check if vim looks visually alright (Check Airline bar, Tab bar, Colorscheme, etc.)

```sh
$ nvim
```

## Customization

 - `.bashrc` - additional customization can be done by introducing a new local overrides file ~/.local/.bashrc
