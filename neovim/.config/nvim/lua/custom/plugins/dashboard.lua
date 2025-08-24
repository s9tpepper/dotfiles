return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      disable_move = true,
      shortcut_type = 'letter',
      shuffle_letter = true,
      change_to_vcs_root = false,
      hide = {
        statusline = true,
        tabline = true,
        winbar = true,
      },
      config = {
        header = {
          '  ███████╗ █████╗ ████████╗██████╗ ███████╗██████╗ ██████╗ ███████╗██████╗ ',
          '  ██╔════╝██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗',
          '  ███████╗╚██████║   ██║   ██████╔╝█████╗  ██████╔╝██████╔╝█████╗  ██████╔╝',
          '  ╚════██║ ╚═══██║   ██║   ██╔═══╝ ██╔══╝  ██╔═══╝ ██╔═══╝ ██╔══╝  ██╔══██╗',
          '  ███████║ █████╔╝   ██║   ██║     ███████╗██║     ██║     ███████╗██║  ██║',
          '  ╚══════╝ ╚════╝    ╚═╝   ╚═╝     ╚══════╝╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝',
        },
        week_header = {
          enable = false,
        },

        shortcut = {
          { desc = '[  Github]', group = 'DashboardShortCut' },
          { desc = '[  s9tpepper]', group = 'DashboardShortCut' },
        },

        mru = { enable = false },
        project = { enable = false },
        footer = {},

        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'b',
            keymap = 'SPC f f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(2)',
          },
          {
            icon = ' ',
            desc = 'Find Dotfiles',
            key = 'f',
            keymap = 'SPC f d',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(3)',
          },
        },
        vertical_center = true, -- Center the Dashboard on the vertical (from top to bottom)
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
