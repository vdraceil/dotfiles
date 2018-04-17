[ -f ~/.bashrc ] && source ~/.bashrc

# start X
[[ -z "$DISPLAY" ]] && [[ -n "$XDG_VTNR" ]] && [[ "$XDG_VTNR" -eq 1 ]] && exec startx
