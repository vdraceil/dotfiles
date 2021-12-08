function posix-source
  for i in (cat $argv | grep -v "^\s*#")
    set arr (echo $i |tr = \n)
    if test -n $arr[1]
      set -gx $arr[1] $arr[2]
    end
  end
end
