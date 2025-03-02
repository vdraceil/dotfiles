local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 50
config.tab_bar_at_bottom = false
config.switch_to_last_active_tab_when_closing_tab = true
config.use_fancy_tab_bar = false

wezterm.on('update-status', function(window)
  local color_scheme = window:effective_config().resolved_palette

  window:set_right_status(wezterm.format {
    { Foreground = { Color = color_scheme.brights[1] } },
    { Attribute = { Italic = true } },
    { Text = ' ws: ' .. window:active_workspace() .. ' ' },
    { Background = { Color = '#000000' } },
    { Foreground = { Color = color_scheme.ansi[2] } },
    { Text = ' ' .. wezterm.strftime('%a, %-d %b %H:%M') .. ' ' },
    { Attribute = { Italic = false } },
  })
end)

-- visual
config.allow_square_glyphs_to_overflow_width = 'Always'
config.color_scheme = 'Monokai (terminal.sexy)'
config.default_cursor_style = 'SteadyUnderline'

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_rules = {
  {
    italic = true,
    font = wezterm.font { family = 'FantasqueSansM Nerd Font', italic = true }
  }
}
config.font_size = 14

-- keys
config.keys = require('keys')

-- launcher
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

-- others
config.front_end = 'WebGpu'
config.scrollback_lines = 10000
config.show_update_window = false
config.quit_when_all_windows_are_closed = true

config.quick_select_patterns = {
  '#[0-9a-z]',  -- hashtags
  '(?<=\\b)~?/\\S+',  -- file paths
  '(?:http|ftp)s?://\\S+',  -- urls
  '(?<=\')[^\']+(?=\')',  -- single quoted strings
  '(?<=")[^"]+(?=")',  -- double quoted strings
}

return config
