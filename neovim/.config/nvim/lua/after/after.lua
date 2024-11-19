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

-- Customize gutter to use symbols, absolute line numbers, and relative line numbers
vim.o.statuscolumn = '%s %l %r'

-- Adjust the width of the number column
vim.opt.numberwidth = 7 -- Default is 4. Increase for more padding.
