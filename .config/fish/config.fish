# prompt setup
starship init fish | source

# aliases
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
