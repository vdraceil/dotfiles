local DAY_COLORSCHEME_MAP = {
  Sunday = { name = 'sonokai', variant = 'sonokai' },
  Monday = { name = 'one_monokai', variant = 'one_monokai' },
  Tuesday = { name = 'kanagawa', variant = 'kanagawa-dragon' },
  Wednesday = { name = 'gruvbox-material', variant = 'gruvbox-material' },
  Thursday = { name = 'catppuccin', variant = 'catppuccin' },
  Friday = { name = 'tokyonight', variant = 'tokyonight' },
  Saturday = { name = 'monokai-nightasty', variant = 'monokai-nightasty' },
}

local function today_colorscheme()
  local today = os.date("%A")
  return DAY_COLORSCHEME_MAP[today]
end

return {
  today_colorscheme = today_colorscheme,
}
