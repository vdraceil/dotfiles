set -g IGNORE_PATTERN '\s*MassTamilan(\.[a-z]{2,3})?'
set -g STRIP_PATTERN '\s*\-\s*(MassTamilan(\.[a-z]{2,3})?|Mp3Bhai).*'
set -g MULTI_SPACE_PATTERN '\s{2,}'
set -g FIX_ATTRIBUTES title artist album 'album artist' composer 'original artist'
set -g CMD_STATIC_ARGS '--genre= --disc-num=0 --disc-total=0 --publisher= --remove-all-lyrics --remove-all-comments --remove-all-unknown --remove-frame TIPL'

function fix-mp3-metadata
  argparse "f/file=" "d/dir=" -- $argv

  if not command -q eyeD3
    # validate eyeD3 installation
    set -f err "eyeD3 Missing - Install It"
  else if set -q _flag_file
    # validate file arg
    if not test -f $_flag_file
      set -f err "Invalid File - $_flag_file"
    else if test (path extension $_flag_file) != ".mp3"
      set -f err "Bad mp3 File - $_flag_file"
    else
      set -f files $_flag_file
    end
  else if set -q _flag_dir
    # validate dir arg
    if test -d $_flag_dir
      set -f files (fd .mp3 $_flag_dir)
    else
      set -f err "Bad Directory - $_flag_dir"
    end
  else
    set -f err 'one of -f/--file or -d/--dir args is required'
  end

  if set -q err
    echo "ERROR: $err"
    return 1
  end

  echo "Total mp3 Files: $(count $files)"
  for mp3_file in $files
    set -f cmd_dynamic_args ''

    # gather fixes
    for attr in $FIX_ATTRIBUTES
      set -l value (eyeD3 $mp3_file | grep "^$attr:" | string replace "$attr: " '')
      set -f new_value (string replace -r $STRIP_PATTERN '' $value | string replace -r $IGNORE_PATTERN '' | string replace -r $MULTI_SPACE_PATTERN ' ')

      if test "$value" != "$new_value"
        if test "$new_value" != ''
          # quote string
          set -f new_value "'$new_value'"
        end

        set -f attr_name (string replace ' ' '-' $attr)
        if test "$attr_name" = 'original-artist'
          # handle special case
          set -f attr_name 'orig-artist'
        end

        set -f cmd_dynamic_args "$cmd_dynamic_args --$attr_name=$new_value"
      end
    end

    if test "$cmd_dynamic_args" = ''
      # no fixes - skip file
      continue
    end

    # apply fixes
    set -l cmd "eyeD3 $CMD_STATIC_ARGS $cmd_dynamic_args '$mp3_file'"
    eval $cmd
    echo "METADATA FIXED: $mp3_file"
  end
end
