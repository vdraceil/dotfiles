return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    enabled = true,
    indent = {
      char = '|',
      smart_indent_cap = true,
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      injected_languages = true,
      highlight = 'CurrentScope'
    },
    exclude = {
      filetypes = { 'help', 'lazy', 'nvim-tree', 'alpha', 'lspinfo' },
      buftypes = { 'terminal', 'nofile', 'quickfix' }
    },
  },
  config = function(_, opts)
    -- set scope highlight color
    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'CurrentScope', { fg = '#AA7CF3' })
    end)

    require('ibl').setup(opts)
  end
}
