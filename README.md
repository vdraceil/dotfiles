## DOT FILES

All of these dot files collectively define my working environment (bash, nvim, i3, git, etc.), which I use everyday

## How does my setup look?
![setup screenshot](static/setup_current_look.png)

## Setup

 - Get the dotfiles and execute install.sh to create all symlinks in your $HOME dir
 - However, if you already have any existing files, they will not be replaced (unless you use the `--force` flag)
 - Use `--sudo` flag if you want to make systemd links under `/etc/`

```sh
$ git clone git@github.com:vdraceil/dotfiles.git
$ ./dotfiles/install.sh
```

 - `pip uninstall greenlet` followed by `pip install --user pynvim` - required for deoplete Plugin
 - `pip install flake8 autopep8` - required for ale Plugin
 - `npm install -g eslint vls` - required for ale Plugin
 - make sure flake8, autopep8, eslint, etc. are all directly accessible (executables in $PATH) or else move them over to `/usr/local/bin` manually
 - Next, open nvim. It'll take care of installing all the plugins
 - After the installation completes, dismiss the Vundle Preview Split and check if vim looks visually alright (Check Airline bar, Tab bar, Colorscheme, etc.)

```sh
$ nv
```

 - Check the bash prompt color change based on success/failure of the previous command

## Customization

 - `.bashrc` - additional customization can be done by introducing a new local overrides file ~/.local/.bashrc
