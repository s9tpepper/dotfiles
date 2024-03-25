return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    -- trouble configurations go here
  },
  config = function ()
    require("custom.configs.trouble")
  end
}
