vim.keymap.set('i', 'jk', '<esc>', { desc = 'Exit Insert Mode' })
vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', { silent = true, desc = 'Clear Highlight' })

-- disable arrow keys in all modes
for _, mode in ipairs({ 'n', 'i', 'v' }) do
  for _, key in ipairs({ '<left>', '<right>', '<up>', '<down>' }) do
    vim.keymap.set(mode, key, '<nop>')
  end
end

-- tabs
vim.keymap.set('n', 'tr', ':tabprev<CR>', { silent = true, desc = 'Move focus to previous tab' })
vim.keymap.set('n', 'trr', ':tabfirst<CR>', { silent = true, desc = 'Move focus to first tab' })
vim.keymap.set('n', 'ty', ':tabnext<CR>', { silent = true, desc = 'Move focus to next tab' })
vim.keymap.set('n', 'tyy', ':tablast<CR>', { silent = true, desc = 'Move focus to last tab' })
vim.keymap.set('n', 'tt', ':tabnew<CR>', { silent = true, desc = 'Create new tab' })
vim.keymap.set('n', 'tm', ':tabm', { desc = 'Move current tab' })

-- splits
vim.keymap.set('n', '<leader>=', ':split<CR>', { silent = true, desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { silent = true, desc = 'Vertical split' })
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Move focus to the left split' })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Move focus to the right split' })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Move focus to the lower split' })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Move focus to the upper split' })

vim.keymap.set('n', '<leader>T', '<C-w>T', { desc = 'Move current split to a new tab' })
vim.keymap.set('n', '<leader>+', '20<C-w>>', { desc = 'Resize split vertical increase' })
vim.keymap.set('n', '<leader>-', '20<C-w><', { desc = 'Resize split vertical decrease' })

-- buffers
vim.keymap.set('n', 'bv', ':bprev<CR>', { silent = true, desc = 'Move focus to previous buffer' })
vim.keymap.set('n', 'bvv', ':bfirst<CR>', { silent = true, desc = 'Move focus to first buffer' })
vim.keymap.set('n', 'bn', ':bnext<CR>', { silent = true, desc = 'Move focus to next buffer' })
vim.keymap.set('n', 'bnn', ':blast<CR>', { silent = true, desc = 'Move focus to last buffer' })

-- plugin: fzf-lua
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { silent = true, desc = 'Fzf Find Files' })
vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>', { silent = true, desc = 'Fzf Recent Files' })
vim.keymap.set('n', '<leader>rg', ':FzfLua live_grep<CR>', { silent = true, desc = 'Fzf Live Grep' })
vim.keymap.set('n', '<leader>gw', ':FzfLua grep_cword<CR>', { silent = true, desc = 'Fzf Grep Curr Word' })
vim.keymap.set('n', '<leader>m', ':FzfLua marks<CR>', { silent = true, desc = 'Fzf Marks' })
vim.keymap.set('n', '<leader>gb', ':FzfLua git_branches<CR>', { silent = true, desc = 'Fzf Git Branches' })
vim.keymap.set('n', '<leader>gc', ':FzfLua git_commits<CR>', { silent = true, desc = 'Fzf Git Commits' })
vim.keymap.set('n', '<leader>gs', ':FzfLua git_stash<CR>', { silent = true, desc = 'Fzf Git Stash' })

-- plugin: nvim-tree
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>', { silent = true, desc = 'NvimTree Toggle' })
vim.keymap.set('n', '<leader>nr', ':NvimTreeRefresh<CR>', { silent = true, desc = 'NvimTree Refresh' })
vim.keymap.set('n', '<leader>nc', ':NvimTreeCollapse<CR>', { silent = true, desc = 'NvimTree Collapse' })

-- plugin: gitsigns
vim.keymap.set('n', '<leader>gB', ':Gitsigns blame<CR>', { silent = true, desc = 'Git Blame' })

-- plugin: diffview
vim.keymap.set('n', '<leader>do', ':DiffviewOpen<CR>', { silent = true, desc = 'DiffView Open' })
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { silent = true, desc = 'DiffView Close' })
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory %<CR>', { silent = true, desc = 'DiffView File History Current File' })
vim.keymap.set('n', '<leader>dx', ':DiffviewFileHistory<CR>', { silent = true, desc = 'DiffView File History - Current Branch' })
