# prompt
function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# shows host name in red if the previous command was a failure. If not, green.
function set_fancy_prompt() {
    exit_status=$?

    off="\[\e[m\]"
    red="\[\033[38;5;197m\]"
    cyan="\[\033[38;5;45m\]"
    green="\[\033[38;5;46m\]"
    yellow="\[\033[38;5;214m\]"

    [ $exit_status -eq 0 ] && status_color=$green || status_color=$red
    PS1="${status_color}\h${off}${cyan}$(parse_git_branch)${off}${yellow} \w${off}\n${status_color}➜ ${off}"
    PS2="${cyan}➜ ${off}"
}
PROMPT_COMMAND=set_fancy_prompt

# aliases
alias ls='ls --color'
alias la='ls -a'
alias la1='ls -a1'
alias ll='ls -alh'
alias ld='ls -aF | grep /$'
alias lld='ls -alF | grep /$'
alias lf='ls -aF | grep [^/]$'
alias llf='ls -alF | grep [^/]$'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias v='vim'
alias hg='history | grep '
alias pg='ps aux | grep '
alias bc='bc -l'
alias cl='clear'
alias path='echo -e ${PATH//:/\\n}'
alias g='git'
alias wm='sudo wifi-menu'

# history
export HISTSIZE=1000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

# others
export EDITOR=vim

# source overrides, if any
if [ -f ~/.local/.bashrc ];then
    source ~/.local/.bashrc
fi
