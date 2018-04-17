## DOT FILES

All of these dot files collectively define my working environment (bash, vim, i3, git), which I use everyday

## Setup

 - Install [Powerline Fonts](https://github.com/Lokaltog/powerline-fonts) for the Airline plugin to look alright
 - Also make sure to change the terminal settings accordingly (set Encoding as 'UTF-8' and Non-ASCII Font as 'Literation Mono Powerline'). For Mac OS X, installing iTerm2 proved fruitful and the Airline rendering was perfect.

```sh
$ git clone https://github.com/Lokaltog/powerline-fonts
$ ./powerline-fonts/install.sh
```

 - Next, get the dotfiles and execute install.sh to create all symlinks in your $HOME dir
 - However, if you already have any existing files, they will not be replaced

```sh
$ git clone git@github.com:vdraceil/dotfiles.git
$ ./dotfiles/install.sh
```

 - Next, open vim. It'll take care of installing all the plugins.
 - After the installation completes, dismiss the Vundle Preview Split and check if vim looks visually alright (Check Airline bar, Tab bar, Colorscheme etc.)

```sh
$ vim
```

 - Check the bash prompt color change based on success/failure of the previous command
 - Also, check tmux looks

## Customization

 - Additional customization to the dot files can be done by introducing a local overrides file ~/.local/<to-be-overridden-dotfile>
