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

# shell greeting
set -l center_greeting "fortune -s | fmt -c -w (tput cols)"
alias fish_greeting="echo -n (set_color -i brwhite);$center_greeting;echo -n (set_color normal)"

# others
source ~/.config/fish/functions/aliases.fish
source ~/.config/fish/functions/work-grata.fish
