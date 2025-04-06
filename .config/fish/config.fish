# mac specific
set -l os (uname)
if test "$os" = Darwin
  source ~/.config/fish/functions/mac.fish
end

# prompt & z setup
starship init fish | source
zoxide init fish | source

# shell greeting
set -l cowsay_greeting "fortune -s | cowsay -f (random choice (cowsay -l | tail -n+2 | tr ' ' '\n'))"
set -l center_greeting "fortune -s | fmt -c -w (tput cols)"
alias fish_greeting="echo -n (set_color -i brwhite);$center_greeting;echo -n (set_color normal)"

# set $LS_COLORS
source ~/.config/fish/functions/ls-colors.fish
set_lscolors

# others
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/functions/env.fish
source ~/.config/fish/functions/work-grata.fish
