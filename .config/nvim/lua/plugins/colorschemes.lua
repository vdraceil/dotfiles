local colors = require('utils.colors')

local all_colorschemes = {
  { 'cpea2506/one_monokai.nvim', name = 'one_monokai', lazy = true },
  { 'catppuccin/nvim', name = 'catppuccin', lazy = true },
  { 'folke/tokyonight.nvim', name = 'tokyonight', lazy = true },
  { 'sainnhe/sonokai', name = 'sonokai', lazy = true },
  { 'rebelot/kanagawa.nvim', name = 'kanagawa', lazy = true },
  { 'sainnhe/gruvbox-material', name = 'gruvbox-material', lazy = true },
  { 'polirritmico/monokai-nightasty.nvim', name = 'monokai-nightasty', lazy = true },
}

for _, item in ipairs(all_colorschemes) do
  local today_colorscheme = colors.today_colorscheme()

  if item.name == today_colorscheme.name then
    item.lazy = false
    item.priority = 1000
    item.config = function()
      vim.cmd.colorscheme(today_colorscheme.variant)
    end
    break
  end
end

return all_colorschemes
