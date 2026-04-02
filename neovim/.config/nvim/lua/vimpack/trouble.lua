vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/folke/trouble.nvim',
}

require('trouble').setup {
  cmd = 'Trouble',
}

vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics' })

-- keys = {
--   {
--     '<leader>cs',
--     '<cmd>Trouble symbols toggle focus=false<cr>',
--     desc = 'Symbols (Trouble)',
--   },
--   {
--     '<leader>cl',
--     '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
--     desc = 'LSP Definitions / references / ... (Trouble)',
--   },
--   {
--     '<leader>xL',
--     '<cmd>Trouble loclist toggle<cr>',
--     desc = 'Location List (Trouble)',
--   },
--   {
--     '<leader>xQ',
--     '<cmd>Trouble qflist toggle<cr>',
--     desc = 'Quickfix List (Trouble)',
--   },
