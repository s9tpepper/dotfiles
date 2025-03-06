return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      disable_move = false,
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
          '   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
          '   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
          '   ██╔██╗ ██║█████╗  ██║   ██║╚██╗ ██╔╝██║██╔████╔██║',
          '   ██║╚██╗██║██╔══╝  ██║   ██║ ╚████╔╝ ██║██║╚██╔╝██║',
          '   ██║ ╚████║███████╗╚██████╔╝  ╚██╔╝  ██║██║ ╚═╝ ██║',
          '   ╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝',
        },
        week_header = {
          enable = false,
        },
        footer = {},
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
