return {
  -- colorschemes
  { 'cpea2506/one_monokai.nvim', lazy = false, priority = 1000 },
  -- 'navarasu/onedark.nvim',
  -- 'sainnhe/sonokai',
  -- 'rebelot/kanagawa.nvim',
  -- 'sainnhe/gruvbox-material',

  -- spacing
  'tpope/vim-sleuth',

  -- icons
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

  -- git
  { 'lewis6991/gitsigns.nvim', opts = {} },

  -- highlight text colors
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({ 'css', 'scss', 'javascript', 'html', 'vue', 'lua' })
    end
  },

  -- pairs
  {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = true,
  },

  -- surround
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end
  },

  -- comment
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.bracketed').setup()
      require('mini.comment').setup()
    end,
  }
}
