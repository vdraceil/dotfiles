return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.install').prefer_git = true
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'fish',
        'html',
        'xml',
        'css',
        'scss',
        'lua',
        'luadoc',
        'markdown',
        'yaml',
        'toml',
        'vim',
        'vimdoc',
        'python',
        'javascript',
        'typescript',
        'dockerfile',
        'elixir',
        'vue',
        'regex',
        'sql',
        'csv',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      additional_vim_regex_highlighting = false,
    })
  end,
}
