return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup({
      view = {
        width = 35,
      },
      git = {
        enable = true,
      },
      update_focused_file = {
        enable = true,
      },
      filters = {
        custom = { '^.git$', '.github', '.vscode', '^env$', 'node_modules', '__pycache__' },
      },
      renderer = {
        icons = {
          padding = '  ',
          glyphs = {
            git = {
              unstaged = '●',
            },
          },
        },
      },
    })

    vim.api.nvim_set_hl(0, 'NvimTreeGitDirtyIcon', { fg = '#e5c07b' })
  end,
}
