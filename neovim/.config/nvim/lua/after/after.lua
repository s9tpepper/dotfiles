vim.cmd [[
  " TODO: Figure out how to remove this link NONE
  highlight link @punctuation.bracket.php NONE

  highlight PhpTagCustom guifg=#ff77ff ctermfg=red
  syntax match PhpTagCustom "<?php" containedin=phpRegion
  syntax keyword PhpTagCustom "<?php"
  autocmd FileType php syntax match PhpTagCustom "<?php"

  " Apply custom settings after the color scheme is loaded
  " augroup CustomHighlight
  "   autocmd!
  "   autocmd ColorScheme * highlight PhpTagCustom guifg=#ff77ff ctermfg=red
  "   autocmd ColorScheme * syntax match PhpTagCustom "<?php" contained
  "   " autocmd ColorScheme * highlight link @punctuation.bracket.php NONE
  " augroup END
]]

vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down' })

-- vim.o.numberwidth = 7 -- Set number column width to 7 characters
-- vim.o.statuscolumn = '%s %l %r'

vim.o.number = true
vim.o.relativenumber = true

vim.api.nvim_set_hl(0, 'StatusColumnLineNr', { fg = '#585b70', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusColumnLineNrCursor', { fg = '#f9e2af', bg = 'Black', reverse = true })

vim.o.statuscolumn = table.concat {
  '%@SignCb@', -- Clickable sign column
  '%s', -- Sign column
  '%=', -- Right align

  -- Absolute line number (current line)
  '%#StatusColumnLineNrCursor#',
  "%{v:virtnum == 0 ? (v:lnum == line('.') ? v:lnum : '') : ''}",

  -- Absolute line number (non-current line)
  '%#StatusColumnLineNr#',
  "%{v:virtnum == 0 ? (v:lnum == line('.') ? '' : v:lnum) : ''}",

  -- Padding space (current line)
  '%#StatusColumnLineNrCursor#',
  "%{v:virtnum == 0 ? (v:relnum == 0 ? ' ' : '') : ''}",

  -- Padding space (non-current line)
  '%#StatusColumnLineNr#',
  "%{v:virtnum == 0 ? (v:relnum == 0 ? '' : ' ') : ''}",

  -- Relative line number (current line)
  '%#StatusColumnLineNrCursor#',
  "%-2{v:virtnum == 0 ? (v:relnum == 0 ? v:relnum : '') : ''}",

  -- Relative line number (non-current line)
  '%#StatusColumnLineNr#',
  "%-2{v:virtnum == 0 ? (v:relnum == 0 ? '' : v:relnum) : ''}",

  '│ ', -- Separator
}

local aml_opts = {
  pattern = '*.aml',
  callback = function()
    vim.cmd 'setfiletype anathema'
  end,
}
vim.api.nvim_create_autocmd('BufReadPost', aml_opts)

-- Ignore Rust Analyzer's warnings about cancelled diagnostics
for _, method in ipairs { 'textDocument/diagnostic', 'workspace/diagnostic' } do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end

    return default_diagnostic_handler(err, result, context, config)
  end
end
