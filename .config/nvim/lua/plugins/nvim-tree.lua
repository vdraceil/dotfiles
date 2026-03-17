return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup({
      git = {
        enable = true,
        ignore = true,
      },
      filters = {
        dotfiles = false,
        custom = { '^.git$', '.github', '.vscode', '^env$', 'node_modules', '__pycache__' },
      },
      renderer = {
        icons = {
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
