# grep
set "RG_EXCLUDE" "!{**/node_modules/*,**/.git/*,**/dist/*,**/build/*,**/env/*,**/__pycache__/*,.pyc}"
set "RG_EXCLUDE_TESTS" "!{**/node_modules/*,**/.git/*,**/dist/*,**/build/*,**/env/*,**/__pycache__/*,.pyc,**/tests/*,**/management/*}"
alias rgi='rg -i -g "$RG_EXCLUDE"'
alias rgc='rg -g "$RG_EXCLUDE_TESTS"'

# ls & tree
alias ls="eza --icons --group-directories-first"
alias ll="eza -l -a"
alias lD="eza -l -D"
alias lf="eza -l -f"
alias l1="eza --no-icons --group-directories-first -1"

set "TREE_EXCLUDE" "node_modules|__pycache__|.pytest_cache|env|build|_build|dist|.git|*.pyc"
alias tree='eza --group-directories-first --no-user --tree -I "$TREE_EXCLUDE"'
alias t="tree -L"

# shorthands (abbr expands inline -> cleaner, searchable history)
abbr -a b bat
abbr -a dc docker-compose
abbr -a g git
abbr -a neo neofetch
abbr -a nv nvim

# navigation
abbr -a .. "cd .."
abbr -a ... "cd ../.."
abbr -a .... "cd ../../.."
abbr -a mkd "mkdir -p"

# safety
alias rm="trash"

