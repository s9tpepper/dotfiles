vim.pack.add( -- Useful plugin to show you pending keybinds.
  { 'https://github.com/folke/which-key.nvim' }
)

require('which-key').setup {
  event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
  config = function() -- This is the function that runs, AFTER loading
    -- require('which-key').setup()
    local wk = require 'which-key'

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
  end,
}
