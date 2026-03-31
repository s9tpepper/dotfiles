vim.pack.add({ 'https://github.com/stevearc/conform.nvim' }, {
  notify_on_error = false,
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd', 'prettier', 'eslint' },
    javascriptreact = { 'prettierd', 'prettier', 'eslint' },
    typescript = { 'prettierd', 'prettier', 'eslint' },
    typescriptreact = { 'prettierd', 'prettier', 'eslint' },
    css = { 'prettierd', 'prettier', 'eslint' },
    html = { 'prettierd', 'prettier', 'eslint' },
    json = { 'prettierd', 'prettier', 'eslint' },

    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    -- You can use a sub-list to tell conform to run *until* a formatter
    -- is found.
    -- javascript = { { "prettierd", "prettier" } },
  },
})
