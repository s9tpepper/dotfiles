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
        "terraform-ls",
        "groovy-language-server"
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
  {
    'mrcjkb/rustaceanvim',
    version = '^3', -- Recommended
    ft = { 'rust' },
    lazy = true,
    config = function ()
      -- require("rustaceanvim").setup()

      -- local bufnr = vim.api.nvim_get_current_buf()
      vim.keymap.set(
        "n",
        "<leader>cf",
        function()
          vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
          -- or vim.lsp.buf.codeAction() if you don't want grouping.
        end,
        -- { silent = true, buffer = bufnr }
        { silent = true }
      )
    end
  },
  {
    'vadimcn/codelldb',
    config = function ()
      vim.g.rustaceanvim = function()
        -- Update this path
        local extension_path = vim.env.HOME .. '~/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
        local codelldb_path = extension_path .. 'adapter/codelldb'
        -- local liblldb_path = extension_path .. 'lldb/lib/liblldb'
        local liblldb_path = extension_path .. '/usr/bin/lldb'
        local this_os = vim.uv.os_uname().sysname;

        -- The path is different on Windows
        if this_os:find "Windows" then
          codelldb_path = extension_path .. "adapter\\codelldb.exe"
          liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
        else
          -- The liblldb extension is .so for Linux and .dylib for MacOS
          liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
        end

        local cfg = require('rustaceanvim.config')
        return {
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
          },
        }
      end
    end
  },
  {
    'ckipp01/nvim-jenkinsfile-linter',
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- TODO: hello
      -- WARN: blah
      -- FIX: wtf
      -- HACK: hrm...
      -- NOTE: some notes.
      -- WARNING: EEP
      -- PERF: this is optimized
    }
  }
  -- Needs to be ported to NvChad themes
  -- {
  --   "blazkowolf/gruber-darker.nvim",
  --   opts = {
  --     bold = true,
  --     invert = {
  --       signs = false,
  --       tabline = false,
  --       visual = false,
  --     },
  --    italic = {
  --       strings = true,
  --       comments = true,
  --       operators = false,
  --       folds = true,
  --     },
  --     undercurl = true,
  --     underline = true,
  --   },
  -- },
}

return plugins
