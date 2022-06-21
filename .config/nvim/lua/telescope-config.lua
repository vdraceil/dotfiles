local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-c>'] = function()
          vim.cmd([[stopinsert]]) --start normal mode if we need it
        end
      }
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    -- find_command = { 'rg', '--files', '--hidden'},
    path_display = {'smart'},
    layout_config = {
      horizontal = {
        mirror = false,
        prompt_position = 'bottom',
        width = 0.85,
        height = 0.9,
        preview_width = 100
      }
    },
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {
      'luadisabled',
      'vimdisabled',
      'forks',
      '.backup',
      '.swap',
      '.langservers',
      '.session',
      '.undo',
      '.git/',
      '.github/',
      'node_modules',
      'vendor',
      '.cache',
      '.vscode-server',
      '.Desktop',
      '.Documents',
      'classes',
      'quantumimage',
    },
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' }
  }
})


local M = {}

M.project_files = function()
  local opts = {}
  local ok = pcall(builtin.git_files, opts)
  if not ok then builtin.find_files(opts) end
end

return M
