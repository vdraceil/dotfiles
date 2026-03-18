# mac specific
if test (uname) = Darwin
  source ~/.config/fish/functions/mac.fish
end

# prompt & z setup (cached for faster startup)
function _cache_or_source -a cmd cache_file
  if not test -f $cache_file; or test (command -s $cmd) -nt $cache_file
    $cmd init fish > $cache_file
  end
  source $cache_file
end
_cache_or_source starship ~/.cache/fish/starship_init.fish
_cache_or_source zoxide ~/.cache/fish/zoxide_init.fish

# environment
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROPTAG man

# shell greeting
set -l center_greeting "fortune -s | fmt -c -w (tput cols)"
alias fish_greeting="echo -n (set_color -i brwhite);$center_greeting;echo -n (set_color normal)"

# notify on long-running commands (>10s)
function __done_notification --on-event fish_postexec
    if test $CMD_DURATION -gt 10000
        set -l secs (math "$CMD_DURATION / 1000")
        osascript -e "display notification \"Took {$secs}s\" with title \"Command Done\" subtitle \"$argv[1]\""
    end
end

# others
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/functions/work-grata.fish
