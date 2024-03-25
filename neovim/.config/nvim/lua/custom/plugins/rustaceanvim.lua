return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
  lazy = true,
  -- config = function()
  --   -- require("rustaceanvim").setup()
  --
  --   -- local bufnr = vim.api.nvim_get_current_buf()
  --   vim.keymap.set(
  --     'n',
  --     '<leader>cf',
  --     function()
  --       vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
  --       -- or vim.lsp.buf.codeAction() if you don't want grouping.
  --     end,
  --     -- { silent = true, buffer = bufnr }
  --     { silent = true }
  --   )
  -- end,
}
