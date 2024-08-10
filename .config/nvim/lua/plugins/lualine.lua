local function file_status_icon()
  if vim.bo.modified then
    return '●'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '󰅚'
  end
  return ''
end

local function short_cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

local function tab_position()
  return vim.fn.tabpagenr() .. '/' .. vim.fn.tabpagenr('$')
end

local nvim_tree_ext = {
  sections = { lualine_a = { short_cwd } },
  inactive_sections = {
    lualine_a = {
      {
        short_cwd,
        color = { fg = '#6E706B', gui = 'italic' }
      }
    }
  },
  filetypes = { 'NvimTree' }
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      always_divide_middle = false,
      global_status = false
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        {
          'branch',
          color = { fg = '#AA7CF3', gui = 'bold' }
        },
        'diff',
        'diagnostics'
      },
      lualine_c = {
        {
          'filename',
          path = 1,
          file_status = false,
          separator = '',
          color = { gui = 'italic' }
        },
        {
          file_status_icon,
          padding = 0,
          color = function()
             return { fg = vim.bo.readonly and '#F4005F' or '#FFAC00' }
          end
        }
      },
      lualine_x = {
         {
           'filetype',
           color = { gui = 'italic' }
         }
      },
      lualine_y = {
        {
          'searchcount',
          maxcount = 999,
          timeout = 1000,
          separator = '',
          color = { fg = '#0076DE', gui = 'bold' }
        },
        'progress'
      },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_c = {
        {
          'filetype',
          icon_only = true,
          separator = '',
        },
        {
          'filename',
          path = 1,
          file_status = false,
          padding = 0,
          color = { fg = '#6E706B', gui = 'italic' }
        }
      },
    },
    tabline = {
      lualine_a = {
        {
          'tabs',
          mode = 1,
          path = 0,
          tab_max_length = 40,
          max_length = vim.o.columns / 1.35,
          separator = '',
          show_modified_status = false,
          tabs_color = {
            active = { gui = 'none' },
            inactive = { fg = '#6E706B', bg = '#000000', gui = 'italic' }
          },
          fmt = function(name, context)
            -- show modified status in tab name
            local buflist = vim.fn.tabpagebuflist(context.tabnr)
            local winnr = vim.fn.tabpagewinnr(context.tabnr)
            local bufnr = buflist[winnr]
            local is_modified = vim.fn.getbufvar(bufnr, '&mod') == 1
            return '#' .. context.tabnr .. ' ' .. name .. (is_modified and ' ●' or '')
          end
        }
      },
      lualine_x = {
        {
          short_cwd,
          color = { gui = 'italic' }
        }
      },
      lualine_z = { tab_position }
    },
    extensions = { nvim_tree_ext }
  },
}
