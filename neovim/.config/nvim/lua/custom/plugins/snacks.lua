return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false }, -- disabled this
    indent = { enabled = false }, -- disabled indentation lines
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false }, -- disabled statuscolumn settings
    words = { enabled = true },

    -- Custom options
    lazygit = {
      configure = true,
      theme = {
        [241] = { fg = 'Special' },
        activeBorderColor = { fg = 'MatchParen', bold = true },
        cherryPickedCommitBgColor = { fg = 'Identifier' },
        cherryPickedCommitFgColor = { fg = 'Function' },
        defaultFgColor = { fg = 'Normal' },
        inactiveBorderColor = { fg = 'FloatBorder' },
        optionsTextColor = { fg = 'Function' },
        searchingActiveBorderColor = { fg = 'MatchParen', bold = true },
        selectedLineBgColor = { bg = 'MatchParen' },
        unstagedChangesColor = { fg = 'DiagnosticError' },
      },
    },
  },

  keys = {
    {
      '<leader>n',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss all notifications',
    },
    {
      '<leader>nh',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Show notification history',
    },
    {
      '<leader>cR',
      function()
        Snacks.rename.rename_file()
      end,
      desc = 'Rename File',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    {
      '<leader>lg',
      function()
        Snacks.lazygit.open()
      end,
      desc = 'Open LazyGit',
    },
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen mode',
    },
  },
}
