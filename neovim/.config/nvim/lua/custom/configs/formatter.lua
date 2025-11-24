local M = {
  formatters_by_ft = {
    -- Disabled running prettier, configure via eslint using eslint-config-prettier

    javascript = {
      --require('formatter.filetypes.javascript').prettier,
      'prettierd',
      'prettier',
      'eslint',
    },
    javascriptreact = {
      -- require('formatter.filetypes.javascriptreact').prettier,
      'prettierd',
      'prettier',
      'eslint',
    },
    typescript = {
      -- require('formatter.filetypes.typescript').prettier,
      'prettierd',
      'prettier',
      'eslint',
    },
    typescriptreact = {
      -- require('formatter.filetypes.typescriptreact').prettier,
      'prettierd',
      'prettier',
      'eslint',
    },

    html = {
      'prettierd',
      'prettier',
    },

    css = {
      'prettierd',
      'prettier',
    },

    -- php = {
    --   function()
    --     return {
    --       exe = 'php-cs-fixer',
    --       args = { 'fix', '--using-cache=no', '--quiet' },
    --       stdin = false,
    --     }
    --   end,
    -- },

    -- json = {
    --   require("formatter.filetypes.json").prettier
    -- },
    -- ['*'] = {
    --   require('formatter.filetypes.any').remove_trailing_whitespace,
    -- },
  },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  command = 'FormatWriteLock',
})

return M
