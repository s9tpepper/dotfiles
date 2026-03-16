return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/noice.nvim', 'catppuccin/nvim' },
  opts = function()
    return require 'custom.configs.lualine'
  end,
}
