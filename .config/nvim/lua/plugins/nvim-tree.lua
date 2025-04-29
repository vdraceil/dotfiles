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
    })
  end,
}
