local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- window
config.window_padding = {
  left = 3,
  right = 3,
  top = 0,
  bottom = 0,
}

config.visual_bell = {
  fade_in_duration_ms = 75,
  fade_out_duration_ms = 75,
  target = 'CursorColor',
}

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
local weekday = os.date('%a')
local color_scheme, font, font_italics

if weekday == 'Sat' or weekday == 'Sun' then
  color_scheme = 'Catppuccin Latte'  -- light theme on weekends
  font = 'Hack Nerd Font Mono'
  font_italics = 'Cascadia Code'
else
  color_scheme = 'Monokai (terminal.sexy)'  -- dark theme on weekdays
  font = 'FiraCode Nerd Font'
  font_italics = 'FantasqueSansM Nerd Font'
end

config.allow_square_glyphs_to_overflow_width = 'Always'
config.color_scheme = color_scheme
config.colors = {
  cursor_border = '#fba922',
  cursor_bg = '#fba922',
}
config.default_cursor_style = 'SteadyUnderline'
config.underline_thickness = 3

config.font = wezterm.font(font)
config.font_rules = {
  {
    italic = true,
    font = wezterm.font { family = font_italics, italic = true }
  }
}
config.font_size = 14

-- keys
config.keys = require('keys')

-- launcher
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

-- others
config.front_end = 'WebGpu'
config.quit_when_all_windows_are_closed = true
config.scrollback_lines = 10000
config.show_update_window = false
config.warn_about_missing_glyphs = true

config.quick_select_patterns = {
  '#[0-9a-z]',  -- hashtags
  '(?<=\\b)~?/\\S+',  -- file paths
  '(?:http|ftp)s?://\\S+',  -- urls
  '(?<=\')[^\']+(?=\')',  -- single quoted strings
  '(?<=")[^"]+(?=")',  -- double quoted strings
}

return config
