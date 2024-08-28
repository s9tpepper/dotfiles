local M = {
  filetype = {
    -- Disabled running prettier, configure via eslint using eslint-config-prettier

    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    javascriptreact = {
      require('formatter.filetypes.javascriptreact').prettier,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettier,
    },

    php = {
      function()
        return {
          exe = 'php-cs-fixer',
          args = { 'fix', '--using-cache=no', '--quiet' },
          stdin = false,
        }
      end,
    },

    -- json = {
    --   require("formatter.filetypes.json").prettier
    -- },
    ['*'] = {
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  command = 'FormatWriteLock',
})

return M
