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
