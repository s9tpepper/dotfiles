local M = {}

local function setup (on_attach, capabilities)
  local lspconfig = require("lspconfig")

  lspconfig.tsserver.setup {
    init_options = {
      preferences = {
        disableSuggestions = true,
      }
    },
    commands = {
      OrganizeImports = {
        organize_imports = function ()
          local params = {
            command = "_typescript.organizeImports",
            arguments = {vim.api.nvim_buf_get_name(0)}
          }

          vim.lsp.buf.execute_command(params)
        end,
        description = "Organize Imports",
      }
    }
  }

  lspconfig.gopls.setup {
    -- on_attach = on_attach,
  }

  lspconfig.groovyls.setup {
    cmd = { "java", "-jar", "/Users/omargonzalez/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar" },
    -- on_attach = on_attach,
    filetypes = { "groovy", "Jenkinsfile" },
    settings = {
      groovy = {
      }
    }
  }
end

M.setup = setup

return M
