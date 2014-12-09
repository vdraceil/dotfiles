# prompt
# shows host name in red if the previous command was a failure. If not, green.
function set_fancy_prompt() {
    exit_status=$?

    off="\[\e[m\]"
    red="\[\e[0;31m\]"
    cyan="\[\e[0;36m\]"
    green="\[\e[0;32m\]"
    yellow="\[\e[0;93m\]"

    [ $exit_status -eq 0 ] && status_color=$green || status_color=$red
    PS1="${status_color}[\h]${off}${yellow}\w${off}\n${status_color}>>>${off}"
    PS2="${cyan}>${off}"
}
PROMPT_COMMAND=set_fancy_prompt

# aliases
alias la='ls -a'
alias ll='ls -alh'
alias lld='ls -F | grep /$'
alias lld='ls -alF | grep /$'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vi='vim'
alias hg='history | grep '
alias pg='ps aux | grep '
alias path='echo -e ${PATH//:/\\n}'

# history
export HISTSIZE=1000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

# others
export EDITOR=vim
