return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    -- 'hrsh7th/cmp-nvim-lsp',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    local on_attach = function(client, bufnr)
      local toggleInlay = function()
        if client.server_capabilities.inlayHintProvider then
          local current_value = vim.lsp.inlay_hint.get({ bufnr = 0 })[1]
          vim.lsp.inlay_hint.enable(bufnr, not current_value)
        end
      end

      -- keymaps
      local nmap = function(keys, func, desc)
        if desc then
          desc = '[LSP] ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>ti', toggleInlay, '[T]oggle [I]nlay hint')
      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      -- nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-K>', vim.lsp.buf.signature_help, 'Signature Documentation')
    end

    -- UI customizations
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- enable the following language servers in mason
    local servers = {
      pylsp = {
        pylsp = {
          configurationSources = {'flake8'},
          plugins = {
            autopep8 = { enabled = false },
            flake8 = { enabled = false },
            pydocstyle = { enabled = false },
            pylint = { enabled = false },

            mccabe = { enabled = true },
            pycodestyle = { enabled = true, maxLineLength = 119 },
            pyflakes = { enabled = true },
            yapf = { enabled = true },
          },
        },
      },
      lua_ls = {
        Lua = {
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file('', true)
          },
          telemetry = { enable = false },
          diagnostics = {
            globals = { 'vim' },
            disable = { 'missing-fields' },
          }
        },
      },
    }

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end
}
