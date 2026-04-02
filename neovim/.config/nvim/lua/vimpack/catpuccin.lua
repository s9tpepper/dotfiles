vim.pack.add {
  'https://github.com/catppuccin/nvim',
}

vim.opt.termguicolors = true

require('catppuccin').setup(require 'custom.configs.catpuccin')
vim.cmd.colorscheme 'catppuccin'

-- -- TODO: Figure out how to move these into Catpuccin configs
-- vim.cmd[[highlight YankColor ctermfg=NONE ctermbg=NONE guibg=#3333FF guifg=#00FFFF]],

-- Change Visual mode selected text color
local hl_group = 'Visual'
vim.api.nvim_set_hl(0, hl_group, {
  -- fg = '#9900FF',
  -- bg = '#FFFF66',
  bg = '#ffff89',
  fg = '#222222',
  reverse = false,
  blend = 0,
  nocombine = false,
  bold = false,
  standout = false,
  italic = false,
})

-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
