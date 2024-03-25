return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  branch = "harpoon2",
  lazy = false,
  config = function ()
    require("custom.configs.harpoon")
  end
}
