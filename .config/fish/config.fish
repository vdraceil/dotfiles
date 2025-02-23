# prompt & z setup
starship init fish | source
zoxide init fish | source

# shell greeting
alias fish_greeting="fortune -s | cowsay -f (random choice (cowsay -l | tail -n+2 | tr ' ' '\n'))"

# set $LS_COLORS
source ~/.config/fish/functions/ls-colors.fish
set_lscolors

# others
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/functions/env.fish
source ~/.config/fish/functions/work-grata.fish
