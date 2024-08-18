return {
  'ggandor/leap.nvim',
  config = function()
    -- bidirectional search
    vim.keymap.set('n', '/', function()
      local current_window = vim.fn.win_getid()
      require('leap').leap({ target_windows = { current_window } })
    end)

    -- define custom highlight groups
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'LeapMatch', { fg = '#0076DE', bold = true, underline = true, nocombine = true })
    vim.api.nvim_set_hl(0, 'LeapLabel', { fg = '#F4005F', bold = true, nocombine = true })
    vim.api.nvim_set_hl(0, 'LeapLabelSelected', { fg = '#FFAC00', bold = true, nocombine = true })
  end,
}
