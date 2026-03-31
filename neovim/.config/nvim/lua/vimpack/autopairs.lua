vim.pack.add({
  'https://github.com/windwp/nvim-autopairs',
}, {
  event = 'InsertEnter',
})

require('nvim-autopairs').setup()
