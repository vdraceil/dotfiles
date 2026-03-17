return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local bufnr = args.buf
        local nmap = function(keys, func, desc)
          if desc then
            desc = '[LSP] ' .. desc
          end
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>ti', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
        end, '[T]oggle [I]nlay hint')
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('<leader>cf', function()
          vim.lsp.buf.code_action({ context = { only = { 'source.fixAll' }, diagnostics = {} }, apply = true })
        end, '[C]ode [F]ix all')
        nmap('gd', function() require('fzf-lua').lsp_definitions() end, '[G]oto [D]efinition')
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('gr', function() require('fzf-lua').lsp_references() end, '[G]oto [R]eferences')
        nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>ds', function() require('fzf-lua').lsp_document_symbols() end, '[D]ocument [S]ymbols')
        nmap('<leader>ws', function() require('fzf-lua').lsp_workspace_symbols() end, '[W]orkspace [S]ymbols')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-K>', vim.lsp.buf.signature_help, 'Signature Documentation')
      end,
    })

    local servers = { 'lua_ls', 'ruff' }

    require('mason-lspconfig').setup {
      ensure_installed = servers,
      automatic_installation = true,
    }

    vim.lsp.config('*', {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          telemetry = { enable = false },
          diagnostics = {
            disable = { 'missing-fields' },
          },
        },
      },
    })

    vim.lsp.enable(servers)

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.py',
      callback = function(args)
        local client = vim.lsp.get_clients({ bufnr = args.buf, name = 'ruff' })[1]
        if not client then return end

        local params = vim.lsp.util.make_range_params(0, client.offset_encoding) --[[@as table]]
        params.context = { only = { 'source.organizeImports.ruff' }, diagnostics = {} }
        local result = client:request_sync('textDocument/codeAction', params, 3000)
        if result and result.result then
          for _, action in ipairs(result.result) do
            if action.edit then
              vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
            end
          end
        end

        vim.lsp.buf.format({ name = 'ruff', async = false })
      end,
    })
  end
}
