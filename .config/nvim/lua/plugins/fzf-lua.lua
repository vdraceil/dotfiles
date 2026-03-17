return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    winopts = {
      border = vim.g.border,
      preview = {
        border = vim.g.border,
        scrollbar = false,
      },
    },
    fzf_opts = {
      ['--layout'] = 'reverse',
      ['--cycle'] = true,
    },
    files = {
      fd_opts = '--type f --hidden --follow --exclude .git --exclude node_modules --exclude __pycache__ --exclude env --exclude dist --exclude build',
    },
    grep = {
      rg_opts = '--hidden --column --line-number --no-heading --color=always --smart-case --glob=!.git --glob=!node_modules --glob=!__pycache__ --glob=!env --glob=!dist --glob=!build',
    },
  },
}
