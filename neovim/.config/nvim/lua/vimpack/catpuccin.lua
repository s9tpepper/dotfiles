vim.pack.add {
  'https://github.com/catppuccin/nvim',
}

vim.opt.termguicolors = true

require('catppuccin').setup(require 'custom.configs.catpuccin')
vim.cmd.colorscheme 'catppuccin'

-- Change Visual mode selected text color
local hl_group = 'Visual'
vim.api.nvim_set_hl(0, hl_group, {
  bg = '#ffff89',
  fg = '#222222',
  reverse = false,
  blend = 0,
  nocombine = false,
  bold = false,
  standout = false,
  italic = false,
})
