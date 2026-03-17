function posix-source
  for line in (string match -rv '^\s*#|^\s*$' < $argv)
    set -l key (string split -m1 '=' -- $line)
    if test (count $key) -eq 2
      set -gx (string trim $key[1]) (string trim $key[2])
    end
  end
end
