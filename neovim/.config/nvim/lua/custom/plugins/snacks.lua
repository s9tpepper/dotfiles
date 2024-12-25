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
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 200 },
        easing = 'outCirc',
      },
      spamming = 10, -- threshold for spamming detection
      -- what buffers to animate
      filter = function(buf)
        return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= 'terminal'
      end,
    },

    dim = {
      enabled = true,
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
    {
      '<leader>wj',
      function()
        Snacks.words.jump(1, true)
      end,
      desc = 'Jump to next LSP reference',
    },
    {
      '<leader>wc',
      function()
        Snacks.words.clear()
      end,
      desc = 'Clear word reference',
    },
    {
      '<leader>js',
      function()
        Snacks.scope.jump()
      end,
      desc = 'Jump around based on scope',
    },
  },
}
