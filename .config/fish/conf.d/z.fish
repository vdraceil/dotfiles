if test -f /usr/local/share/z.lua
  lua /usr/local/share/z.lua --init fish | source
  set -gx _ZL_CD cd
else
  echo "[z ERROR] /usr/local/share/z.lua missing"
  echo '[z ERROR] Try `sudo curl "https://raw.githubusercontent.com/skywind3000/z.lua/master/z.lua" -o /usr/local/share/z.lua`'
  echo "[z ERROR] After downloading restart the terminal session"
end
