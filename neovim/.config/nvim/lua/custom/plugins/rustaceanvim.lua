return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  ft = { 'rust' },
  lazy = true,
  lsp = {
    settings = {
      ['rust-analyzer'] = {
        -- Disable automatic cargo check on save to reduce CPU usage
        checkOnSave = { enable = false },

        -- Exclude large directories from analysis
        files = {
          excludeDirs = { 'target', '.git', 'node_modules' },
        },

        -- Disable proc macros unless you need them
        procMacro = { enable = false },

        -- Optional: enable incremental features but lighter
        cargo = { allFeatures = true },
      },
    },
  },
}
