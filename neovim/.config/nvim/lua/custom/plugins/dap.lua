return {
  'mfussenegger/nvim-dap',
  lazy = true,
  config = function()
    require 'custom.configs.dap'
    -- require("core.utils").load_mappings("dap")
  end,
}
