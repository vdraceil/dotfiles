## Dotfiles

These are the bash and vim runtime files that I use on a daily basis

## Usage

 - First, install [Vundle](https://github.com/gmarik/vundle):

```sh
$ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

 - Next, install [Powerline Fonts](https://github.com/Lokaltog/powerline-fonts) for the Airline plugin to look alright
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

 - Next, install all Plugins through Vundle

```sh
$ vim +PluginInstall +qall
```

 - Open vim and check if it looks visually alright (Check Airline bar, Tab bar, Colorscheme etc.)
```sh
$ vim
```

 - Check the bash prompt color change based on success/failure of the previous command
