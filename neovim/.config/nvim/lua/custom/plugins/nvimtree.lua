return {
  'nvim-tree/nvim-tree.lua',
  lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require('nvim-tree').setup()
    vim.keymap.set('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>')
  end,
}
