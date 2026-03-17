local DAY_COLORSCHEME_MAP = {
  Sunday = { name = 'sonokai', variant = 'sonokai' },
  Monday = { name = 'one_monokai', variant = 'one_monokai' },
  Tuesday = { name = 'edge', variant = 'edge' },
  Wednesday = { name = 'gruvbox-material', variant = 'gruvbox-material' },
  Thursday = { name = 'catppuccin', variant = 'catppuccin' },
  Friday = { name = 'tokyonight', variant = 'tokyonight' },
  Saturday = { name = 'monokai-nightasty', variant = 'monokai-nightasty' },
}

local WEEKDAY_ALPHA = { AlphaHeader = '#F4005F', AlphaButton = '#FFAC00', AlphaShortcut = '#0076DE' }
local WEEKEND_ALPHA = { AlphaHeader = '#F7F7F7', AlphaButton = '#F4005F', AlphaShortcut = '#4DFFFF' }

local DAY_ALPHA_COLORS_MAP = {
  Sunday = WEEKEND_ALPHA,
  Monday = WEEKDAY_ALPHA,
  Tuesday = WEEKDAY_ALPHA,
  Wednesday = WEEKDAY_ALPHA,
  Thursday = WEEKDAY_ALPHA,
  Friday = WEEKDAY_ALPHA,
  Saturday = WEEKEND_ALPHA,
}

local TODAY = os.date("%A")

return {
  alpha = DAY_ALPHA_COLORS_MAP[TODAY],
  colorscheme = DAY_COLORSCHEME_MAP[TODAY],
}
