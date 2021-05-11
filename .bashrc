# global functions
function psgrep() {
  ps aux | grep -i $1 | grep -v grep
}

# prompt
function get_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function get_py_virtualenv() {
    basename "$VIRTUAL_ENV" | sed -e 's/^\(.\)/ \1/'
}

# shows host name in red if the previous command was a failure; else green
function set_fancy_prompt() {
    exit_status=$?

    off="\[\e[m\]"
    red="\[\033[38;5;197m\]"
    cyan="\[\033[38;5;45m\]"
    green="\[\033[38;5;46m\]"
    yellow="\[\033[38;5;214m\]"
    gray="\[\033[0;37m\]"

    [ $exit_status -eq 0 ] && status_color=$green || status_color=$red
    PS1="${status_color}\h${off}${gray}$(get_py_virtualenv)${off}${cyan}$(get_git_branch)${off}${yellow} \w${off}\n${status_color}➜ ${off}"
    PS2="${cyan}➜ ${off}"
}
PROMPT_COMMAND=set_fancy_prompt

# aliases - bash
alias ls='ls --color'
alias la='ls --color -a'
alias l1='ls --color -1'
alias la1='ls --color -a1'
alias ll='ls --color -alh'
alias ld='ls --color -aF | grep /$'
alias lld='ls --color -alF | grep /$'
alias lf='ls --color -aF | grep [^/]$'
alias llf='ls --color -alF | grep [^/]$'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias nv='nvim'
alias hgrep='history | grep'
alias bc='bc -l'
alias path='echo -e ${PATH//:/\\n}'
alias grl='grep -rl'
alias gril='grep -ril'

# aliases - os
alias g='git'
alias wm='sudo wifi-menu'
alias pacs='sudo pacman --color=always -S'
alias pacsyu='sudo pacman --color=always -Syu'
alias n='neofetch'

TREE_EXCLUDE="node_modules|__pycache__|.pytest_cache|env|build|_build|dist|.git|*.pyc"
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

# history
export HISTSIZE=1000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

# others
export EDITOR=nvim
export XDG_USER_CONFIG_DIR="$HOME/.config"

# source overrides, if any
if [ -f ~/.local/.bashrc ];then
    source ~/.local/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/vdraceil/google-cloud-sdk/path.bash.inc' ]; then . '/home/vdraceil/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/vdraceil/google-cloud-sdk/completion.bash.inc' ]; then . '/home/vdraceil/google-cloud-sdk/completion.bash.inc'; fi

# node/nvm
source /usr/share/nvm/init-nvm.sh
