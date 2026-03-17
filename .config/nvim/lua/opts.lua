vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '120'

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.breakindent = true
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '»·', trail = '·', nbsp = '␣' }

vim.opt.mouse = ''  -- disable mouse
vim.opt.showmode = false  -- disable; mode will be shown in status line anyway

vim.opt.scrolloff = 10  -- min num of lines to keep above & below cursor
vim.opt.inccommand = 'split'  -- preview live substitutions

vim.opt.clipboard = 'unnamedplus' -- sync clipboard between OS and neovim

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- case-insensitive searching unless \C or one or more capital letters in the search term
