# ls
#alias ld="ls -d */"
alias l1="ls -1 --group-directories-first"
alias la="ls -a --group-directories-first"
alias l1a="ls -1a --group-directories-first"
alias ll="ls -lh --group-directories-first"
alias lla="ls -lah --group-directories-first"
alias lld="ls -ldh */"

# cd
alias ...="cd ../.."
alias ....="cd ../../.."

# grep
alias grr="grep -r"
alias grri="grep -ri"
alias grl="grep -rl"
alias gril="grep -ril"
alias hgrep="history | grep"

# tree
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

# others
alias g="git"
alias wm="sudo wifi-menu"
alias n="neofetch"
alias nv="nvim"
alias dc="docker-compose"
alias codon="/home/vdraceil/.codon/bin/codon"
