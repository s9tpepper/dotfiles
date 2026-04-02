vim.pack.add( -- Useful plugin to show you pending keybinds.
  { 'https://github.com/folke/which-key.nvim' }
)

local wk = require 'which-key'
wk.setup()

-- Document existing key chains
wk.add {
  { '<leader>c', group = '[C]ode' },
  { '<leader>c_', hidden = true },
  { '<leader>d', group = '[D]ocument' },
  { '<leader>d_', hidden = true },
  { '<leader>r', group = '[R]ename' },
  { '<leader>r_', hidden = true },
  { '<leader>s', group = '[S]earch' },
  { '<leader>s_', hidden = true },
  { '<leader>w', group = '[W]orkspace' },
  { '<leader>w_', hidden = true },
  { '<leader>x', group = '[X]Trouble' },
  { '<leader>x_', hidden = true },
}
