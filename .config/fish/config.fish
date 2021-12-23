# prompt setup
starship init fish | source

# aliases
alias ld="ls -d */"
alias l1="ls -1 --group-directories-first"
alias la="ls -a --group-directories-first"
alias l1a="ls -1a --group-directories-first"
alias ll="ls -lh --group-directories-first"
alias lla="ls -lah --group-directories-first"
alias lld="ls -ldh */"
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
alias t='tree -C -I "$TREE_EXCLUDE"'
alias t1='tree -C -I "$TREE_EXCLUDE" -L 1'
alias t2='tree -C -I "$TREE_EXCLUDE" -L 2'
alias t3='tree -C -I "$TREE_EXCLUDE" -L 3'
alias t4='tree -C -I "$TREE_EXCLUDE" -L 4'
alias td='tree -C -I "$TREE_EXCLUDE" -d'
alias td1='tree -C -I "$TREE_EXCLUDE" -L 1 -d'
alias td2='tree -C -I "$TREE_EXCLUDE" -L 2 -d'
alias td3='tree -C -I "$TREE_EXCLUDE" -L 3 -d'
alias td4='tree -C -I "$TREE_EXCLUDE" -L 4 -d'

# # set LS_COLORS (uncomment when you migrate to lsd)
# source ~/.config/fish/functions/ls-colors.fish
# set_lscolors
