vim.keymap.set('i', 'jk', '<esc>', { desc = 'Exit Insert Mode' })
vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', { desc = 'Clear Highlight' })

-- disable arrow keys in all modes
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')

vim.keymap.set('i', '<left>', '<nop>')
vim.keymap.set('i', '<right>', '<nop>')
vim.keymap.set('i', '<up>', '<nop>')
vim.keymap.set('i', '<down>', '<nop>')

vim.keymap.set('v', '<left>', '<nop>')
vim.keymap.set('v', '<right>', '<nop>')
vim.keymap.set('v', '<up>', '<nop>')
vim.keymap.set('v', '<down>', '<nop>')

-- navigation
-- popup
vim.keymap.set('i', '<Tab>',   [[pumvisible() ? '<C-n>' : '<Tab>']],   { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? '<C-p>' : '<S-Tab>']], { expr = true })

-- tabs
vim.keymap.set('n', 'tr', ':tabprev<CR>', { desc = 'Move focus to previous tab' })
vim.keymap.set('n', 'trr', ':tabfirst<CR>', { desc = 'Move focus to first tab' })
vim.keymap.set('n', 'ty', ':tabnext<CR>', { desc = 'Move focus to next tab' })
vim.keymap.set('n', 'tyy', ':tablast<CR>', { desc = 'Move focus to last tab' })
vim.keymap.set('n', 'tt', ':tabnew<CR>', { desc = 'Create new tab' })
vim.keymap.set('n', 'tm', ':tabm', { desc = 'Move current tab' })

-- splits
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Move focus to the left split' })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Move focus to the right split' })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = 'Move focus to the lower split' })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = 'Move focus to the upper split' })

vim.keymap.set('n', '<leader>T', '<C-w>T', { desc = 'Move current split to a new tab' })

vim.keymap.set('n', '<C->>', '<C-w>r', { desc = 'Rotate split clockwise' })
vim.keymap.set('n', '<C-<>', '<C-w>R', { desc = 'Rotate split anti-clockwise' })

vim.keymap.set('n', '<leader>+', '20<C-w>>', { desc = 'Resize split vertical increase' })
vim.keymap.set('n', '<leader>-', '20<C-w><', { desc = 'Resize split vertical decrease' })

-- buffers
vim.keymap.set('n', 'bv', ':bprev<CR>', { desc = 'Move focus to previous buffer' })
vim.keymap.set('n', 'bvv', ':bfirst<CR>', { desc = 'Move focus to first buffer' })
vim.keymap.set('n', 'bn', ':bnext<CR>', { desc = 'Move focus to next buffer' })
vim.keymap.set('n', 'bnn', ':blast<CR>', { desc = 'Move focus to last buffer' })

-- plugin: fzf-lua
vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { desc = 'Fzf Find Files' })
vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>', { desc = 'Fzf Recent Files' })
vim.keymap.set('n', '<leader>rg', ':FzfLua live_grep<CR>', { desc = 'Fzf Live Grep' })
vim.keymap.set('n', '<leader>gw', ':FzfLua grep_cword<CR>', { desc = 'Fzf Grep Curr Word' })
vim.keymap.set('n', '<leader>m', ':FzfLua marks<CR>', { desc = 'Fzf Marks' })
vim.keymap.set('n', '<leader>gb', ':FzfLua git_branches<CR>', { desc = 'Fzf Git Branches' })
vim.keymap.set('n', '<leader>gc', ':FzfLua git_commits<CR>', { desc = 'Fzf Git Commits' })
vim.keymap.set('n', '<leader>gs', ':FzfLua git_stash<CR>', { desc = 'Fzf Git Stash' })

-- plugin: nvim-tree
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>', { desc = 'NvimTree Toggle' })
vim.keymap.set('n', '<leader>nr', ':NvimTreeRefresh<CR>', { desc = 'NvimTree Refresh' })
vim.keymap.set('n', '<leader>nc', ':NvimTreeCollapse<CR>', { desc = 'NvimTree Collapse' })

-- plugin: gitsigns
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame<CR>', { desc = 'Git Blame' })

-- plugin: diffview
vim.keymap.set('n', '<leader>do', ':DiffviewOpen<CR>', { desc = 'DiffView Open' })
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { desc = 'DiffView Close' })
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory %<CR>', { desc = 'DiffView File History Current File' })
vim.keymap.set('n', '<leader>dx', ':DiffviewFileHistory<CR>', { desc = 'DiffView File History - Current Branch' })
