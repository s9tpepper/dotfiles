return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  branch = 'harpoon2',
  config = function()
    require 'custom.configs.harpoon'
  end,
}
