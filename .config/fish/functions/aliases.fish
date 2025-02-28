# grep
set "RG_EXCLUDE" "!{**/node_modules/*,**/.git/*,**/dist/*,**/build/*,**/env/*,**/__pycache__/*,.pyc}"
set "RG_EXCLUDE_TESTS" "!{**/node_modules/*,**/.git/*,**/dist/*,**/build/*,**/env/*,**/__pycache__/*,.pyc,**/tests/*,**/management/*}"
alias rgi='rg -i -g "$RG_EXCLUDE"'
alias rgc='rg -g "$RG_EXCLUDE_TESTS"'

# ls & tree
alias ls="eza --icons --group-directories-first"
alias ll="eza --no-user -l"
alias ll="eza -l -a"
alias lD="eza -l -D"
alias lf="eza -l -f"
alias l1="eza --no-icons --group-directories-first -1"

set "TREE_EXCLUDE" "node_modules|__pycache__|.pytest_cache|env|build|_build|dist|.git|*.pyc"
alias tree='eza --group-directories-first --no-user --tree -I "$TREE_EXCLUDE"'
alias t="tree -L"

# other shorthands
alias b="bat"
alias du="dust"
alias dc="docker-compose"
alias g="git"
alias n="neofetch"
alias nv="nvim"

# linux specific
if test (uname) != 'Darwin'
    alias ps="procs --tree"
    alias psc="procs --sortd cpu"
    alias wm="sudo wifi-menu"
end
