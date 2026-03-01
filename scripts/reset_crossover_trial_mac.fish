#!/usr/bin/env fish
# Have this script run every hour to catch a window where no games are being played and delete the trial date
# Cron Job: 0 * * * * /usr/local/bin/fish /Users/vino/Code/dotfiles/scripts/reset_crossover_trial_mac.fish

# Exit if CrossOver is open to avoid crashing games or file corruption
if pgrep -f "CrossOver" >/dev/null
    exit 0
end

# Reset System Plist & Cache
defaults delete com.codeweavers.CrossOver FirstRunDate 2>/dev/null
plutil -remove FirstRunDate ~/Library/Preferences/com.codeweavers.CrossOver.plist 2>/dev/null
killall cfprefsd 2>/dev/null

# Reset Bottle Reg Files
set -l BOTTLES_PATH "$HOME/Library/Application Support/CrossOver/Bottles"
for reg_file in "$BOTTLES_PATH"/**system.reg
    if test -f "$reg_file"
        sed -i '' '/\[Software\\\\CodeWeavers\\\\CrossOver\\\\cxoffice\].*/,+5d' "$reg_file"
    end
end
