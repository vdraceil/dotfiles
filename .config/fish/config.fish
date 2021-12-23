# prompt setup
starship init fish | source

# aliases
alias ls="lsd"
alias ld="lsd -d"
alias l1="lsd -1"
alias la="lsd -A"
alias l1a="lsd -1A"
alias ll="lsd -lh"
alias lla="lsd -lAh"
alias lld="lsd -ldh"
alias ...="cd ../.."
alias ....="cd ../../.."
alias hgrep="history | grep"
alias grr="grep -r"
alias grri="grep -ri"
alias grl="grep -rl"
alias gril="grep -ril"

alias g="git"
alias wm="sudo wifi-menu"
alias n="neofetch"
alias nv="nvim"

set "TREE_EXCLUDE" "node_modules|__pycache__|.pytest_cache|env|build|_build|dist|.git|*.pyc"
alias t='lsd --tree -I "$TREE_EXCLUDE"'
alias t1='lsd --tree -I "$TREE_EXCLUDE" --depth 1'
alias t2='lsd --tree -I "$TREE_EXCLUDE" --depth 2'
alias t3='lsd --tree -I "$TREE_EXCLUDE" --depth 3'
alias t4='lsd --tree -I "$TREE_EXCLUDE" --depth 4'

# set LS_COLORS
source ~/.config/fish/functions/ls-colors.fish
set_lscolors
