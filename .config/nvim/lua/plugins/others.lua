return {
  -- spacing
  'tpope/vim-sleuth',

  -- icons
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#6E706B', italic = true })
      require('gitsigns').setup()
    end
  },
  'sindrets/diffview.nvim',

  -- highlight text colors
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup()
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
