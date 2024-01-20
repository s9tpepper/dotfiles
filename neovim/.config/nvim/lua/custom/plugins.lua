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
  -- Testing nvim plugin development
  -- {
  --   dir = "~/projects/first-nvim-plugin",
  --   dev = true,
  --   lazy = false
  -- },
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
    },
    config = function ()
      require("custom.configs.trouble")
    end
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    lazy = false,
    config = function ()
      require("custom.configs.harpoon")
    end
  },
}

return plugins
