-- Highlight, edit, and navigate code
vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
}

-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.config').setup {
  ensure_installed = {
    'c',
    'lua',
    'vim',
    'vimdoc',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'json',
    'vue',
    'bash',
    'dockerfile',
    'groovy',
    'xml',
    'yaml',
    'php',
  },
  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see :help nvim-treesitter-incremental-selection-mod
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
