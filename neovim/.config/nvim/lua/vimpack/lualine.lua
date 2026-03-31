vim.pack.add {
  'https://github.com/folke/noice.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/catppuccin/nvim',
}

vim.pack.add {
  'https://github.com/nvim-lualine/lualine.nvim',
}

require('lualine').setup(require 'custom.configs.lualine')
