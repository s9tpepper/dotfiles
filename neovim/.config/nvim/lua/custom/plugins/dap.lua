return {
  'mfussenegger/nvim-dap',
  config = function()
    require 'custom.configs.dap'
    -- require("core.utils").load_mappings("dap")
  end,
}
