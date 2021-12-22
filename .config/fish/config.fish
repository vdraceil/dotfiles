# prompt setup
starship init fish | source

# key bindings
function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
end

# aliases
alias ls="ls --color"
alias la="ls --color -a"
alias l1="ls --color -1"
alias la1="ls --color -a1"
alias ll="ls --color -alh"
alias ...="cd ../.."
alias ....="cd ../../.."
alias nv="nvim"
alias hgrep="history | grep"
alias grr="grep -r"
alias grri="grep -ri"
alias grl="grep -rl"
alias gril="grep -ril"

alias g="git"
alias wm="sudo wifi-menu"
alias n="neofetch"

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
