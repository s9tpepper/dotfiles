vim.pack.add({
  'https://github.com/mhartington/formatter.nvim',
})

require('formatter').setup(require 'custom.configs.formatter')
