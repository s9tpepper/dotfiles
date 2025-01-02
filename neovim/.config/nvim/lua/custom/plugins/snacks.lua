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
    notifier = {
      enabled = true,
      timeout = 3000, -- default timeout in ms
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      -- editor margin to keep free. tabline and statusline are taken into account automatically
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true, -- add 1 cell of left/right padding to the notification window
      sort = { 'level', 'added' }, -- sort by level and time
      -- minimum log level to display. TRACE is the lowest
      -- all notifications are stored in history
      level = vim.log.levels.TRACE,
      icons = {
        error = ' ',
        warn = ' ',
        info = ' ',
        debug = ' ',
        trace = ' ',
      },
      keep = function(notif)
        -- if notif.msg.find(notif.msg, '-32802') then
        --   return false
        -- end

        return vim.fn.getcmdpos() > 0
      end,
      ---@type snacks.notifier.style
      style = 'compact',
      top_down = true, -- place notifications from top to bottom
      date_format = '%R', -- time format for notifications
      -- format for footer when more lines are available
      -- `%d` is replaced with the number of lines.
      -- only works for styles with a border
      ---@type string|boolean
      more_format = ' ↓ %d lines ',
      refresh = 50, -- refresh at most every 50ms
    },
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
      enabled = false,
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
