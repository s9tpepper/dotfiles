return {
  'saecki/crates.nvim',
  tag = 'stable',
  lazy = true,
  config = function()
    require('crates').setup {}
  end,
}
