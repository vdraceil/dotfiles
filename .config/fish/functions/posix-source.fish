function posix-source
  for i in (cat $argv | awk 'NF' | grep -v '^\s*#')
    set arr (echo $i | sed 's/\s*=\s*/\n/g')
    if test -n $arr[1]
      set -gx $arr[1] $arr[2]
    end
  end
end
