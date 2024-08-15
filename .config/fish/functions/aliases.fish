# cp
alias cp="xcp"

# du
alias du="dust"

# grep
set "RG_EXCLUDE" "!{**/node_modules/*,**/.git/*,**/dist/*,**/build/*,**/env/*,**/__pycache__/*,.pyc}"
set "RG_EXCLUDE_TESTS" "!{**/node_modules/*,**/.git/*,**/dist/*,**/build/*,**/env/*,**/__pycache__/*,.pyc,**/tests/*,**/management/*}"
alias rgi='rg -i -g "$RG_EXCLUDE"'
alias rgc='rg -g "$RG_EXCLUDE_TESTS"'

# ls & tree
alias ls="eza --icons --group-directories-first"
alias ll="ls --no-user -l"
alias l1="eza --no-icons --group-directories-first -1"

set "TREE_EXCLUDE" "node_modules|__pycache__|.pytest_cache|env|build|_build|dist|.git|*.pyc"
alias tree='eza --group-directories-first --no-user --tree -I "$TREE_EXCLUDE"'
alias t="tree -L"

# ps
alias ps="procs --tree"
alias psc="procs --sortd cpu"

# other shorthands
alias dc="docker-compose"
alias g="git"
alias n="neofetch"
alias nv="nvim"
alias wm="sudo wifi-menu"
