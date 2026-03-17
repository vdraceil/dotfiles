return {
  -- spacing
  { 'tpope/vim-sleuth', event = { 'BufReadPre', 'BufNewFile' } },

  -- icons
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

  -- git
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
      vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#6E706B', italic = true })
    end,
    opts = {
      on_attach = function(bufnr)
        local gs = require('gitsigns')
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map('n', ']h', gs.next_hunk, 'Next hunk')
        map('n', '[h', gs.prev_hunk, 'Prev hunk')
        map('n', '<leader>ga', gs.stage_hunk, 'Git stage (add) hunk')
        map('n', '<leader>gr', gs.reset_hunk, 'Git reset hunk')
        map('n', '<leader>gu', gs.undo_stage_hunk, 'Git undo stage hunk')
        map('n', '<leader>gp', gs.preview_hunk, 'Git preview hunk')
        map('n', '<leader>gd', gs.diffthis, 'Git diff this')
        map('n', '<leader>tb', gs.toggle_current_line_blame, 'Toggle line blame')
      end,
    },
  },
  { 'sindrets/diffview.nvim', cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' } },

  -- highlight text colors
  {
    'brenoprata10/nvim-highlight-colors',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },

  -- pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true,
    },
  },

  -- surround
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },

  -- bracket navigation
  {
    'echasnovski/mini.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('mini.bracketed').setup()
    end,
  }
}
