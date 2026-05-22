return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      search = { enabled = false },
    },
  },
  config = function(_, opts)
    require('flash').setup(opts)
    vim.api.nvim_set_hl(0, 'FlashLabel', { bg = '#ff007c', fg = '#ffffff', bold = true })
  end,
  keys = {
    { '\\', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
    { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
  },
}
