local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_existed["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.formatter"
    end
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
      require "custom.configs.lint"
    end
  },

  {
    "williamboman/mason.nvim",
    opts = {
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
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "sitiom/nvim-numbertoggle",
    lazy = false
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",

        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        "bash",
        "dockerfile",
        "groovy",
        "xml",
        "yaml"
        -- "python"
      },
    }
  },
  {
    dir = "~/projects/first-nvim-plugin",
    dev = true,
    lazy = false
  },
  {
    "tpope/vim-fugitive",
    lazy = false
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      -- trouble configurations go here
    }
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    lazy = false,
    config = function ()
      local harpoon = require("harpoon")
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          save_on_ui_close = true,
        }
      })
      vim.keymap.set("n", "<leader>a", function () harpoon:list():append() end, { desc = "Add file to Harpoon" })
      vim.keymap.set("n", "<leader>H", function () harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon Window"})
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Open Harpoon File 1" })
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Open Harpoon File 2" })
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Open Harpoon File 3" })
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Open Harpoon File 4" })
      vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Open Harpoon File 5" })

      -- Telescope Setup
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end

      vim.keymap.set("n", "<C-e>", function () toggle_telescope(harpoon:list()) end,
        { desc = "Open Telescope Harpoon Window"}
      )
    end
  }
}

return plugins
