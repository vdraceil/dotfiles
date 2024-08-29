local DAY_COLORSCHEME_MAP = {
  Sunday = { name = 'sonokai', variant = 'sonokai' },
  Monday = { name = 'one_monokai', variant = 'one_monokai' },
  Tuesday = { name = 'edge', variant = 'edge' },
  Wednesday = { name = 'gruvbox-material', variant = 'gruvbox-material' },
  Thursday = { name = 'catppuccin', variant = 'catppuccin' },
  Friday = { name = 'tokyonight', variant = 'tokyonight' },
  Saturday = { name = 'monokai-nightasty', variant = 'monokai-nightasty' },
}

local DAY_ALPHA_COLORS_MAP = {
  Sunday = { AlphaHeader = '#F7F7F7', AlphaButton = '#F4005F', AlphaShortcut = '#4DFFFF' },
  Monday = { AlphaHeader = '#F4005F', AlphaButton = '#FFAC00', AlphaShortcut = '#0076DE' },
  Tuesday = { AlphaHeader = '#F4005F', AlphaButton = '#FFAC00', AlphaShortcut = '#0076DE' },
  Wednesday = { AlphaHeader = '#F4005F', AlphaButton = '#FFAC00', AlphaShortcut = '#0076DE' },
  Thursday = { AlphaHeader = '#F4005F', AlphaButton = '#FFAC00', AlphaShortcut = '#0076DE' },
  Friday = { AlphaHeader = '#F4005F', AlphaButton = '#FFAC00', AlphaShortcut = '#0076DE' },
  Saturday = { AlphaHeader = '#F7F7F7', AlphaButton = '#F4005F', AlphaShortcut = '#4DFFFF' },
}

local TODAY = os.date("%A")

return {
  alpha = DAY_ALPHA_COLORS_MAP[TODAY],
  colorscheme = DAY_COLORSCHEME_MAP[TODAY],
}
