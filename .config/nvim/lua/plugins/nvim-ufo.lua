local custom_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' 󰁂 %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, {chunkText, hlGroup})
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, {suffix, 'Comment'})
  return newVirtText
end

return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
    'neovim/nvim-lspconfig',
  },
  event = 'BufRead',
  keys = {
    { 'zR', function() require('ufo').openAllFolds() end, { desc = 'Open All Folds (Reveal)' } },
    { 'zM', function() require('ufo').closeAllFolds() end, { desc = 'Close All Folds (Minimize)' } },
    { 'zK',
      function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      { desc = 'Peek Fold Under Cursor' }
    }
  },
  config = function()
    require('ufo').setup({
      -- display num of lines folded hint
      fold_virt_text_handler = custom_virt_text_handler,

      close_fold_kinds_for_ft = {
        default = {'imports', 'comment'},
      },

      provider_selector = function(bufnr, filetype, buftype)
        return {'lsp', 'indent'}
      end
    })
  end
}
