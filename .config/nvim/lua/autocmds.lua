vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Open NvimTree for files',
  group = vim.api.nvim_create_augroup('NvimTreeOpen', { clear = true }),
  callback = function(data)
    local is_real_file = vim.fn.filereadable(data.file) == 1
    local is_no_name = data.file == '' and vim.bo[data.buf].buftype == ''

    if is_real_file or is_no_name then
      require('nvim-tree.api').tree.toggle({ focus = false, find_file = true })
    end
  end
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Close NvimTree if it is the last buffer',
  group = vim.api.nvim_create_augroup('NvimTreeClose', { clear = true }),
  pattern = 'NvimTree_*',
  callback = function()
    local layout = vim.api.nvim_call_function('winlayout', {})
    if layout[1] == 'leaf'
    and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), 'filetype') == 'NvimTree'
    and layout[3] == nil
    then
      vim.cmd('confirm quit')
    end
  end
})

local LEAP_PATCH_COLORSCHEMES = { 'gruvbox-material', 'sonokai' }
vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Colorscheme customizations',
  callback = function ()
    local utils = require('utils.base')

    if utils.contains(LEAP_PATCH_COLORSCHEMES, vim.g.colors_name) then
      require('leap').init_highlight(true)

      -- define custom highlight groups
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
      vim.api.nvim_set_hl(0, 'LeapMatch', { fg = '#0076DE', bold = true, underline = true, nocombine = true })
      vim.api.nvim_set_hl(0, 'LeapLabel', { fg = '#F4005F', bold = true, nocombine = true })
      vim.api.nvim_set_hl(0, 'LeapLabelSelected', { fg = '#FFAC00', bold = true, nocombine = true })
    end
  end
})
