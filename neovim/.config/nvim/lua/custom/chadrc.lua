---@type ChadrcConfig
local M = {}

M.mason = {
  ensure_installed = {
    "js-debug-adapter",
    "eslint-lsp",
    "prettier",
    "typescript-language-server",
    "gopls",
    "js-debug-adapter",
    "json-lsp",
    "lua-language-server",
    "prettierd",
    "python-lsp-server",
    "tailwindcss-language-server",
    "terraform-ls"
  }
}

M.ui = {
  theme = 'tokyonight',
  transparency = true,
  hl_override = {
    CursorLine = {
      bg = "darker_black"
    }
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- Enable highlight yanked region
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]

-- Enable max line length column
vim.api.nvim_set_option_value("colorcolumn", "120", {
  scope = "global"
})

-- enable yank highlights
-- augroup highlight_yank
--     autocmd!
--     au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
-- augroup END

-- au TextYankPost * silent! lua vim.highlight.on {higroup="IncSearch", timeout=150}
-- vim.highlight.on {higroup="IncSearch", timeout=150}


return M
