# dotfiles

Personal working environment configs for macOS and Linux (fish, neovim, wezterm, git, i3, etc.)

## Install

Clone the repo and run the install script. It creates symlinks from your `$HOME` to the repo files.

```sh
git clone git@github.com:vdraceil/dotfiles.git
cd dotfiles
./install.fish
```

Existing files will **not** be overwritten unless you pass `--force`:

```sh
./install.fish --force
```

On Linux, use `--sudo` to set up systemd services:

```sh
./install.fish --sudo
```

After installing, open `nvim` -- lazy.nvim will auto-install all plugins on first launch.

## Dependencies

### macOS (Homebrew)

```sh
# core
brew install fish neovim starship zoxide eza bat ripgrep fzf fd git-delta fortune trash neofetch

# wezterm
brew install --cask wezterm

# fisher + fzf.fish (run inside fish shell)
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
```

### Linux (pacman)

```sh
# core
sudo pacman -S fish neovim starship zoxide eza bat ripgrep fzf fd git-delta fortune-mod neofetch

# wezterm
sudo pacman -S wezterm

# desktop (i3 + utilities)
sudo pacman -S i3-wm polybar rofi dunst feh xorg-xbacklight xorg-xrdb xorg-xset \
  alsa-utils imagemagick ffmpeg udiskie ranger mpv socat jq acpi libnotify bc rxvt-unicode

# AUR (requires yay or paru)
yay -S betterlockscreen

# fisher + fzf.fish (run inside fish shell)
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
```

## What gets set up

### Common (macOS + Linux)

Symlinked to `$HOME`:

| Config | Description |
|---|---|
| `.config/nvim` | Neovim -- lazy.nvim, LSP (lua_ls, ruff, pyright), treesitter, fzf-lua, nvim-tree, nvim-cmp, flash, nvim-ufo |
| `.config/fish` | Fish shell -- vi key bindings, aliases (eza, bat, rg, dust), work functions, cached starship/zoxide init |
| `.config/wezterm` | WezTerm -- day-based themes (Monokai weekdays, Everforest Light weekends), pane/tab keybindings, WebGPU renderer |
| `.config/starship.toml` | Starship prompt -- custom format with git, python, node, elixir, docker modules |
| `.config/neofetch` | Neofetch config |
| `.config/scripts` | Utility scripts |
| `.gitconfig` | Git config |
| `.gitignore` | Global gitignore |
| `.dircolors` | LS_COLORS definitions |

### macOS

No additional symlinks beyond the common set. macOS-specific setup (Homebrew paths, OpenSSL flags, Postgres paths) is handled inside the fish config.

### Linux

Additional symlinks on top of common:

| Config | Description |
|---|---|
| `.bashrc` / `.bash_profile` | Bash config (fallback shell) |
| `.xinitrc` / `.Xresources` | X11 display server config |
| `.config/i3` | i3 window manager |
| `.config/polybar` | Polybar status bar |
| `.config/rofi` | Rofi application launcher |
| `.config/dunst` | Dunst notification daemon |
| `.config/systemd` | Systemd user services |

With `--sudo`, the following systemd services are enabled:

- **betterlockscreen** -- screen locker service
- **check_battery** -- battery monitoring timer
