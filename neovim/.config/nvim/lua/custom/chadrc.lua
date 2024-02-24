---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  transparency = true,
  hl_override = {
    CursorLine = {
      bg = "darker_black"
    },
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.cmd[[highlight YankColor ctermfg=NONE ctermbg=NONE guibg=#3333FF guifg=#00FFFF]]

-- Enable highlight yanked region
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank{higroup="YankColor"}]]

-- Enable max line length column
vim.api.nvim_set_option_value("colorcolumn", "120", {
  scope = "global"
})

-- Add file types to languages
vim.filetype.add({
  filename = {
    ['Jenkinsfile'] = 'groovy'
  }
})

-- require('custom.plugins.custom_visual_highlight').setup()

-- Change Visual mode selected text color
local hl_group = 'Visual'
vim.api.nvim_set_hl(0, hl_group, {
  fg = '#9900FF', bg = '#FFFF66',
  reverse = true, blend = 10,
  nocombine = false, bold = false,
  ctermfg = 'black', ctermbg = 'yellow',
  standout = false, italic = false
})




-- enable yank highlights
-- augroup highlight_yank
--     autocmd!
--     au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
-- augroup END

-- au TextYankPost * silent! lua vim.highlight.on {higroup="IncSearch", timeout=150}
-- vim.highlight.on {higroup="IncSearch", timeout=150}


return M
