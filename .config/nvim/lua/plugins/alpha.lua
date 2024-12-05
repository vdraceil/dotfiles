local QUOTE_MAX_WIDTH = 65

return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')
    local ascii = require('utils.ascii')
    local colors = require('utils.colors')
    local quotes = require('utils.quotes')

    -- define custom highlight groups
    vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = colors.alpha.AlphaHeader })
    vim.api.nvim_set_hl(0, 'AlphaSubHeader', { fg = '#6E706B', italic = true })
    vim.api.nvim_set_hl(0, 'AlphaButton', { fg = colors.alpha.AlphaButton })
    vim.api.nvim_set_hl(0, 'AlphaShortcut', { fg = colors.alpha.AlphaShortcut, bold = true })
    vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = '#6E706B', italic = true })

    -- dynamic header
    local weekday = os.date('%b %d,%a')

    dashboard.section.header = {
      type = 'group',
      val = {
        {
          type = 'text',
          val = ascii.str_ascii_art(weekday),
          opts = { hl = 'AlphaHeader', shrink_margin = false, position = 'center' }
        },
        { type = 'padding', val = 1 },
      }
    }

    -- setup buttons
    dashboard.section.buttons = {
      type = 'group',
      val = {
        dashboard.button('f', '    Find File', ':FzfLua files<CR>'),
        dashboard.button('r', '    Recent File', ':FzfLua oldfiles<CR>'),
        dashboard.button('n', '    New File', ':ene <bar> startinsert<CR>'),
        dashboard.button('g', '    Live Grep', ':FzfLua live_grep<CR>'),
        dashboard.button('t', '    File Explorer', ':NvimTreeOpen<CR>'),
        dashboard.button('u', '    Update Plugins', ':Lazy update<CR>'),
        dashboard.button('c', '    Config', ':e $MYVIMRC | :cd %:p:h <CR>'),
        dashboard.button('q', '    Quit', ':qa<CR>'),
      },
      opts = { spacing = 1 },
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButton'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end

    -- dynamic quote footer
    dashboard.section.footer = {
      type = 'group',
      val = {},
    }
    local quote_lines = quotes.break_text(quotes.get_random_quote(), QUOTE_MAX_WIDTH)
    for _, line in ipairs(quote_lines) do
      table.insert(dashboard.section.footer.val, {
        type = 'text',
        val = line,
        opts = { hl = 'AlphaFooter', shrink_margin = false, position = 'center' },
      })
    end

    -- center vertical align
    local margin_top_percent = 0.2
    local header_padding = vim.fn.max({2, vim.fn.floor(vim.fn.winheight(0) * margin_top_percent)})

    dashboard.config.layout = {
      { type = 'padding', val = header_padding },
      dashboard.section.header,
      { type = 'padding', val = 3 },
      dashboard.section.buttons,
      { type = 'padding', val = 2 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)

    -- disable fold
    vim.cmd('autocmd FileType alpha setlocal nofoldenable')

    -- append stats & version to header
    vim.api.nvim_create_autocmd('User', {
      once = true,
      pattern = 'LazyVimStarted',
      callback = function()
        local v = vim.version()
        local version_info = ' ' .. v.major .. '.' .. v.minor .. '.' .. v.patch

        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local plugins_info = '⚡loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'

        local coloscheme_info = '🎨 ' .. colors.colorscheme.variant

        table.insert(dashboard.section.header.val, {
          type = 'text',
          val = plugins_info .. '\t\t\t' .. version_info .. '\t\t\t' .. coloscheme_info,
          opts = { hl = 'AlphaSubHeader', shrink_margin = false, position = 'center'},
        })
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end
}
