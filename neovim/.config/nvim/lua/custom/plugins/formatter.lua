return {
  'mhartington/formatter.nvim',
  event = 'VeryLazy',
  opts = function()
    return require 'custom.configs.formatter'
  end,
}
