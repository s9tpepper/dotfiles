vim.pack.add({ -- Adds git related signs to the gutter, as well as utilities for managing changes
  'https://github.com/lewis6991/gitsigns.nvim',
}, {
  -- See `:help gitsigns.txt`
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
})
